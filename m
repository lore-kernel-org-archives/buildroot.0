From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 15:40:36 +0100
Subject: [Buildroot] [git commit] boost: add option for the stacktrace
	library
Message-ID: <20171029143331.9A9DA811B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a43ddc79fe2100ffde0a653085aecfdb468de74b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

stacktrace requires dynamic library support, which was causing the
following build errors:

http://autobuild.buildroot.net/results/692ffad93a7bd867ecc7ccbfc8c6280735d29435/
http://autobuild.buildroot.net/results/6058ece804889abaaab0a29258e1de2904162d26/
http://autobuild.buildroot.net/results/12df9b345a90a4e011b8bb4cb1d1ef1c2c7040c0/
http://autobuild.buildroot.net/results/7473c433e93b3e785e44d9868fec517437f59847/

Adding an option for it allows to have it disabled by default, and
make sure it only gets enabled when shared library support is
available.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in | 9 +++++++++
 package/boost/boost.mk  | 1 +
 2 files changed, 10 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 37a7e73..e69e6c6 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -158,6 +158,15 @@ config BR2_PACKAGE_BOOST_SERIALIZATION
 config BR2_PACKAGE_BOOST_SIGNALS
 	bool "boost-signals"
 
+config BR2_PACKAGE_BOOST_STACKTRACE
+	bool "boost-stacktrace"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Gather, store, copy and print backtraces.
+
+comment "boost-stacktrace needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_BOOST_SYSTEM
 	bool "boost-system"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 0fd6c4d..750b40f 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -42,6 +42,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SIGNALS),,signals)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_STACKTRACE),,stacktrace)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
