From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 15:45:39 +0200
Subject: [Buildroot] [git commit] package/iputils: fix build without NLS
Message-ID: <20190801134529.53DA881249@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ea3072936f224485a89914effddd0ad8035838a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set USE_GETTEXT depending on BR2_SYSTEM_ENABLE_NLS as otherwise build
will fail if gettext is not installed on host because USE_GETTEXT is
enabled by default since version 20190324 and
https://github.com/iputils/iputils/commit/2615a527209bb408b54028ef6405075cadd4541b

Fixes:
 - http://autobuild.buildroot.org/results/127823ddbd75336abc0fe0e9bd11e4f5249df87c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iputils/iputils.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 8e6a3e2fc5..b28222138f 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -49,6 +49,12 @@ IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+IPUTILS_CONF_OPTS += -DUSE_GETTEXT=true
+else
+IPUTILS_CONF_OPTS += -DUSE_GETTEXT=false
+endif
+
 IPUTILS_CONF_OPTS += -DBUILD_TRACEROUTE6=true
 
 # XSL Stylesheets for DocBook 5 not packaged for buildroot
