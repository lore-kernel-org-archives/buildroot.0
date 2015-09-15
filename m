From: Wetzel Andreas <Andreas.Wetzel@nanotronic.ch>
Date: Tue, 15 Sep 2015 09:38:12 +0000
Subject: [Buildroot] [PATCH] openvpn: add option for --enable-password-save
Message-ID: <9811803ba55043e0b0bf8a6451c40cf2@LysExc01.nanotronic.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added configuration option BR2_PACKAGE_OPENVPN_PWSAVE that
adds --enable-password-save to OPENVPN_CONF_OPTS if selected.

Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
---
 package/openvpn/Config.in  | 6 ++++++
 package/openvpn/openvpn.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 5edb479..2b5962d 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -27,6 +27,12 @@ config BR2_PACKAGE_OPENVPN_SMALL
          You loose eurephia, debugging info, help messages and more.
          It saves around 100 KiB in binary file size.
 
+config BR2_PACKAGE_OPENVPN_PWSAVE
+    bool "Allow passwords in files"
+    help
+      Allow --askpass and --auth-user-pass passwords to be
+      read from a file.
+
 choice
        prompt "Crypto backend"
        default BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 1caa9a0..cdae3f0 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -41,6 +41,10 @@ else
 OPENVPN_CONF_OPTS += --disable-lzo
 endif
 
+ifeq ($(BR2_PACKAGE_OPENVPN_PWSAVE),y)
+OPENVPN_CONF_OPTS += --enable-password-save
+endif
+
 ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL),y)
 OPENVPN_CONF_OPTS += --with-crypto-library=openssl
 OPENVPN_DEPENDENCIES += openssl
-- 
2.1.4
