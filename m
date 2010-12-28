From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Dec 2010 16:10:26 -0300
Subject: [Buildroot] [PATCH 01/10] sstrip: make it a proper package
In-Reply-To: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293563435-10054-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Convert sstrip to a proper gentargets package
* Use openwrt svn version, it's basically the same one we used
* Change the hooks from old toolchain/sstrip to new package/sstrip
* Drop the old toolchain/sstrip directory
* sstrip for the target is now in Package -> Development

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                         |    3 +
 package/Makefile.in                       |    2 +-
 package/sstrip/Config.in                  |    7 +
 package/sstrip/sstrip.mk                  |   45 +++
 toolchain/dependencies/dependencies.mk    |    2 +-
 toolchain/sstrip/Config.in                |    9 -
 toolchain/sstrip/sstrip.c                 |  467 -----------------------------
 toolchain/sstrip/sstrip.mk                |   70 -----
 toolchain/toolchain-buildroot.mk          |    1 -
 toolchain/toolchain-buildroot/Config.in.2 |    1 -
 toolchain/toolchain-crosstool-ng.mk       |    1 -
 toolchain/toolchain-external.mk           |    1 -
 12 files changed, 57 insertions(+), 552 deletions(-)
 create mode 100644 package/sstrip/Config.in
 create mode 100644 package/sstrip/sstrip.mk
 delete mode 100644 toolchain/sstrip/Config.in
 delete mode 100644 toolchain/sstrip/sstrip.c
 delete mode 100644 toolchain/sstrip/sstrip.mk

diff --git a/package/Config.in b/package/Config.in
index 225d873..27d8023 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -73,6 +73,9 @@ endif
 source "package/pkg-config/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sed/Config.in"
+endif
+source "package/sstrip/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tar/Config.in"
 endif
 endmenu
diff --git a/package/Makefile.in b/package/Makefile.in
index 71c8dbc..3fa98fe 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -162,7 +162,7 @@ ifeq ($(BR2_STRIP_sstrip),y)
 STRIP_DISCARD_ALL:=
 STRIP_STRIP_UNNEEDED:=
 STRIP_STRIP_ALL:=
-TARGET_STRIP=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
+TARGET_STRIP=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
 STRIPCMD=$(TARGET_STRIP)
 KSTRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note --strip-unneeded
 endif
diff --git a/package/sstrip/Config.in b/package/sstrip/Config.in
new file mode 100644
index 0000000..12a5941
--- /dev/null
+++ b/package/sstrip/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SSTRIP
+	bool "sstrip"
+	help
+	  Small utility that removes a few bytes from an executable that
+	  strip leaves behind.
+
+	  http://www.muppetlabs.com/~breadbox/software/elfkickers.html
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
new file mode 100644
index 0000000..d8db3b7
--- /dev/null
+++ b/package/sstrip/sstrip.mk
@@ -0,0 +1,45 @@
+############################################################
+#
+# sstrip
+#
+############################################################
+
+SSTRIP_SITE = svn://dev.openwrt.org/openwrt/trunk/tools/sstrip
+SSTRIP_VERSION = 20154
+HOST_SSTRIP_BINARY = $(REAL_GNU_TARGET_NAME)-sstrip
+
+# This is a kludge to get host-ccache build before us or it fails
+ifeq ($(BR2_CCACHE),y)
+HOST_SSTRIP_DEPENDENCIES = host-ccache
+endif
+
+define SSTRIP_BUILD_CMDS
+	cd $(@D) ; \
+	$(TARGET_CC) $(TARGET_CFLAGS) -include endian.h -include byteswap.h \
+		-o sstrip src/sstrip.c
+endef
+
+define SSTRIP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/sstrip $(TARGET_DIR)/usr/bin/sstrip
+endef
+
+define SSTRIP_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/sstrip
+endef
+
+define HOST_SSTRIP_BUILD_CMDS
+	cd $(@D) ; \
+	$(HOSTCC) $(HOST_CFLAGS) -include endian.h -include byteswap.h \
+		-o sstrip src/sstrip.c
+endef
+
+define HOST_SSTRIP_INSTALL_CMDS
+	$(INSTALL) -D $(@D)/sstrip $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
+endef
+
+define HOST_SSTRIP_UNINSTALL_CMDS
+	rm -f $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
+endef
+
+$(eval $(call GENTARGETS,package,sstrip))
+$(eval $(call GENTARGETS,package,sstrip,host))
diff --git a/toolchain/dependencies/dependencies.mk b/toolchain/dependencies/dependencies.mk
index 13604f0..6eac05d 100644
--- a/toolchain/dependencies/dependencies.mk
+++ b/toolchain/dependencies/dependencies.mk
@@ -7,7 +7,7 @@
 
 DEPENDENCIES_HOST_PREREQ:=
 ifeq ($(BR2_STRIP_sstrip),y)
-DEPENDENCIES_HOST_PREREQ+=sstrip_host
+DEPENDENCIES_HOST_PREREQ+=host-sstrip
 endif
 
 # Remove duplicate entries from $(DL_TOOLS_DEPENDENCIES)
diff --git a/toolchain/sstrip/Config.in b/toolchain/sstrip/Config.in
deleted file mode 100644
index be4fa28..0000000
--- a/toolchain/sstrip/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_SSTRIP_TARGET
-	bool "Install sstrip for the target system"
-	help
-	  Maximal 'strip'ing utility.
-
-config BR2_PACKAGE_SSTRIP_HOST
-	bool "Install sstrip for the host/build system"
-	help
-	  Maximal 'strip'ing utility.
diff --git a/toolchain/sstrip/sstrip.c b/toolchain/sstrip/sstrip.c
deleted file mode 100644
index 03adc0e..0000000
--- a/toolchain/sstrip/sstrip.c
+++ /dev/null
@@ -1,467 +0,0 @@
-/* http://www.muppetlabs.com/~breadbox/software/elfkickers.html */
-
-/* sstrip: Copyright (C) 1999-2001 by Brian Raiter, under the GNU
- * General Public License. No warranty. See COPYING for details.
- *
- * Aug 23, 2004 Hacked by Manuel Novoa III <mjn3@codepoet.org> to
- * handle targets of different endianness and/or elf class, making
- * it more useful in a cross-devel environment.
- */
-
-/* ============== original README ===================
- *
- * sstrip is a small utility that removes the contents at the end of an
- * ELF file that are not part of the program's memory image.
- * 
- * Most ELF executables are built with both a program header table and a
- * section header table. However, only the former is required in order
- * for the OS to load, link and execute a program. sstrip attempts to
- * extract the ELF header, the program header table, and its contents,
- * leaving everything else in the bit bucket. It can only remove parts of
- * the file that occur at the end, after the parts to be saved. However,
- * this almost always includes the section header table, and occasionally
- * a few random sections that are not used when running a program.
- * 
- * It should be noted that the GNU bfd library is (understandably)
- * dependent on the section header table as an index to the file's
- * contents. Thus, an executable file that has no section header table
- * cannot be used with gdb, objdump, or any other program based upon the
- * bfd library, at all. In fact, the program will not even recognize the
- * file as a valid executable. (This limitation is noted in the source
- * code comments for bfd, and is marked "FIXME", so this may change at
- * some future date. However, I would imagine that it is a pretty
- * low-priority item, as executables without a section header table are
- * rare in the extreme.) This probably also explains why strip doesn't
- * offer the option to do this.
- * 
- * Shared library files may also have their section header table removed.
- * Such a library will still function; however, it will no longer be
- * possible for a compiler to link a new program against it.
- * 
- * As an added bonus, sstrip also tries to removes trailing zero bytes
- * from the end of the file. (This normally cannot be done with an
- * executable that has a section header table.)
- * 
- * sstrip is a very simplistic program. It depends upon the common
- * practice of putting the parts of the file that contribute to the
- * memory image at the front, and the remaining material at the end. This
- * permits it to discard the latter material without affecting file
- * offsets and memory addresses in what remains. Of course, the ELF
- * standard permits files to be organized in almost any order, so if a
- * pathological linker decided to put its section headers at the top,
- * sstrip would be useless on such executables.
- */
-
-#include	<stdio.h>
-#include	<stdlib.h>
-#include	<string.h>
-#include	<errno.h>
-#include	<unistd.h>
-#include	<fcntl.h>
-#include	<elf.h>
-#include	<endian.h>
-#include	<byteswap.h>
-
-#ifndef TRUE
-#define	TRUE		1
-#define	FALSE		0
-#endif
-
-/* The name of the program.
- */
-static char const	*progname;
-
-/* The name of the current file.
- */
-static char const	*filename;
-
-
-/* A simple error-handling function. FALSE is always returned for the
- * convenience of the caller.
- */
-static int err(char const *errmsg)
-{
-	fprintf(stderr, "%s: %s: %s\n", progname, filename, errmsg);
-	return FALSE;
-}
-
-/* A flag to signal the need for endian reversal.
- */
-static int do_reverse_endian;
-
-/* Get a value from the elf header, compensating for endianness.
- */
-#define EGET(X) \
-	(__extension__ ({ \
-		uint64_t __res; \
-		if (!do_reverse_endian) { \
-			__res = (X); \
-		} else if (sizeof(X) == 1) { \
-			__res = (X); \
-		} else if (sizeof(X) == 2) { \
-			__res = bswap_16((X)); \
-		} else if (sizeof(X) == 4) { \
-			__res = bswap_32((X)); \
-		} else if (sizeof(X) == 8) { \
-			__res = bswap_64((X)); \
-		} else { \
-			fprintf(stderr, "%s: %s: EGET failed for size %d\n", \
-					progname, filename, sizeof(X)); \
-			exit(EXIT_FAILURE); \
-		} \
-		__res; \
-	}))
-
-/* Set a value 'Y' in the elf header to 'X', compensating for endianness.
- */
-#define ESET(Y,X) \
-		do if (!do_reverse_endian) { \
-			Y = (X); \
-		} else if (sizeof(Y) == 1) { \
-			Y = (X); \
-		} else if (sizeof(Y) == 2) { \
-			Y = bswap_16((uint16_t)(X)); \
-		} else if (sizeof(Y) == 4) { \
-			Y = bswap_32((uint32_t)(X)); \
-		} else if (sizeof(Y) == 8) { \
-			Y = bswap_64((uint64_t)(X)); \
-		} else { \
-			fprintf(stderr, "%s: %s: ESET failed for size %d\n", \
-					progname, filename, sizeof(Y)); \
-			exit(EXIT_FAILURE); \
-		} while (0)
-
-
-/* A macro for I/O errors: The given error message is used only when
- * errno is not set.
- */
-#define	ferr(msg)	(err(errno ? strerror(errno) : (msg)))
-
-
-
-#define HEADER_FUNCTIONS(CLASS) \
- \
-/* readelfheader() reads the ELF header into our global variable, and \
- * checks to make sure that this is in fact a file that we should be \
- * munging. \
- */ \
-static int readelfheader ## CLASS (int fd, Elf ## CLASS ## _Ehdr *ehdr) \
-{ \
-	 if (read(fd, ((char *)ehdr)+EI_NIDENT, sizeof(*ehdr) - EI_NIDENT) \
-		!= sizeof(*ehdr) - EI_NIDENT) \
-		return ferr("missing or incomplete ELF header."); \
- \
-	/* Verify the sizes of the ELF header and the program segment \
-	 * header table entries. \
-	 */ \
-	if (EGET(ehdr->e_ehsize) != sizeof(Elf ## CLASS ## _Ehdr)) \
-		return err("unrecognized ELF header size."); \
-	if (EGET(ehdr->e_phentsize) != sizeof(Elf ## CLASS ## _Phdr)) \
-		return err("unrecognized program segment header size."); \
- \
-	/* Finally, check the file type. \
-	 */ \
-	if (EGET(ehdr->e_type) != ET_EXEC && EGET(ehdr->e_type) != ET_DYN) \
-		return err("not an executable or shared-object library."); \
- \
-	return TRUE; \
-} \
- \
-/* readphdrtable() loads the program segment header table into memory. \
- */ \
-static int readphdrtable ## CLASS (int fd, Elf ## CLASS ## _Ehdr const *ehdr, \
-								   Elf ## CLASS ## _Phdr **phdrs) \
-{ \
-	size_t	size; \
- \
-	if (!EGET(ehdr->e_phoff) || !EGET(ehdr->e_phnum) \
-)		return err("ELF file has no program header table."); \
- \
-	size = EGET(ehdr->e_phnum) * sizeof **phdrs; \
-	if (!(*phdrs = malloc(size))) \
-		return err("Out of memory!"); \
- \
-	errno = 0; \
-	if (read(fd, *phdrs, size) != (ssize_t)size) \
-		return ferr("missing or incomplete program segment header table."); \
- \
-	return TRUE; \
-} \
- \
-/* getmemorysize() determines the offset of the last byte of the file \
- * that is referenced by an entry in the program segment header table. \
- * (Anything in the file after that point is not used when the program \
- * is executing, and thus can be safely discarded.) \
- */ \
-static int getmemorysize ## CLASS (Elf ## CLASS ## _Ehdr const *ehdr, \
-								   Elf ## CLASS ## _Phdr const *phdrs, \
-						 unsigned long *newsize) \
-{ \
-	Elf ## CLASS ## _Phdr const   *phdr; \
-	unsigned long	size, n; \
-	int			i; \
- \
-	/* Start by setting the size to include the ELF header and the \
-	 * complete program segment header table. \
-	 */ \
-	size = EGET(ehdr->e_phoff) + EGET(ehdr->e_phnum) * sizeof *phdrs; \
-	if (size < sizeof *ehdr) \
-		size = sizeof *ehdr; \
- \
-	/* Then keep extending the size to include whatever data the \
-	 * program segment header table references. \
-	 */ \
-	for (i = 0, phdr = phdrs ; i < EGET(ehdr->e_phnum) ; ++i, ++phdr) { \
-		if (EGET(phdr->p_type) != PT_NULL) { \
-			n = EGET(phdr->p_offset) + EGET(phdr->p_filesz); \
-			if (n > size) \
-				size = n; \
-		} \
-	} \
- \
-	*newsize = size; \
-	return TRUE; \
-} \
- \
-/* modifyheaders() removes references to the section header table if \
- * it was stripped, and reduces program header table entries that \
- * included truncated bytes at the end of the file. \
- */ \
-static int modifyheaders ## CLASS (Elf ## CLASS ## _Ehdr *ehdr, \
-								   Elf ## CLASS ## _Phdr *phdrs, \
-								   unsigned long newsize) \
-{ \
-	Elf ## CLASS ## _Phdr *phdr; \
-	int		i; \
- \
-	/* If the section header table is gone, then remove all references \
-	 * to it in the ELF header. \
-	 */ \
-	if (EGET(ehdr->e_shoff) >= newsize) { \
-		ESET(ehdr->e_shoff,0); \
-		ESET(ehdr->e_shnum,0); \
-		ESET(ehdr->e_shentsize,0); \
-		ESET(ehdr->e_shstrndx,0); \
-	} \
- \
-	/* The program adjusts the file size of any segment that was \
-	 * truncated. The case of a segment being completely stripped out \
-	 * is handled separately. \
-	 */ \
-	for (i = 0, phdr = phdrs ; i < EGET(ehdr->e_phnum) ; ++i, ++phdr) { \
-		if (EGET(phdr->p_offset) >= newsize) { \
-			ESET(phdr->p_offset,newsize); \
-			ESET(phdr->p_filesz,0); \
-		} else if (EGET(phdr->p_offset) + EGET(phdr->p_filesz) > newsize) { \
-			ESET(phdr->p_filesz, newsize - EGET(phdr->p_offset)); \
-		} \
-	} \
- \
-	return TRUE; \
-} \
- \
-/* commitchanges() writes the new headers back to the original file \
- * and sets the file to its new size. \
- */ \
-static int commitchanges ## CLASS (int fd, Elf ## CLASS ## _Ehdr const *ehdr, \
-								   Elf ## CLASS ## _Phdr *phdrs, \
-								   unsigned long newsize) \
-{ \
-	size_t	n; \
- \
-	/* Save the changes to the ELF header, if any. \
-	 */ \
-	if (lseek(fd, 0, SEEK_SET)) \
-		return ferr("could not rewind file"); \
-	errno = 0; \
-	if (write(fd, ehdr, sizeof *ehdr) != sizeof *ehdr) \
-		return err("could not modify file"); \
- \
-	/* Save the changes to the program segment header table, if any. \
-	 */ \
-	if (lseek(fd, EGET(ehdr->e_phoff), SEEK_SET) == (off_t)-1) { \
-		err("could not seek in file."); \
-		goto warning; \
-	} \
-	n = EGET(ehdr->e_phnum) * sizeof *phdrs; \
-	if (write(fd, phdrs, n) != (ssize_t)n) { \
-		err("could not write to file"); \
-		goto warning; \
-	} \
- \
-	/* Eleventh-hour sanity check: don't truncate before the end of \
-	 * the program segment header table. \
-	 */ \
-	if (newsize < EGET(ehdr->e_phoff) + n) \
-		newsize = EGET(ehdr->e_phoff) + n; \
- \
-	/* Chop off the end of the file. \
-	 */ \
-	if (ftruncate(fd, newsize)) { \
-		err("could not resize file"); \
-		goto warning; \
-	} \
- \
-	return TRUE; \
- \
- warning: \
-	return err("ELF file may have been corrupted!"); \
-}
-
-
-/* First elements of Elf32_Ehdr and Elf64_Ehdr are common.
- */
-static int readelfheaderident(int fd, Elf32_Ehdr *ehdr)
-{
-	errno = 0;
-	if (read(fd, ehdr, EI_NIDENT) != EI_NIDENT)
-		return ferr("missing or incomplete ELF header.");
-
-	/* Check the ELF signature.
-	 */
-	if (!(ehdr->e_ident[EI_MAG0] == ELFMAG0 &&
-		  ehdr->e_ident[EI_MAG1] == ELFMAG1 &&
-		  ehdr->e_ident[EI_MAG2] == ELFMAG2 &&
-		  ehdr->e_ident[EI_MAG3] == ELFMAG3))
-	{
-		err("missing ELF signature.");
-		return -1;
-	}
-
-	/* Compare the file's class and endianness with the program's.
-	 */
-#if __BYTE_ORDER == __LITTLE_ENDIAN
-	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB) {
-		do_reverse_endian = 0;
-	} else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB) {
-/* 		fprintf(stderr, "ELF file has different endianness.\n"); */
-		do_reverse_endian = 1;
-	}
-#elif __BYTE_ORDER == __BIG_ENDIAN
-	if (ehdr->e_ident[EI_DATA] == ELFDATA2LSB) {
-/* 		fprintf(stderr, "ELF file has different endianness.\n"); */
-		do_reverse_endian = 1;
-	} else if (ehdr->e_ident[EI_DATA] == ELFDATA2MSB) {
-		do_reverse_endian = 0;
-	}
-#else
-#error unkown endianness
-#endif
-	else {
-		err("Unsupported endianness");
-		return -1;
-	}
-
-	/* Check the target architecture.
-	 */
-/*	 if (EGET(ehdr->e_machine) != ELF_ARCH) { */
-/* 		/\* return err("ELF file created for different architecture."); *\/ */
-/* 		fprintf(stderr, "ELF file created for different architecture.\n"); */
-/* 	} */
-	return ehdr->e_ident[EI_CLASS];
-}
-
-
-HEADER_FUNCTIONS(32)
-
-HEADER_FUNCTIONS(64)
-
-/* truncatezeros() examines the bytes at the end of the file's
- * size-to-be, and reduces the size to exclude any trailing zero
- * bytes.
- */
-static int truncatezeros(int fd, unsigned long *newsize)
-{
-	unsigned char	contents[1024];
-	unsigned long	size, n;
-
-	size = *newsize;
-	do {
-		n = sizeof contents;
-		if (n > size)
-			n = size;
-		if (lseek(fd, size - n, SEEK_SET) == (off_t)-1)
-			return ferr("cannot seek in file.");
-		if (read(fd, contents, n) != (ssize_t)n)
-			return ferr("cannot read file contents");
-		while (n && !contents[--n])
-			--size;
-	} while (size && !n);
-
-	/* Sanity check.
-	 */
-	if (!size)
-		return err("ELF file is completely blank!");
-
-	*newsize = size;
-	return TRUE;
-}
-
-/* main() loops over the cmdline arguments, leaving all the real work
- * to the other functions.
- */
-int main(int argc, char *argv[])
-{
-	int				fd;
-	union {
-		Elf32_Ehdr	ehdr32;
-		Elf64_Ehdr	ehdr64;
-	} e;
-	union {
-		Elf32_Phdr	*phdrs32;
-		Elf64_Phdr	*phdrs64;
-	} p;
-	unsigned long	newsize;
-	char			**arg;
-	int				failures = 0;
-
-	if (argc < 2 || argv[1][0] == '-') {
-		printf("Usage: sstrip FILE...\n"
-			   "sstrip discards all nonessential bytes from an executable.\n\n"
-			   "Version 2.0-X Copyright (C) 2000,2001 Brian Raiter.\n"
-			   "Cross-devel hacks Copyright (C) 2004 Manuel Novoa III.\n"
-			   "This program is free software, licensed under the GNU\n"
-			   "General Public License. There is absolutely no warranty.\n");
-		return EXIT_SUCCESS;
-	}
-
-	progname = argv[0];
-
-	for (arg = argv + 1 ; *arg != NULL ; ++arg) {
-		filename = *arg;
-
-		fd = open(*arg, O_RDWR);
-		if (fd < 0) {
-			ferr("can't open");
-			++failures;
-			continue;
-		}
-
-		switch (readelfheaderident(fd, &e.ehdr32)) {
-			case ELFCLASS32:
-				if (!(readelfheader32(fd, &e.ehdr32)					&&
-					  readphdrtable32(fd, &e.ehdr32, &p.phdrs32)		&&
-					  getmemorysize32(&e.ehdr32, p.phdrs32, &newsize)	&&
-					  truncatezeros(fd, &newsize)						&&
-					  modifyheaders32(&e.ehdr32, p.phdrs32, newsize)	&&
-					  commitchanges32(fd, &e.ehdr32, p.phdrs32, newsize)))
-					++failures;
-				break;
-			case ELFCLASS64:
-				if (!(readelfheader64(fd, &e.ehdr64)					&&
-					  readphdrtable64(fd, &e.ehdr64, &p.phdrs64)		&&
-					  getmemorysize64(&e.ehdr64, p.phdrs64, &newsize)	&&
-					  truncatezeros(fd, &newsize)						&&
-					  modifyheaders64(&e.ehdr64, p.phdrs64, newsize)	&&
-					  commitchanges64(fd, &e.ehdr64, p.phdrs64, newsize)))
-					++failures;
-				break;
-			default:
-				++failures;
-				break;
-		}
-		close(fd);
-	}
-
-	return failures ? EXIT_FAILURE : EXIT_SUCCESS;
-}
diff --git a/toolchain/sstrip/sstrip.mk b/toolchain/sstrip/sstrip.mk
deleted file mode 100644
index f387e2d..0000000
--- a/toolchain/sstrip/sstrip.mk
+++ /dev/null
@@ -1,70 +0,0 @@
-######################################################################
-#
-# sstrip
-#
-######################################################################
-
-SSTRIP_SOURCE_FILE:=$(TOPDIR)/toolchain/sstrip/sstrip.c
-
-######################################################################
-#
-# sstrip host
-#
-######################################################################
-
-SSTRIP_HOST:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
-
-$(SSTRIP_HOST): $(SSTRIP_SOURCE_FILE)
-	mkdir -p $(@D) $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
-	$(HOSTCC) $(HOST_CFLAGS) $(SSTRIP_SOURCE_FILE) -o $(SSTRIP_HOST)
-	ln -snf ../../bin/$(REAL_GNU_TARGET_NAME)-sstrip \
-		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/sstrip
-	ln -snf $(REAL_GNU_TARGET_NAME)-sstrip \
-		$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-sstrip
-
-sstrip_host: $(SSTRIP_HOST)
-
-sstrip_host-source: $(SSTRIP_SOURCE_FILE)
-
-sstrip_host-clean:
-	rm -f $(SSTRIP_HOST)
-	rm -f $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/sstrip
-	rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-sstrip
-
-sstrip_host-dirclean:
-	true
-
-######################################################################
-#
-# sstrip target
-#
-######################################################################
-
-SSTRIP_TARGET:=$(TARGET_DIR)/usr/bin/sstrip
-
-$(SSTRIP_TARGET): $(SSTRIP_SOURCE_FILE)
-	$(TARGET_CC) $(TARGET_CFLAGS) $(SSTRIP_SOURCE_FILE) -o $(SSTRIP_TARGET)
-
-sstrip_target: $(SSTRIP_TARGET)
-
-sstrip_target-source: $(SSTRIP_SOURCE_FILE)
-
-sstrip_target-clean:
-	rm -f $(SSTRIP_TARGET)
-
-sstrip_target-dirclean:
-	true
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-
-ifeq ($(BR2_PACKAGE_SSTRIP_HOST),y)
-TARGETS+=sstrip_host
-endif
-
-ifeq ($(BR2_PACKAGE_SSTRIP_TARGET),y)
-TARGETS+=sstrip_target
-endif
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index 44044d7..f12a480 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -7,5 +7,4 @@ include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
 include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/mklibs/mklibs.mk
-include toolchain/sstrip/sstrip.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index d76aa7a..6a383f6 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -105,7 +105,6 @@ endchoice
 
 source "toolchain/elf2flt/Config.in"
 source "toolchain/mklibs/Config.in"
-source "toolchain/sstrip/Config.in"
 
 config BR2_VFP_FLOAT
 	bool "Use ARM Vector Floating Point unit"
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
index 1c80300..1befff2 100644
--- a/toolchain/toolchain-crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -9,5 +9,4 @@ include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
 include toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 include toolchain/mklibs/mklibs.mk
-include toolchain/sstrip/sstrip.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index f90b6f1..c43618b 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -8,6 +8,5 @@ include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
 include toolchain/kernel-headers/kernel-headers.mk
 include toolchain/mklibs/mklibs.mk
-include toolchain/sstrip/sstrip.mk
 include toolchain/toolchain-external/ext-tool.mk
 include toolchain/uClibc/uclibc.mk
-- 
1.7.2.2
