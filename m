From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 May 2017 23:07:57 +0200
Subject: [Buildroot] [git commit] openssh: add support for HW SSL engines
Message-ID: <20170504072829.B455582823@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=634655b6281047f5fe2a2b09b95aa642144d23a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable support for OpenSSH to use a hardware SSL engine if
cryptodev-linux is included. Without this, OpenSSH uses only
OpenSSL software crypto implementation.

Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
CC: Baruch Siach <baruch@tkos.co.il>
CC: Arnout Vandecappelle <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/openssh.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f971e99..7e197b0 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -28,6 +28,13 @@ endif
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
+ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
+OPENSSH_DEPENDENCIES += cryptodev-linux
+OPENSSH_CONF_OPTS += --with-ssl-engine
+else
+OPENSSH_CONF_OPTS += --without-ssl-engine
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 define OPENSSH_INSTALL_PAM_CONF
 	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
