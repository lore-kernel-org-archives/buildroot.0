From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jun 2014 19:50:29 -0700
Subject: [Buildroot] [PATCH v2 2/3] tclap: new package
In-Reply-To: <1402455030-18008-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1402455030-18008-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1402455030-18008-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---

Changes v1 -> v2:
   - Added depend on c++ stdlib (Thomas P)
   - Fixed description line length and word spelling (Thomas P)
   - Removed define of source archive file name as it's default
     (Thomas P)
   - Added description about not installing to target and that
     this pkg is a set of template headers (Thomas P)
---
 package/Config.in       |    1 +
 package/tclap/Config.in |   17 +++++++++++++++++
 package/tclap/tclap.mk  |   16 ++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/tclap/Config.in
 create mode 100644 package/tclap/tclap.mk

diff --git a/package/Config.in b/package/Config.in
index 60118ea..ac3af6b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -856,6 +856,7 @@ source "package/pcre/Config.in"
 source "package/popt/Config.in"
 source "package/readline/Config.in"
 source "package/slang/Config.in"
+source "package/tclap/Config.in"
 endmenu
 
 endmenu
diff --git a/package/tclap/Config.in b/package/tclap/Config.in
new file mode 100644
index 0000000..8c6296f
--- /dev/null
+++ b/package/tclap/Config.in
@@ -0,0 +1,17 @@
+comment "tclap needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_TCLAP
+	bool "tclap"
+	depends BR2_INSTALL_LIBSTDCPP
+	help
+	  This is a small, flexible library that provides a simple interface
+	  for defining and accessing command line arguments. It was initially
+	  inspired by the user friendly CLAP libary. The difference is that
+	  this library is templatized, so the argument class is type
+	  independent. Type independence avoids identical-except-for-type
+	  objects, such as IntArg, FloatArg, and StringArg. While the library
+	  is not strictly compliant with the GNU or POSIX standards, it is
+	  close.
+
+	  http://tclap.sourceforge.net/
diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
new file mode 100644
index 0000000..807f247
--- /dev/null
+++ b/package/tclap/tclap.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# tclap
+#
+################################################################################
+
+TCLAP_VERSION = 1.2.1
+TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
+TCLAP_LICENSE = MIT
+TCLAP_LICENSE_FILES = COPYING
+TCLAP_INSTALL_STAGING = YES
+
+# This package is a pure C++ template library, only made of headers.
+TCLAP_INSTALL_TARGET = NO
+
+$(eval $(autotools-package))
-- 
1.7.9.5
