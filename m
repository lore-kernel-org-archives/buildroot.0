From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2016 22:38:29 +0200
Subject: [Buildroot] [PATCH/next 2/2] python3: do not use hg or svn when
	available
In-Reply-To: <1472675909-20905-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472675909-20905-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1472675909-20905-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the execution of its configure script, Python 3 tries to find an
available "hg" installation, and if available, will try to use it to get
information from the version control system. To do this, it tries to
communicate over the network, potentially over ports that are blocked,
causing the build to halt. This was reported by a user as part of bug
7802.

To solve this, we simply make the Python script use /bin/false as the
"hg" program.

Fixes bug #7802 for the python3 package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 34e1297..393b9fb 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -41,8 +41,11 @@ HOST_PYTHON3_CONF_OPTS += 	\
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
 # python is called.
+# Make python believe we don't have 'hg', so that it doesn't try to
+# communicate over the network during the build.
 HOST_PYTHON3_CONF_ENV += \
-	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags"
+	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
+	ac_cv_prog_HAS_HG=/bin/false
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
 
@@ -110,11 +113,14 @@ else
 PYTHON3_CONF_OPTS += --disable-ossaudiodev
 endif
 
+# Make python believe we don't have 'hg', so that it doesn't try to
+# communicate over the network during the build.
 PYTHON3_CONF_ENV += \
 	ac_cv_have_long_long_format=yes \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
-	ac_cv_working_tzset=yes
+	ac_cv_working_tzset=yes \
+	ac_cv_prog_HAS_HG=/bin/false
 
 # uClibc is known to have a broken wcsftime() implementation, so tell
 # Python 3 to fall back to strftime() instead.
-- 
2.7.4
