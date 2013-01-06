From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:52 +0100
Subject: [Buildroot] [PATCH 12/15] elfutils: towards uClibc support: gettext
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8ca2d6bdaaafedc9dc20c5e38c91d3b6a7b6faa0.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

elfutils is annoying: it needs gettext even if locale support is
disabled...

Heavily based from work done by Stefan Fr?berg, but with many further
modifications by Thomas Petazzoni.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/Config.in   |    1 +
 package/elfutils/elfutils.mk |   11 +++++++++++
 2 files changed, 12 insertions(+)

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
-- 
1.7.9.5
