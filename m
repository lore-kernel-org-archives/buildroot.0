From: Koen Martens <gmc@sonologic.nl>
Date: Sat, 16 May 2020 09:53:13 +0200
Subject: [Buildroot] [PATCH v2] package/capnproto: bump version to 0.8.0
Message-ID: <20200516075313.GB31946@coltrane>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The new version requires an extra features in the
toolchain and won't build with a specific gcc
bug, therefore two new toolchain options are added
as dependencies:

* !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
* BR2_TOOLCHAIN_HAS_UCONTEXT

Signed-off-by: Koen Martens <gmc@sonologic.nl>

---
changes v1 -> v2:
  - use !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 instead of
    BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
    (suggested by Thomas Petazzoni)
---
 package/capnproto/Config.in      | 9 +++++++--
 package/capnproto/capnproto.hash | 2 +-
 package/capnproto/capnproto.mk   | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
index cd9cb647af..e7143527d2 100644
--- a/package/capnproto/Config.in
+++ b/package/capnproto/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_CAPNPROTO
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
 	help
 	  Cap'n Proto is an insanely fast data interchange format
 	  and capability-based RPC system. Think JSON, except
@@ -15,10 +17,13 @@ config BR2_PACKAGE_CAPNPROTO
 
 	  https://capnproto.org/index.html
 
-comment "capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic"
+comment "capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic, ucontext and not gcc bug 64735"
 	depends on BR2_USE_MMU
 	depends on !BR2_HOST_GCC_AT_LEAST_5 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HAS_ATOMIC
+		!BR2_TOOLCHAIN_HAS_ATOMIC || \
+		BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
+		!BR2_TOOLCHAIN_HAS_UCONTEXT
+
diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
index 98467f8634..d4500e0aad 100644
--- a/package/capnproto/capnproto.hash
+++ b/package/capnproto/capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	76c7114a3d142ad08b7208b3964a26e72a6320ee81331d3f0b87569fc9c47a28  capnproto-0.7.0.tar.gz
+sha256	6d8b43a7ec2a764b4dfe4139a7cdd070ad9057f106898050d9f4db3754b98820  capnproto-0.8.0.tar.gz
 sha256	9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 34fb885914..e9e89dff07 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAPNPROTO_VERSION = 0.7.0
+CAPNPROTO_VERSION = 0.8.0
 CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
 CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
-- 
2.17.1
