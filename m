From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 16:58:25 +0100
Subject: [Buildroot] [git commit] iproute2: fix em_ipset build issue
Message-ID: <20121103161145.289AD99A74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b5ce0e9a2867851cdb81aaa68b4007d5517250f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/be19e39c19b62946ea48dd6b3dfd55f5c3ccd7c9

em_ipset.c uses xtables.h from iptables, but the configure script fails
to to check for this, so forcibly disable it if not available.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/iproute2.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 03767cc..6f5ee51 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -24,6 +24,11 @@ define IPROUTE2_WITH_IPTABLES
 	$(SED) "s/-DIPT/-DXT/" $(IPROUTE2_DIR)/tc/Makefile
 	echo "TC_CONFIG_XT:=y" >>$(IPROUTE2_DIR)/Config
 endef
+else
+define IPROUTE2_WITH_IPTABLES
+	# em_ipset needs xtables, but configure misdetects it
+	echo "TC_CONFIG_IPSET:=n" >>$(IPROUTE2_DIR)/Config
+endef
 endif
 
 define IPROUTE2_CONFIGURE_CMDS
