From: Ben Widawsky <ben@bwidawsk.net>
Date: Wed, 23 Jul 2014 15:36:27 -0700
Subject: [Buildroot] [PATCH] sna/dri2: Protect compsiteext.h include
 with build check
In-Reply-To: <20140723234458.7399f7b6@free-electrons.com>
References: <1405661249-6506-1-git-send-email-ben@bwidawsk.net>
 <1405665634-3299-1-git-send-email-chris@chris-wilson.co.uk>
 <20140718232336.GA5940@bwidawsk.net>
 <20140723234458.7399f7b6@free-electrons.com>
Message-ID: <20140723223626.GA759@bwidawsk.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 23, 2014 at 11:44:58PM +0200, Thomas Petazzoni wrote:
> Dear Ben Widawsky,
> 
> On Fri, 18 Jul 2014 16:23:37 -0700, Ben Widawsky wrote:
> > On Fri, Jul 18, 2014 at 07:40:34AM +0100, Chris Wilson wrote:
> > > We shouldn't include calls to the composite extension if it has not been
> > > built.
> > > 
> > > Reported-by: Ben Widawsky <ben@bwidawsk.net>
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > 
> > This patch does not apply cleanly to .912. The wiggled patch does build.
> > With my earlier patch reverted.
> > 
> > If this patch will be in .913, and .913 is coming relatively soon, we
> > can ignore this entirely for buildroot and simply do a version bump to
> > .913 when its available.
> 
> I'm sorry, but I don't understand your comment. Your patch was against
> Buildroot, but you say it doesn't apply against .912, which is a
> version of the intel driver. Could you explain a bit more if your
> patches http://patchwork.ozlabs.org/patch/371342/ and
> http://patchwork.ozlabs.org/patch/371343/ are still applicable?
> 
> Thanks,
> 
> Thomas

Hi. The second patch, .912 bump has been nak'd already by Bernd (I
missed this before my ping). Coincidentally, Bernd also fixed the
composite extension compilation error in buildroot (differently than I
did). Chris Wilson, the Intel DDX maintainer has fixed the issue
meanwhile.

I would recommend backporting the xf86-video-intel patch instead of the
patch Bernd submitted. Wiggle handled all the conflicts. I am not sure
if it will apply to .907 (the current version). The other option is to
take Bernd's patch, and revert it when you finally get to the fixed
upstream version.

In the most ideal case, we could just bump to the recently released .913 and
have everything /just/ work. Chris has fixed 2 bugs that Bernd's series also
attempted to fix. Of course that runs the risk of invoking the wrath that
caused the original .912 revert.

That all came out more complicated than it should have. I apologize. I am
pasting the patch I wiggled as an example. Hopefully that helps make sense.

---


commit 6cf66fc273e6d6348f605e7dcce915e53198e23b
Author: Ben Widawsky <ben@bwidawsk.net>
Date:   Fri Jul 18 16:24:07 2014 -0700

    xdriver_xf86-video-intel: Take the upstream composite patch
    
    "
    We shouldn't include calls to the composite extension if it has not been
    built.
    
    Reported-by: Ben Widawsky <ben@bwidawsk.net>
    Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
    "
    
    Signed-off-by: Ben Widawsky <ben@bwidawsk.net>

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-0001-sna-dri2-Protect-compsiteext.h-include-with-build-ch.patch b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-0001-sna-dri2-Protect-compsiteext.h-include-with-build-ch.patch
new file mode 100644
index 0000000..a82c482
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-0001-sna-dri2-Protect-compsiteext.h-include-with-build-ch.patch
@@ -0,0 +1,50 @@
+From f17f0808ab3de6f65a3eedf5548e7b314b7a182f Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Fri, 18 Jul 2014 07:40:34 +0100
+Subject: [PATCH] sna/dri2: Protect compsiteext.h include with build check
+
+We shouldn't include calls to the composite extension if it has not been
+built.
+
+Reported-by: Ben Widawsky <ben@bwidawsk.net>
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+---
+ src/sna/sna_dri2.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/sna/sna_dri2.c b/src/sna/sna_dri2.c
+index 1baaf2b..1edf98e 100644
+--- a/src/sna/sna_dri2.c
++++ b/src/sna/sna_dri2.c
+@@ -48,8 +48,9 @@ USE OR OTHER DEALINGS IN THE SOFTWARE.
+ #include <xf86drm.h>
+ #include <i915_drm.h>
+ #include <dri2.h>
+-#if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,12,99,901,0)
++#if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,12,99,901,0) && defined(COMPOSITE)
+ #include <compositeext.h>
++#define CHECK_FOR_COMPOSITOR
+ #endif
+ 
+ #if DRI2INFOREC_VERSION < 2
+@@ -2164,7 +2165,7 @@ get_current_msc(struct sna *sna, DrawablePtr draw, xf86CrtcPtr crtc)
+       return draw_current_msc(draw, crtc, ret);
+ }
+ 
+-#if !XORG_CAN_TRIPLE_BUFFER && XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,12,99,901,0)
++#if !XORG_CAN_TRIPLE_BUFFER && defined(CHECK_FOR_COMPOSITOR)
+ static Bool find(pointer value, XID id, pointer cdata)
+ {
+       return TRUE;
+@@ -2187,7 +2188,7 @@ static int use_triple_buffer(struct sna *sna, ClientPtr client, bool async)
+ #if XORG_CAN_TRIPLE_BUFFER
+       DBG(("%s: triple buffer enabled, using FLIP_THROTTLE\n", __FUNCTION__));
+       return FLIP_THROTTLE;
+-#elif XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,12,99,901,0)
++#elif defined(CHECK_FOR_COMPOSITOR)
+       /* Hack: Disable triple buffering for compositors */
+       {
+               struct sna_client *priv = sna_client(client);
+-- 
+2.0.2
+
