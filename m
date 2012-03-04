From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Mar 2012 11:02:48 +0100
Subject: [Buildroot] [git commit] imagemagick: re-add xml2-config patch
Message-ID: <20120304100359.59CA390C03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06ef58efc45dabf078c93358a6ce37f178ae8df5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch somehow got removed from eb5498 (bump version, fix build) by
accident, so add it again.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../imagemagick/imagemagick-use-xml2-config.patch  |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/imagemagick/imagemagick-use-xml2-config.patch b/package/imagemagick/imagemagick-use-xml2-config.patch
new file mode 100644
index 0000000..bff4c73
--- /dev/null
+++ b/package/imagemagick/imagemagick-use-xml2-config.patch
@@ -0,0 +1,31 @@
+Use the detected xml2-config script
+
+The AC_CHECK_PROG() macro allows to find the location of a particular
+program. In ImageMagick, it is used to find the location of
+xml2-config, and fills it into the xml2_config
+variable. Unfortunately, the check just below hardcodes `xml2-config
+--prefix`, without using the variable, which defeats the whole purpose
+of having AC_CHECK_PROG().
+
+So, let's use the ${xml2_config} variable instead. This allows to fix
+cross-compilation issues when a non-standard xml2-config location
+needs to be specified.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: imagemagick-6.6.4-8/configure.ac
+===================================================================
+--- imagemagick-6.6.4-8.orig/configure.ac
++++ imagemagick-6.6.4-8/configure.ac
+@@ -2549,7 +2549,7 @@
+         # Debian installs libxml headers under /usr/include/libxml2/libxml with
+         # the shared library installed under /usr/lib, whereas the package
+         # installs itself under $prefix/libxml and $prefix/lib.
+-        xml2_prefix=`xml2-config --prefix`
++        xml2_prefix=`${xml2_config} --prefix`
+         if test -d "${xml2_prefix}/include/libxml2"; then
+             CPPFLAGS="$CPPFLAGS -I${xml2_prefix}/include/libxml2"
+         fi
