From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sun,  8 Jul 2018 21:54:29 +0200
Subject: [Buildroot] [PATCH] systemd: add an option to use busybox's getty
Message-ID: <20180708195429.9693-1-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the patch to replace agetty with busybox's getty is always
applied.

this patch adds a compile-time option to systemd to choose either agetty
or busybox's getty and chooses the correct option depending on agetty being
selected in busybox


Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/systemd/0001-fix-getty-unit.patch | 112 +++++++++++++++++-----
 package/systemd/systemd.mk                |   6 ++
 2 files changed, 93 insertions(+), 25 deletions(-)

diff --git a/package/systemd/0001-fix-getty-unit.patch b/package/systemd/0001-fix-getty-unit.patch
index d546e1ab32..cdbcf38b93 100644
--- a/package/systemd/0001-fix-getty-unit.patch
+++ b/package/systemd/0001-fix-getty-unit.patch
@@ -1,4 +1,4 @@
-From 69e440f9b7a0e9a43ef582d4bb521722b448a7c2 Mon Sep 17 00:00:00 2001
+From 5f0534a9464717f1cde3f9c1c76f3bff6b9ae6a1 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Mon, 31 Jul 2017 10:08:46 -0400
 Subject: [PATCH] fix-getty-unit
@@ -6,7 +6,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Prefer getty to agetty in console setup systemd units
+Add an option to select getty instead of agetty
 
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
@@ -14,68 +14,130 @@ Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [J?r?my: replace additional usage of agetty by getty.]
 Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
+[J?r?my: transform into a systemd compile-time option.]
+Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
 ---
- units/console-getty.service.m4    | 2 +-
- units/container-getty at .service.m4 | 2 +-
- units/getty at .service.m4           | 5 +----
- units/serial-getty at .service.m4    | 2 +-
- 4 files changed, 4 insertions(+), 7 deletions(-)
+ meson.build                       | 4 +++-
+ meson_options.txt                 | 3 +++
+ units/console-getty.service.m4    | 7 +++++--
+ units/container-getty at .service.m4 | 7 +++++--
+ units/getty at .service.m4           | 7 +++++--
+ units/serial-getty at .service.m4    | 7 +++++--
+ 6 files changed, 26 insertions(+), 9 deletions(-)
 
+diff --git a/meson.build b/meson.build
+index 04331dd41..b95e74a54 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1221,7 +1221,8 @@ foreach term : ['utmp',
+                 'smack',
+                 'gshadow',
+                 'idn',
+-                'nss-systemd']
++                'nss-systemd',
++                'busybox-getty']
+         have = get_option(term)
+         name = 'ENABLE_' + term.underscorify().to_upper()
+         conf.set10(name, have)
+@@ -2985,6 +2986,7 @@ foreach tuple : [
+         ['debug hashmap'],
+         ['debug mmap cache'],
+         ['valgrind',         conf.get('VALGRIND') == 1],
++        ['busybox-getty']
+ ]
+ 
+         if tuple.length() >= 2
+diff --git a/meson_options.txt b/meson_options.txt
+index 16c1f2b2f..8ccdd6c7d 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -315,3 +315,6 @@ option('oss-fuzz', type : 'boolean', value : 'false',
+        description : 'build against oss-fuzz')
+ option('llvm-fuzz', type : 'boolean', value : 'false',
+        description : 'build against LLVM libFuzzer')
++
++option('busybox-getty',type : 'boolean', value : 'false',
++       description : 'Use busybox implementation of getty')
 diff --git a/units/console-getty.service.m4 b/units/console-getty.service.m4
-index 3c553240a..fd5ad9456 100644
+index 3c553240a..7271336f1 100644
 --- a/units/console-getty.service.m4
 +++ b/units/console-getty.service.m4
-@@ -23,7 +23,7 @@ ConditionPathExists=/dev/console
- # The '-o' option value tells agetty to replace 'login' arguments with an
+@@ -20,10 +20,13 @@ Before=getty.target
+ ConditionPathExists=/dev/console
+ 
+ [Service]
+-# The '-o' option value tells agetty to replace 'login' arguments with an
++m4_changequote(?,@)m4_ifdef(?ENABLE_BUSYBOX_GETTY@,
++?ExecStart=-/sbin/getty -L %I 115200 vt100@,
++?# The '-o' option value tells agetty to replace 'login' arguments with an
  # option to preserve environment (-p), followed by '--' for safety, and then
  # the entered username.
 -ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud console 115200,38400,9600 $TERM
-+ExecStart=-/sbin/getty -L %I 115200 vt100
++ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud console 115200,38400,9600 $TERM@
++)m4_changequote()m4_dnl
  Type=idle
  Restart=always
  UtmpIdentifier=cons
 diff --git a/units/container-getty at .service.m4 b/units/container-getty at .service.m4
-index 087ab7f9b..30f7b66fe 100644
+index 087ab7f9b..f534375bd 100644
 --- a/units/container-getty at .service.m4
 +++ b/units/container-getty at .service.m4
-@@ -28,7 +28,7 @@ Before=rescue.service
- # The '-o' option value tells agetty to replace 'login' arguments with an
+@@ -25,10 +25,13 @@ Conflicts=rescue.service
+ Before=rescue.service
+ 
+ [Service]
+-# The '-o' option value tells agetty to replace 'login' arguments with an
++m4_changequote(?,@)m4_ifdef(?ENABLE_BUSYBOX_GETTY@,
++?ExecStart=-/sbin/getty -L %I 115200 vt100@,
++?# The '-o' option value tells agetty to replace 'login' arguments with an
  # option to preserve environment (-p), followed by '--' for safety, and then
  # the entered username.
 -ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud pts/%I 115200,38400,9600 $TERM
-+ExecStart=-/sbin/getty -L %I 115200 vt100
++ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud pts/%I 115200,38400,9600 $TERM@
++)m4_changequote()m4_dnl
  Type=idle
  Restart=always
  RestartSec=0
 diff --git a/units/getty at .service.m4 b/units/getty at .service.m4
-index 80e793bb7..385758c61 100644
+index 80e793bb7..2370e94f3 100644
 --- a/units/getty at .service.m4
 +++ b/units/getty at .service.m4
-@@ -35,10 +35,7 @@ ConditionPathExists=/dev/tty0
+@@ -35,10 +35,13 @@ ConditionPathExists=/dev/tty0
  
  [Service]
  # the VT is cleared by TTYVTDisallocate
 -# The '-o' option value tells agetty to replace 'login' arguments with an
--# option to preserve environment (-p), followed by '--' for safety, and then
--# the entered username.
++m4_changequote(?,@)m4_ifdef(?ENABLE_BUSYBOX_GETTY@,
++?ExecStart=-/sbin/getty -L %I 115200 vt100@,
++?# The '-o' option value tells agetty to replace 'login' arguments with an
+ # option to preserve environment (-p), followed by '--' for safety, and then
+ # the entered username.
 -ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear %I $TERM
-+ExecStart=-/sbin/getty -L %I 115200 vt100
++ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear %I $TERM@
++)m4_changequote()m4_dnl
  Type=idle
  Restart=always
  RestartSec=0
 diff --git a/units/serial-getty at .service.m4 b/units/serial-getty at .service.m4
-index 757b86ab2..3d60efdb6 100644
+index 757b86ab2..fea646f77 100644
 --- a/units/serial-getty at .service.m4
 +++ b/units/serial-getty at .service.m4
-@@ -33,7 +33,7 @@ Before=rescue.service
- # The '-o' option value tells agetty to replace 'login' arguments with an
+@@ -30,10 +30,13 @@ Conflicts=rescue.service
+ Before=rescue.service
+ 
+ [Service]
+-# The '-o' option value tells agetty to replace 'login' arguments with an
++m4_changequote(?,@)m4_ifdef(?ENABLE_BUSYBOX_GETTY@,
++?ExecStart=-/sbin/getty -L %I 115200 vt100@,
++?# The '-o' option value tells agetty to replace 'login' arguments with an
  # option to preserve environment (-p), followed by '--' for safety, and then
  # the entered username.
 -ExecStart=-/sbin/agetty -o '-p -- \\u' --keep-baud 115200,38400,9600 %I $TERM
-+ExecStart=-/sbin/getty -L %I 115200 vt100
++ExecStart=-/sbin/agetty -o '-p -- \\u' --keep-baud 115200,38400,9600 %I $TERM@
++)m4_changequote()m4_dnl
  Type=idle
  Restart=always
  UtmpIdentifier=%I
 -- 
-2.14.4
+2.18.0
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d7031ed21d..e723a59f33 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -332,6 +332,12 @@ else
 SYSTEMD_CONF_OPTS += -Dhibernate=false
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),y)
+SYSTEMD_CONF_OPTS += -Dbusybox-getty=false
+else
+SYSTEMD_CONF_OPTS += -Dbusybox-getty=true
+endif
+
 SYSTEMD_FALLBACK_HOSTNAME = $(call qstrip,$(BR2_TARGET_GENERIC_HOSTNAME))
 ifneq ($(SYSTEMD_FALLBACK_HOSTNAME),)
 SYSTEMD_CONF_OPTS += -Dfallback-hostname=$(SYSTEMD_FALLBACK_HOSTNAME)
-- 
2.18.0
