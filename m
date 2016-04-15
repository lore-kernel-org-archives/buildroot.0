From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Apr 2016 02:00:16 +0000
Subject: [Buildroot] [Bug 8856] New: python tornado runtime wasn't met on
 buildroot 2016.02
Message-ID: <bug-8856-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8856

            Bug ID: 8856
           Summary: python tornado runtime wasn't met on buildroot 2016.02
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ckhardin at exablox.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

in build root 2016.02 it looks like python-tornado doesn't work when installed
on the current version... we did this to get it to work.

diff --git a/package/Config.in b/package/Config.in
index 8f39f49..843cea9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -619,6 +619,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "External python modules"
        source "package/python-alsaaudio/Config.in"
        source "package/python-backports-abc/Config.in"
+       source "package/python-backports-ssl-match-hostname/Config.in"
        source "package/python-beautifulsoup4/Config.in"
        source "package/python-bottle/Config.in"
        source "package/python-can/Config.in"
diff --git a/package/python-backports-ssl-match-hostname/Config.in
b/package/python-backports-ssl-match-hostname/Config.in
new file mode 100644
index 0000000..b2bb471
--- /dev/null
+++ b/package/python-backports-ssl-match-hostname/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME
+       bool "python-backports-ssl-match-hostname"
+       help
+         The ssl.match_hostname() function from Python 3.5
+
+         https://pypi.python.org/pypi/backports.ssl_match_hostname
diff --git
a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
new file mode 100644
index 0000000..4c15d21
--- /dev/null
+++
b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
@@ -0,0 +1,3 @@
+# md5 from
https://pypi.python.org/pypi?:action=show_md5&digest=c03fc5e2c7b3da46b81acf5cbacfe1e6,
sha256 locally computed
+md5     c03fc5e2c7b3da46b81acf5cbacfe1e6 
backports.ssl_match_hostname-3.5.0.1.tar.gz
+sha256  502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2 
backports.ssl_match_hostname-3.5.0.1.tar.gz
diff --git
a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
new file mode 100644
index 0000000..b2d9133
--- /dev/null
+++
b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-backports-ssl-match-hostname
+#
+################################################################################
+
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION = 3.5.0.1
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SOURCE =
backports.ssl_match_hostname-$(PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION).tar.gz
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SITE =
https://pypi.python.org/packages/source/b/backports.ssl_match_hostname
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE = Python Software Foundation
License
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SETUP_TYPE = distutils
+
+$(eval $(python-package))
diff --git a/package/python-tornado/Config.in
b/package/python-tornado/Config.in
index ac86682..8009a58 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PYTHON_TORNADO
        select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
        select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON #
runtime
        select BR2_PACKAGE_PYTHON_BACKPORTS_ABC # runtime
+       select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME if
BR2_PACKAGE_PYTHON # runtime
+       select BR2_PACKAGE_PYTHON_CERTIFI # runtime
        help
          Tornado is a Python web framework and asynchronous networking
          library, originally developed at FriendFeed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
