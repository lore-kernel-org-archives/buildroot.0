From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Oct 2014 11:31:05 +0100
Subject: [Buildroot] [git commit] nss-mdns: unbreak after e1eba3d97
	(system/skeleton: make nsswitch install conditional)
Message-ID: <20141031103620.B1418B2511@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c7c0ca288dc8bf758c4324e23fc5853192d23d7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/481/4819cacd4b7015ef2bfaaf1b3fc9ba33f9194315/

After commit e1eba3d97, the skeleton no longer has a /etc/nsswitch.conf by
the time nss-mdns gets built, so the sed invocation fails.

Work around it by installing the glibc one early if not already available
in the skeleton.

If we want to do further modification of nsswitch.conf in the future (for
E.G.  samba), then we should probably introduce some hooks to
GLIBC_COPY_NSSWITCH_FILE instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nss-mdns/nss-mdns.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 8d23f89..22c2bc2 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -10,6 +10,9 @@ NSS_MDNS_LICENSE = LGPLv2.1+
 NSS_MDNS_LICENSE_FILES = LICENSE
 
 define NSS_MDNS_INSTALL_CONFIG
+	if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
+		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
+	fi
 	sed -r -i -e 's/^(hosts:[[:space:]]+).*/\1files mdns4_minimal [NOTFOUND=return] dns mdns4/' \
 	    $(TARGET_DIR)/etc/nsswitch.conf
 endef
