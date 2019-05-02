From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Thu,  2 May 2019 10:20:04 +0200
Subject: [Buildroot] [PATCH 1/7] package/luajit: bump to version 2.1.x
 developpment version for aarch64
In-Reply-To: <1556785210-18237-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556785210-18237-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556785210-18237-2-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

luajit 2.0.5 has not been updated since 2017, it
lacks aarch64 support.
An upgrade to version 2.1.0-beta3 is required to
get aarch64 which allows to execute bcc (ebpf's front
end tool) on arm64 architectures.

Luajit 2.0.1-beta3 is not a release version:
https://github.com/LuaJIT/LuaJIT which why we
kept luajit 2.0.5 version and the upgrade is
only made when aarch64 is encountered.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 .../bcc/0001-package-bcc-luajit-for-aarch64.patch  | 25 ++++++++++++++++++++++
 package/luajit/Config.in                           |  2 +-
 package/luajit/luajit.hash                         |  1 +
 package/luajit/luajit.mk                           |  8 +++++--
 4 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 package/bcc/0001-package-bcc-luajit-for-aarch64.patch

diff --git a/package/bcc/0001-package-bcc-luajit-for-aarch64.patch b/package/bcc/0001-package-bcc-luajit-for-aarch64.patch
new file mode 100644
index 0000000..a3658a7
--- /dev/null
+++ b/package/bcc/0001-package-bcc-luajit-for-aarch64.patch
@@ -0,0 +1,25 @@
+From 910cee6713f78eb4dce4747ca349322cd0528a5e Mon Sep 17 00:00:00 2001
+From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+Date: Thu, 2 May 2019 10:02:43 +0200
+Subject: [PATCH] package/bcc luajit for aarch64
+
+---
+ bcc-v0.8.0/src/lua/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lua/CMakeLists.txt b/src/lua/CMakeLists.txt
+index 7541d48..620a0cd 100644
+--- a/src/lua/CMakeLists.txt
++++ b/src/lua/CMakeLists.txt
+@@ -15,7 +15,7 @@ if (LUAJIT_LIBRARIES AND LUAJIT)
+ 
+ 	ADD_CUSTOM_COMMAND(
+ 		OUTPUT bcc.o
+-		COMMAND ${LUAJIT} -bg bcc.lua bcc.o
++		COMMAND ../../../../host/bin/luajit -bg bcc.lua -a arm64 bcc.o
+ 		DEPENDS bcc.lua
+ 	)
+ 
+-- 
+2.7.4
+
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 88c5bcb..9ecf6b4 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
-	default y if BR2_i386 || \
+	default y if BR2_i386 || BR2_aarch64 || \
 		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
 		BR2_powerpc || BR2_arm || BR2_armeb || \
 		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT && \
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 7e2d87e..1737cca 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -2,4 +2,5 @@
 md5 48353202cbcacab84ee41a5a70ea0a2c    LuaJIT-2.0.5.tar.gz
 
 # Locally calculated
+sha256 ad5077bd861241bf5e50ae4bf543d291c5fcffab95ccc3218401131f503e45bd luajit-f0e865dd4861520258299d0f2a56491bd9d602e1.tar.gz
 sha256 accb335aa3102f80d31caa2c2508fbcb795314106493519a367f13a87d0e87de  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 5b08a42..0e0a1e7 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,14 +4,18 @@
 #
 ################################################################################
 
+ifeq ($(BR2_aarch64),y)
+LUAJIT_VERSION = f0e865dd4861520258299d0f2a56491bd9d602e1
+LUAJIT_SITE = $(call github,luajit,luajit,$(LUAJIT_VERSION))
+else
 LUAJIT_VERSION = 2.0.5
 LUAJIT_SOURCE = LuaJIT-$(LUAJIT_VERSION).tar.gz
 LUAJIT_SITE = http://luajit.org/download
+endif
+
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-
 LUAJIT_INSTALL_STAGING = YES
-
 LUAJIT_PROVIDES = luainterpreter
 
 ifeq ($(BR2_PACKAGE_LUAJIT_COMPAT52),y)
-- 
2.7.4
