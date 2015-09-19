From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 14:14:16 +0200
Subject: [Buildroot] [git commit] package/luaposix: add patch to fix musl
	compatibility
Message-ID: <20150919121439.3CB0E8180F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d54751e2d451cf2737971bd901e88501349d0dd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport patch from upstream to fix musl build error:

```
In file included from ext/posix/posix.c:25:0:
ext/posix/sched.c: In function 'Psched_setscheduler':
ext/posix/sched.c:74:9: error: variable 'sched_param' has initializer but incomplete type
  struct sched_param sched_param = {0};
```

Fixed upstream by commit 11cc8a2973569ec7fb1e7c2466dca0282944b124.

[Thomas: add missing <pkg>_AUTORECONF=YES.]

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...round-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch |   59 ++++++++++++++++++++
 package/luaposix/luaposix.mk                       |    2 +
 2 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/package/luaposix/0001-sched-workaround-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch b/package/luaposix/0001-sched-workaround-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch
new file mode 100644
index 0000000..3853e9f
--- /dev/null
+++ b/package/luaposix/0001-sched-workaround-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch
@@ -0,0 +1,59 @@
+From de2a9b45e7b4a89affa3ac6d0a010cc627ab4a87 Mon Sep 17 00:00:00 2001
+From: "Gary V. Vaughan" <gary@vaughan.pe>
+Date: Mon, 6 Apr 2015 18:39:46 -0700
+Subject: [PATCH 1/1] sched: workaround glibc _POSIX_PRIORITY_SCHEDULING bug.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Close #223.
+* configure.ac (AC_CHECK_HEADERS): Add sched.h.
+* ext/posix/sched.c: Remove unistd.h; Predicate use of priority
+scheduling APIs on presence of sched.h instead of
+_POSIX_PRIORITY_SCHEDULING macro erroneously defined by glibc on
+Linux.
+Reported by ncopa at github.com.
+
+Backported from: 11cc8a2973569ec7fb1e7c2466dca0282944b124
+
+Signed-off-by: Gary V. Vaughan <gary@vaughan.pe>
+[Backport]
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ configure.ac      | 2 +-
+ ext/posix/sched.c | 5 +++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index aa18318..89a2feb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -114,7 +114,7 @@ gl_INIT
+ 
+ ## Check for header files
+ AC_HEADER_STDC
+-AC_CHECK_HEADERS([crypt.h strings.h sys/statvfs.h])
++AC_CHECK_HEADERS([crypt.h sched.h strings.h sys/statvfs.h])
+ AC_CHECK_HEADERS([net/if.h linux/netlink.h], [], [], [
+ #include <sys/socket.h>
+ ])
+diff --git a/ext/posix/sched.c b/ext/posix/sched.c
+index 13b196b..f338d73 100644
+--- a/ext/posix/sched.c
++++ b/ext/posix/sched.c
+@@ -21,9 +21,10 @@
+ 
+ #include <config.h>
+ 
+-#include <unistd.h>	/* for _POSIX_PRIORITY_SCHEDULING */
++/* cannot use unistd.h for _POSIX_PRIORITY_SCHEDULING, because on Linux
++   glibc it is defined even though the APIs are not implemented :-(     */
+ 
+-#ifdef _POSIX_PRIORITY_SCHEDULING
++#ifdef HAVE_SCHED_H
+ #include <sched.h>
+ #endif
+ 
+-- 
+2.5.2
+
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index ea4ab02..24b567f 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -9,6 +9,8 @@ LUAPOSIX_SITE = $(call github,luaposix,luaposix,release-v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = COPYING
 LUAPOSIX_DEPENDENCIES = luainterpreter host-lua ncurses
+# 0001-sched-workaround-glibc-_POSIX_PRIORITY_SCHEDULING-bu.patch
+LUAPOSIX_AUTORECONF = YES
 LUAPOSIX_CONF_OPTS = --libdir="/usr/lib/lua/$(LUAINTERPRETER_ABIVER)" --datarootdir="/usr/share/lua/$(LUAINTERPRETER_ABIVER)"
 
 $(eval $(autotools-package))
