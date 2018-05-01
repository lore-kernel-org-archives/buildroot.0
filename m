From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 22:40:37 +0200
Subject: [Buildroot] [PATCH 6/7] systemd: add optional dependency on libidn2
In-Reply-To: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
References: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
Message-ID: <20180501204038.20000-6-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index db7fb43636..bdf4fb32f2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -75,12 +75,19 @@ else
 SYSTEMD_CONF_OPTS += -Daudit=false
 endif
 
+# Both options can't be selected at the same time so prefer libidn2
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+SYSTEMD_DEPENDENCIES += libidn2
+SYSTEMD_CONF_OPTS += -Dlibidn2=true
+else
+SYSTEMD_CONF_OPTS += -Dlibidn2=false
 ifeq ($(BR2_PACKAGE_LIBIDN),y)
 SYSTEMD_DEPENDENCIES += libidn
 SYSTEMD_CONF_OPTS += -Dlibidn=true
 else
 SYSTEMD_CONF_OPTS += -Dlibidn=false
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 SYSTEMD_DEPENDENCIES += libseccomp
-- 
2.14.1
