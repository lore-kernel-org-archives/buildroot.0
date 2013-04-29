From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Apr 2013 22:29:32 +0200
Subject: [Buildroot] [PATCH 2/4] make: undeprecate package as it is used by
	the uClibc test suite
In-Reply-To: <1367267374-7512-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1367267374-7512-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1367267374-7512-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uClibc test suite can be installed on the target thanks to the
BR2_UCLIBC_INSTALL_TEST_SUITE option, but it requires make to be
installed on the target. Since the make package is currently marked as
deprecated, it leads to the following warning:

warning: (BR2_UCLIBC_INSTALL_TEST_SUITE) selects BR2_PACKAGE_MAKE which has unmet direct dependencies (BR2_DEPRECATED)

We fix this by undeprecating the make package, and also update its
description to explain why we have the make package even if we don't
have support for building a toolchain for the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/make/Config.in |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/make/Config.in b/package/make/Config.in
index e5cc970..aea72e3 100644
--- a/package/make/Config.in
+++ b/package/make/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_MAKE
 	bool "make"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	# We no longer support a toolchain on the target
-	depends on BR2_DEPRECATED
 	help
 	  A tool which controls the generation of executables and other
 	  non-source files of a program from the program's source files.
 
+	  While Buildroot no longer supports building a toolchain for
+	  the target, we keep a make package that is for example
+	  useful to run the uClibc test suite on the target.
+
 	  http://www.gnu.org/software/make/
-- 
1.7.9.5
