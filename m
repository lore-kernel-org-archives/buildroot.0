From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 23:33:34 +0100
Subject: [Buildroot] [git commit] mkpimage: bump to latest barebox version
Message-ID: <20170209223438.A164082161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29c00e40af7799153d78c62cb2536ba877ffc2d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support for header v1 (used on Arria 10 SoCs)

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mkpimage/mkpimage.c  | 149 ++++++++++++++++++++++++++++++++++---------
 package/mkpimage/mkpimage.mk |   6 +-
 2 files changed, 122 insertions(+), 33 deletions(-)

diff --git a/package/mkpimage/mkpimage.c b/package/mkpimage/mkpimage.c
index 1a7a66d..d7fe1b1 100644
--- a/package/mkpimage/mkpimage.c
+++ b/package/mkpimage/mkpimage.c
@@ -12,7 +12,12 @@
 
 #define VALIDATION_WORD 0x31305341
 
-#define MAX_IMAGE_SIZE (60 * 1024 - 4)
+#define BRANCH_INST 0xea /* ARM opcode for "b" (unconditional branch) */
+
+#define MAX_V0IMAGE_SIZE (60 * 1024 - 4)
+/* Max size without authentication is 224 KB, due to memory used by
+ * the ROM boot code as a workspace out of the 256 KB of OCRAM */
+#define MAX_V1IMAGE_SIZE (224 * 1024 - 4)
 
 static int add_barebox_header;
 
@@ -20,9 +25,21 @@ struct socfpga_header {
 	uint8_t validation_word[4];
 	uint8_t version;
 	uint8_t flags;
-	uint8_t program_length[2];
-	uint8_t spare[2];
-	uint8_t checksum[2];
+	union {
+		struct {
+			uint8_t program_length[2];
+			uint8_t spare[2];
+			uint8_t checksum[2];
+			uint8_t start_vector[4];
+		} v0;
+		struct {
+			uint8_t header_length[2];
+			uint8_t program_length[4];
+			uint8_t entry_offset[4];
+			uint8_t spare[2];
+			uint8_t checksum[2];
+		} v1;
+	};
 };
 
 static uint32_t bb_header[] = {
@@ -45,7 +62,7 @@ static uint32_t bb_header[] = {
 	0x00000000,	/* socfpga header */
 	0x00000000,	/* socfpga header */
 	0x00000000,	/* socfpga header */
-	0xea00006b,	/* entry. b 0x200  */
+	0xea00006b,	/* entry. b 0x200 (offset may be adjusted) */
 };
 
 static int read_full(int fd, void *buf, size_t size)
@@ -84,7 +101,7 @@ static int write_full(int fd, void *buf, size_t size)
 	return insize;
 }
 
-static uint32_t crc_table[256] = {
+static const uint32_t crc_table[256] = {
 	0x00000000, 0x04c11db7, 0x09823b6e, 0x0d4326d9, 0x130476dc, 0x17c56b6b,
 	0x1a864db2, 0x1e475005, 0x2608edb8, 0x22c9f00f, 0x2f8ad6d6, 0x2b4bcb61,
 	0x350c9b64, 0x31cd86d3, 0x3c8ea00a, 0x384fbdbd, 0x4c11db70, 0x48d0c6c7,
@@ -140,37 +157,94 @@ uint32_t crc32(uint32_t crc, void *_buf, int length)
 	return crc;
 }
 
-static int add_socfpga_header(void *buf, int size)
+/* Create an ARM relative branch instuction 
+ * branch is where the instruction will be placed and dest points to where
+ * it should branch too. */
+static void branch(uint8_t *branch, uint8_t *dest)
+{
+	int offset = dest - branch - 8; /* PC is offset +8 bytes on ARM */
+
+	branch[0] = (offset >> 2) & 0xff; /* instruction uses offset/4 */
+	branch[1] = (offset >> 10) & 0xff;
+	branch[2] = (offset >> 18) & 0xff;
+	branch[3] = BRANCH_INST;
+}
+
+/* start_addr is where the socfpga header's start instruction should branch to.
+ * It should be relative to the start of buf */
+static int add_socfpga_header(void *buf, size_t size, unsigned start_addr, unsigned version)
 {
 	struct socfpga_header *header = buf + 0x40;
-	uint8_t *buf_header = buf + 0x40;
+	void *entry;
+	uint8_t *bufp, *sumendp;
 	uint32_t *crc;
 	unsigned checksum;
-	int length = size >> 2;
-	int i;
 
 	if (size & 0x3) {
 		fprintf(stderr, "%s: size must be multiple of 4\n", __func__);
 		return -EINVAL;
 	}
 
+	/* Absolute address of entry point in buf */
+	entry = buf + start_addr;
+	if (version == 0) {
+		sumendp = &header->v0.checksum[0];
+	} else {
+		sumendp = &header->v1.checksum[0];
+
+		/* The ROM loader can't handle a negative offset */
+		if (entry < (void*)header) {
+			/* add a trampoline branch inst after end of the header */
+			uint8_t *trampoline = (void*)(header + 1);
+			branch(trampoline, entry);
+
+			/* and then make the trampoline the entry point */
+			entry = trampoline;
+		}
+		/* Calculate start address as offset relative to start of header */
+		start_addr = entry - (void*)header;
+	}
+
 	header->validation_word[0] = VALIDATION_WORD & 0xff;
 	header->validation_word[1] = (VALIDATION_WORD >> 8) & 0xff;
 	header->validation_word[2] = (VALIDATION_WORD >> 16) & 0xff;
 	header->validation_word[3] = (VALIDATION_WORD >> 24) & 0xff;
-	header->version = 0;
+	header->version = version;
 	header->flags = 0;
-	header->program_length[0] = length & 0xff;
-	header->program_length[1] = (length >> 8) & 0xff;
-	header->spare[0] = 0;
-	header->spare[1] = 0;
 
-	checksum = 0;
-	for (i = 0; i < sizeof(*header) - 2; i++)
-		checksum += buf_header[i];
+	if (version == 0) {
+		header->v0.program_length[0] = (size >>  2) & 0xff; /* length in words */
+		header->v0.program_length[1] = (size >> 10) & 0xff;
+		header->v0.spare[0] = 0;
+		header->v0.spare[1] = 0;
+		branch(header->v0.start_vector, entry);
+	} else {
+		header->v1.header_length[0] = (sizeof(*header) >> 0) & 0xff;
+		header->v1.header_length[1] = (sizeof(*header) >> 8) & 0xff;
+		header->v1.program_length[0] = (size >>  0) & 0xff;
+		header->v1.program_length[1] = (size >>  8) & 0xff;
+		header->v1.program_length[2] = (size >> 16) & 0xff;
+		header->v1.program_length[3] = (size >> 24) & 0xff;
+		header->v1.entry_offset[0] = (start_addr >>  0) & 0xff;
+		header->v1.entry_offset[1] = (start_addr >>  8) & 0xff;
+		header->v1.entry_offset[2] = (start_addr >> 16) & 0xff;
+		header->v1.entry_offset[3] = (start_addr >> 24) & 0xff;
+		header->v1.spare[0] = 0;
+		header->v1.spare[1] = 0;
+	}
 
-	header->checksum[0] = checksum & 0xff;;
-	header->checksum[1] = (checksum >> 8) & 0xff;;
+	/* Sum from beginning of header to start of checksum field */
+	checksum = 0;
+	for (bufp = (uint8_t*)header; bufp < sumendp; bufp++)
+		checksum += *bufp;
+
+	if (version == 0) {
+		header->v0.checksum[0] = checksum & 0xff;;
+		header->v0.checksum[1] = (checksum >> 8) & 0xff;;
+	} else {
+		header->v1.checksum[0] = checksum & 0xff;;
+		header->v1.checksum[1] = (checksum >> 8) & 0xff;;
+	}
 
 	crc = buf + size - sizeof(uint32_t);
 
@@ -182,7 +256,7 @@ static int add_socfpga_header(void *buf, int size)
 
 static void usage(const char *prgname)
 {
-	fprintf(stderr, "usage: %s [OPTIONS] <infile>\n", prgname);
+	fprintf(stderr, "usage: %s [-hb] [-v version] <infile> -o <outfile>\n", prgname);
 }
 
 int main(int argc, char *argv[])
@@ -192,16 +266,23 @@ int main(int argc, char *argv[])
 	struct stat s;
 	void *buf;
 	int fd;
-	int min_image_size = 80;
-	int max_image_size = MAX_IMAGE_SIZE;
+	int max_image_size, min_image_size = 80;
 	int addsize = 0, pad;
+	unsigned int version = 0;
 
-	while ((opt = getopt(argc, argv, "o:hb")) != -1) {
+	while ((opt = getopt(argc, argv, "o:hbv:")) != -1) {
 		switch (opt) {
+		case 'v':
+			version = atoi(optarg);
+			if (version > 1) {
+				printf("Versions supported: 0 or 1\n");
+				usage(argv[0]);
+				exit(1);
+			}
+			break;
 		case 'b':
 			add_barebox_header = 1;
 			min_image_size = 0;
-			max_image_size = MAX_IMAGE_SIZE - 512;
 			addsize = 512;
 			break;
 		case 'h':
@@ -211,15 +292,21 @@ int main(int argc, char *argv[])
 			outfile = optarg;
 			break;
 		default:
+			usage(argv[0]);
 			exit(1);
 		}
 	}
+	if (version == 0) {
+		max_image_size = MAX_V0IMAGE_SIZE;
+	} else {
+		max_image_size = MAX_V1IMAGE_SIZE;
+	}
+	max_image_size -= addsize;
 
-	if (optind == argc) {
+	if (optind == argc || !outfile) {
 		usage(argv[0]);
 		exit(1);
 	}
-
 	infile = argv[optind];
 
 	ret = stat(infile, &s);
@@ -229,7 +316,8 @@ int main(int argc, char *argv[])
 	}
 
 	if (s.st_size < min_image_size) {
-		fprintf(stderr, "input image too small. Minimum is 80 bytes\n");
+		fprintf(stderr, "input image too small. Minimum is %d bytes\n",
+			min_image_size);
 		exit(1);
 	}
 
@@ -240,7 +328,7 @@ int main(int argc, char *argv[])
 	}
 
 	fd = open(infile, O_RDONLY);
-	if (fd < 0) {
+	if (fd == -1) {
 		perror("open infile");
 		exit(1);
 	}
@@ -267,7 +355,8 @@ int main(int argc, char *argv[])
 		memcpy(buf, bb_header, sizeof(bb_header));
 	}
 
-	ret = add_socfpga_header(buf, s.st_size + 4 + addsize + pad);
+	ret = add_socfpga_header(buf, s.st_size + 4 + addsize + pad, addsize,
+	                         version);
 	if (ret)
 		exit(1);
 
diff --git a/package/mkpimage/mkpimage.mk b/package/mkpimage/mkpimage.mk
index c30a680..04b2ef0 100644
--- a/package/mkpimage/mkpimage.mk
+++ b/package/mkpimage/mkpimage.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-# source included in the package
-# came from barebox's repository:
-# http://git.pengutronix.de/?p=barebox.git;a=blob;f=scripts/socfpga_mkimage.c;h=1a7a66d98841e9f52c3ea49c651286aa1412c9a5;hb=HEAD
 HOST_MKPIMAGE_LICENSE = GPLv2
 
+# source included in the package
+# came from barebox's repository:
+# https://git.pengutronix.de/cgit/barebox/tree/scripts/socfpga_mkimage.c?id=55d29525146dcd280987dfd565bfd34f08858fb3
 define HOST_MKPIMAGE_BUILD_CMDS
 	$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
 		package/mkpimage/mkpimage.c -o $(@D)/mkpimage
