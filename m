From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Nov 2014 22:03:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xserver_xorg-server: Fix
	blackfin build
In-Reply-To: <1417296232-29343-2-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 29 Nov 2014 22:23:52 +0100")
References: <1417296232-29343-1-git-send-email-bernd.kuhls@t-online.de>
 <1417296232-29343-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <877fycjt8n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/497/4970352598a68d7af89acbb33cdf69d656e23f4d/
 > http://autobuild.buildroot.net/results/497/4970352598a68d7af89acbb33cdf69d656e23f4d/
 > http://autobuild.buildroot.net/results/497/4970352598a68d7af89acbb33cdf69d656e23f4d/

These are all the same URL?

 > Upstream bug report was updated:
 > https://bugs.freedesktop.org/show_bug.cgi?id=83582

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/x11r7/xserver_xorg-server/0003-image-byte-order.patch |    4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/x11r7/xserver_xorg-server/0003-image-byte-order.patch b/package/x11r7/xserver_xorg-server/0003-image-byte-order.patch
 > index b99b669..59e8177 100644
 > --- a/package/x11r7/xserver_xorg-server/0003-image-byte-order.patch
 > +++ b/package/x11r7/xserver_xorg-server/0003-image-byte-order.patch
 > @@ -1,4 +1,4 @@
 > -xserver_xorg-server: Fix compile error for microblaze
 > +xserver_xorg-server: Fix compile error for microblaze/blackfin
 
 >  Fixes
 >  mipushpxl.c: In function 'miPushPixels':
 > @@ -16,7 +16,7 @@ diff -uNr xorg-server-1.16.0.glyph/include/servermd.h xorg-server-1.16.0/include
  
 >   #endif                          /* mips */
  
 > -+#if defined(__microblaze__) || defined(microblaze)
 > ++#if defined(__microblaze__) || defined(microblaze) || defined(BFIN)

But xserver_xorg-server depends on !BR2_USE_MMU since 7c00cd:

    xorg-server: needs mmu
    
    os/utils.c::System() unconditionally uses fork(), so it only builds on
    configurations with mmu.
    
    (Indirectly) fixes:
    http://autobuild.buildroot.net/results/497/4970352598a68d7af89acbb33cdf69d656e23f4d/
    http://autobuild.buildroot.net/results/d27/d279dc35bff53b7f939af02bee70b1ed3014e49b/
    http://autobuild.buildroot.net/results/84b/84b8f19221a5c841de3016959c99b92c96c57e81/
    
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Which even lists the same autobuilder issue you listed about. So what is
the point?

-- 
Bye, Peter Korsgaard
