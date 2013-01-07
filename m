From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:44:56 +0100
Subject: [Buildroot] [git commit] elfutils: towards uClibc support: gettext
Message-ID: <20130107212532.B15529A691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f282139807a7d10cc496b6ede23a4c16e587e0be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elfutils is annoying: it needs gettext even if locale support is
disabled...

Heavily based from work done by Stefan Fr??berg, but with many further
modifications by Thomas Petazzoni.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/elfutils/Config.in   |    1 +
 package/elfutils/elfutils.mk |   11 +++++++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 5ec4ca9..78d02a5 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_ELFUTILS
 	       BR2_TOOLCHAIN_BUILDROOT   || \
 	       BR2_TOOLCHAIN_CTNG_uClibc || \
 	       BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_LARGEFILE
 	help
 	  Libraries/utilities to handle ELF objects (drop in
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 9f9de52..39407db 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -25,6 +25,17 @@ ELFUTILS_CONF_ENV += \
         CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
 endif
 
+ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS)
+
+# Unconditionnally requires gettext.
+ifeq ($(BR2_NEEDS_GETTEXT),y)
+ELFUTILS_DEPENDENCIES += gettext
+ELFUTILS_LDFLAGS += -lintl
+endif
+
+ELFUTILS_CONF_ENV += \
+	LDFLAGS="$(ELFUTILS_LDFLAGS)"
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
  ELFUTILS_DEPENDENCIES += argp-standalone
 endif
