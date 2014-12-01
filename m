From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Dec 2014 00:28:35 +0100
Subject: [Buildroot] [git commit] proftpd: install configuration file
	unconditionally
Message-ID: <20141201233009.7EB4280051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e18b0a4e12e739aed6eb892a246d3d27a007a38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As discussed, users should use a rootfs overlay or a post-build script
instead of a custom skeleton to override files installed by Buildroot,
so there is no point in having conditions when installing init scripts
or configuration files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index ce66a3f..0fd8cc8 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -48,10 +48,8 @@ PROFTPD_MAKE = $(MAKE1)
 
 define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
-	@if [ ! -f $(TARGET_DIR)/etc/proftpd.conf ]; then \
-		$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
-		$(if $(BR2_INET_IPV6),,$(SED) 's/^UseIPv6/# UseIPv6/' $(TARGET_DIR)/etc/proftpd.conf;) \
-	fi
+	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
+	$(if $(BR2_INET_IPV6),,$(SED) 's/^UseIPv6/# UseIPv6/' $(TARGET_DIR)/etc/proftpd.conf;) \
 endef
 
 define PROFTPD_INSTALL_INIT_SYSV
