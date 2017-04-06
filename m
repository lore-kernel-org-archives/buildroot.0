From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:14:48 +0200
Subject: [Buildroot] [git commit] fmt: new package
Message-ID: <20170406201507.7198381DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81fe75c855f9a598695f83b7384713820383efe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
[Thomas:
 - add entry to DEVELOPERS file
 - add missing wchar dependency
 - minor tweaks.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS            |  3 +++
 package/Config.in     |  1 +
 package/fmt/Config.in | 11 +++++++++++
 package/fmt/fmt.hash  |  2 ++
 package/fmt/fmt.mk    | 18 ++++++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e1713cf..629ea4b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1411,6 +1411,9 @@ F:	package/kyua/
 F:	package/lutok/
 F:	package/yaml-cpp/
 
+N:	Semyon Kolganov <semenak94@mail.ru>
+F:	package/fmt/
+
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
 F:	package/mongodb/
diff --git a/package/Config.in b/package/Config.in
index fe4c0ae..a4855a9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1433,6 +1433,7 @@ endmenu
 menu "Text and terminal handling"
 	source "package/augeas/Config.in"
 	source "package/enchant/Config.in"
+	source "package/fmt/Config.in"
 	source "package/icu/Config.in"
 	source "package/libcli/Config.in"
 	source "package/libedit/Config.in"
diff --git a/package/fmt/Config.in b/package/fmt/Config.in
new file mode 100644
index 0000000..979d940
--- /dev/null
+++ b/package/fmt/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_FMT
+	bool "fmt"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	help
+	  fmt is an open-source formatting library for C++. It can be used
+	  as a safe alternative to printf or as a fast alternative to
+	  IOStreams.
+
+comment "fmt needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
new file mode 100755
index 0000000..beb120b
--- /dev/null
+++ b/package/fmt/fmt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	dce62ab75a161dd4353a98364feb166d35e7eea382169d59d9ce842c49c55bad fmt-3.0.1.tar.gz
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
new file mode 100755
index 0000000..b7e3db0
--- /dev/null
+++ b/package/fmt/fmt.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# fmt
+#
+################################################################################
+
+FMT_VERSION = 3.0.1
+FMT_SITE = $(call github,fmtlib,fmt,$(FMT_VERSION))
+FMT_LICENSE = BSD-2-Clause
+FMT_LICENSE_FILES = LICENSE.rst
+FMT_INSTALL_STAGING = YES
+
+FMT_CONF_OPTS = \
+	-DHAVE_OPEN=ON \
+	-DFMT_INSTALL=ON \
+	-DFMT_TEST=OFF
+
+$(eval $(cmake-package))
