From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Dec 2017 21:51:35 +0200
Subject: [Buildroot] [PATCH 2/2] dhcp: add upstream security fix
In-Reply-To: <b408b98eeb4a9479b974d3d98e84b5d1f279c5b2.1513108295.git.baruch@tkos.co.il>
References: <b408b98eeb4a9479b974d3d98e84b5d1f279c5b2.1513108295.git.baruch@tkos.co.il>
Message-ID: <1297d1b88cdabb9705f05b5d05a9615b690ee3de.1513108295.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes socket leak that might cause denial of serivce.

https://bugzilla.redhat.com/show_bug.cgi?id=1523547

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...3-Plugs-a-socket-descriptor-leak-in-OMAPI.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/dhcp/0002-v4_3-Plugs-a-socket-descriptor-leak-in-OMAPI.patch

diff --git a/package/dhcp/0002-v4_3-Plugs-a-socket-descriptor-leak-in-OMAPI.patch b/package/dhcp/0002-v4_3-Plugs-a-socket-descriptor-leak-in-OMAPI.patch
new file mode 100644
index 000000000000..df294651fb81
--- /dev/null
+++ b/package/dhcp/0002-v4_3-Plugs-a-socket-descriptor-leak-in-OMAPI.patch
@@ -0,0 +1,51 @@
+From 5097bc0559f592683faac1f67bf350e1bddf6ed4 Mon Sep 17 00:00:00 2001
+From: Thomas Markwalder <tmark@isc.org>
+Date: Thu, 7 Dec 2017 11:39:30 -0500
+Subject: [PATCH] [v4_3] Plugs a socket descriptor leak in OMAPI
+
+        Merges in rt46767.
+
+[baruch: drop RELNOTES hunk]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 5097bc0559f
+
+ omapip/buffer.c  | 9 +++++++++
+ omapip/message.c | 2 +-
+
+diff --git a/omapip/buffer.c b/omapip/buffer.c
+index f7fdc3250e82..809034d1317b 100644
+--- a/omapip/buffer.c
++++ b/omapip/buffer.c
+@@ -566,6 +566,15 @@ isc_result_t omapi_connection_writer (omapi_object_t *h)
+ 			omapi_buffer_dereference (&buffer, MDL);
+ 		}
+ 	}
++
++	/* If we had data left to write when we're told to disconnect,
++	* we need recall disconnect, now that we're done writing.
++	* See rt46767. */
++	if (c->out_bytes == 0 && c->state == omapi_connection_disconnecting) {
++		omapi_disconnect (h, 1);
++		return ISC_R_SHUTTINGDOWN;
++	}
++
+ 	return ISC_R_SUCCESS;
+ }
+ 
+diff --git a/omapip/message.c b/omapip/message.c
+index 59ccdc2c05cf..21bcfc3822e7 100644
+--- a/omapip/message.c
++++ b/omapip/message.c
+@@ -339,7 +339,7 @@ isc_result_t omapi_message_unregister (omapi_object_t *mo)
+ }
+ 
+ #ifdef DEBUG_PROTOCOL
+-static const char *omapi_message_op_name(int op) {
++const char *omapi_message_op_name(int op) {
+ 	switch (op) {
+ 	case OMAPI_OP_OPEN:    return "OMAPI_OP_OPEN";
+ 	case OMAPI_OP_REFRESH: return "OMAPI_OP_REFRESH";
+-- 
+2.15.1
+
-- 
2.15.1
