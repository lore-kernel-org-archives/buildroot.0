From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2015 13:04:33 +0200
Subject: [Buildroot] [git commit] openvpn: add option for
	--enable-password-save
Message-ID: <20150930110450.DCB9F8185E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58dfd45aec6de8213bb34c10506117aa88b6ca2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added configuration option BR2_PACKAGE_OPENVPN_PWSAVE that
adds --enable-password-save to OPENVPN_CONF_OPTS if selected.

[Thomas: rewrap Config.in help text, as suggested by Vicente.]

Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvpn/Config.in  |    6 ++++++
 package/openvpn/openvpn.mk |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 5edb479..2e37125 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -27,6 +27,12 @@ config BR2_PACKAGE_OPENVPN_SMALL
 	  You loose eurephia, debugging info, help messages and more.
 	  It saves around 100 KiB in binary file size.
 
+config BR2_PACKAGE_OPENVPN_PWSAVE
+	bool "Allow passwords in files"
+	help
+	  Allow --askpass and --auth-user-pass passwords to be read
+	  from a file.
+
 choice
 	prompt "Crypto backend"
 	default BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 1caa9a0..2973928 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -41,6 +41,12 @@ else
 OPENVPN_CONF_OPTS += --disable-lzo
 endif
 
+ifeq ($(BR2_PACKAGE_OPENVPN_PWSAVE),y)
+OPENVPN_CONF_OPTS += --enable-password-save
+else
+OPENVPN_CONF_OPTS += --disable-password-save
+endif
+
 ifeq ($(BR2_PACKAGE_OPENVPN_CRYPTO_OPENSSL),y)
 OPENVPN_CONF_OPTS += --with-crypto-library=openssl
 OPENVPN_DEPENDENCIES += openssl
