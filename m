From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 17:11:38 +0200
Subject: [Buildroot] [git commit] python: do not use hg or svn when available
Message-ID: <20160918151210.1D5CD8041E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0d9ba275a89cf3c71eda822d5ebf30c348ec6c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During the execution of its configure script, Python tries to find an
available "hg" and "svn" installation, and if available, will try to use
them to get information from the version control system. To do this, it
tries to communicate over the network, potentially over ports that are
blocked, causing the build to halt. This was reported by a user as part
of bug #7802.

To solve this, we simply make the Python script use /bin/false as the
"hg" and "svn" programs.

Fixes bug #7802 for the python package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python/python.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 9026703..cc65376 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -39,8 +39,12 @@ HOST_PYTHON_CONF_OPTS += 	\
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
 # python is called.
+# Make python believe we don't have 'hg' and 'svn', so that it doesn't
+# try to communicate over the network during the build.
 HOST_PYTHON_CONF_ENV += \
-	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags"
+	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
+	ac_cv_prog_HAS_HG=/bin/false \
+	ac_cv_prog_SVNVERSION=/bin/false
 
 # Building host python in parallel sometimes triggers a "Bus error"
 # during the execution of "./python setup.py build" in the
@@ -126,11 +130,15 @@ else
 PYTHON_CONF_OPTS += --disable-ossaudiodev
 endif
 
+# Make python believe we don't have 'hg' and 'svn', so that it doesn't
+# try to communicate over the network during the build.
 PYTHON_CONF_ENV += \
 	ac_cv_have_long_long_format=yes \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
-	ac_cv_working_tzset=yes
+	ac_cv_working_tzset=yes \
+	ac_cv_prog_HAS_HG=/bin/false \
+	ac_cv_prog_SVNVERSION=/bin/false
 
 PYTHON_CONF_OPTS += \
 	--without-cxx-main 	\
