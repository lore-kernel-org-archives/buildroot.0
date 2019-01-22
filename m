From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 22:45:44 +0100
Subject: [Buildroot] [git commit] package/upmpdcli: add upstream patch to
 fix musl build issue
Message-ID: <20190122214705.AAE6F835B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=255f9172377f98da18ce8797e1ddf35f8f369373
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

upmpdcli 1.4.0 uses both the `uint64_t` and `u_int64_t` type. `uintN_t` is
standard C99 type available in `<stdint.h>`, whereas `u_intN_t` is defined in
`<sys/types.h>`.

Because of the missing include of `<sys/types.h>` building upmpdcli breaks now
when building with the musl C library, which is very strict:

```
src/mediaserver/cdplugins/netfetch.h:71:5: error: ???u_int64_t??? does not name a type
     u_int64_t datacount() {
```

Add a patch from upstream which fixes the issue by replacing `u_int64_t`
with `uint64_t`.

Fixes:
http://autobuild.buildroot.net/results/f3082d2fdda8d73dbd9d3b65a08d844934066ef7

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Use-uint64_t-instead-of-u_int64_t.patch   | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/package/upmpdcli/0001-Use-uint64_t-instead-of-u_int64_t.patch b/package/upmpdcli/0001-Use-uint64_t-instead-of-u_int64_t.patch
new file mode 100644
index 0000000000..69e05827ce
--- /dev/null
+++ b/package/upmpdcli/0001-Use-uint64_t-instead-of-u_int64_t.patch
@@ -0,0 +1,72 @@
+From 256394399f57ba6e3057ee2c981127a14e4623f8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Tue, 22 Jan 2019 09:07:56 +0100
+Subject: [PATCH] Use uint64_t instead of u_int64_t
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+`uintN_t` is standard C99 type available in `<stdint.h>`, whereas `u_intN_t`
+is defined `<sys/types.h>`
+
+As upmpdcli already uses the `uintN_t` type, replace the few existing
+`u_intN_t` types, as it breaks build with the musl C library, which is
+very strict, because of the missing `<sys/types.h>`:
+
+```
+src/mediaserver/cdplugins/netfetch.h:71:5: error: ???u_int64_t??? does not name a type
+     u_int64_t datacount() {
+```
+
+Backported from: 256394399f57ba6e3057ee2c981127a14e4623f8
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ src/mediaserver/cdplugins/netfetch.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/mediaserver/cdplugins/netfetch.h b/src/mediaserver/cdplugins/netfetch.h
+index d7e9df4..d105e53 100644
+--- a/src/mediaserver/cdplugins/netfetch.h
++++ b/src/mediaserver/cdplugins/netfetch.h
+@@ -68,7 +68,7 @@ public:
+     /// Reset after transfer done, for retrying for exemple.
+     virtual bool reset() = 0;
+ 
+-    u_int64_t datacount() {
++    uint64_t datacount() {
+         return fetch_data_count;
+     }
+ 
+@@ -84,11 +84,11 @@ public:
+         buf1cb = f;
+     }
+     // Called when the network transfer is done
+-    void setEOFetchCB(std::function<void(bool ok, u_int64_t count)> f) {
++    void setEOFetchCB(std::function<void(bool ok, uint64_t count)> f) {
+         eofcb = f;
+     }
+     // Called every time we get new data from the remote
+-    void setFetchBytesCB(std::function<void(u_int64_t count)> f) {
++    void setFetchBytesCB(std::function<void(uint64_t count)> f) {
+         fbcb = f;
+     }
+ 
+@@ -98,11 +98,11 @@ protected:
+     std::string _url;
+     uint64_t startoffset;
+     int timeoutsecs{0};
+-    u_int64_t fetch_data_count{0};
++    uint64_t fetch_data_count{0};
+     BufXChange<ABuffer*> *outqueue{nullptr};
+     std::function<bool(std::string&, void *, int)> buf1cb;
+-    std::function<void(u_int64_t)> fbcb;
+-    std::function<void(bool, u_int64_t)> eofcb;
++    std::function<void(uint64_t)> fbcb;
++    std::function<void(bool, uint64_t)> eofcb;
+ };
+ 
+ #endif /* _MEDIAFETCH_H_INCLUDED_ */
+-- 
+2.20.1
+
