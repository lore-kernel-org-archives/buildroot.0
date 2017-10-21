From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Oct 2017 16:59:49 +0200
Subject: [Buildroot] [git commit] pppd: Add an option to not to overwrite
	/etc/resolv.conf
Message-ID: <20171021150107.D5FF5802A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bb454bcb15f33c4539c2f1b4633e4c9dafbb854
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default pppd built by buildroot writes the list of nameservers to
/etc/resolv.conf instead of /etc/ppp/resolv.conf
This is not the default behavior of pppd and breaks name resolution
if several network interfaces are used. The change makes this optional
and enabled by default, to be backward compatible and to add a possibility
to turn this behavior off, if required.

Signed-off-by: Maksim Salau <msalau@iotecha.com>
[Arnout: extend the help text to explain that it won't work on readonly
 rootfs]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pppd/Config.in | 12 ++++++++++++
 package/pppd/pppd.mk   |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 8c56421..ee89a57 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -23,6 +23,18 @@ config BR2_PACKAGE_PPPD_RADIUS
 	help
 	  Install RADIUS support for pppd
 
+config BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF
+	bool "overwrite /etc/resolv.conf"
+	default y
+	help
+	  Overwrite /etc/resolv.conf instead of maintaining the
+	  separate list of nameservers in /etc/ppp/resolv.conf
+
+	  Note that the pppd default of writing to /etc/ppp/resolv.conf
+	  does not work on a read-only rootfs unless you make it
+	  writable in your rootfs customizations (e.g. by linking it to
+	  a file in tmpfs or by mounting a writable filesystem on it).
+
 endif
 
 comment "pppd needs a uClibc or glibc toolchain w/ dynamic library"
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 6139c5b..6b86a4d 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -41,7 +41,9 @@ PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_INTERNAL_IF_PPOL2TP_H
 define PPPD_SET_RESOLV_CONF
 	$(SED) 's,ppp/resolv.conf,resolv.conf,' $(@D)/pppd/pathnames.h
 endef
+ifeq ($(BR2_PACKAGE_PPPD_OVERWRITE_RESOLV_CONF),y)
 PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
+endif
 
 define PPPD_CONFIGURE_CMDS
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
