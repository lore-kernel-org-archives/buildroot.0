From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 21:31:22 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: bump to version 1.4.2
Message-ID: <20190403192733.89CA381931@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eee04e59c89c0aadaa049352e0bd1d8e096b958f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch 0001, which is included in the new version.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Use-uint64_t-instead-of-u_int64_t.patch   | 72 ----------------------
 package/upmpdcli/upmpdcli.hash                     |  4 +-
 package/upmpdcli/upmpdcli.mk                       |  2 +-
 3 files changed, 3 insertions(+), 75 deletions(-)

diff --git a/package/upmpdcli/0001-Use-uint64_t-instead-of-u_int64_t.patch b/package/upmpdcli/0001-Use-uint64_t-instead-of-u_int64_t.patch
deleted file mode 100644
index 69e05827ce..0000000000
--- a/package/upmpdcli/0001-Use-uint64_t-instead-of-u_int64_t.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 256394399f57ba6e3057ee2c981127a14e4623f8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Tue, 22 Jan 2019 09:07:56 +0100
-Subject: [PATCH] Use uint64_t instead of u_int64_t
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-`uintN_t` is standard C99 type available in `<stdint.h>`, whereas `u_intN_t`
-is defined `<sys/types.h>`
-
-As upmpdcli already uses the `uintN_t` type, replace the few existing
-`u_intN_t` types, as it breaks build with the musl C library, which is
-very strict, because of the missing `<sys/types.h>`:
-
-```
-src/mediaserver/cdplugins/netfetch.h:71:5: error: ???u_int64_t??? does not name a type
-     u_int64_t datacount() {
-```
-
-Backported from: 256394399f57ba6e3057ee2c981127a14e4623f8
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
- src/mediaserver/cdplugins/netfetch.h | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/mediaserver/cdplugins/netfetch.h b/src/mediaserver/cdplugins/netfetch.h
-index d7e9df4..d105e53 100644
---- a/src/mediaserver/cdplugins/netfetch.h
-+++ b/src/mediaserver/cdplugins/netfetch.h
-@@ -68,7 +68,7 @@ public:
-     /// Reset after transfer done, for retrying for exemple.
-     virtual bool reset() = 0;
- 
--    u_int64_t datacount() {
-+    uint64_t datacount() {
-         return fetch_data_count;
-     }
- 
-@@ -84,11 +84,11 @@ public:
-         buf1cb = f;
-     }
-     // Called when the network transfer is done
--    void setEOFetchCB(std::function<void(bool ok, u_int64_t count)> f) {
-+    void setEOFetchCB(std::function<void(bool ok, uint64_t count)> f) {
-         eofcb = f;
-     }
-     // Called every time we get new data from the remote
--    void setFetchBytesCB(std::function<void(u_int64_t count)> f) {
-+    void setFetchBytesCB(std::function<void(uint64_t count)> f) {
-         fbcb = f;
-     }
- 
-@@ -98,11 +98,11 @@ protected:
-     std::string _url;
-     uint64_t startoffset;
-     int timeoutsecs{0};
--    u_int64_t fetch_data_count{0};
-+    uint64_t fetch_data_count{0};
-     BufXChange<ABuffer*> *outqueue{nullptr};
-     std::function<bool(std::string&, void *, int)> buf1cb;
--    std::function<void(u_int64_t)> fbcb;
--    std::function<void(bool, u_int64_t)> eofcb;
-+    std::function<void(uint64_t)> fbcb;
-+    std::function<void(bool, uint64_t)> eofcb;
- };
- 
- #endif /* _MEDIAFETCH_H_INCLUDED_ */
--- 
-2.20.1
-
diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index cbd12fe293..09df35491e 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.0.tar.gz.sha256:
-sha256  28742910fa16b72f0c4e5b7dc561f59aa7f1a5fdd3e8e4f72f359d2e4af90d35  upmpdcli-1.4.0.tar.gz
+# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.4.2.tar.gz.sha256:
+sha256  1d4489e76416b9cff2e98a68243d56bf46303890752ac18db382be2859b62bc3  upmpdcli-1.4.2.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 22a5bf2429..2241853fe1 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.4.0
+UPMPDCLI_VERSION = 1.4.2
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
