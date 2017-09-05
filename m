From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Sep 2017 23:12:15 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] dbus: add upstream patch
	to fix startup hang with with expat >= 2.2.1
Message-ID: <20170905220138.5F8FE7FA06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=935b33b25851e56fb9db5d24b0f9d4eaff2a8f47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

After c0ad6ded018ffbc33f7f5 expat: security bump to version 2.2.1
the system can hang on startup under certain circumstances.

This happens when:
  * we use systemd as init system
  * the random nonblocking pool takes a while to initialize
    * this apparently doesn't happen on qemu, so this would not have
      been caught by the runtime testing infrastructure
    * it also doesn't seem to happen when network booting

For a more detailed description of the bug see here:
https://bugs.freedesktop.org/show_bug.cgi?id=101858

The patch should be in next dbus version 1.10.24

Set DBUS_AUTORECONF = YES because configure.ac is changed.

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
[Arnout: add upstream commit sha + Marcus's Sob to the patch]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5a5e76381f8b000baa09c902ca89d45725c47f04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...er-expat-Tell-Expat-not-to-defend-against.patch | 78 ++++++++++++++++++++++
 package/dbus/dbus.mk                               |  2 +
 2 files changed, 80 insertions(+)

diff --git a/package/dbus/0001-config-loader-expat-Tell-Expat-not-to-defend-against.patch b/package/dbus/0001-config-loader-expat-Tell-Expat-not-to-defend-against.patch
new file mode 100644
index 0000000..fd9e01d
--- /dev/null
+++ b/package/dbus/0001-config-loader-expat-Tell-Expat-not-to-defend-against.patch
@@ -0,0 +1,78 @@
+From 1252dc1d1f465b8ab6b36ff7252e395e66a040cf Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Fri, 21 Jul 2017 10:46:39 +0100
+Subject: [PATCH 1/2] config-loader-expat: Tell Expat not to defend against
+ hash collisions
+
+By default, Expat uses cryptographic-quality random numbers as a salt for
+its hash algorithm, and since 2.2.1 it gets them from the getrandom
+syscall on Linux. That syscall refuses to return any entropy until the
+kernel's CSPRNG (random pool) has been initialized. Unfortunately, this
+can take as long as 40 seconds on embedded devices with few entropy
+sources, which is too long: if the system dbus-daemon blocks for that
+length of time, important D-Bus clients like systemd and systemd-logind
+time out and fail to connect to it.
+
+We're parsing small configuration files here, and we trust them
+completely, so we don't need to defend against hash collisions: nobody
+is going to be crafting them to cause pathological performance.
+
+Bug: https://bugs.freedesktop.org/show_bug.cgi?id=101858
+Signed-off-by: Simon McVittie <smcv@debian.org>
+Tested-by: Christopher Hewitt <hewitt@ieee.org>
+Reviewed-by: Philip Withnall <withnall@endlessm.com>
+
+Upstream commit 1252dc1d1f465b8ab6b36ff7252e395e66a040cf
+Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
+---
+ bus/config-loader-expat.c | 14 ++++++++++++++
+ configure.ac              |  8 ++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/bus/config-loader-expat.c b/bus/config-loader-expat.c
+index b571fda3..27cbe2d0 100644
+--- a/bus/config-loader-expat.c
++++ b/bus/config-loader-expat.c
+@@ -203,6 +203,20 @@ bus_config_load (const DBusString      *file,
+       goto failed;
+     }
+ 
++  /* We do not need protection against hash collisions (CVE-2012-0876)
++   * because we are only parsing trusted XML; and if we let Expat block
++   * waiting for the CSPRNG to be initialized, as it does by default to
++   * defeat CVE-2012-0876, it can cause timeouts during early boot on
++   * entropy-starved embedded devices.
++   *
++   * TODO: When Expat gets a more explicit API for this than
++   * XML_SetHashSalt, check for that too, and use it preferentially.
++   * https://github.com/libexpat/libexpat/issues/91 */
++#if defined(HAVE_XML_SETHASHSALT)
++  /* Any nonzero number will do. https://xkcd.com/221/ */
++  XML_SetHashSalt (expat, 4);
++#endif
++
+   if (!_dbus_string_get_dirname (file, &dirname))
+     {
+       dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
+diff --git a/configure.ac b/configure.ac
+index 52da11fb..c4022ed7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -938,6 +938,14 @@ XML_CFLAGS=
+ AC_SUBST([XML_CFLAGS])
+ AC_SUBST([XML_LIBS])
+ 
++save_cflags="$CFLAGS"
++save_libs="$LIBS"
++CFLAGS="$CFLAGS $XML_CFLAGS"
++LIBS="$LIBS $XML_LIBS"
++AC_CHECK_FUNCS([XML_SetHashSalt])
++CFLAGS="$save_cflags"
++LIBS="$save_libs"
++
+ # Thread lib detection
+ AC_ARG_VAR([THREAD_LIBS])
+ save_libs="$LIBS"
+-- 
+2.11.0
+
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 66b90bc..09e261e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -7,6 +7,8 @@
 DBUS_VERSION = 1.10.16
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFLv2.1 or GPLv2+ (library, tools), GPLv2+ (tools)
+# 0001-config-loader-expat-Tell-Expat-not-to-defend-against.patch
+DBUS_AUTORECONF = YES
 DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
