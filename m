From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 00:13:58 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 package/x11r7/xserver_xorg-server: bump version to 1.20.10
Message-ID: <20201212233308.EA26682976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7529a552499fc692bb5002f5ec59a5f7a3352ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Release notes:
https://lists.x.org/archives/xorg-announce/2020-December/003067.html

Remove patches which were applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5f6e3c0962176855715a24fc0a028ebca11ac742)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...eviceInfo-and-SetDeviceIndicators-heap-ov.patch | 100 ----------------
 ...008-Check-SetMap-request-length-carefully.patch | 131 ---------------------
 .../xserver_xorg-server/xserver_xorg-server.hash   |   6 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |   2 +-
 4 files changed, 4 insertions(+), 235 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/0007-Fix-XkbSetDeviceInfo-and-SetDeviceIndicators-heap-ov.patch b/package/x11r7/xserver_xorg-server/0007-Fix-XkbSetDeviceInfo-and-SetDeviceIndicators-heap-ov.patch
deleted file mode 100644
index 8297aa8a9f..0000000000
--- a/package/x11r7/xserver_xorg-server/0007-Fix-XkbSetDeviceInfo-and-SetDeviceIndicators-heap-ov.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 87c64fc5b0db9f62f4e361444f4b60501ebf67b9 Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Sun, 11 Oct 2020 17:05:09 +0200
-Subject: [PATCH] Fix XkbSetDeviceInfo() and SetDeviceIndicators() heap
- overflows
-
-ZDI-CAN 11389 / CVE-2020-25712
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- xkb/xkb.c | 26 +++++++++++++++++++++++---
- 1 file changed, 23 insertions(+), 3 deletions(-)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index 8e016cd74..f54cc97f8 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -6536,7 +6536,9 @@ SetDeviceIndicators(char *wire,
-                     unsigned changed,
-                     int num,
-                     int *status_rtrn,
--                    ClientPtr client, xkbExtensionDeviceNotify * ev)
-+                    ClientPtr client,
-+                    xkbExtensionDeviceNotify * ev,
-+                    xkbSetDeviceInfoReq * stuff)
- {
-     xkbDeviceLedsWireDesc *ledWire;
-     int i;
-@@ -6557,6 +6559,11 @@ SetDeviceIndicators(char *wire,
-         xkbIndicatorMapWireDesc *mapWire;
-         XkbSrvLedInfoPtr sli;
- 
-+        if (!_XkbCheckRequestBounds(client, stuff, ledWire, ledWire + 1)) {
-+            *status_rtrn = BadLength;
-+            return (char *) ledWire;
-+        }
-+
-         namec = mapc = statec = 0;
-         sli = XkbFindSrvLedInfo(dev, ledWire->ledClass, ledWire->ledID,
-                                 XkbXI_IndicatorMapsMask);
-@@ -6575,6 +6582,10 @@ SetDeviceIndicators(char *wire,
-             memset((char *) sli->names, 0, XkbNumIndicators * sizeof(Atom));
-             for (n = 0, bit = 1; n < XkbNumIndicators; n++, bit <<= 1) {
-                 if (ledWire->namesPresent & bit) {
-+                    if (!_XkbCheckRequestBounds(client, stuff, atomWire, atomWire + 1)) {
-+                        *status_rtrn = BadLength;
-+                        return (char *) atomWire;
-+                    }
-                     sli->names[n] = (Atom) *atomWire;
-                     if (sli->names[n] == None)
-                         ledWire->namesPresent &= ~bit;
-@@ -6592,6 +6603,10 @@ SetDeviceIndicators(char *wire,
-         if (ledWire->mapsPresent) {
-             for (n = 0, bit = 1; n < XkbNumIndicators; n++, bit <<= 1) {
-                 if (ledWire->mapsPresent & bit) {
-+                    if (!_XkbCheckRequestBounds(client, stuff, mapWire, mapWire + 1)) {
-+                        *status_rtrn = BadLength;
-+                        return (char *) mapWire;
-+                    }
-                     sli->maps[n].flags = mapWire->flags;
-                     sli->maps[n].which_groups = mapWire->whichGroups;
-                     sli->maps[n].groups = mapWire->groups;
-@@ -6671,7 +6686,7 @@ _XkbSetDeviceInfoCheck(ClientPtr client, DeviceIntPtr dev,
-     ed.deviceID = dev->id;
-     wire = (char *) &stuff[1];
-     if (stuff->change & XkbXI_ButtonActionsMask) {
--        int nBtns, sz, i;
-+	int nBtns, sz, i;
-         XkbAction *acts;
-         DeviceIntPtr kbd;
- 
-@@ -6683,7 +6698,11 @@ _XkbSetDeviceInfoCheck(ClientPtr client, DeviceIntPtr dev,
-                 return BadAlloc;
-             dev->button->xkb_acts = acts;
-         }
-+        if (stuff->firstBtn + stuff->nBtns > nBtns)
-+            return BadValue;
-         sz = stuff->nBtns * SIZEOF(xkbActionWireDesc);
-+        if (!_XkbCheckRequestBounds(client, stuff, wire, (char *) wire + sz))
-+            return BadLength;
-         memcpy((char *) &acts[stuff->firstBtn], (char *) wire, sz);
-         wire += sz;
-         ed.reason |= XkbXI_ButtonActionsMask;
-@@ -6704,7 +6723,8 @@ _XkbSetDeviceInfoCheck(ClientPtr client, DeviceIntPtr dev,
-         int status = Success;
- 
-         wire = SetDeviceIndicators(wire, dev, stuff->change,
--                                   stuff->nDeviceLedFBs, &status, client, &ed);
-+                                   stuff->nDeviceLedFBs, &status, client, &ed,
-+                                   stuff);
-         if (status != Success)
-             return status;
-     }
--- 
-2.20.1
-
diff --git a/package/x11r7/xserver_xorg-server/0008-Check-SetMap-request-length-carefully.patch b/package/x11r7/xserver_xorg-server/0008-Check-SetMap-request-length-carefully.patch
deleted file mode 100644
index a8b33ebf3b..0000000000
--- a/package/x11r7/xserver_xorg-server/0008-Check-SetMap-request-length-carefully.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From 446ff2d3177087b8173fa779fa5b77a2a128988b Mon Sep 17 00:00:00 2001
-From: Matthieu Herrb <matthieu@herrb.eu>
-Date: Thu, 12 Nov 2020 19:15:07 +0100
-Subject: [PATCH] Check SetMap request length carefully.
-
-Avoid out of bounds memory accesses on too short request.
-
-ZDI-CAN 11572 /  CVE-2020-14360
-
-This vulnerability was discovered by:
-Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
-
-Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- xkb/xkb.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 92 insertions(+)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index f54cc97f8..d056c698c 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -2382,6 +2382,93 @@ SetVirtualModMap(XkbSrvInfoPtr xkbi,
-     return (char *) wire;
- }
- 
-+#define _add_check_len(new) \
-+    if (len > UINT32_MAX - (new) || len > req_len - (new)) goto bad; \
-+    else len += new
-+
-+/**
-+ * Check the length of the SetMap request
-+ */
-+static int
-+_XkbSetMapCheckLength(xkbSetMapReq *req)
-+{
-+    size_t len = sz_xkbSetMapReq, req_len = req->length << 2;
-+    xkbKeyTypeWireDesc *keytype;
-+    xkbSymMapWireDesc *symmap;
-+    BOOL preserve;
-+    int i, map_count, nSyms;
-+
-+    if (req_len < len)
-+        goto bad;
-+    /* types */
-+    if (req->present & XkbKeyTypesMask) {
-+        keytype = (xkbKeyTypeWireDesc *)(req + 1);
-+        for (i = 0; i < req->nTypes; i++) {
-+            _add_check_len(XkbPaddedSize(sz_xkbKeyTypeWireDesc));
-+            if (req->flags & XkbSetMapResizeTypes) {
-+                _add_check_len(keytype->nMapEntries
-+                               * sz_xkbKTSetMapEntryWireDesc);
-+                preserve = keytype->preserve;
-+                map_count = keytype->nMapEntries;
-+                if (preserve) {
-+                    _add_check_len(map_count * sz_xkbModsWireDesc);
-+                }
-+                keytype += 1;
-+                keytype = (xkbKeyTypeWireDesc *)
-+                          ((xkbKTSetMapEntryWireDesc *)keytype + map_count);
-+                if (preserve)
-+                    keytype = (xkbKeyTypeWireDesc *)
-+                              ((xkbModsWireDesc *)keytype + map_count);
-+            }
-+        }
-+    }
-+    /* syms */
-+    if (req->present & XkbKeySymsMask) {
-+        symmap = (xkbSymMapWireDesc *)((char *)req + len);
-+        for (i = 0; i < req->nKeySyms; i++) {
-+            _add_check_len(sz_xkbSymMapWireDesc);
-+            nSyms = symmap->nSyms;
-+            _add_check_len(nSyms*sizeof(CARD32));
-+            symmap += 1;
-+            symmap = (xkbSymMapWireDesc *)((CARD32 *)symmap + nSyms);
-+        }
-+    }
-+    /* actions */
-+    if (req->present & XkbKeyActionsMask) {
-+        _add_check_len(req->totalActs * sz_xkbActionWireDesc 
-+                       + XkbPaddedSize(req->nKeyActs));
-+    }
-+    /* behaviours */
-+    if (req->present & XkbKeyBehaviorsMask) {
-+        _add_check_len(req->totalKeyBehaviors * sz_xkbBehaviorWireDesc);
-+    }
-+    /* vmods */
-+    if (req->present & XkbVirtualModsMask) {
-+        _add_check_len(XkbPaddedSize(Ones(req->virtualMods)));
-+    }
-+    /* explicit */
-+    if (req->present & XkbExplicitComponentsMask) {
-+        /* two bytes per non-zero explicit componen */
-+        _add_check_len(XkbPaddedSize(req->totalKeyExplicit * sizeof(CARD16)));
-+    }
-+    /* modmap */
-+    if (req->present & XkbModifierMapMask) {
-+         /* two bytes per non-zero modmap component */
-+        _add_check_len(XkbPaddedSize(req->totalModMapKeys * sizeof(CARD16)));
-+    }
-+    /* vmodmap */
-+    if (req->present & XkbVirtualModMapMask) {
-+        _add_check_len(req->totalVModMapKeys * sz_xkbVModMapWireDesc);
-+    }
-+    if (len == req_len)
-+        return Success;
-+bad:
-+    ErrorF("[xkb] BOGUS LENGTH in SetMap: expected %ld got %ld\n",
-+           len, req_len);
-+    return BadLength;
-+}
-+
-+
- /**
-  * Check if the given request can be applied to the given device but don't
-  * actually do anything, except swap values when client->swapped and doswap are both true.
-@@ -2642,6 +2729,11 @@ ProcXkbSetMap(ClientPtr client)
-     CHK_KBD_DEVICE(dev, stuff->deviceSpec, client, DixManageAccess);
-     CHK_MASK_LEGAL(0x01, stuff->present, XkbAllMapComponentsMask);
- 
-+    /* first verify the request length carefully */
-+    rc = _XkbSetMapCheckLength(stuff);
-+    if (rc != Success)
-+        return rc;
-+
-     tmp = (char *) &stuff[1];
- 
-     /* Check if we can to the SetMap on the requested device. If this
--- 
-2.20.1
-
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 2b55449e14..d6b3c92e08 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-August/003059.html
-sha256  e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571  xorg-server-1.20.9.tar.bz2
-sha512  d9b5f93e1b9763a89187d8b272aa7d4ce9709641b8539f4536708af153310e5a4931bffd4229c51a3b0e3b12da7838750aa71b635751fb4c0bb27438cce4e5e6  xorg-server-1.20.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-December/003067.html
+sha256  977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99  xorg-server-1.20.10.tar.bz2
+sha512  a07bee380bb72f2117fe6f831a6e4aded19bea1f2b36e42a019a30348e98d6fe65c0617cf819be9c6b405502f88cafb829df30aab32393774b71f1418a4cefae  xorg-server-1.20.10.tar.bz2
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index de97467745..8ac2d17b24 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.20.9
+XSERVER_XORG_SERVER_VERSION = 1.20.10
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
