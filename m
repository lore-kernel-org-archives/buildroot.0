From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon,  6 May 2019 10:15:42 +0200
Subject: [Buildroot] [PATCH v3 1/7] package/luajit: bump to version 2.1.x
 developpment version for aarch64
In-Reply-To: <1557130548-6267-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557130548-6267-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1557130548-6267-2-git-send-email-jugurtha.belkalem@smile.fr>
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
Changes V1 => V2 :
Removing luajit patch for aarch64
as this patch should be in
bcc package.
---
 package/luajit/Config.in   | 2 +-
 package/luajit/luajit.hash | 1 +
 package/luajit/luajit.mk   | 6 ++++++
 3 files changed, 8 insertions(+), 1 deletion(-)

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
index 5b08a42..181cf1c 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,9 +4,15 @@
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
 
-- 
2.7.4
