From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:24:00 +0200
Subject: [Buildroot] [git commit] systemd: fix path for kmod in service files
Message-ID: <20140715212406.415379D248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64b38f03a705fdbb40f0cf0186bbe38d611d1e10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The path for kmod used in kmod-static-nodes.service is the one found by
the ./configure script, which ends up being the path to the host kmod
program.

This patch forces the path to the target kmod program.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 95e7214..f7fbf79 100644
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
