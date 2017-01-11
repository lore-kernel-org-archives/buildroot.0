From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 12 Jan 2017 00:03:14 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: fix xserver
	freeze with DRI2
Message-ID: <20170111230314.21743-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix bug https://bugs.freedesktop.org/show_bug.cgi?id=99333.
Tested using Enlightenment and Lugaru game on x86_64 target using DRI2.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
This is the same config I used when I noticed the bug.
---
 ...t-of-grab-pervious-client-must-queue-to-s.patch | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/1.19.0/0002-AttendClient-of-grab-pervious-client-must-queue-to-s.patch

diff --git a/package/x11r7/xserver_xorg-server/1.19.0/0002-AttendClient-of-grab-pervious-client-must-queue-to-s.patch b/package/x11r7/xserver_xorg-server/1.19.0/0002-AttendClient-of-grab-pervious-client-must-queue-to-s.patch
new file mode 100644
index 0000000..fd83b3b
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/1.19.0/0002-AttendClient-of-grab-pervious-client-must-queue-to-s.patch
@@ -0,0 +1,85 @@
+From 192b3411d685a103ade0080e20a3331535587241 Mon Sep 17 00:00:00 2001
+From: Keith Packard <keithp@keithp.com>
+Date: Mon, 9 Jan 2017 18:10:21 -0800
+Subject: [PATCH] AttendClient of grab-pervious client must queue to
+ saved_ready_clients [v2]
+
+A client which is attended while a grab is blocking execution of its
+requests needs to be placed in the saved_ready_clients list so that it
+will get scheduled once the grab terminates. Otherwise, if the client
+never sends another request, there is no way for it to be placed in
+the ready_clients list.
+
+v2: Wrap comment above mark_client_saved_ready.
+    Remove test for OS_COMM_IGNORED which will always be true.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=99333
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+
+Patch status: upstream
+
+[Romain: backport to 1.19.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ dix/dispatch.c      | 10 ++++++++++
+ include/dixstruct.h |  6 ++++++
+ os/connection.c     |  4 ++++
+ 3 files changed, 20 insertions(+)
+
+diff --git a/dix/dispatch.c b/dix/dispatch.c
+index 3d0fe26..78ac095 100644
+--- a/dix/dispatch.c
++++ b/dix/dispatch.c
+@@ -266,6 +266,16 @@ mark_client_ready(ClientPtr client)
+         xorg_list_append(&client->ready, &ready_clients);
+ }
+ 
++/*
++ * Client has requests queued or data on the network, but awaits a
++ * server grab release
++ */
++void mark_client_saved_ready(ClientPtr client)
++{
++    if (xorg_list_is_empty(&client->ready))
++        xorg_list_append(&client->ready, &saved_ready_clients);
++}
++
+ /* Client has no requests queued and no data on network */
+ void
+ mark_client_not_ready(ClientPtr client)
+diff --git a/include/dixstruct.h b/include/dixstruct.h
+index d71b0ac..21a6b8a 100644
+--- a/include/dixstruct.h
++++ b/include/dixstruct.h
+@@ -143,6 +143,12 @@ extern void SmartScheduleStopTimer(void);
+ /* Client has requests queued or data on the network */
+ void mark_client_ready(ClientPtr client);
+ 
++/*
++ * Client has requests queued or data on the network, but awaits a
++ * server grab release
++ */
++void mark_client_saved_ready(ClientPtr client);
++
+ /* Client has no requests queued and no data on network */
+ void mark_client_not_ready(ClientPtr client);
+ 
+diff --git a/os/connection.c b/os/connection.c
+index a901ebf..62e2980 100644
+--- a/os/connection.c
++++ b/os/connection.c
+@@ -1067,6 +1067,10 @@ AttendClient(ClientPtr client)
+     set_poll_client(client);
+     if (listen_to_client(client))
+         mark_client_ready(client);
++    else {
++        /* grab active, mark ready when grab goes away */
++        mark_client_saved_ready(client);
++    }
+ }
+ 
+ /* make client impervious to grabs; assume only executing client calls this */
+-- 
+2.9.3
+
-- 
2.9.3
