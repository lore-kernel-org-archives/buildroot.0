From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 16:12:25 +0200
Subject: [Buildroot] [git commit branch/next] systemd: add optional
 dependency on libidn2
Message-ID: <20180520141552.91B5181239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ded5d6af4f0198036183f00de190569d7578bc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: simplify ifeq/else/endif sequence.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index db7fb43636..1e4b257731 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -75,11 +75,15 @@ else
 SYSTEMD_CONF_OPTS += -Daudit=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIDN),y)
+# Both options can't be selected at the same time so prefer libidn2
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+SYSTEMD_DEPENDENCIES += libidn2
+SYSTEMD_CONF_OPTS += -Dlibidn2=true -Dlibidn=false
+else ifeq ($(BR2_PACKAGE_LIBIDN),y)
 SYSTEMD_DEPENDENCIES += libidn
-SYSTEMD_CONF_OPTS += -Dlibidn=true
+SYSTEMD_CONF_OPTS += -Dlibidn=true -Dlibidn2=false
 else
-SYSTEMD_CONF_OPTS += -Dlibidn=false
+SYSTEMD_CONF_OPTS += -Dlibidn=false -Dlibidn2=true
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
