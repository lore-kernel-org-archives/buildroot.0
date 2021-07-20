From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 20 Jul 2021 09:25:59 -0600
Subject: [Buildroot] [PATCH 1/1] package/systemd: disable urlify unless
 supported
Message-ID: <20210720152559.129171-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The urlify feature in the systemd pager is only supported by the full
less package and not busybox less, enable only for builds with full
less support.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...1-Add-meson-option-to-disable-urlify.patch | 67 +++++++++++++++++++
 package/systemd/systemd.mk                    |  6 ++
 2 files changed, 73 insertions(+)
 create mode 100644 package/systemd/0001-Add-meson-option-to-disable-urlify.patch

diff --git a/package/systemd/0001-Add-meson-option-to-disable-urlify.patch b/package/systemd/0001-Add-meson-option-to-disable-urlify.patch
new file mode 100644
index 0000000000..b0a59a9f0f
--- /dev/null
+++ b/package/systemd/0001-Add-meson-option-to-disable-urlify.patch
@@ -0,0 +1,67 @@
+From e5d86ebed5624ef62342c820a5868b1075deb300 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 11 Jul 2021 04:39:33 -0600
+Subject: [PATCH] Add meson option to disable urlify.
+
+Useful for systems that don't use a version of less with hyperlink
+support.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1 at gmail.com: backport from upstream commit
+e5d86ebed5624ef62342c820a5868b1075deb300]
+---
+ meson.build               | 1 +
+ meson_options.txt         | 2 ++
+ src/shared/pretty-print.c | 4 ++++
+ 3 files changed, 7 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 5735cfc7ad..a2ee15bf32 100644
+--- a/meson.build
++++ b/meson.build
+@@ -278,6 +278,7 @@ conf.set_quoted('USER_PRESET_DIR',                            userpresetdir)
+ conf.set_quoted('VENDOR_KEYRING_PATH',                        join_paths(rootlibexecdir, 'import-pubring.gpg'))
+ 
+ conf.set('ANSI_OK_COLOR',                                     'ANSI_' + get_option('ok-color').underscorify().to_upper())
++conf.set10('ENABLE_URLIFY',                                   get_option('urlify'))
+ conf.set10('ENABLE_FEXECVE',                                  get_option('fexecve'))
+ conf.set10('MEMORY_ACCOUNTING_DEFAULT',                       memory_accounting_default)
+ conf.set('STATUS_UNIT_FORMAT_DEFAULT',                        'STATUS_UNIT_FORMAT_' + status_unit_format_default.to_upper())
+diff --git a/meson_options.txt b/meson_options.txt
+index 163c8df87d..b60261ac24 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -444,6 +444,8 @@ option('ok-color', type : 'combo',
+                   'highlight-cyan', 'highlight-white'],
+        value : 'green',
+        description: 'color of the "OK" status message')
++option('urlify', type : 'boolean', value : 'true',
++       description : 'enable pager Hyperlink ANSI sequence support')
+ option('fexecve', type : 'boolean', value : 'false',
+        description : 'use fexecve() to spawn children')
+ 
+diff --git a/src/shared/pretty-print.c b/src/shared/pretty-print.c
+index 137ba77b3a..7983c0a33a 100644
+--- a/src/shared/pretty-print.c
++++ b/src/shared/pretty-print.c
+@@ -19,6 +19,7 @@
+ #include "util.h"
+ 
+ bool urlify_enabled(void) {
++#if ENABLE_URLIFY
+         static int cached_urlify_enabled = -1;
+ 
+         if (cached_urlify_enabled < 0) {
+@@ -32,6 +33,9 @@ bool urlify_enabled(void) {
+         }
+ 
+         return cached_urlify_enabled;
++#else
++        return 0;
++#endif
+ }
+ 
+ int terminal_urlify(const char *url, const char *text, char **ret) {
+-- 
+2.25.1
+
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 5562703a89..03a5a5e4c8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -59,6 +59,12 @@ else
 SYSTEMD_CONF_OPTS += -Dacl=false
 endif
 
+ifeq ($(BR2_PACKAGE_LESS),y)
+SYSTEMD_CONF_OPTS += -Durlify=true
+else
+SYSTEMD_CONF_OPTS += -Durlify=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 SYSTEMD_DEPENDENCIES += libapparmor
 SYSTEMD_CONF_OPTS += -Dapparmor=true
-- 
2.25.1
