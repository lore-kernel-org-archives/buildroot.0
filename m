From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Sep 2020 22:10:09 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: remove
 unmaintained versions 1.14.7 & 1.17.4
Message-ID: <20200902161640.376FE85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6dc4f1857eed27a19abd57fae7428bea38b69e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream does not maintain these older versions anymore. Due to security
fixes not being backported to these versions anymore we remove these old
X server versions.

Move current patches from version-specific directory to package directory.

No legacy handling is added for the old versions, since it's simply a
version bump. THe old packages and features (AIGLX) that depend on the
old versions do have legacy handling.

Remove legacy handling for 1.19.*

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   | 13 ++--
 .../0001-modesettings-needs-dri2.patch             |  0
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch |  0
 .../0003-Remove-check-for-useSIGIO-option.patch    |  0
 .../0004-include-misc.h-fix-uClibc-build.patch     |  0
 ...wayland-Makefile.am-fix-build-without-glx.patch |  0
 ...6-common-xf86Init.c-fix-build-without-glx.patch |  0
 .../{1.20.8 => }/0007-fix-for-ZDI-11426.patch      |  0
 .../1.14.7/0001-sdksyms-gcc5.patch                 | 50 ---------------
 ...target-buffer-in-SProcXSendExtensionEvent.patch | 39 ------------
 ...isallow-GenericEvent-in-SendEvent-request.patch | 71 ----------------------
 ...ify-all-events-in-ProcXSendExtensionEvent.patch | 50 ---------------
 .../0005-Xi-Do-not-try-to-swap-GenericEvent.patch  | 45 --------------
 .../1.17.4/0001-modesettings-needs-dri2.patch      | 19 ------
 ...target-buffer-in-SProcXSendExtensionEvent.patch | 39 ------------
 ...isallow-GenericEvent-in-SendEvent-request.patch | 71 ----------------------
 ...ify-all-events-in-ProcXSendExtensionEvent.patch | 50 ---------------
 .../0005-Xi-Do-not-try-to-swap-GenericEvent.patch  | 45 --------------
 package/x11r7/xserver_xorg-server/Config.in        | 50 ---------------
 .../xserver_xorg-server/xserver_xorg-server.hash   |  5 --
 .../xserver_xorg-server/xserver_xorg-server.mk     | 10 +--
 21 files changed, 7 insertions(+), 550 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3bcdaf9287..0c37b600ba 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
+	bool "X.org Enable AIGLX Extension"
+	select BR2_LEGACY
+	help
+	  AIGLX Extension was removed in X.org X server version 1.19.0
+
 config BR2_PACKAGE_AMD_CATALYST
 	bool "amd-catalyst"
 	select BR2_LEGACY
@@ -1114,13 +1120,6 @@ config BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT
 	  BR2_PACKAGE_DOCKER_CLI_STATIC, following the package split of
 	  docker-engine and docker-cli.
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
-	bool "Modular X.org server was updated to version 1.20.0"
-	select BR2_LEGACY
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
-	help
-	  Modular X.org server was updated to version 1.20.0
-
 config BR2_PACKAGE_XPROTO_APPLEWMPROTO
 	bool "xproto-applewmproto package replaced by xorgproto"
 	select BR2_LEGACY
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.8/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/package/x11r7/xserver_xorg-server/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.8/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
rename to package/x11r7/xserver_xorg-server/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0003-Remove-check-for-useSIGIO-option.patch b/package/x11r7/xserver_xorg-server/0003-Remove-check-for-useSIGIO-option.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.8/0003-Remove-check-for-useSIGIO-option.patch
rename to package/x11r7/xserver_xorg-server/0003-Remove-check-for-useSIGIO-option.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0004-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xserver_xorg-server/0004-include-misc.h-fix-uClibc-build.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.8/0004-include-misc.h-fix-uClibc-build.patch
rename to package/x11r7/xserver_xorg-server/0004-include-misc.h-fix-uClibc-build.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.8/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
rename to package/x11r7/xserver_xorg-server/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch b/package/x11r7/xserver_xorg-server/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.8/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
rename to package/x11r7/xserver_xorg-server/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch
diff --git a/package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch b/package/x11r7/xserver_xorg-server/0007-fix-for-ZDI-11426.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch
rename to package/x11r7/xserver_xorg-server/0007-fix-for-ZDI-11426.patch
diff --git a/package/x11r7/xserver_xorg-server/1.14.7/0001-sdksyms-gcc5.patch b/package/x11r7/xserver_xorg-server/1.14.7/0001-sdksyms-gcc5.patch
deleted file mode 100644
index ad544aa30c..0000000000
--- a/package/x11r7/xserver_xorg-server/1.14.7/0001-sdksyms-gcc5.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 21b896939c5bb242f3aacc37baf12379e43254b6 Mon Sep 17 00:00:00 2001
-From: Egbert Eich <eich@freedesktop.org>
-Date: Tue, 3 Mar 2015 16:27:05 +0100
-Subject: symbols: Fix sdksyms.sh to cope with gcc5
-
-Gcc5 adds additional lines stating line numbers before and
-after __attribute__() which need to be skipped.
-
-Downloaded from upstream commit
-https://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/sdksyms.sh?id=21b896939c5bb242f3aacc37baf12379e43254b6
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Egbert Eich <eich@freedesktop.org>
-Tested-by: Daniel Stone <daniels@collabora.com>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-
-diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
-index 2305073..05ac410 100755
---- a/hw/xfree86/sdksyms.sh
-+++ b/hw/xfree86/sdksyms.sh
-@@ -350,13 +350,25 @@ BEGIN {
-     if (sdk) {
- 	n = 3;
- 
-+        # skip line numbers GCC 5 adds before __attribute__
-+        while ($n == "" || $0 ~ /^# [0-9]+ "/) {
-+           getline;
-+           n = 1;
-+        }
-+
- 	# skip attribute, if any
- 	while ($n ~ /^(__attribute__|__global)/ ||
- 	    # skip modifiers, if any
- 	    $n ~ /^\*?(unsigned|const|volatile|struct|_X_EXPORT)$/ ||
- 	    # skip pointer
--	    $n ~ /^[a-zA-Z0-9_]*\*$/)
-+	    $n ~ /^[a-zA-Z0-9_]*\*$/) {
- 	    n++;
-+            # skip line numbers GCC 5 adds after __attribute__
-+            while ($n == "" || $0 ~ /^# [0-9]+ "/) {
-+               getline;
-+               n = 1;
-+            }
-+        }
- 
- 	# type specifier may not be set, as in
- 	#   extern _X_EXPORT unsigned name(...)
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xserver_xorg-server/1.14.7/0002-Xi-Zero-target-buffer-in-SProcXSendExtensionEvent.patch b/package/x11r7/xserver_xorg-server/1.14.7/0002-Xi-Zero-target-buffer-in-SProcXSendExtensionEvent.patch
deleted file mode 100644
index c15dc9f50c..0000000000
--- a/package/x11r7/xserver_xorg-server/1.14.7/0002-Xi-Zero-target-buffer-in-SProcXSendExtensionEvent.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 05442de962d3dc624f79fc1a00eca3ffc5489ced Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:39 +0300
-Subject: [PATCH] Xi: Zero target buffer in SProcXSendExtensionEvent.
-
-Make sure that the xEvent eventT is initialized with zeros, the same way as
-in SProcSendEvent.
-
-Some event swapping functions do not overwrite all 32 bytes of xEvent
-structure, for example XSecurityAuthorizationRevoked. Two cooperating
-clients, one swapped and the other not, can send
-XSecurityAuthorizationRevoked event to each other to retrieve old stack data
-from X server. This can be potentialy misused to go around ASLR or
-stack-protector.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Xi/sendexev.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Xi/sendexev.c b/Xi/sendexev.c
-index 11d82029f..1cf118ab6 100644
---- a/Xi/sendexev.c
-+++ b/Xi/sendexev.c
-@@ -78,7 +78,7 @@ SProcXSendExtensionEvent(ClientPtr client)
- {
-     CARD32 *p;
-     int i;
--    xEvent eventT;
-+    xEvent eventT = { .u.u.type = 0 };
-     xEvent *eventP;
-     EventSwapPtr proc;
- 
--- 
-2.11.0
-
diff --git a/package/x11r7/xserver_xorg-server/1.14.7/0003-dix-Disallow-GenericEvent-in-SendEvent-request.patch b/package/x11r7/xserver_xorg-server/1.14.7/0003-dix-Disallow-GenericEvent-in-SendEvent-request.patch
deleted file mode 100644
index 12da5f5cba..0000000000
--- a/package/x11r7/xserver_xorg-server/1.14.7/0003-dix-Disallow-GenericEvent-in-SendEvent-request.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 215f894965df5fb0bb45b107d84524e700d2073c Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:40 +0300
-Subject: [PATCH] dix: Disallow GenericEvent in SendEvent request.
-
-The SendEvent request holds xEvent which is exactly 32 bytes long, no more,
-no less. Both ProcSendEvent and SProcSendEvent verify that the received data
-exactly match the request size. However nothing stops the client from passing
-in event with xEvent::type = GenericEvent and any value of
-xGenericEvent::length.
-
-In the case of ProcSendEvent, the event will be eventually passed to
-WriteEventsToClient which will see that it is Generic event and copy the
-arbitrary length from the receive buffer (and possibly past it) and send it to
-the other client. This allows clients to copy unitialized heap memory out of X
-server or to crash it.
-
-In case of SProcSendEvent, it will attempt to swap the incoming event by
-calling a swapping function from the EventSwapVector array. The swapped event
-is written to target buffer, which in this case is local xEvent variable. The
-xEvent variable is 32 bytes long, but the swapping functions for GenericEvents
-expect that the target buffer has size matching the size of the source
-GenericEvent. This allows clients to cause stack buffer overflows.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- dix/events.c  | 6 ++++++
- dix/swapreq.c | 7 +++++++
- 2 files changed, 13 insertions(+)
-
-diff --git a/dix/events.c b/dix/events.c
-index 3e3a01ef9..d3a33ea3f 100644
---- a/dix/events.c
-+++ b/dix/events.c
-@@ -5366,6 +5366,12 @@ ProcSendEvent(ClientPtr client)
-         client->errorValue = stuff->event.u.u.type;
-         return BadValue;
-     }
-+    /* Generic events can have variable size, but SendEvent request holds
-+       exactly 32B of event data. */
-+    if (stuff->event.u.u.type == GenericEvent) {
-+        client->errorValue = stuff->event.u.u.type;
-+        return BadValue;
-+    }
-     if (stuff->event.u.u.type == ClientMessage &&
-         stuff->event.u.u.detail != 8 &&
-         stuff->event.u.u.detail != 16 && stuff->event.u.u.detail != 32) {
-diff --git a/dix/swapreq.c b/dix/swapreq.c
-index 719e9b81c..67850593b 100644
---- a/dix/swapreq.c
-+++ b/dix/swapreq.c
-@@ -292,6 +292,13 @@ SProcSendEvent(ClientPtr client)
-     swapl(&stuff->destination);
-     swapl(&stuff->eventMask);
- 
-+    /* Generic events can have variable size, but SendEvent request holds
-+       exactly 32B of event data. */
-+    if (stuff->event.u.u.type == GenericEvent) {
-+        client->errorValue = stuff->event.u.u.type;
-+        return BadValue;
-+    }
-+
-     /* Swap event */
-     proc = EventSwapVector[stuff->event.u.u.type & 0177];
-     if (!proc || proc == NotImplemented)        /* no swapping proc; invalid event type? */
--- 
-2.11.0
-
diff --git a/package/x11r7/xserver_xorg-server/1.14.7/0004-Xi-Verify-all-events-in-ProcXSendExtensionEvent.patch b/package/x11r7/xserver_xorg-server/1.14.7/0004-Xi-Verify-all-events-in-ProcXSendExtensionEvent.patch
deleted file mode 100644
index 2e651006ba..0000000000
--- a/package/x11r7/xserver_xorg-server/1.14.7/0004-Xi-Verify-all-events-in-ProcXSendExtensionEvent.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 8caed4df36b1f802b4992edcfd282cbeeec35d9d Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:41 +0300
-Subject: [PATCH] Xi: Verify all events in ProcXSendExtensionEvent.
-
-The requirement is that events have type in range
-EXTENSION_EVENT_BASE..lastEvent, but it was tested
-only for first event of all.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Xi/sendexev.c | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/Xi/sendexev.c b/Xi/sendexev.c
-index 1cf118ab6..5e63bfcca 100644
---- a/Xi/sendexev.c
-+++ b/Xi/sendexev.c
-@@ -117,7 +117,7 @@ SProcXSendExtensionEvent(ClientPtr client)
- int
- ProcXSendExtensionEvent(ClientPtr client)
- {
--    int ret;
-+    int ret, i;
-     DeviceIntPtr dev;
-     xEvent *first;
-     XEventClass *list;
-@@ -141,10 +141,12 @@ ProcXSendExtensionEvent(ClientPtr client)
-     /* The client's event type must be one defined by an extension. */
- 
-     first = ((xEvent *) &stuff[1]);
--    if (!((EXTENSION_EVENT_BASE <= first->u.u.type) &&
--          (first->u.u.type < lastEvent))) {
--        client->errorValue = first->u.u.type;
--        return BadValue;
-+    for (i = 0; i < stuff->num_events; i++) {
-+        if (!((EXTENSION_EVENT_BASE <= first[i].u.u.type) &&
-+            (first[i].u.u.type < lastEvent))) {
-+            client->errorValue = first[i].u.u.type;
-+            return BadValue;
-+        }
-     }
- 
-     list = (XEventClass *) (first + stuff->num_events);
--- 
-2.11.0
-
diff --git a/package/x11r7/xserver_xorg-server/1.14.7/0005-Xi-Do-not-try-to-swap-GenericEvent.patch b/package/x11r7/xserver_xorg-server/1.14.7/0005-Xi-Do-not-try-to-swap-GenericEvent.patch
deleted file mode 100644
index 871e7621ed..0000000000
--- a/package/x11r7/xserver_xorg-server/1.14.7/0005-Xi-Do-not-try-to-swap-GenericEvent.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ba336b24052122b136486961c82deac76bbde455 Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:42 +0300
-Subject: [PATCH] Xi: Do not try to swap GenericEvent.
-
-The SProcXSendExtensionEvent must not attempt to swap GenericEvent because
-it is assuming that the event has fixed size and gives the swapping function
-xEvent-sized buffer.
-
-A GenericEvent would be later rejected by ProcXSendExtensionEvent anyway.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Xi/sendexev.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Xi/sendexev.c b/Xi/sendexev.c
-index 5e63bfcca..5c2e0fc56 100644
---- a/Xi/sendexev.c
-+++ b/Xi/sendexev.c
-@@ -95,9 +95,17 @@ SProcXSendExtensionEvent(ClientPtr client)
- 
-     eventP = (xEvent *) &stuff[1];
-     for (i = 0; i < stuff->num_events; i++, eventP++) {
-+        if (eventP->u.u.type == GenericEvent) {
-+            client->errorValue = eventP->u.u.type;
-+            return BadValue;
-+        }
-+
-         proc = EventSwapVector[eventP->u.u.type & 0177];
--        if (proc == NotImplemented)     /* no swapping proc; invalid event type? */
-+        /* no swapping proc; invalid event type? */
-+        if (proc == NotImplemented) {
-+            client->errorValue = eventP->u.u.type;
-             return BadValue;
-+        }
-         (*proc) (eventP, &eventT);
-         *eventP = eventT;
-     }
--- 
-2.11.0
-
diff --git a/package/x11r7/xserver_xorg-server/1.17.4/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.17.4/0001-modesettings-needs-dri2.patch
deleted file mode 100644
index 4ef95efc3e..0000000000
--- a/package/x11r7/xserver_xorg-server/1.17.4/0001-modesettings-needs-dri2.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Kernel modesettings support also depends on dri2, see
-http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/drivers/modesetting/Makefile.am#n46
-
-Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=91584
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr xorg-server-1.17.2.org/configure.ac xorg-server-1.17.2/configure.ac
---- xorg-server-1.17.2.org/configure.ac	2015-06-16 17:42:40.000000000 +0200
-+++ xorg-server-1.17.2/configure.ac	2015-08-08 10:44:59.702382624 +0200
-@@ -2036,7 +2036,7 @@
- 	        XORG_SYS_LIBS="$XORG_SYS_LIBS $XORG_MODULES_LIBS"
- 	fi
- 
--	if test "x$DRM" = xyes; then
-+	if test "x$DRM" = xyes -a "x$DRI2" = xyes; then
- 		dnl 2.4.46 is required for cursor hotspot support.
- 		PKG_CHECK_EXISTS(libdrm >= 2.4.46)
- 		XORG_DRIVER_MODESETTING=yes
diff --git a/package/x11r7/xserver_xorg-server/1.17.4/0002-Xi-Zero-target-buffer-in-SProcXSendExtensionEvent.patch b/package/x11r7/xserver_xorg-server/1.17.4/0002-Xi-Zero-target-buffer-in-SProcXSendExtensionEvent.patch
deleted file mode 100644
index c15dc9f50c..0000000000
--- a/package/x11r7/xserver_xorg-server/1.17.4/0002-Xi-Zero-target-buffer-in-SProcXSendExtensionEvent.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 05442de962d3dc624f79fc1a00eca3ffc5489ced Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:39 +0300
-Subject: [PATCH] Xi: Zero target buffer in SProcXSendExtensionEvent.
-
-Make sure that the xEvent eventT is initialized with zeros, the same way as
-in SProcSendEvent.
-
-Some event swapping functions do not overwrite all 32 bytes of xEvent
-structure, for example XSecurityAuthorizationRevoked. Two cooperating
-clients, one swapped and the other not, can send
-XSecurityAuthorizationRevoked event to each other to retrieve old stack data
-from X server. This can be potentialy misused to go around ASLR or
-stack-protector.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Xi/sendexev.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Xi/sendexev.c b/Xi/sendexev.c
-index 11d82029f..1cf118ab6 100644
---- a/Xi/sendexev.c
-+++ b/Xi/sendexev.c
-@@ -78,7 +78,7 @@ SProcXSendExtensionEvent(ClientPtr client)
- {
-     CARD32 *p;
-     int i;
--    xEvent eventT;
-+    xEvent eventT = { .u.u.type = 0 };
-     xEvent *eventP;
-     EventSwapPtr proc;
- 
--- 
-2.11.0
-
diff --git a/package/x11r7/xserver_xorg-server/1.17.4/0003-dix-Disallow-GenericEvent-in-SendEvent-request.patch b/package/x11r7/xserver_xorg-server/1.17.4/0003-dix-Disallow-GenericEvent-in-SendEvent-request.patch
deleted file mode 100644
index 12da5f5cba..0000000000
--- a/package/x11r7/xserver_xorg-server/1.17.4/0003-dix-Disallow-GenericEvent-in-SendEvent-request.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 215f894965df5fb0bb45b107d84524e700d2073c Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:40 +0300
-Subject: [PATCH] dix: Disallow GenericEvent in SendEvent request.
-
-The SendEvent request holds xEvent which is exactly 32 bytes long, no more,
-no less. Both ProcSendEvent and SProcSendEvent verify that the received data
-exactly match the request size. However nothing stops the client from passing
-in event with xEvent::type = GenericEvent and any value of
-xGenericEvent::length.
-
-In the case of ProcSendEvent, the event will be eventually passed to
-WriteEventsToClient which will see that it is Generic event and copy the
-arbitrary length from the receive buffer (and possibly past it) and send it to
-the other client. This allows clients to copy unitialized heap memory out of X
-server or to crash it.
-
-In case of SProcSendEvent, it will attempt to swap the incoming event by
-calling a swapping function from the EventSwapVector array. The swapped event
-is written to target buffer, which in this case is local xEvent variable. The
-xEvent variable is 32 bytes long, but the swapping functions for GenericEvents
-expect that the target buffer has size matching the size of the source
-GenericEvent. This allows clients to cause stack buffer overflows.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- dix/events.c  | 6 ++++++
- dix/swapreq.c | 7 +++++++
- 2 files changed, 13 insertions(+)
-
-diff --git a/dix/events.c b/dix/events.c
-index 3e3a01ef9..d3a33ea3f 100644
---- a/dix/events.c
-+++ b/dix/events.c
-@@ -5366,6 +5366,12 @@ ProcSendEvent(ClientPtr client)
-         client->errorValue = stuff->event.u.u.type;
-         return BadValue;
-     }
-+    /* Generic events can have variable size, but SendEvent request holds
-+       exactly 32B of event data. */
-+    if (stuff->event.u.u.type == GenericEvent) {
-+        client->errorValue = stuff->event.u.u.type;
-+        return BadValue;
-+    }
-     if (stuff->event.u.u.type == ClientMessage &&
-         stuff->event.u.u.detail != 8 &&
-         stuff->event.u.u.detail != 16 && stuff->event.u.u.detail != 32) {
-diff --git a/dix/swapreq.c b/dix/swapreq.c
-index 719e9b81c..67850593b 100644
---- a/dix/swapreq.c
-+++ b/dix/swapreq.c
-@@ -292,6 +292,13 @@ SProcSendEvent(ClientPtr client)
-     swapl(&stuff->destination);
-     swapl(&stuff->eventMask);
- 
-+    /* Generic events can have variable size, but SendEvent request holds
-+       exactly 32B of event data. */
-+    if (stuff->event.u.u.type == GenericEvent) {
-+        client->errorValue = stuff->event.u.u.type;
-+        return BadValue;
-+    }
-+
-     /* Swap event */
-     proc = EventSwapVector[stuff->event.u.u.type & 0177];
-     if (!proc || proc == NotImplemented)        /* no swapping proc; invalid event type? */
--- 
-2.11.0
-
diff --git a/package/x11r7/xserver_xorg-server/1.17.4/0004-Xi-Verify-all-events-in-ProcXSendExtensionEvent.patch b/package/x11r7/xserver_xorg-server/1.17.4/0004-Xi-Verify-all-events-in-ProcXSendExtensionEvent.patch
deleted file mode 100644
index 2e651006ba..0000000000
--- a/package/x11r7/xserver_xorg-server/1.17.4/0004-Xi-Verify-all-events-in-ProcXSendExtensionEvent.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 8caed4df36b1f802b4992edcfd282cbeeec35d9d Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:41 +0300
-Subject: [PATCH] Xi: Verify all events in ProcXSendExtensionEvent.
-
-The requirement is that events have type in range
-EXTENSION_EVENT_BASE..lastEvent, but it was tested
-only for first event of all.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Xi/sendexev.c | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/Xi/sendexev.c b/Xi/sendexev.c
-index 1cf118ab6..5e63bfcca 100644
---- a/Xi/sendexev.c
-+++ b/Xi/sendexev.c
-@@ -117,7 +117,7 @@ SProcXSendExtensionEvent(ClientPtr client)
- int
- ProcXSendExtensionEvent(ClientPtr client)
- {
--    int ret;
-+    int ret, i;
-     DeviceIntPtr dev;
-     xEvent *first;
-     XEventClass *list;
-@@ -141,10 +141,12 @@ ProcXSendExtensionEvent(ClientPtr client)
-     /* The client's event type must be one defined by an extension. */
- 
-     first = ((xEvent *) &stuff[1]);
--    if (!((EXTENSION_EVENT_BASE <= first->u.u.type) &&
--          (first->u.u.type < lastEvent))) {
--        client->errorValue = first->u.u.type;
--        return BadValue;
-+    for (i = 0; i < stuff->num_events; i++) {
-+        if (!((EXTENSION_EVENT_BASE <= first[i].u.u.type) &&
-+            (first[i].u.u.type < lastEvent))) {
-+            client->errorValue = first[i].u.u.type;
-+            return BadValue;
-+        }
-     }
- 
-     list = (XEventClass *) (first + stuff->num_events);
--- 
-2.11.0
-
diff --git a/package/x11r7/xserver_xorg-server/1.17.4/0005-Xi-Do-not-try-to-swap-GenericEvent.patch b/package/x11r7/xserver_xorg-server/1.17.4/0005-Xi-Do-not-try-to-swap-GenericEvent.patch
deleted file mode 100644
index 871e7621ed..0000000000
--- a/package/x11r7/xserver_xorg-server/1.17.4/0005-Xi-Do-not-try-to-swap-GenericEvent.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ba336b24052122b136486961c82deac76bbde455 Mon Sep 17 00:00:00 2001
-From: Michal Srb <msrb@suse.com>
-Date: Wed, 24 May 2017 15:54:42 +0300
-Subject: [PATCH] Xi: Do not try to swap GenericEvent.
-
-The SProcXSendExtensionEvent must not attempt to swap GenericEvent because
-it is assuming that the event has fixed size and gives the swapping function
-xEvent-sized buffer.
-
-A GenericEvent would be later rejected by ProcXSendExtensionEvent anyway.
-
-Signed-off-by: Michal Srb <msrb@suse.com>
-Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Xi/sendexev.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Xi/sendexev.c b/Xi/sendexev.c
-index 5e63bfcca..5c2e0fc56 100644
---- a/Xi/sendexev.c
-+++ b/Xi/sendexev.c
-@@ -95,9 +95,17 @@ SProcXSendExtensionEvent(ClientPtr client)
- 
-     eventP = (xEvent *) &stuff[1];
-     for (i = 0; i < stuff->num_events; i++, eventP++) {
-+        if (eventP->u.u.type == GenericEvent) {
-+            client->errorValue = eventP->u.u.type;
-+            return BadValue;
-+        }
-+
-         proc = EventSwapVector[eventP->u.u.type & 0177];
--        if (proc == NotImplemented)     /* no swapping proc; invalid event type? */
-+        /* no swapping proc; invalid event type? */
-+        if (proc == NotImplemented) {
-+            client->errorValue = eventP->u.u.type;
-             return BadValue;
-+        }
-         (*proc) (eventP, &eventT);
-         *eventP = eventT;
-     }
--- 
-2.11.0
-
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 79968ea979..e3056683cc 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -40,49 +40,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 
 	  http://xorg.freedesktop.org
 
-if BR2_PACKAGE_XSERVER_XORG_SERVER
-
-config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
-	bool
-
-config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
-	bool
-
-config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
-	bool
-
-config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI
-	int
-	default 14 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
-	default 19 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
-	default 24 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
-
-choice
-	bool "X Window System server version"
-
-config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
-	bool "1.20.8"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_24
-	select BR2_PACKAGE_XLIB_LIBXFONT2
-
-config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
-	bool "1.17.4"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
-	select BR2_PACKAGE_XLIB_LIBXFONT
-
-config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
-	bool "1.14.7"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
-	select BR2_PACKAGE_XLIB_LIBXFONT
-
-endchoice
-
-config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
-	string
-	default "1.20.8" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20
-	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
-	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
-
 choice
 	prompt "X Window System server type"
 	help
@@ -114,13 +71,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 
 endchoice
 
-config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
-	bool "Enable AIGLX Extension"
-	# AIGLX Extension removed in 1.19.0
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14 || BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
-	help
-	  Enable/Use AIGLX extension.
-
 if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index f7b1bc14bf..7d75853c62 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,8 +1,3 @@
-# From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
-sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
-sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
-# From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
-sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
 # From https://lists.x.org/archives/xorg-announce/2020-March/003041.html
 sha256 d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146  xorg-server-1.20.8.tar.bz2
 sha512 ab0ec0fcbf490c61558b9297f61b58fd2dedb676c78bef6431dc9166054743b43a0091b88a8b3f4e81d1f539909440ee7e188a298cefabe13ea89159639cd805  xorg-server-1.20.8.tar.bz2
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 07714be340..7c8119e371 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = $(call qstrip,$(BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION))
+XSERVER_XORG_SERVER_VERSION = 1.20.9
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
@@ -38,10 +38,8 @@ XSERVER_XORG_SERVER_DEPENDENCIES = \
 	mcookie \
 	host-pkgconf
 
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_20),y)
 # 1.20.8/0007-fix-for-ZDI-11426.patch
 XSERVER_XORG_SERVER_IGNORE_CVES += CVE-2020-14347
-endif
 
 # We force -O2 regardless of the optimization level chosen by the
 # user, as the X.org server is known to trigger some compiler bugs at
@@ -132,12 +130,6 @@ else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
 
-ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-aiglx
-else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-aiglx
-endif
-
 # Optional packages
 ifeq ($(BR2_PACKAGE_TSLIB),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += tslib
