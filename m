From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 17:35:41 +0100
Subject: [Buildroot] [git commit branch/next] openocd: bump to 0.9.0
Message-ID: <20151201164337.73D2180287@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=827bf7a24fdcf6be51fb2d2813d6d8123252905b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove obsolete compilation error patch and update jimtcl related patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...mpilation-error-in-src-flash-nor-mini51.c.patch |   30 --------------------
 ...auto-configuration-to-force-static-librar.patch |   14 ++-------
 package/openocd/openocd.hash                       |    6 ++--
 package/openocd/openocd.mk                         |    4 +-
 4 files changed, 8 insertions(+), 46 deletions(-)

diff --git a/package/openocd/0001-Fix-compilation-error-in-src-flash-nor-mini51.c.patch b/package/openocd/0001-Fix-compilation-error-in-src-flash-nor-mini51.c.patch
deleted file mode 100644
index 6eb7f9d..0000000
--- a/package/openocd/0001-Fix-compilation-error-in-src-flash-nor-mini51.c.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 893330638a26ea2868c6e7606047acf9b6fe31ea Mon Sep 17 00:00:00 2001
-From: Claudio Laurita <claudio.laurita@integrazionetotale.it>
-Date: Sun, 30 Nov 2014 17:30:36 +0100
-Subject: [PATCH 1/1] Fix compilation error in src/flash/nor/mini51.c
-
-0001-Fix-compilation-error-in-src-flash-nor-mini51.c.patch
-gcc complains about missing initialization of 
-local variable flash_size and compilation aborts
-
-Signed-off-by: Claudio Laurita <claudio.laurita@integrazionetotale.it>
----
- src/flash/nor/mini51.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/flash/nor/mini51.c b/src/flash/nor/mini51.c
-index 61aee5d..c7ba13a 100644
---- a/src/flash/nor/mini51.c
-+++ b/src/flash/nor/mini51.c
-@@ -397,7 +397,7 @@ static int mini51_write(struct flash_bank *bank, const uint8_t *buffer, uint32_t
- 
- static int mini51_probe(struct flash_bank *bank)
- {
--	uint32_t flash_size;
-+	uint32_t flash_size = 0;
- 	int retval;
- 	int num_pages;
- 	uint32_t offset = 0;
--- 
-2.1.3
-
diff --git a/package/openocd/0002-Fix-jimtcl-auto-configuration-to-force-static-librar.patch b/package/openocd/0002-Fix-jimtcl-auto-configuration-to-force-static-librar.patch
index 5ec0552..fd3cfa4 100644
--- a/package/openocd/0002-Fix-jimtcl-auto-configuration-to-force-static-librar.patch
+++ b/package/openocd/0002-Fix-jimtcl-auto-configuration-to-force-static-librar.patch
@@ -7,15 +7,10 @@ Subject: [PATCH 2/2] Fix jimtcl auto configuration to force static library
  option in buildroot project.
 
 Signed-off-by: Claudio Laurita <claudio.laurita@integrazionetotale.it>
----
- jimtcl/auto.def | 8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
 
-diff --git a/jimtcl/auto.def b/jimtcl/auto.def
-index ddb0c1e..929ade0 100644
 --- a/jimtcl/auto.def
 +++ b/jimtcl/auto.def
-@@ -181,12 +181,8 @@ if {[opt-bool references]} {
+@@ -194,12 +194,8 @@
      msg-result "Enabling references"
      define JIM_REFERENCES
  }
@@ -27,9 +22,6 @@ index ddb0c1e..929ade0 100644
 -}
 +msg-result "Building static library"
 +define JIM_STATICLIB
+ define LIBSOEXT [format [get-define SH_SOEXTVER] [format %.2f [expr {[get-define JIM_VERSION] / 100.0}]]]
  define JIM_INSTALL [opt-bool install-jim]
- 
- # Attributes of the extensions
--- 
-2.1.3
-
+ define JIM_DOCS [opt-bool docs]
diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
index bc5c8c0..4ca11e2 100644
--- a/package/openocd/openocd.hash
+++ b/package/openocd/openocd.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/openocd/files/openocd/0.8.0/
-sha1 10bf9eeb54e03083cb1a101785b2d69fbdf18f31 openocd-0.8.0.tar.bz2
-md5 6d83c34763a5f1d1ac7ad83c5a11f4fb openocd-0.8.0.tar.bz2
+# From http://sourceforge.net/projects/openocd/files/openocd/0.9.0/
+sha1 bcf99bb21f09513065b2c9ece148ace7d16cdd0c openocd-0.9.0.tar.bz2
+md5 665cc98ae9e7297e09ec6ac7235fee49 openocd-0.9.0.tar.bz2
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 3b76850..21a302f 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-OPENOCD_VERSION = 0.8.0
+OPENOCD_VERSION = 0.9.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
-OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
+OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
 
 OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
