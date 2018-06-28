From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 28 Jun 2018 17:19:44 -0300
Subject: [Buildroot] [PATCH] dropbear: enable PAM athentication if linux-pam
 is selected
Message-ID: <20180628201944.31492-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Disable password file athentication, since it's not possible to have
  both at once.
- Install a /etc/pam.d/sshd file, based on the ofe from from openssh.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/dropbear/dropbear.mk    | 14 ++++++++++++++
 package/dropbear/etc-pam.d-sshd |  7 +++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/dropbear/etc-pam.d-sshd

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index fc41a84c1f..bb902bc7ce 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -34,6 +34,19 @@ ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 DROPBEAR_CONF_OPTS += --disable-static
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+define DROPBEAR_SVR_PAM_AUTH
+	echo '#define DROPBEAR_SVR_PASSWORD_AUTH 0'     >> $(@D)/localoptions.h
+	echo '#define DROPBEAR_SVR_PAM_AUTH 1'          >> $(@D)/localoptions.h
+endef
+define DROPBEAR_INSTALL_PAM_CONF
+	$(INSTALL) -D -m 644 package/dropbear/etc-pam.d-sshd $(TARGET_DIR)/etc/pam.d/sshd
+endef
+DROPBEAR_DEPENDENCIES += linux-pam
+DROPBEAR_CONF_OPTS += --enable-pam
+DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PAM_AUTH
+DROPBEAR_POST_INSTALL_TARGET_HOOKS += DROPBEAR_INSTALL_PAM_CONF
+else
 # Ensure that dropbear doesn't use crypt() when it's not available
 define DROPBEAR_SVR_PASSWORD_AUTH
 	echo '#if !HAVE_CRYPT'                          >> $(@D)/localoptions.h
@@ -41,6 +54,7 @@ define DROPBEAR_SVR_PASSWORD_AUTH
 	echo '#endif'                                   >> $(@D)/localoptions.h
 endef
 DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_SVR_PASSWORD_AUTH
+endif
 
 define DROPBEAR_ENABLE_REVERSE_DNS
 	echo '#define DO_HOST_LOOKUP 1'                 >> $(@D)/localoptions.h
diff --git a/package/dropbear/etc-pam.d-sshd b/package/dropbear/etc-pam.d-sshd
new file mode 100644
index 0000000000..5e13fc0d60
--- /dev/null
+++ b/package/dropbear/etc-pam.d-sshd
@@ -0,0 +1,7 @@
+#%PAM-1.0
+auth       required     pam_unix.so shadow nodelay
+account    required     pam_nologin.so
+account    required     pam_unix.so
+password   required     pam_unix.so shadow nullok use_authtok
+session    required     pam_unix.so
+session    required     pam_limits.so
-- 
2.14.4
