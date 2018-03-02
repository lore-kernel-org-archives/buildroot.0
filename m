From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Fri, 2 Mar 2018 11:16:24 -0500
Subject: [Buildroot] [PATCH v2 1/1] qt5webkit: fix build issue with
 32-bits armv8-a
In-Reply-To: <20180302142301.513bb769@windsurf.lan>
References: <20180302115853.4181-1-gael.portay@savoirfairelinux.com>
 <20180302142301.513bb769@windsurf.lan>
Message-ID: <20180302161624.bc5u3pib3pfqdc77@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Mar 02, 2018 at 02:23:01PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri,  2 Mar 2018 06:58:53 -0500, Ga?l PORTAY wrote:
> > Adds WTF platform support for the 32-bits armv8-a architectures.
> > 
> > Fixes:
> > 
> > 	In file included from ./config.h:30:0,
> > 	                 from ...
> > 	./wtf/Platform.h:323:6: error: #error "Not supported ARM
> > architecture"
> > 	 #    error "Not supported ARM architecture"
> > 	      ^~~~~
> > 
> > The patch is an adaptation of an upstream fix in version 5.212 of
> > qtwebkit[1].
> > 
> > Unfortunately, the commit cannot be backported and has to be fixed since
> > the toolchain does not define __ARM_ARCH_8__ but __ARM_ARCH_8A__.
> 
> Do you know why we have this difference between __ARM_ARCH_8__ and
> __ARM_ARCH_8A__ ?
> 

Honestly I don't.

I think that the __ARM_ARCH_8__ is never defined and probably does not
exist (at least with gcc). But I may be wrong.

I tried to all the armv8 -mcpu option with gcc and I never had
__ARM_ARCH_8__ defined.

> 
> > diff --git a/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch b/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
> > new file mode 100644
> > index 0000000000..1cb655c078
> > --- /dev/null
> > +++ b/package/qt5/qt5webkit/5.6.3/0005-Detect-32-bits-armv8-a-architecture.patch
> > @@ -0,0 +1,48 @@
> > +From 068bf2d2d91382ea0d8ec24a142a30ea429704db Mon Sep 17 00:00:00 2001
> > +From: =?utf-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
> > +Date: Tue, 15 Aug 2017 18:28:49 -0400
> > +Subject: [PATCH 1/1] Detect 32-bits armv8-a architecture
> 
> Nit: generate your patch with "git format-patch -N" to get rid of the
> "1/1" in [PATCH 1/1]. Indeed, this patch is the fifth patch in the
> series :)
> 

Fixed for v3.

> > +Upstream-Status: Inappropriate
> 
> This is not really correct: your patch is a backport from upstream,
> with adaptations.
>

Well, okay.

> > +Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> 
> (Both comments also apply to the 5.9.3 patch, of course).
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> http://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Gael
