From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 Oct 2013 23:44:23 +0200
Subject: [Buildroot] [PATCH 7/9] package/rpi-userland: add patch to remove
	faulty assert()
In-Reply-To: <cover.1381354867.git.yann.morin.1998@free.fr>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
Message-ID: <b678145f0445d0d08b358732762e769ed8771d40.1381354867.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

While porting wayland/weston to run on the RPi, I always tripped on
this assert.

Thinking there was an issue with weston, I poked the weston guys on
IRC about the issue. 'daniels' on irc.freenode.net/#wayland suggested
removing the assert altogether, as that's what they had pushed
upstream in their wayland pull-request:
    https://github.com/raspberrypi/userland/pull/92

Turns out they forgot to include this in their pull-request, but that
they were using a patched rpi-userland without that assert.

And indeed, without that assert, weston runs on the RPi. :-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
The weston guys will probably push this upstream soon.
If not, then I'll take the burden to do it.
---
 .../rpi-userland-002-remove-faulty-assert.patch     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch

diff --git a/package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch b/package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch
new file mode 100644
index 0000000..c23c43a
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-002-remove-faulty-assert.patch
@@ -0,0 +1,21 @@
+interface: remove faulty assert() to make weston happy at runtime
+
+This was removed after a discussion on IRC with the weston guys
+('daniels' on irc.freenode.net/#wayland).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Upstream status: no, will be pushed by weston guys later.
+If not, I'll do it.
+
+diff -durN rpi-userland-77d32cd.orig/interface/vmcs_host/vc_vchi_dispmanx.c rpi-userland-77d32cd/interface/vmcs_host/vc_vchi_dispmanx.c
+--- rpi-userland-77d32cd.orig/interface/vmcs_host/vc_vchi_dispmanx.c	2013-10-04 17:43:44.000000000 +0200
++++ rpi-userland-77d32cd/interface/vmcs_host/vc_vchi_dispmanx.c	2013-10-08 22:28:51.611433539 +0200
+@@ -1187,7 +1187,6 @@
+          continue;
+    
+       if(dispmanx_client.update_callback ) {
+-         vcos_assert( dispmanx_client.pending_update_handle == (DISPMANX_UPDATE_HANDLE_T) dispmanx_client.notify_buffer[1]);
+          dispmanx_client.update_callback((DISPMANX_UPDATE_HANDLE_T) dispmanx_client.notify_buffer[1], dispmanx_client.update_callback_param);
+       }
+    }
-- 
1.8.1.2
