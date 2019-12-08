From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 23:06:25 +0100
Subject: [Buildroot] [git commit] package/shairport-sync: add audio DSP
 convolution option
Message-ID: <20191208221346.6707188F27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e4acf980b48607a0d6ef98e6d229f6609e82af3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Already in version 3.1, shairport-sync added audio DSP convolution support. This
optional feature requires the sndfile library.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/shairport-sync/Config.in         | 6 ++++++
 package/shairport-sync/shairport-sync.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/shairport-sync/Config.in b/package/shairport-sync/Config.in
index 085a9ec77d..87f38a940d 100644
--- a/package/shairport-sync/Config.in
+++ b/package/shairport-sync/Config.in
@@ -20,6 +20,12 @@ config BR2_PACKAGE_SHAIRPORT_SYNC
 
 if BR2_PACKAGE_SHAIRPORT_SYNC
 
+config BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION
+	bool "convolution support"
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Enable audio DSP convolution support.
+
 config BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR
 	bool "libsoxr support"
 	select BR2_PACKAGE_LIBSOXR
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 3d9e909879..1ca56e9f0a 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -51,6 +51,11 @@ SHAIRPORT_SYNC_CONF_LIBS += -lz
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_CONVOLUTION),y)
+SHAIRPORT_SYNC_DEPENDENCIES += libsndfile
+SHAIRPORT_SYNC_CONF_OPTS += --with-convolution
+endif
+
 ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
 SHAIRPORT_SYNC_DEPENDENCIES += libsoxr
 SHAIRPORT_SYNC_CONF_OPTS += --with-soxr
