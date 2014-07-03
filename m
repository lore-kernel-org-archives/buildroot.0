From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu,  3 Jul 2014 18:57:36 +0200
Subject: [Buildroot] [PATCH 3/6] systemd: fix path for kmod in service files
In-Reply-To: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1404406659-31109-4-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The path for kmod used in kmod-static-nodes.service is the one found by
the ./configure script, which ends up being the path to the host kmod
program.

This patch forces the path to the target kmod program.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/systemd.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 97fa61a..756446b 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -50,6 +50,10 @@ SYSTEMD_CONF_OPT += \
 	--disable-dbus \
 	--without-python
 
+# Override path to kmod, used in kmod-static-nodes.service
+SYSTEMD_CONF_ENV = \
+	ac_cv_path_KMOD=/usr/bin/kmod
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_COMPAT),y)
 SYSTEMD_CONF_OPT += --enable-compat-libs
 else
-- 
1.7.10.4
