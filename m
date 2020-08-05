From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:32:59 +0200
Subject: [Buildroot] [git commit] package/systemd: bump version to 246
Message-ID: <20200805133452.AC71A82A05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6cf469614740dbbfffd093e866e071c5fe2725d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add zstd as optional dependency, and
disable new options for host-systemd.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.hash |  4 ++--
 package/systemd/systemd.mk   | 17 ++++++++++++++---
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index a90a54ab56..4672e43422 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,6 +1,6 @@
 # sha256 locally computed
-sha256  5770df29a89e8249bb4fbdc2018e2ea7bbb4fd01425cc03ece338f04a1d80c7f  systemd-245.7.tar.gz
+sha256  4268bd88037806c61c5cd1c78d869f7f20bf7e7368c63916d47b5d1c3411bd6f  systemd-246.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
-sha256  f7299f5f5e8bdffd347dce1bed888b1cea6ddaf27de521c307265098bcbeae92  README
+sha256  a5ce42cd4614b086ef75aae6663f88f55bdf9e09a83c615c636ca540282528cf  README
 sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  tools/chromiumos/LICENSE
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 107fcbe66a..87265c97ad 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 245.7
-SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
+SYSTEMD_VERSION = 246
+SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
 SYSTEMD_INSTALL_STAGING = YES
@@ -125,6 +125,13 @@ else
 SYSTEMD_CONF_OPTS += -Dbzip2=false
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+SYSTEMD_DEPENDENCIES += zstd
+SYSTEMD_CONF_OPTS += -Dzstd=true
+else
+SYSTEMD_CONF_OPTS += -Dzstd=false
+endif
+
 ifeq ($(BR2_PACKAGE_LZ4),y)
 SYSTEMD_DEPENDENCIES += lz4
 SYSTEMD_CONF_OPTS += -Dlz4=true
@@ -658,7 +665,11 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dtests=false \
 	-Dglib=false \
 	-Dacl=false \
-	-Dsysvinit-path=''
+	-Dsysvinit-path='' \
+	-Dinitrd=false \
+	-Dxdg-autostart=false \
+	-Dkernel-install=false \
+	-Dsystemd-analyze=false
 
 HOST_SYSTEMD_DEPENDENCIES = \
 	$(BR2_COREUTILS_HOST_DEPENDENCY) \
