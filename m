From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Mar 2011 11:36:18 +0100
Subject: [Buildroot] [git commit master 1/1] pkg-config: only prepend
	sysroot to includedir / libdir
Message-ID: <20110310111401.BC0A38FE31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=117a8ea0eaabec72d7637f80f7a55fbba9ce67bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only append sysroot to includedir / libdir, and not to other variables,
when a variable is requested (--variable=<name>), similar to how it
is done for the -I / -L flags in cflags/ldflags.

The problem is that pkg-config doesn't have any explicit cross compilation
support, so there's some confusion about what are host paths and what are
target ones.  Includedir / libdir are paths for the (cross) compiler, so
those should normally have sysroot prepended, but other variables might
refer to target paths instead.

This fixes the installation of the xfonts-* packages, which uses
pkg-config --variable=fontrootdir fontutil to figure out the target
installation location for fonts.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../pkg-config/pkg-config-0.25-fix-variable.patch  |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/pkg-config/pkg-config-0.25-fix-variable.patch b/package/pkg-config/pkg-config-0.25-fix-variable.patch
index 46b262b..0b1d4a9 100644
--- a/package/pkg-config/pkg-config-0.25-fix-variable.patch
+++ b/package/pkg-config/pkg-config-0.25-fix-variable.patch
@@ -1,26 +1,28 @@
-[PATCH] prefix sysroot to path variables
+[PATCH] prefix sysroot to include/libdir path variables
 
-Prefix path values with sysroot if a variable is requested
-(--varable=<name>), similar to how it's done for -I / -L flags.
+Prefix includedir / libdir variable values with sysroot if a variable is
+requested (--variable=<name>), similar to how it's done for -I / -L flags.
 
 This is sometimes used to find header files (E.G. in gst-plugins configure),
 so ensure the sysroot'ed files are used.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 ---
- main.c |    3 +++
- 1 file changed, 3 insertions(+)
+ main.c |    5 +++++
+ 1 file changed, 5 insertions(+)
 
 Index: pkg-config-0.25/main.c
 ===================================================================
 --- pkg-config-0.25.orig/main.c
 +++ pkg-config-0.25/main.c
-@@ -695,6 +695,9 @@ main (int argc, char **argv)
+@@ -700,6 +700,11 @@
    if (variable_name)
      {
        char *str = packages_get_var (packages, variable_name);
-+      /* path variable? */
-+      if (pcsysrootdir && str[0] == '/')
++      /* include/lib variable? */
++      if (pcsysrootdir &&
++          (!strcmp(variable_name, "includedir") ||
++           !strcmp(variable_name, "libdir")))
 +          printf ("%s/", pcsysrootdir);
        printf ("%s", str);
        g_free (str);
-- 
1.7.3.4
