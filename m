From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 21:18:12 +0200
Subject: [Buildroot] [git commit] xorg-xserver: always enable forced outputs
Message-ID: <20120730191828.0683E81EC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8b98bd1b055395922860ad3f4e69ac48ece97d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the user has gone to the effort of manually enabling an output in
the configuration file assume that they know what they're doing.

X.org Bug 14611 <http://bugs.freedesktop.org/show_bug.cgi?id=14611>

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rg-server-03-always-enable-forced-outputs.patch |   30 ++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-always-enable-forced-outputs.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-always-enable-forced-outputs.patch
new file mode 100644
index 0000000..bf27977
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-always-enable-forced-outputs.patch
@@ -0,0 +1,30 @@
+From 93ff1bc5884cdfca1132af7fbc06c48e06f218c8 Mon Sep 17 00:00:00 2001
+From: Simon Farnsworth <simon.farnsworth@onelan.co.uk>
+Date: Mon, 15 Feb 2010 12:18:00 +0000
+Subject: Always enable outputs that have been forced on in the configuration file
+
+If the user has gone to the effort of manually enabling an output in
+the configuration file assume that they know what they're doing.
+
+X.org Bug 14611 <http://bugs.freedesktop.org/show_bug.cgi?id=14611>
+
+Signed-off-by: Simon Farnsworth <simon.farnsworth@onelan.co.uk>
+Reviewed-by: Alex Deucher <alexdeucher@gmail.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+---
+diff --git a/hw/xfree86/modes/xf86Crtc.c b/hw/xfree86/modes/xf86Crtc.c
+index 573fe96..9b1ff28 100644
+--- a/hw/xfree86/modes/xf86Crtc.c
++++ b/hw/xfree86/modes/xf86Crtc.c
+@@ -1573,7 +1573,8 @@ xf86ProbeOutputModes (ScrnInfoPtr scrn, int maxX, int maxY)
+ 	 */
+ 	output->status = (*output->funcs->detect)(output);
+ 
+-	if (output->status == XF86OutputStatusDisconnected)
++	if (output->status == XF86OutputStatusDisconnected &&
++		!xf86ReturnOptValBool(output->options, OPTION_ENABLE, FALSE))
+ 	{
+ 	    xf86OutputSetEDID (output, NULL);
+ 	    continue;
+--
+cgit v0.9.0.2-2-gbebe
