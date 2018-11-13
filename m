From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:27:24 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] xserver_xorg-server:
 backport upstream fix for CVE-2018-14665 to 1.19.6
Message-ID: <20181113224003.2D2FF82B8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a5413f2c86bff26298a4a88b910c0aa2633d33a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Incorrect command-line parameter validation in the Xorg X server can
lead to privilege elevation and/or arbitrary files overwrite, when the
X server is running with elevated privileges (ie when Xorg is
installed with the setuid bit set and started by a non-root user).

The -modulepath argument can be used to specify an insecure path to
modules that are going to be loaded in the X server, allowing to
execute unprivileged code in the privileged process.

The -logfile argument can be used to overwrite arbitrary files in the
file system, due to incorrect checks in the parsing of the option.

For more details, see the advisory:

https://lists.x.org/archives/xorg-announce/2018-October/002927.html

Issue was introduced in 1.19.0, so the older xserver variants are not
affected.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...file-and-modulepath-when-running-with-ele.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/1.19.6/0005-Disable-logfile-and-modulepath-when-running-with-ele.patch b/package/x11r7/xserver_xorg-server/1.19.6/0005-Disable-logfile-and-modulepath-when-running-with-ele.patch
new file mode 100644
index 0000000000..ba0f09cdda
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.19.6/0005-Disable-logfile-and-modulepath-when-running-with-ele.patch
@@ -0,0 +1,52 @@
+From 0ff8977a348c316cd9909b890c48d7f5175a5eba Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Tue, 23 Oct 2018 21:29:08 +0200
+Subject: [PATCH] Disable -logfile and -modulepath when running with elevated
+ privileges
+
+Could cause privilege elevation and/or arbitrary files overwrite, when
+the X server is running with elevated privileges (ie when Xorg is
+installed with the setuid bit set and started by a non-root user).
+
+CVE-2018-14665
+
+Issue reported by Narendra Shinde and Red Hat.
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+(cherry picked from commit 50c0cf885a6e91c0ea71fb49fa8f1b7c86fe330e)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ hw/xfree86/common/xf86Init.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/hw/xfree86/common/xf86Init.c b/hw/xfree86/common/xf86Init.c
+index d59c224d5..183158c21 100644
+--- a/hw/xfree86/common/xf86Init.c
++++ b/hw/xfree86/common/xf86Init.c
+@@ -1135,14 +1135,18 @@ ddxProcessArgument(int argc, char **argv, int i)
+     /* First the options that are not allowed with elevated privileges */
+     if (!strcmp(argv[i], "-modulepath")) {
+         CHECK_FOR_REQUIRED_ARGUMENT();
+-        xf86CheckPrivs(argv[i], argv[i + 1]);
++        if (xf86PrivsElevated())
++              FatalError("\nInvalid argument -modulepath "
++                "with elevated privileges\n");
+         xf86ModulePath = argv[i + 1];
+         xf86ModPathFrom = X_CMDLINE;
+         return 2;
+     }
+     if (!strcmp(argv[i], "-logfile")) {
+         CHECK_FOR_REQUIRED_ARGUMENT();
+-        xf86CheckPrivs(argv[i], argv[i + 1]);
++        if (xf86PrivsElevated())
++              FatalError("\nInvalid argument -logfile "
++                "with elevated privileges\n");
+         xf86LogFile = argv[i + 1];
+         xf86LogFileFrom = X_CMDLINE;
+         return 2;
+-- 
+2.11.0
+
