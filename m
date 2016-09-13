From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 13 Sep 2016 06:15:44 +0200
Subject: [Buildroot] [PATCH 1/5] grub2: bump up version
In-Reply-To: <20160913041548.10290-1-nunes.erico@gmail.com>
References: <20160913041548.10290-1-nunes.erico@gmail.com>
Message-ID: <20160913041548.10290-2-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grub 2 version 2.00 which exists in Buildroot dates back from 2012 and
does not support new interesting features such as ARM support.

Despite it being the last official non-beta release, it makes sense to
bump Grub 2 to current master HEAD as the project has not been providing
regular releases since then.
Other distributions such as Fedora have also been shipping variations of
the newer "beta" releases.

Patch boot/grub2/0001-remove-gets.patch doesn't seem to be required
anymore as grub-core/gnulib/stdio.in.h has changed significantly since
"053cfcd Import new gnulib." and has another treatment for gets.
Patch
boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch
was a backport which is present after the bump and therefore is also no
longer necessary.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 boot/grub2/0001-remove-gets.patch                  | 21 ------------
 ...ettext-gettext.c-main_context-secondary_c.patch | 39 ----------------------
 boot/grub2/grub2.hash                              |  4 +--
 boot/grub2/grub2.mk                                | 11 ++++--
 4 files changed, 10 insertions(+), 65 deletions(-)
 delete mode 100644 boot/grub2/0001-remove-gets.patch
 delete mode 100644 boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch

diff --git a/boot/grub2/0001-remove-gets.patch b/boot/grub2/0001-remove-gets.patch
deleted file mode 100644
index 0da71b3..0000000
--- a/boot/grub2/0001-remove-gets.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-ISO C11 removes the specification of gets() from the C language, eglibc 2.16+ removed it
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Upstream-Status: Pending
-Index: grub-1.99/grub-core/gnulib/stdio.in.h
-===================================================================
---- grub-1.99.orig/grub-core/gnulib/stdio.in.h	2010-12-01 06:45:43.000000000 -0800
-+++ grub-1.99/grub-core/gnulib/stdio.in.h	2012-07-04 12:25:02.057099107 -0700
-@@ -140,8 +140,10 @@
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
-+#if defined gets
- #undef gets
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
diff --git a/boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch b/boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch
deleted file mode 100644
index 94be092..0000000
--- a/boot/grub2/0002-grub-core-gettext-gettext.c-main_context-secondary_c.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f30c692c1f9ef0e93bee2b408a24baa017f1ca9d Mon Sep 17 00:00:00 2001
-From: Vladimir Serbinenko <phcoder@gmail.com>
-Date: Thu, 7 Nov 2013 01:01:47 +0100
-Subject: [PATCH] 	* grub-core/gettext/gettext.c (main_context),
- (secondary_context): 	Define after defining type and not before.
-
-[Thomas: backport from upstream commit
-f30c692c1f9ef0e93bee2b408a24baa017f1ca9d, and remove ChangeLog
-modifications to avoid conflicts.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- grub-core/gettext/gettext.c | 4 ++--
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
-index df73570..4880cef 100644
---- a/grub-core/gettext/gettext.c
-+++ b/grub-core/gettext/gettext.c
-@@ -34,8 +34,6 @@ GRUB_MOD_LICENSE ("GPLv3+");
-    http://www.gnu.org/software/autoconf/manual/gettext/MO-Files.html .
- */
- 
--static struct grub_gettext_context main_context, secondary_context;
--
- static const char *(*grub_gettext_original) (const char *s);
- 
- struct grub_gettext_msg
-@@ -69,6 +67,8 @@ struct grub_gettext_context
-   struct grub_gettext_msg *grub_gettext_msg_list;
- };
- 
-+static struct grub_gettext_context main_context, secondary_context;
-+
- #define MO_MAGIC_NUMBER 		0x950412de
- 
- static grub_err_t
--- 
-2.7.4
-
diff --git a/boot/grub2/grub2.hash b/boot/grub2/grub2.hash
index 8883905..051a9ab 100644
--- a/boot/grub2/grub2.hash
+++ b/boot/grub2/grub2.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	784ec38e7edc32239ad75b8e66df04dc8bfb26d88681bc9f627133a6eb85c458	grub-2.00.tar.xz
+# Locally computed:
+sha256 680f584995cf318adb1ff8c40caef30d0ec7c03e16e88ba60bf5aa5b5a6e26ed grub2-4e0f8f66e321cf1051c0e01f6fbcc6fc35a807b6.tar.gz
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index dc4e51e..ecdf421 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GRUB2_VERSION = 2.00
-GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
-GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
+GRUB2_VERSION = 4e0f8f66e321cf1051c0e01f6fbcc6fc35a807b6
+GRUB2_SITE = git://git.savannah.gnu.org/grub.git
+GRUB2_SITE_METHOD = git
 GRUB2_LICENSE = GPLv3+
 GRUB2_LICENSE_FILES = COPYING
 GRUB2_DEPENDENCIES = host-bison host-flex
@@ -70,6 +70,11 @@ GRUB2_CONF_OPTS = \
 	--enable-libzfs=no \
 	--disable-werror
 
+define GRUB2_RUN_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+GRUB2_PRE_CONFIGURE_HOOKS += GRUB2_RUN_AUTOGEN
+
 # We don't want all the native tools and Grub2 modules to be installed
 # in the target. So we in fact install everything into the host
 # directory, and the image generation process (below) will use the
-- 
2.9.3
