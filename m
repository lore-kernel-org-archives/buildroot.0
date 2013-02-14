From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 14 Feb 2013 16:10:06 +0100
Subject: [Buildroot] [PATCH v4 2/2] strongswan: fix build without IPv6
	support
In-Reply-To: <1360854606-13787-1-git-send-email-jezz@sysmic.org>
References: <20130214143957.1095407a@skate>
 <1360854606-13787-1-git-send-email-jezz@sysmic.org>
Message-ID: <1360854606-13787-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable kernel-netlink and socket-default features if toolchain does not
support IPv6. Also add a comment for this case.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/strongswan/Config.in     |    6 ++++++
 package/strongswan/strongswan.mk |    4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 24b30ad..f7404f6 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -16,6 +16,12 @@ menuconfig BR2_PACKAGE_STRONGSWAN
 
 if BR2_PACKAGE_STRONGSWAN
 
+if !BR2_INET_IPV6
+
+comment "kernel-netlink and socket-default options require a toolchain with IPV6 support"
+
+endif
+
 config BR2_PACKAGE_STRONGSWAN_OPENSSL
 	bool "Enables OpenSSL based crypto backends"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index e235a04..548401d 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -10,7 +10,9 @@ STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPLv2+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_CONF_OPT +=                                                             \
-      --enable-pkcs11                                                              \
+      --enable-pkcs11=yes                                                          \
+      --enable-kernel-netlink=$(if $(BR2_INET_IPV6),yes,no)                        \
+      --enable-socket-default=$(if $(BR2_INET_IPV6),yes,no)                        \
       --enable-openssl=$(if $(BR2_PACKAGE_STRONGSWAN_OPENSSL),yes,no)              \
       --enable-gcrypt=$(if $(BR2_PACKAGE_STRONGSWAN_GCRYPT),yes,no)                \
       --enable-gmp=$(if $(BR2_PACKAGE_STRONGSWAN_GMP),yes,no)                      \
-- 
1.7.9.5
