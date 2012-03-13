From: Markos Chandras <markos.chandras@imgtec.com>
Date: Tue, 13 Mar 2012 13:35:08 +0000
Subject: [Buildroot] [PATCH] imagemagick: Ignore host's xml2-config
Message-ID: <1331645708-7650-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If $(HOST_DIR)/usr/bin is in the user's $PATH, and host-libxml2 is
installed, the configure script will find xml2-config in
$(HOST_DIR)/usr/bin  and the xml2-config --prefix will return the
$(HOST_DIR)/usr. This is bad because imagemagick will append
-L$(HOST_DIR)/usr/lib to LDFLAGS and it will try to link against
the host's libraries instead of those located in the staging directory.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
It is pretty common for people to add $(HOST_DIR)/usr/bin to their $PATH
(also uggested in buildroot documentation:
http://buildroot.uclibc.org/buildroot.html#using_toolchain)
in order to use their cross-toolchain utilities so this problem may
be exposed to a significant number of people. The configure script
is modified to ensure that the xml2-config utility that was found in $PATH
is located in the sysroot directory. This will prevent host's libraries
to be appended to imagemagick's LDFLAGS. This patch depends on the one
added in commit 06ef58efc45dabf078c93358a6ce37f178ae8df5 and it needs to
be applied after that.
---
 .../imagemagick-6.6.7-6-xml2-config-path.patch     |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/imagemagick/imagemagick-6.6.7-6-xml2-config-path.patch

diff --git a/package/imagemagick/imagemagick-6.6.7-6-xml2-config-path.patch b/package/imagemagick/imagemagick-6.6.7-6-xml2-config-path.patch
new file mode 100644
index 0000000..f2a0d34
--- /dev/null
+++ b/package/imagemagick/imagemagick-6.6.7-6-xml2-config-path.patch
@@ -0,0 +1,26 @@
+Index: imagemagick-6.6.7-6/configure.ac
+===================================================================
+--- imagemagick-6.6.7-6.orig/configure.ac
++++ imagemagick-6.6.7-6/configure.ac
+@@ -2589,12 +2589,15 @@ if test "$with_xml" != 'no'; then
+         # the shared library installed under /usr/lib, whereas the package
+         # installs itself under $prefix/libxml and $prefix/lib.
+         xml2_prefix=`xml2-config --prefix`
+-        if test -d "${xml2_prefix}/include/libxml2"; then
+-            CPPFLAGS="$CPPFLAGS -I${xml2_prefix}/include/libxml2"
+-        fi
+-        if test "${xml2_prefix}" != '/usr'; then
+-            LDFLAGS="$LDFLAGS -L${xml2_prefix}/lib"
+-        fi
++	# Make sure we didn't pick the host's xml2-config
++	if `echo ${xml2_prefix} | grep sysroot > /dev/null 2>&1`; then
++	        if test -d "${xml2_prefix}/include/libxml2"; then
++        	    CPPFLAGS="$CPPFLAGS -I${xml2_prefix}/include/libxml2"
++	        fi
++        	if test "${xml2_prefix}" != '/usr'; then
++	            LDFLAGS="$LDFLAGS -L${xml2_prefix}/lib"
++        	fi
++	fi
+     fi
+     failed=0
+     passed=0
-- 
1.7.1
