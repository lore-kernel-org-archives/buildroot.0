From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 23:03:04 +0200
Subject: [Buildroot] [git commit] package/meson-tools: fix build with older
 gcc versions
Message-ID: <20200919205435.B85D58AA59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b70114eecd47fc7d95361c5ef01bcd25cf8f6a55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The meson-tools code uses C99 constructs without passing -std=c99,
which causes the build to fail with old gcc versions. Since there are
very few instances of C99 constructs, we simply patch them out.

Fixes:

 - http://autobuild.buildroot.net/results/602d474a12cf2400e4f38ffad903758d7fd9f2f5
 - http://autobuild.buildroot.net/results/65cfe582ce60fcff18afd008c3d469471ffb0e49

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nc-gxl-remove-non-std-C-convention-in-for.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch b/package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch
new file mode 100644
index 0000000000..243c59b5c1
--- /dev/null
+++ b/package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch
@@ -0,0 +1,50 @@
+From 7c5475187d1bdf861360ffd8bc1aaea84a341db3 Mon Sep 17 00:00:00 2001
+From: Dagg Stompler <daggs@gmx.com>
+Date: Fri, 11 Sep 2020 12:28:52 +0300
+Subject: [PATCH] amlbootenc-gxl: remove non std C convention in for
+
+not all compilers have c99 or gnu99 enabled, so try not to use a
+non std C convention in for call loops
+
+Signed-off-by: Dagg Stompler <daggs@gmx.com>
+---
+ amlbootenc-gxl.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/amlbootenc-gxl.c b/amlbootenc-gxl.c
+index 3695e13..233563d 100644
+--- a/amlbootenc-gxl.c
++++ b/amlbootenc-gxl.c
+@@ -51,6 +51,7 @@ static int boot_enc(const char *input, const char *output)
+ 		._unknown3 = 0x02000000,
+ 		.sig2 = AMLOGIC_C_SIGNATURE,
+ 	};
++	int i;
+
+ 	assert(sizeof(hdr) == 0x100);
+
+@@ -130,10 +131,10 @@ static int boot_enc(const char *input, const char *output)
+ 	memcpy(hdr.iv, (uint8_t[]){ 0x14, 0x82, 0x5b, 0x1b, 0x10, 0xc1, 0x49, 0x0d, 0x8f, 0x13, 0x0a, 0x99, 0x15, 0x50, 0x1d, 0x37 }, 16);
+ 	}
+ #else
+-	for (int i = 0; i < sizeof(hdr.key); i++) {
++	for (i = 0; i < sizeof(hdr.key); i++) {
+ 		hdr.key[i] = rand();
+ 	}
+-	for (int i = 0; i < sizeof(hdr.iv); i++) {
++	for (i = 0; i < sizeof(hdr.iv); i++) {
+ 		hdr.iv[i] = rand();
+ 	}
+ #endif
+@@ -151,7 +152,7 @@ static int boot_enc(const char *input, const char *output)
+ 	AES_cbc_encrypt(src_buf, buf + hdr.first_offset, hdr.block_size, &aes_key, iv, AES_ENCRYPT);
+ 	SHA256_Update(&sha256_ctx, buf + hdr.first_offset, hdr.block_size);
+
+-	for (int i = 1; i < hdr.payload_size / hdr.block_size; i++) {
++	for (i = 1; i < hdr.payload_size / hdr.block_size; i++) {
+ 		memset(src_buf, 0, hdr.block_size);
+ 		fread(src_buf, 1, hdr.block_size, fin);
+ 		AES_cbc_encrypt(src_buf, buf + hdr.data_offset + (i - 1) * hdr.block_size, hdr.block_size, &aes_key, iv, AES_ENCRYPT);
+--
+2.28.0
+
