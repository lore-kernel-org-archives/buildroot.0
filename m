From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:59:31 +0200
Subject: [Buildroot] [git commit] syslog-ng: disable mongodb
Message-ID: <20170422135936.B2B018262C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c2b11977a70d418b7ae2cd7d4b62e77bddbc2c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libbson is a dependency of the mongo-c-driver that syslog-ng uses. Buildroot
doesn't package mongo-c-driver so syslog-ng uses the bundled one. The bundled
mongo-c-driver in turn may optionally use a bundled libbson. When Buildroot
builds libbson mongo-c-driver detects that and does not configure its bundled
libbson. This breaks the build of the syslog-ng mongodb module because it adds
the bundled libbson to the headers search path.

Disable the mongodb module to avoid this issue.

Fixes:
http://autobuild.buildroot.net/results/843/84331e9a168d8bdf2cceca8e9e1480611c1ecaed/
http://autobuild.buildroot.net/results/b5b/b5bad64abbf5764faf2a7129a1a25ad75c34980b/
http://autobuild.buildroot.net/results/3c3/3c32f4eb7436da06f3fb59f928363959df2a5e86/

Cc: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/syslog-ng/syslog-ng.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 192a52b..980c783 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -13,7 +13,7 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 # rabbit-mq needs -lrt
 SYSLOG_NG_CONF_ENV = LIBS=-lrt
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
-	--disable-java --disable-java-modules
+	--disable-java --disable-java-modules --disable-mongodb
 
 # We override busybox's S01logging init script
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
