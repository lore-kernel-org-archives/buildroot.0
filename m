From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Fri, 14 Dec 2018 10:22:17 +0800
Subject: [Buildroot] [PATCH 1/1] boot/systemd-boot: new package
Message-ID: <1544754137-698-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

This is essentially the successor to gummiboot.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                         |   1 +
 boot/Config.in                                     |   1 +
 boot/systemd-boot/0001-fix-getty-unit.patch        |  81 +++++++++++++++
 .../0002-install-don-t-use-ln-relative.patch       |  80 +++++++++++++++
 ...etect-whether-struct-statx-is-defined-in-.patch | 111 +++++++++++++++++++++
 ...-linux-stat.h-check-with-other-checks-and.patch |  77 ++++++++++++++
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch |  30 ++++++
 ...eson.build-fix-detection-of-Werror-shadow.patch |  34 +++++++
 boot/systemd-boot/Config.in                        |  23 +++++
 boot/systemd-boot/buildroot.conf                   |   3 +
 boot/systemd-boot/loader.conf                      |   2 +
 boot/systemd-boot/systemd-boot.hash                |   5 +
 boot/systemd-boot/systemd-boot.mk                  | 106 ++++++++++++++++++++
 13 files changed, 554 insertions(+)
 create mode 100644 boot/systemd-boot/0001-fix-getty-unit.patch
 create mode 100644 boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
 create mode 100644 boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
 create mode 100644 boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
 create mode 100644 boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
 create mode 100644 boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
 create mode 100644 boot/systemd-boot/Config.in
 create mode 100644 boot/systemd-boot/buildroot.conf
 create mode 100644 boot/systemd-boot/loader.conf
 create mode 100644 boot/systemd-boot/systemd-boot.hash
 create mode 100644 boot/systemd-boot/systemd-boot.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4192681..93599fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -995,6 +995,7 @@ F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
+F:	boot/systemd-boot/
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
 F:	package/python-aiohttp-jinja2/
diff --git a/boot/Config.in b/boot/Config.in
index 8e0c8e5..5b7f606 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -16,6 +16,7 @@ source "boot/mxs-bootlets/Config.in"
 source "boot/riscv-pk/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/syslinux/Config.in"
+source "boot/systemd-boot/Config.in"
 source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
diff --git a/boot/systemd-boot/0001-fix-getty-unit.patch b/boot/systemd-boot/0001-fix-getty-unit.patch
new file mode 100644
index 0000000..d546e1a
--- /dev/null
+++ b/boot/systemd-boot/0001-fix-getty-unit.patch
@@ -0,0 +1,81 @@
+From 69e440f9b7a0e9a43ef582d4bb521722b448a7c2 Mon Sep 17 00:00:00 2001
+From: Maxime Ripard <maxime.ripard@free-electrons.com>
+Date: Mon, 31 Jul 2017 10:08:46 -0400
+Subject: [PATCH] fix-getty-unit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Prefer getty to agetty in console setup systemd units
+
+Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+[aduskett at gmail.com: Update for systemd v237]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[J?r?my: replace additional usage of agetty by getty.]
+Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
+---
+ units/console-getty.service.m4    | 2 +-
+ units/container-getty at .service.m4 | 2 +-
+ units/getty at .service.m4           | 5 +----
+ units/serial-getty at .service.m4    | 2 +-
+ 4 files changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/units/console-getty.service.m4 b/units/console-getty.service.m4
+index 3c553240a..fd5ad9456 100644
+--- a/units/console-getty.service.m4
++++ b/units/console-getty.service.m4
+@@ -23,7 +23,7 @@ ConditionPathExists=/dev/console
+ # The '-o' option value tells agetty to replace 'login' arguments with an
+ # option to preserve environment (-p), followed by '--' for safety, and then
+ # the entered username.
+-ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud console 115200,38400,9600 $TERM
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
+ Restart=always
+ UtmpIdentifier=cons
+diff --git a/units/container-getty at .service.m4 b/units/container-getty at .service.m4
+index 087ab7f9b..30f7b66fe 100644
+--- a/units/container-getty at .service.m4
++++ b/units/container-getty at .service.m4
+@@ -28,7 +28,7 @@ Before=rescue.service
+ # The '-o' option value tells agetty to replace 'login' arguments with an
+ # option to preserve environment (-p), followed by '--' for safety, and then
+ # the entered username.
+-ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear --keep-baud pts/%I 115200,38400,9600 $TERM
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
+ Restart=always
+ RestartSec=0
+diff --git a/units/getty at .service.m4 b/units/getty at .service.m4
+index 80e793bb7..385758c61 100644
+--- a/units/getty at .service.m4
++++ b/units/getty at .service.m4
+@@ -35,10 +35,7 @@ ConditionPathExists=/dev/tty0
+ 
+ [Service]
+ # the VT is cleared by TTYVTDisallocate
+-# The '-o' option value tells agetty to replace 'login' arguments with an
+-# option to preserve environment (-p), followed by '--' for safety, and then
+-# the entered username.
+-ExecStart=-/sbin/agetty -o '-p -- \\u' --noclear %I $TERM
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
+ Restart=always
+ RestartSec=0
+diff --git a/units/serial-getty at .service.m4 b/units/serial-getty at .service.m4
+index 757b86ab2..3d60efdb6 100644
+--- a/units/serial-getty at .service.m4
++++ b/units/serial-getty at .service.m4
+@@ -33,7 +33,7 @@ Before=rescue.service
+ # The '-o' option value tells agetty to replace 'login' arguments with an
+ # option to preserve environment (-p), followed by '--' for safety, and then
+ # the entered username.
+-ExecStart=-/sbin/agetty -o '-p -- \\u' --keep-baud 115200,38400,9600 %I $TERM
++ExecStart=-/sbin/getty -L %I 115200 vt100
+ Type=idle
+ Restart=always
+ UtmpIdentifier=%I
+-- 
+2.14.4
+
diff --git a/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch b/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
new file mode 100644
index 0000000..a024ac4
--- /dev/null
+++ b/boot/systemd-boot/0002-install-don-t-use-ln-relative.patch
@@ -0,0 +1,80 @@
+From 7f4a12d25bbb5859d266f32f7a3d794bb62c354e Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Adamduskett@outlook.com>
+Date: Sun, 31 Dec 2017 12:46:04 -0500
+Subject: [PATCH] install: don't use ln --relative
+
+Oldish enterprise-class distributions have too old versions of
+coreutils, with ln not supporting --relative.
+
+So we fake it.
+
+ln --relative would create minimalist relative paths, but they are not
+trivial to generate. Instead, we always create paths relative to the
+root, i.e.:
+
+    ln -s --relative /usr/bin/foo /usr/sbin/foo
+
+would create:  /usr/sbin/foo -> ../bin/foo
+while we do :  /usr/sbin/foo -> ../../usr/bin/foo
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[aduskett at gmail.com: Added meson.build section and dirname wrapper in add-wants]
+[aduskett at gmail.com: Update for systemd v237]
+Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+[tpiepho at impinj.com: Fix add-wants wrapper]
+Signed-off-by: Trent Piepho <tpiepho@impinj.com>
+---
+ meson.build                 | 2 +-
+ tools/meson-make-symlink.sh | 3 ++-
+ units/meson-add-wants.sh    | 6 ++++--
+ 3 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 04331dd41..359042c04 100644
+--- a/meson.build
++++ b/meson.build
+@@ -559,7 +559,7 @@ endforeach
+ conf.set_quoted('TELINIT', get_option('telinit-path'))
+ 
+ if run_command('ln', '--relative', '--help').returncode() != 0
+-        error('ln does not support --relative (added in coreutils 8.16)')
++        message('ln does not support --relative (added in coreutils 8.16)')
+ endif
+ 
+ ############################################################
+diff --git a/tools/meson-make-symlink.sh b/tools/meson-make-symlink.sh
+index 501cd43d4..25e7f89fd 100755
+--- a/tools/meson-make-symlink.sh
++++ b/tools/meson-make-symlink.sh
+@@ -8,5 +8,6 @@ mkdir -vp "$(dirname "${DESTDIR:-}$2")"
+ if [ "$(dirname $1)" = . ]; then
+         ln -vfs -T "$1" "${DESTDIR:-}$2"
+ else
+-        ln -vfs -T --relative "${DESTDIR:-}$1" "${DESTDIR:-}$2"
++        dds="$( dirname "$2" |sed -r -e 's:/+[^/]+:../:g; s:/$::' )"
++        ln -vfs -T "${dds}$1" "${DESTDIR:-}$2"
+ fi
+diff --git a/units/meson-add-wants.sh b/units/meson-add-wants.sh
+index 70f7172ae..bb8155075 100755
+--- a/units/meson-add-wants.sh
++++ b/units/meson-add-wants.sh
+@@ -14,7 +14,7 @@ case "$target" in
+                 ;;
+ esac
+ 
+-unitpath="${DESTDIR:-}${unitdir}/${unit}"
++unitpath="${unitdir}/${unit}"
+ 
+ case "$target" in
+         */)
+@@ -25,4 +25,6 @@ case "$target" in
+                 ;;
+ esac
+ 
+-ln -vfs --relative "$unitpath" "$dir"
++[ ! -d "${dir}" ] && linkdir=`dirname "${dir}"` || linkdir="${dir}"
++dds="$(printf "%s" "${linkdir#${DESTDIR:-}}" |sed -r -e 's:/+[^/]+:../:g; s:/$::')"
++ln -vfs "$dds$unitpath" "$dir"
+-- 
+2.14.4
+
diff --git a/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch b/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
new file mode 100644
index 0000000..d849659
--- /dev/null
+++ b/boot/systemd-boot/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
@@ -0,0 +1,111 @@
+From ebe5606eadb1241796ba9747d8e357bd6b3e912e Mon Sep 17 00:00:00 2001
+From: Filipe Brandenburger <filbranden@google.com>
+Date: Sun, 15 Jul 2018 22:43:35 -0700
+Subject: [PATCH] build-sys: Detect whether struct statx is defined in
+ sys/stat.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Starting with glibc 2.27.9000-36.fc29, include file sys/stat.h will have a
+definition for struct statx, in which case include file linux/stat.h should be
+avoided, in order to prevent a duplicate definition.
+
+    In file included from ../src/basic/missing.h:18,
+		     from ../src/basic/util.h:28,
+		     from ../src/basic/hashmap.h:10,
+		     from ../src/shared/bus-util.h:12,
+		     from ../src/libsystemd/sd-bus/bus-creds.c:11:
+    /usr/include/linux/stat.h:99:8: error: redefinition of ?struct statx?
+     struct statx {
+	    ^~~~~
+    In file included from /usr/include/sys/stat.h:446,
+		     from ../src/basic/util.h:19,
+		     from ../src/basic/hashmap.h:10,
+		     from ../src/shared/bus-util.h:12,
+		     from ../src/libsystemd/sd-bus/bus-creds.c:11:
+    /usr/include/bits/statx.h:36:8: note: originally defined here
+     struct statx
+	    ^~~~~
+
+Extend our meson.build to look for struct statx when only sys/stat.h is
+included and, in that case, do not include linux/stat.h anymore.
+
+Tested that systemd builds correctly when using a glibc version that includes a
+definition for struct statx.
+
+glibc Fedora RPM update:
+https://src.fedoraproject.org/rpms/glibc/c/28cb5d31fc1e5887912283c889689c47076278ae
+
+glibc upstream commit:
+https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fd70af45528d59a00eb3190ef6706cb299488fcd
+
+(cherry picked from commit 75720bff62a84896e9a0654afc7cf9408cf89a38)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ meson.build            | 5 +++++
+ src/basic/missing.h    | 5 ++++-
+ src/basic/xattr-util.c | 1 -
+ 3 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 04331dd41..a0e724070 100644
+--- a/meson.build
++++ b/meson.build
+@@ -425,6 +425,7 @@ decl_headers = '''
+ #include <sys/stat.h>
+ '''
+ # FIXME: key_serial_t is only defined in keyutils.h, this is bound to fail
++# FIXME: these should use -D_GNU_SOURCE, since that is defined at build time
+ 
+ foreach decl : ['char16_t',
+                 'char32_t',
+@@ -439,6 +440,10 @@ foreach decl : ['char16_t',
+         conf.set10('HAVE_' + decl.underscorify().to_upper(), have)
+ endforeach
+ 
++conf.set10('HAVE_STRUCT_STATX_IN_SYS_STAT_H', cc.sizeof('struct statx', prefix : '''
++#include <sys/stat.h>
++''', args : '-D_GNU_SOURCE') > 0)
++
+ foreach decl : [['IFLA_INET6_ADDR_GEN_MODE',         'linux/if_link.h'],
+                 ['IN6_ADDR_GEN_MODE_STABLE_PRIVACY', 'linux/if_link.h'],
+                 ['IFLA_VRF_TABLE',                   'linux/if_link.h'],
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index 71a07d057..14ad3d491 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -15,7 +15,6 @@
+ #include <linux/neighbour.h>
+ #include <linux/oom.h>
+ #include <linux/rtnetlink.h>
+-#include <linux/stat.h>
+ #include <net/ethernet.h>
+ #include <stdlib.h>
+ #include <sys/resource.h>
+@@ -25,6 +24,10 @@
+ #include <uchar.h>
+ #include <unistd.h>
+ 
++#if !HAVE_STRUCT_STATX_IN_SYS_STAT_H
++#include <linux/stat.h>
++#endif
++
+ #if HAVE_AUDIT
+ #include <libaudit.h>
+ #endif
+diff --git a/src/basic/xattr-util.c b/src/basic/xattr-util.c
+index c5c55ea84..0ee097983 100644
+--- a/src/basic/xattr-util.c
++++ b/src/basic/xattr-util.c
+@@ -2,7 +2,6 @@
+ 
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <linux/stat.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+-- 
+2.14.4
+
diff --git a/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch b/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
new file mode 100644
index 0000000..70c35c6
--- /dev/null
+++ b/boot/systemd-boot/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
@@ -0,0 +1,77 @@
+From 17bd864a04a0583cfb343c5621b591bdd76d79ad Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 18 Jul 2018 17:26:17 +0200
+Subject: [PATCH] meson: unify linux/stat.h check with other checks and use
+ _GNU_SOURCE
+
+Using _GNU_SOURCE is better because that's how we include the headers in the
+actual build, and some headers define different stuff when it is defined.
+sys/stat.h for example defines 'struct statx' conditionally.
+
+(cherry picked from commit 9c869d08d82c73f62ab3527567858ce4b0cf1257)
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ meson.build         | 20 ++++++++++++++------
+ src/basic/missing.h |  2 +-
+ 2 files changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index a0e724070..5dcabdc6c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -421,11 +421,9 @@ decl_headers = '''
+ #include <uchar.h>
+ #include <linux/ethtool.h>
+ #include <linux/fib_rules.h>
+-#include <linux/stat.h>
+ #include <sys/stat.h>
+ '''
+ # FIXME: key_serial_t is only defined in keyutils.h, this is bound to fail
+-# FIXME: these should use -D_GNU_SOURCE, since that is defined at build time
+ 
+ foreach decl : ['char16_t',
+                 'char32_t',
+@@ -436,13 +434,23 @@ foreach decl : ['char16_t',
+                ]
+ 
+         # We get -1 if the size cannot be determined
+-        have = cc.sizeof(decl, prefix : decl_headers) > 0
++        have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
++
++        if decl == 'struct statx'
++                if have
++                        want_linux_stat_h = false
++                else
++                        have = cc.sizeof(decl,
++                                         prefix : decl_headers + '#include <linux/stat.h>',
++                                         args : '-D_GNU_SOURCE') > 0
++                        want_linux_stat_h = have
++                endif
++        endif
++
+         conf.set10('HAVE_' + decl.underscorify().to_upper(), have)
+ endforeach
+ 
+-conf.set10('HAVE_STRUCT_STATX_IN_SYS_STAT_H', cc.sizeof('struct statx', prefix : '''
+-#include <sys/stat.h>
+-''', args : '-D_GNU_SOURCE') > 0)
++conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
+ 
+ foreach decl : [['IFLA_INET6_ADDR_GEN_MODE',         'linux/if_link.h'],
+                 ['IN6_ADDR_GEN_MODE_STABLE_PRIVACY', 'linux/if_link.h'],
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index 14ad3d491..9044683b1 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -24,7 +24,7 @@
+ #include <uchar.h>
+ #include <unistd.h>
+ 
+-#if !HAVE_STRUCT_STATX_IN_SYS_STAT_H
++#if WANT_LINUX_STAT_H
+ #include <linux/stat.h>
+ #endif
+ 
+-- 
+2.14.4
+
diff --git a/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
new file mode 100644
index 0000000..6a72a38
--- /dev/null
+++ b/boot/systemd-boot/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
@@ -0,0 +1,30 @@
+From 49653743f69658aeeebdb14faf1ab158f1f2cb20 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 19 Oct 2018 12:12:33 +0200
+Subject: [PATCH] dhcp6: make sure we have enough space for the DHCP6 option
+ header
+
+Fixes CVE-2018-15688:
+https://security-tracker.debian.org/tracker/CVE-2018-15688
+
+Patch downloaded from upstream commit:
+https://github.com/systemd/systemd/commit/49653743f69658aeeebdb14faf1ab158f1f2cb20
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/libsystemd-network/dhcp6-option.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libsystemd-network/dhcp6-option.c b/src/libsystemd-network/dhcp6-option.c
+index cbd4bc7a2a3..2806415100c 100644
+--- a/src/libsystemd-network/dhcp6-option.c
++++ b/src/libsystemd-network/dhcp6-option.c
+@@ -106,7 +106,7 @@ int dhcp6_option_append_ia(uint8_t **buf, size_t *buflen, const DHCP6IA *ia) {
+                 return -EINVAL;
+         }
+ 
+-        if (*buflen < len)
++        if (*buflen < offsetof(DHCP6Option, data) + len)
+                 return -ENOBUFS;
+ 
+         ia_hdr = *buf;
diff --git a/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch b/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
new file mode 100644
index 0000000..0aa3189
--- /dev/null
+++ b/boot/systemd-boot/0006-meson.build-fix-detection-of-Werror-shadow.patch
@@ -0,0 +1,34 @@
+From 7bd6e6db3dbb980c099b444c61d9aff7fcc636cf Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 29 Nov 2018 13:22:08 +0100
+Subject: [PATCH] meson.build: fix detection of -Werror=shadow
+
+Pass -Werror=shadow in args of cc.compiles otherwise test will always
+succeed
+This fix a build failure with gcc 4.7.3
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ffd71c473d3b29618c18cd2e04705370266696f2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/systemd/systemd/pull/10993]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 37ae27b4a..980150ac8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -396,7 +396,7 @@ if cc.compiles('''
+            struct timespec now;
+            return 0;
+    }
+-''', name : '-Werror=shadow with local shadowing')
++''', args: '-Werror=shadow', name : '-Werror=shadow with local shadowing')
+         add_project_arguments('-Werror=shadow', language : 'c')
+ endif
+ 
+-- 
+2.14.1
+
diff --git a/boot/systemd-boot/Config.in b/boot/systemd-boot/Config.in
new file mode 100644
index 0000000..fa90530
--- /dev/null
+++ b/boot/systemd-boot/Config.in
@@ -0,0 +1,23 @@
+config BR2_TARGET_SYSTEMD_BOOT
+	bool "systemd-boot"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_GNU_EFI
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	help
+	  systemd-boot is a simple UEFI boot manager which executes
+	  configured EFI images. The default entry is selected by a
+	  configured pattern (glob) or an on-screen menu.
+
+	  systemd-boot operates on the EFI System Partition (ESP)
+	  only. Configuration file fragments, kernels, initrds, other
+	  EFI images need to reside on the ESP. Linux kernels need to
+	  be built with CONFIG_EFI_STUB to be able to be directly
+	  executed as an EFI image.
+
+	  See the Grub2 help text for details on preparing an EFI
+	  capable disk image using systemd-boot: the instructions are
+	  exactly the same, except that the systemd-boot configuration
+	  files will be located in /loader/ inside the EFI partition.
+
+	  https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
\ No newline at end of file
diff --git a/boot/systemd-boot/buildroot.conf b/boot/systemd-boot/buildroot.conf
new file mode 100644
index 0000000..16d4d85
--- /dev/null
+++ b/boot/systemd-boot/buildroot.conf
@@ -0,0 +1,3 @@
+title	Buildroot
+linux	/bzImage
+options	root=/dev/sda2 rootwait console=tty1
diff --git a/boot/systemd-boot/loader.conf b/boot/systemd-boot/loader.conf
new file mode 100644
index 0000000..93b77b8
--- /dev/null
+++ b/boot/systemd-boot/loader.conf
@@ -0,0 +1,2 @@
+timeout 3
+default buildroot
diff --git a/boot/systemd-boot/systemd-boot.hash b/boot/systemd-boot/systemd-boot.hash
new file mode 100644
index 0000000..c059ba8
--- /dev/null
+++ b/boot/systemd-boot/systemd-boot.hash
@@ -0,0 +1,5 @@
+# sha256 locally computed
+sha256	8a11b1b07d620f4c06a16e95bba4dd2a97e90efdf2a5ba47ed0a935085787a14  	systemd-boot-239.tar.gz
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
+sha256	37ab495827a3cdbbc35ceaba3066764d69b6490e514e0c8a1acdb3c2fdb9e921	README
diff --git a/boot/systemd-boot/systemd-boot.mk b/boot/systemd-boot/systemd-boot.mk
new file mode 100644
index 0000000..3f11d3b
--- /dev/null
+++ b/boot/systemd-boot/systemd-boot.mk
@@ -0,0 +1,106 @@
+################################################################################
+#
+# systemd-boot
+#
+################################################################################
+
+SYSTEMD_BOOT_VERSION = 239
+SYSTEMD_BOOT_SITE = $(call github,systemd,systemd,v$(SYSTEMD_BOOT_VERSION))
+SYSTEMD_BOOT_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
+SYSTEMD_BOOT_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
+SYSTEMD_BOOT_INSTALL_STAGING = NO
+SYSTEMD_BOOT_INSTALL_TARGET = NO
+SYSTEMD_BOOT_INSTALL_IMAGES = YES
+SYSTEMD_BOOT_DEPENDENCIES = \
+	gnu-efi \
+	util-linux
+
+ifeq ($(BR2_i386),y)
+SYSTEMD_BOOT_IMGARCH = ia32
+else ifeq ($(BR2_x86_64),y)
+SYSTEMD_BOOT_IMGARCH = x64
+endif
+
+SYSTEMD_BOOT_CONF_OPTS += \
+	-Drootlibdir='/usr/lib' \
+	-Dblkid=true \
+	-Dman=false \
+	-Dima=false \
+	-Dlibcryptsetup=false \
+	-Defi=true \
+	-Defi-cc=$(TARGET_CC) \
+	-Defi-ld=$(TARGET_LD) \
+	-Defi-libdir=$(STAGING_DIR)/usr/lib \
+	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
+	-Defi-includedir=$(STAGING_DIR)/usr/include/efi \
+	-Dgnu-efi=true \
+	-Dldconfig=false \
+	-Ddefault-dnssec=no \
+	-Dtests=false \
+	-Dnobody-group=nogroup \
+	-Didn=true \
+	-Dnss-systemd=true \
+	-Dacl=false \
+	-Daudit=false \
+	-Delfutils=false \
+	-Dlibidn=false \
+	-Dlibidn2=false \
+	-Dseccomp=false \
+	-Dxkbcommon=false \
+	-Dbzip2=false \
+	-Dlz4=false \
+	-Dpam=false \
+	-Dxz=false \
+	-Dzlib=false \
+	-Dlibcurl=false \
+	-Dgcrypt=false \
+	-Dpcre2=false \
+	-Dmicrohttpd=false \
+	-Dqrencode=false \
+	-Dselinux=false \
+	-Dhwdb=false \
+	-Dbinfmt=false \
+	-Dvconsole=false \
+	-Dquotacheck=false \
+	-Dtmpfiles=false \
+	-Dsysusers=false \
+	-Dfirstboot=false \
+	-Drandomseed=false \
+	-Dbacklight=false \
+	-Drfkill=false \
+	-Dlogind=false \
+	-Dmachined=false \
+	-Dimportd=false \
+	-Dhostnamed=false \
+	-Dmyhostname=false \
+	-Dtimedated=false \
+	-Dlocaled=false \
+	-Dcoredump=false \
+	-Dpolkit=false \
+	-Dnetworkd=false \
+	-Dresolve=false \
+	-Dtimesyncd=false \
+	-Dsmack=false \
+	-Dhibernate=false
+
+SYSTEMD_BOOT_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
+SYSTEMD_BOOT_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
+
+define SYSTEMD_BOOT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(SYSTEMD_BOOT_NINJA_ENV) \
+		$(NINJA) $(NINJA_OPTS) -C $(SYSTEMD_BOOT_SRCDIR)/build \
+		src/boot/efi/{systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi,linux$(SYSTEMD_BOOT_IMGARCH).efi.stub}
+endef
+
+define SYSTEMD_BOOT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/build/src/boot/efi/systemd-boot$(SYSTEMD_BOOT_IMGARCH).efi \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT/boot$(SYSTEMD_BOOT_IMGARCH).efi
+	echo "boot$(SYSTEMD_BOOT_IMGARCH).efi" > \
+		$(BINARIES_DIR)/efi-part/startup.nsh
+	$(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/loader.conf \
+		$(BINARIES_DIR)/efi-part/loader/loader.conf
+	$(INSTALL) -D -m 0644 $(SYSTEMD_BOOT_PKGDIR)/buildroot.conf \
+		$(BINARIES_DIR)/efi-part/loader/entries/buildroot.conf
+endef
+
+$(eval $(meson-package))
-- 
2.7.4
