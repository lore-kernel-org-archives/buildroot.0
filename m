From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:52:38 +0200
Subject: [Buildroot] [git commit branch/next] package/systemd: fix statx
 support with glibc >= 2.28
Message-ID: <20180809214613.CA516812DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7eed608713be61ea42c0cf45dd535c03fc2d346b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Backport 2 patches fixing statx redefinition:

  In file included from ../src/basic/missing.h:18,
     from ../src/basic/util.h:28,
     from ../src/basic/hashmap.h:10,
     from ../src/shared/bus-util.h:12,
     from ../src/libsystemd/sd-bus/bus-creds.c:11:
     /usr/include/linux/stat.h:99:8: error: redefinition of ???struct statx???

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...etect-whether-struct-statx-is-defined-in-.patch | 111 +++++++++++++++++++++
 ...-linux-stat.h-check-with-other-checks-and.patch |  77 ++++++++++++++
 2 files changed, 188 insertions(+)

diff --git a/package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch b/package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
new file mode 100644
index 0000000000..d849659c77
--- /dev/null
+++ b/package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
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
+    /usr/include/linux/stat.h:99:8: error: redefinition of ???struct statx???
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
diff --git a/package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch b/package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
new file mode 100644
index 0000000000..70c35c66e2
--- /dev/null
+++ b/package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
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
