From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 23 Dec 2012 03:05:49 +0200
Subject: [Buildroot] [PATCH] new package: p7zip
Message-ID: <1356224749-24739-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in                          |    1 +
 package/p7zip/7z                           |    3 +
 package/p7zip/7za                          |    3 +
 package/p7zip/Config.in                    |    9 +++
 package/p7zip/p7zip-9.20.1-QA.patch        |   12 ++++
 package/p7zip/p7zip-9.20.1-execstack.patch |   24 ++++++++
 package/p7zip/p7zip.mk                     |   81 ++++++++++++++++++++++++++++
 7 files changed, 133 insertions(+), 0 deletions(-)
 create mode 100755 package/p7zip/7z
 create mode 100755 package/p7zip/7za
 create mode 100644 package/p7zip/Config.in
 create mode 100644 package/p7zip/p7zip-9.20.1-QA.patch
 create mode 100644 package/p7zip/p7zip-9.20.1-execstack.patch
 create mode 100644 package/p7zip/p7zip.mk

diff --git a/package/Config.in b/package/Config.in
index 47a281e..e6487d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -13,6 +13,7 @@ source "package/gzip/Config.in"
 endif
 source "package/lzop/Config.in"
 source "package/lzma/Config.in"
+source "package/p7zip/Config.in"
 source "package/xz/Config.in"
 endmenu
 
diff --git a/package/p7zip/7z b/package/p7zip/7z
new file mode 100755
index 0000000..c04e07f
--- /dev/null
+++ b/package/p7zip/7z
@@ -0,0 +1,3 @@
+#!/bin/sh
+"/usr/lib/p7zip/7z" "$@"
+
diff --git a/package/p7zip/7za b/package/p7zip/7za
new file mode 100755
index 0000000..1d7374e
--- /dev/null
+++ b/package/p7zip/7za
@@ -0,0 +1,3 @@
+#!/bin/sh
+"/usr/lib/p7zip/7za" "$@"
+
diff --git a/package/p7zip/Config.in b/package/p7zip/Config.in
new file mode 100644
index 0000000..689feb4
--- /dev/null
+++ b/package/p7zip/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_P7ZIP
+	bool "p7zip"
+	help
+	  p7zip is a quick port of 7.exe and 7za.exe 
+	  (command line version of 7-zip, see http://www.7-zip.org) for Unix.
+
+	  7-Zip is a file archiver with highest compression ratio.
+
+	  http://sourceforge.net/projects/p7zip
diff --git a/package/p7zip/p7zip-9.20.1-QA.patch b/package/p7zip/p7zip-9.20.1-QA.patch
new file mode 100644
index 0000000..b7c121b
--- /dev/null
+++ b/package/p7zip/p7zip-9.20.1-QA.patch
@@ -0,0 +1,12 @@
+diff -Naur p7zip_9.20.1.org/CPP/7zip/Archive/NtfsHandler.cpp p7zip_9.20.1/CPP/7zip/Archive/NtfsHandler.cpp
+--- p7zip_9.20.1.org/CPP/7zip/Archive/NtfsHandler.cpp	2012-09-06 01:20:35.220955438 +0300
++++ p7zip_9.20.1/CPP/7zip/Archive/NtfsHandler.cpp	2012-09-06 01:21:35.361955043 +0300
+@@ -1280,7 +1280,7 @@
+     if (recSizeLog < Header.SectorSizeLog)
+       return false;
+     numSectorsInRec = 1 << (recSizeLog - Header.SectorSizeLog);
+-    if (!mftRec.Parse(ByteBuf, Header.SectorSizeLog, numSectorsInRec, NULL, 0))
++    if (!mftRec.Parse(ByteBuf, Header.SectorSizeLog, numSectorsInRec, 0, NULL))
+       return S_FALSE;
+     if (!mftRec.IsFILE())
+       return S_FALSE;
diff --git a/package/p7zip/p7zip-9.20.1-execstack.patch b/package/p7zip/p7zip-9.20.1-execstack.patch
new file mode 100644
index 0000000..1fdff48
--- /dev/null
+++ b/package/p7zip/p7zip-9.20.1-execstack.patch
@@ -0,0 +1,24 @@
+diff -Naupr p7zip_9.20.1.orig/Asm/x64/7zCrcT8U.asm p7zip_9.20.1/Asm/x64/7zCrcT8U.asm
+--- p7zip_9.20.1.orig/Asm/x64/7zCrcT8U.asm	2008-08-14 11:18:07.000000000 +0200
++++ p7zip_9.20.1/Asm/x64/7zCrcT8U.asm	2011-07-26 17:43:57.727910278 +0200
+@@ -101,3 +101,8 @@ _CrcUpdateT8:
+     ret
+ 
+ end
++
++%ifidn __OUTPUT_FORMAT__,elf
++section .note.GNU-stack noalloc noexec nowrite progbits
++%endif
++
+diff -Naupr p7zip_9.20.1.orig/Asm/x86/7zCrcT8U.asm p7zip_9.20.1/Asm/x86/7zCrcT8U.asm
+--- p7zip_9.20.1.orig/Asm/x86/7zCrcT8U.asm	2009-07-14 12:44:15.000000000 +0200
++++ p7zip_9.20.1/Asm/x86/7zCrcT8U.asm	2011-07-26 17:44:23.938864508 +0200
+@@ -99,3 +99,8 @@ _CrcUpdateT8:
+ 
+ 
+ ; end
++
++%ifidn __OUTPUT_FORMAT__,elf
++section .note.GNU-stack noalloc noexec nowrite progbits
++%endif
++
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
new file mode 100644
index 0000000..efc0adc
--- /dev/null
+++ b/package/p7zip/p7zip.mk
@@ -0,0 +1,81 @@
+############################################
+#
+# p7zip
+# 
+# Note: I just constructed this (mostly) from 
+# Gentoo ebuild file of p7zip.
+#
+# Original can be found from here:
+# http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-arch/p7zip/p7zip-9.20.1-r2.ebuild
+# 
+############################################
+P7ZIP_VERSION = 9.20.1
+P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
+P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
+P7ZIP_DEPENDENCIES = host-yasm
+# What UnRAR license basically means here is that as long
+# as you are not using UnRAR source code to reverse engineer 
+# the RAR *compression* algorithm, which is proprietary and owned by Alexander L. Roshal,
+# then everything should be fine, in this case (LGPLv2.1+).
+P7ZIP_LICENSE = LGPLv2.1+ UnRAR
+
+# Is this the right way to do ?
+# Basically this should mean:
+# "If we have 32-bit Intel/AMD machine, then use 32-bit asm optimized makefile for building"
+# "If we have 64-bit Intel/AMD machine, then use 64-bit asm optimized makefile for building"
+# "If we have anything else than Intel or AMD CPU, then use the generic makefile for building"
+# (those sed lines will just ensure that we are using host-yasm assembler for 32-bit and 64-bit building)
+ifeq ($(BR2_i386),y)
+define	P7ZIP_POST_CONFIGURE_FIXUP
+	(cd $(@D); \
+	sed -i -e "/^ASM=/s:nasm:$(HOST_DIR)/usr/bin/yasm:" makefile.linux_x86_asm_gcc_4.X ;\
+	 cp makefile.linux_x86_asm_gcc_4.X makefile.machine)
+endef
+else if ($(BR2_x86_64),y)
+define	P7ZIP_POST_CONFIGURE_FIXUP
+	(cd $(@D); \
+	sed -i -e "/^ASM=/s:yasm:$(HOST_DIR)/usr/bin/yasm:" makefile.linux_amd64_asm ;\
+	 cp makefile.linux_amd64_asm makefile.machine)
+endef
+else
+define	P7ZIP_POST_CONFIGURE_FIXUP
+	(cd $(@D); \
+	 cp makefile.linux_any_cpu_gcc_4.X makefile.machine)
+endef
+endif
+
+P7ZIP_POST_CONFIGURE_HOOKS += P7ZIP_POST_CONFIGURE_FIXUP
+
+define	P7ZIP_CONFIGURE_CMDS
+	# Do some PCH disabling and makefile fixup
+	(cd $(@D); \
+	sed "s:PRE_COMPILED_HEADER=StdAfx.h.gch:PRE_COMPILED_HEADER=:g" -i makefile.* ;\
+	sed -e 's:-m32 ::g' -e 's:-m64 ::g' -e 's:-O::g' -e 's:-pipe::g' \
+	-e "/^CC/s:\$$(ALLFLAGS):$${CFLAGS} \$$(ALLFLAGS):g" \
+	-e "/^CXX/s:\$$(ALLFLAGS):$${CXXFLAGS} \$$(ALLFLAGS):g" -i makefile* ;\
+	sed -i -e "/^CXX=/s:g++:$(TARGET_CXX):" \
+		-e "/^CC=/s:gcc:$(TARGET_CC):" \
+		-e '/ALLFLAGS/s:-s ::' makefile* )
+endef
+
+define P7ZIP_BUILD_CMDS
+	 $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all2
+endef
+
+define P7ZIP_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib/p7zip
+	cp -r $(@D)/bin/* $(TARGET_DIR)/usr/lib/p7zip/
+
+	# According to Gentoo folks, we can't just use symlinks
+	# but have to invoke p7zip programs (7z & 7za) with full path (/usr/lib/p7zip) 
+	# when using them (which is really annoying)
+
+	# That's why we use more helpful wrapper scripts instead.
+	cp package/p7zip/7z $(TARGET_DIR)/usr/bin/
+	cp package/p7zip/7za $(TARGET_DIR)/usr/bin/
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
+
+
-- 
1.7.7.6
