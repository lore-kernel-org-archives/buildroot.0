From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 28 Sep 2016 15:43:48 +0200
Subject: [Buildroot] [PATCH] newt: bump to version 0.52.19
Message-ID: <1475070228-18312-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Remove upstreamed patches and change download location.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...-instead-of-CPP-to-generate-.depend-files.patch | 38 ----------------------
 ...e-bogus-I-usr-include-slang-from-CPPFLAGS.patch | 33 -------------------
 package/newt/newt.hash                             |  2 +-
 package/newt/newt.mk                               |  4 +--
 4 files changed, 3 insertions(+), 74 deletions(-)
 delete mode 100644 package/newt/0001-Use-CC-instead-of-CPP-to-generate-.depend-files.patch
 delete mode 100644 package/newt/0002-Remove-bogus-I-usr-include-slang-from-CPPFLAGS.patch

diff --git a/package/newt/0001-Use-CC-instead-of-CPP-to-generate-.depend-files.patch b/package/newt/0001-Use-CC-instead-of-CPP-to-generate-.depend-files.patch
deleted file mode 100644
index 853472b..0000000
--- a/package/newt/0001-Use-CC-instead-of-CPP-to-generate-.depend-files.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 65754effe16506a7a0a04069c8b6e1281811604d Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 10 Jan 2015 11:54:10 +0100
-Subject: [PATCH newt 1/2] Use $(CC) instead of $(CPP) to generate .depend
- files
-
-Use $(CC) instead of $(CPP) to generate .depend file because '$(CPP)
--M' call does not support multiple input files.  This avoid the
-following error:
-
-make[1]: Entering directory `/opt/br/output/build/newt-0.51.0'
-/opt/br/output/host/usr/bin/arm-none-linux-gnueabi-cpp -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -M newt.c button.c form.c checkbox.c entry.c label.c listbox.c scrollbar.c textbox.c scale.c grid.c windows.c buttonbar.c checkboxtree.c > .depend
-arm-none-linux-gnueabi-cpp: too many input files
-make[1]: *** [depend] Error 1
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 7989203..17853e0 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -121,7 +121,7 @@ clean:
- 		$(SHAREDDIR)/*.o *.$(SOEXT)*
- 
- depend:
--	$(CPP) $(CFLAGS) $(CPPFLAGS) -M $(SOURCES) > .depend
-+	$(CC) $(CFLAGS) $(CPPFLAGS) -M $(SOURCES) > .depend
- 
- $(SHAREDDIR):
- 	mkdir -p $(SHAREDDIR)
--- 
-2.1.0
-
diff --git a/package/newt/0002-Remove-bogus-I-usr-include-slang-from-CPPFLAGS.patch b/package/newt/0002-Remove-bogus-I-usr-include-slang-from-CPPFLAGS.patch
deleted file mode 100644
index eb445dd..0000000
--- a/package/newt/0002-Remove-bogus-I-usr-include-slang-from-CPPFLAGS.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 28145b46649165b94666ee585d064b41306e10fd Mon Sep 17 00:00:00 2001
-From: Alex Suykov <alex.suykov@gmail.com>
-Date: Sat, 10 Jan 2015 11:55:32 +0100
-Subject: [PATCH newt 2/2] Remove bogus -I/usr/include/slang from CPPFLAGS
-
-Hardcoding -I/usr/include/slang in CPPFLAGS is bogus for
-cross-compilation. With recent versions of slang, the headers are
-installed in ${sysroot}/usr/include directly, so there is no need for
-an additional flag. And if one was needed, it should be added by the
-configure script, after detecting the right header location.
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 17853e0..d32d784 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -5,7 +5,7 @@ CC = @CC@
- CPP = @CPP@
- CFLAGS = @CFLAGS@
- LDFLAGS = @LDFLAGS@
--CPPFLAGS = -D_GNU_SOURCE -I/usr/include/slang @CPPFLAGS@ 
-+CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@
- GNU_LD = @GNU_LD@
- 
- VERSION = @VERSION@
--- 
-2.1.0
-
diff --git a/package/newt/newt.hash b/package/newt/newt.hash
index ca64f41..fe5870b 100644
--- a/package/newt/newt.hash
+++ b/package/newt/newt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	771b0e634ede56ae6a6acd910728bb5832ac13ddb0d1d27919d2498dab70c91e	newt-0.52.18.tar.gz
+sha256	08c0db56c21996af6a7cbab99491b774c6c09cef91cd9b03903c84634bff2e80  newt-0.52.19.tar.gz
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 4c5d241..2b8d337 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NEWT_VERSION = 0.52.18
-NEWT_SITE = https://fedorahosted.org/releases/n/e/newt
+NEWT_VERSION = 0.52.19
+NEWT_SITE = https://pagure.io/releases/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-- 
2.1.4
