From: Markos Chandras <markos.chandras@imgtec.com>
Date: Tue, 20 Aug 2013 15:25:39 +0100
Subject: [Buildroot] [PATCH] python-setuptools: Add patch to prevent
	detecting the host installation
Message-ID: <1377008739-12484-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 ...etuptools-do-not-detect-installed-version.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/python-setuptools/python-setuptools-do-not-detect-installed-version.patch

diff --git a/package/python-setuptools/python-setuptools-do-not-detect-installed-version.patch b/package/python-setuptools/python-setuptools-do-not-detect-installed-version.patch
new file mode 100644
index 0000000..ebc8830
--- /dev/null
+++ b/package/python-setuptools/python-setuptools-do-not-detect-installed-version.patch
@@ -0,0 +1,26 @@
+Prevent build system from detecting an existing installation.
+Fixes the following problem when python-setuptools is installed
+on the host:
+
+Setuptools installation detected at /usr/lib64/python2.7/site-packages
+Renaming /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info to
+/usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info.OLD.1377005697.88
+OSError: [Errno 13] Permission denied
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+
+Index: python-setuptools-0.6.36/setup.py
+===================================================================
+--- python-setuptools-0.6.36.orig/setup.py
++++ python-setuptools-0.6.36/setup.py
+@@ -129,10 +129,6 @@ def _being_installed():
+         return False
+     return  'install' in sys.argv[1:] or _easy_install_marker()
+ 
+-if _being_installed():
+-    from distribute_setup import _before_install
+-    _before_install()
+-
+ # return contents of reStructureText file with linked issue references
+ def _linkified(rst_path):
+     bitroot = 'http://bitbucket.org/tarek/distribute'
-- 
1.8.3.2
