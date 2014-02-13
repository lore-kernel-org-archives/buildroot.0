From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:49:06 +0100
Subject: [Buildroot] [PATCHv1 17/26] package: allow Python packages with
	Python3
In-Reply-To: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392324555-29246-18-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fca61d6..fe2acf9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,7 +395,8 @@ endmenu
 endif
 source "package/php/Config.in"
 source "package/python/Config.in"
-if BR2_PACKAGE_PYTHON
+source "package/python3/Config.in"
+if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 menu "external python modules"
 source "package/python-bottle/Config.in"
 source "package/python-configobj/Config.in"
@@ -431,7 +432,6 @@ source "package/python-tornado/Config.in"
 source "package/python-versiontools/Config.in"
 endmenu
 endif
-source "package/python3/Config.in"
 source "package/ruby/Config.in"
 source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
-- 
1.8.3.2
