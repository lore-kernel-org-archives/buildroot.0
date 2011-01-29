From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 00:40:13 +0100
Subject: [Buildroot] [git commit master 1/1] pkg-config: prefix sysroot to
	path variables
Message-ID: <20110129234038.7376F8E076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b4df2ea27fc28734978ff8a52811dc23d5d1c221
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes gst-plugins-bad build, if gstreamer is installed on host with xml
support, as it uses pkg-config --variable=includedir to find gstconfig.h,
and hence ends up looking at the host version.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../pkg-config/pkg-config-0.25-fix-variable.patch  |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/pkg-config/pkg-config-0.25-fix-variable.patch

diff --git a/package/pkg-config/pkg-config-0.25-fix-variable.patch b/package/pkg-config/pkg-config-0.25-fix-variable.patch
new file mode 100644
index 0000000..46b262b
--- /dev/null
+++ b/package/pkg-config/pkg-config-0.25-fix-variable.patch
@@ -0,0 +1,27 @@
+[PATCH] prefix sysroot to path variables
+
+Prefix path values with sysroot if a variable is requested
+(--varable=<name>), similar to how it's done for -I / -L flags.
+
+This is sometimes used to find header files (E.G. in gst-plugins configure),
+so ensure the sysroot'ed files are used.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ main.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: pkg-config-0.25/main.c
+===================================================================
+--- pkg-config-0.25.orig/main.c
++++ pkg-config-0.25/main.c
+@@ -695,6 +695,9 @@ main (int argc, char **argv)
+   if (variable_name)
+     {
+       char *str = packages_get_var (packages, variable_name);
++      /* path variable? */
++      if (pcsysrootdir && str[0] == '/')
++          printf ("%s/", pcsysrootdir);
+       printf ("%s", str);
+       g_free (str);
+       need_newline = TRUE;
-- 
1.7.3.4
