From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:08:09 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/dhcpcd: create
 dhcpcd user
Message-ID: <20201227082413.6CEAE88179@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb5d61cf2b4be5c1be04a15b66e2921323b1f2fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

privsep is supported since version 9.0.0 and
https://github.com/rsmarples/dhcpcd/commit/d5786118da1bad4c247631cae86344f1b249a8cb
It is enabled by default since
https://github.com/rsmarples/dhcpcd/commit/3a4c2e5604d72151b06ed365aa71493740a3ad75

So use --privsepuser to avoid that the detection mechanism finds a wrong
value from host and create it on the target

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13416

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9e20f0910902d3f2af2c8fd0b44110d088ebc1e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 11d78e1847..7b69602605 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -13,7 +13,8 @@ DHCPCD_LICENSE_FILES = LICENSE
 
 DHCPCD_CONFIG_OPTS = \
 	--libexecdir=/lib/dhcpcd \
-	--os=linux
+	--os=linux \
+	--privsepuser=dhcpcd
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCPCD_CONFIG_OPTS += --enable-static
@@ -50,6 +51,10 @@ define DHCPCD_INSTALL_INIT_SYSTEMD
 endef
 endif
 
+define DHCPCD_USERS
+	dhcpcd -1 dhcpcd -1 * - - - dhcpcd user
+endef
+
 # NOTE: Even though this package has a configure script, it is not generated
 # using the autotools, so we have to use the generic package infrastructure.
 
