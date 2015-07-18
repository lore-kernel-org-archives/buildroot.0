From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 17:26:07 +0200
Subject: [Buildroot] [git commit] openssh: selinux and pam support
Message-ID: <20150718153630.9287C81DD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5f5bd92df7708d19ac19a9df922739520c707ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: in the sed expression, use % as a delimiter instead of /,
since the line contains several / that all had to be escaped.]

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssh/openssh.mk |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 11a844e..5a7162f 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -30,8 +30,24 @@ endif
 OPENSSH_DEPENDENCIES = zlib openssl
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+define OPENSSH_INSTALL_PAM_CONF
+	$(INSTALL) -D -m 644 $(@D)/contrib/sshd.pam.generic $(TARGET_DIR)/etc/pam.d/sshd
+	$(SED) '\%password   required     /lib/security/pam_cracklib.so%d' $(TARGET_DIR)/etc/pam.d/sshd
+	$(SED) 's/\#UsePAM no/UsePAM yes/' $(TARGET_DIR)/etc/ssh/sshd_config
+endef
+
 OPENSSH_DEPENDENCIES += linux-pam
 OPENSSH_CONF_OPTS += --with-pam
+OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_PAM_CONF
+else
+OPENSSH_CONF_OPTS += --without-pam
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+OPENSSH_DEPENDENCIES += libselinux
+OPENSSH_CONF_OPTS += --with-selinux
+else
+OPENSSH_CONF_OPTS += --without-selinux
 endif
 
 define OPENSSH_INSTALL_INIT_SYSTEMD
