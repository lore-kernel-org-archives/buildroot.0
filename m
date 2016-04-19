From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 23:22:32 +0200
Subject: [Buildroot] [git commit] linux-pam: add optional libselinux and
	audit dependencies
Message-ID: <20160419212237.A2B04817F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ee7c0ded2286f0decd96fe0c572b90e913a130e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds optional libselinux and audit packages
to linux-pam package.

Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-pam/linux-pam.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 71c5490..2b94412 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -26,6 +26,20 @@ LINUX_PAM_DEPENDENCIES += gettext
 LINUX_PAM_MAKE_OPTS += LIBS=-lintl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+LINUX_PAM_CONF_OPTS += --enable-selinux
+LINUX_PAM_DEPENDENCIES += libselinux
+else
+LINUX_PAM_CONF_OPTS += --disable-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+LINUX_PAM_CONF_OPTS += --enable-audit
+LINUX_PAM_DEPENDENCIES += audit
+else
+LINUX_PAM_CONF_OPTS += --disable-audit
+endif
+
 # Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
 	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
