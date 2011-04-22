From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 22 Apr 2011 15:12:19 +0200
Subject: [Buildroot] [git commit] proftpd: remove UseIPv6 option from sample
	config if built without IPv6
Message-ID: <20110422132109.4A9B682973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=af6b3ecf401935edfe613c2d90423f34bc38460e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

proftpd refuses to start if it finds a UseIPv6 option in the configuration
file (even if set to off) when built without IPv6 support, so comment out
line.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/proftpd/proftpd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 191f611..75ab930 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -31,6 +31,7 @@ define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
 	@if [ ! -f $(TARGET_DIR)/etc/proftpd.conf ]; then \
 		$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf; \
+		$(if $(BR2_INET_IPV6),,$(SED) 's/^UseIPv6/# UseIPv6/' $(TARGET_DIR)/etc/proftpd.conf;) \
 	fi
 	$(INSTALL) -m 0755 package/proftpd/S50proftpd $(TARGET_DIR)/etc/init.d
 endef
-- 
1.7.3.4
