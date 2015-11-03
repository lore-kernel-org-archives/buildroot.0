From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 21:16:26 +0100
Subject: [Buildroot] [git commit] boost: add option to build boost_coroutine
Message-ID: <20151103201652.4F5DA807A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9bd806311f84c2c640f8d99ac556fd7111d9f2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was disabled by default by commit
611dfe6cb55ed72d7df3b7c102f4a723248a4037 because it caused some build
failures on AArch64 and SuperH. However, the coroutine module needs
the context module, which is only available on certain architectures.

We can therefore allow enabling the coroutine module, but only if the
context module is available.

[Thomas: extend commit log with more details.]

Signed-off-by: Edson Siqueira <edson.siqueira@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in |    4 ++++
 package/boost/boost.mk  |    4 +---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index ac70152..150174c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -70,6 +70,10 @@ config BR2_PACKAGE_BOOST_CONTEXT
 	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
 			|| BR2_powerpc || BR2_sparc || BR2_x86_64)
 
+config BR2_PACKAGE_BOOST_COROUTINE
+        bool "boost-coroutine"
+        depends on BR2_PACKAGE_BOOST_CONTEXT
+
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 16d05cd..80325b0 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -20,13 +20,11 @@ HOST_BOOST_FLAGS = --without-icu \
 	iostreams locale log math mpi program_options python random regex \
 	serialization signals system test thread timer wave)
 
-# coroutine breaks on some weak toolchains and it's new for 1.54+
-BOOST_WITHOUT_FLAGS = coroutine
-
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
