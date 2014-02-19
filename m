From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 08:52:31 +0100
Subject: [Buildroot] [git commit] package: allow Python packages with Python3
Message-ID: <20140228133414.7FC9C9BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0520b8cf59ab1ed8dac0146a48c05f4cf5b3fc9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, Python external modules were only visible when Python 2.x
was selected. With this commit, we now source all the Config.in files
of Python external modules, as soon as one of the two Python
interpreters is enabled.

Since all Python external modules have a "depends on
BR2_PACKAGE_PYTHON" in their Config.in, this commit in practice does
not allow to enable any Python external module. However, thanks to
this, we can progressively and safely enable more and more Python
external modules to build with Python 3, by simply changing their
dependency to "depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cb2d31b..0f702a3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -411,7 +411,8 @@ comment "External PHP extensions need a toolchain w/ dynamic library"
 endif
 endif
 source "package/python/Config.in"
-if BR2_PACKAGE_PYTHON
+source "package/python3/Config.in"
+if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "external python modules"
 source "package/python-bottle/Config.in"
 source "package/python-configobj/Config.in"
@@ -447,7 +448,6 @@ source "package/python-tornado/Config.in"
 source "package/python-versiontools/Config.in"
 endmenu
 endif
-source "package/python3/Config.in"
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
