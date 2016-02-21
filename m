From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:40:53 +0100
Subject: [Buildroot] [git commit branch/next] ifupdown: bump to version 0.8.8
Message-ID: <20160221204439.403898046E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4558f82dea2db6f037d92940f95fd2fcaeb1ae4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add a kludge switching the explicit invocation of the ip binary
from /bin to /sbin since that's where buildroot installs it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifupdown/ifupdown.hash |  4 ++--
 package/ifupdown/ifupdown.mk   | 13 +++++++++++--
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/ifupdown/ifupdown.hash b/package/ifupdown/ifupdown.hash
index 02dfd2b..c5a4189 100644
--- a/package/ifupdown/ifupdown.hash
+++ b/package/ifupdown/ifupdown.hash
@@ -1,2 +1,2 @@
-# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.2.dsc
-sha256	edb08f935fea9bc376c3faa0140c04c7a4d4ef5f22fd280ec4060386a75df10b	ifupdown_0.8.2.tar.xz
+# From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.8.dsc
+sha256	180edaaa6de99e4e74de7229481edf74361b8e8468462842618a42a952a26c0e	ifupdown_0.8.8.tar.xz
diff --git a/package/ifupdown/ifupdown.mk b/package/ifupdown/ifupdown.mk
index 7fbd003..37aaf5d 100644
--- a/package/ifupdown/ifupdown.mk
+++ b/package/ifupdown/ifupdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-IFUPDOWN_VERSION = 0.8.2
+IFUPDOWN_VERSION = 0.8.8
 IFUPDOWN_SOURCE = ifupdown_$(IFUPDOWN_VERSION).tar.xz
-IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20151205T042642Z/pool/main/i/ifupdown
+IFUPDOWN_SITE = http://snapshot.debian.org/archive/debian/20160113T035819Z/pool/main/i/ifupdown
 IFUPDOWN_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 IFUPDOWN_LICENSE = GPLv2+
 IFUPDOWN_LICENSE_FILES = COPYING
@@ -23,4 +23,13 @@ define IFUPDOWN_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) BASEDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
+# We need to switch from /bin/ip to /sbin/ip
+IFUPDOWN_DEFN_FILES = can inet inet6 ipx link meta
+define IFUPDOWN_MAKE_IP_IN_SBIN
+	for f in $(IFUPDOWN_DEFN_FILES) ; do \
+		$(SED) 's,/bin/ip,/sbin/ip,' $(@D)/$$f.defn ; \
+	done
+endef
+IFUPDOWN_POST_PATCH_HOOKS += IFUPDOWN_MAKE_IP_IN_SBIN
+
 $(eval $(generic-package))
