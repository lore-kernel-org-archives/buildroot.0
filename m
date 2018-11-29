From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 17:22:33 +0100
Subject: [Buildroot] [git commit] package/netsnmp: drop our custom config
 script fixups
Message-ID: <20181202071600.BEADB803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48ea9fa4a43a8eef3306dd6091e04ba3812df57b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those custom fixups were added in 2011 with commit d1b42b24b88
(net-snmp: fixup paths in net-snmp-config) before we add generic config
scripts fixups in 2013 with commit 834f9311aac (pkg-infra: add
<pkg>_CONFIG_FIXUP to fix *-config files)

These custom fixups enclose the includes and libraries paths in single
quotes (presumably to protect them from further expnasion by the shell,
in case there are spaces for example).

It turns out that this breaks now that we replace the staging dir with
$(dirname $0), as it is between single quotes.

It looks like these fixups are really no longer needed anymore, since
the generic fixups do the job just fine (and better).

Fixes:
    http://autobuild.buildroot.org/results/2c5/2c5e379a06825bf8588bf070d733d2e1f98dab66/
    http://autobuild.buildroot.org/results/eea/eea704463c3f14dbb9bd7f8aa23d4b61c25987f4/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/netsnmp.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 65a3f16a4d..4bd65ef17a 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -106,12 +106,4 @@ define NETSNMP_INSTALL_INIT_SYSV
 endef
 endif
 
-define NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
-	$(SED)	"s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
-		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
-		$(STAGING_DIR)/usr/bin/net-snmp-config
-endef
-
-NETSNMP_POST_INSTALL_STAGING_HOOKS += NETSNMP_STAGING_NETSNMP_CONFIG_FIXUP
-
 $(eval $(autotools-package))
