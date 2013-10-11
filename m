From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Oct 2013 08:56:17 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: add patch to remove
	faulty assert()
Message-ID: <20131011082158.DE33C9B9C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a863451c395b60912c9007fc36e74b0751bc0b8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../rpi-userland-002-remove-faulty-assert.patch    |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

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
