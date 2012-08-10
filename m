From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Aug 2012 22:00:52 +0200
Subject: [Buildroot] [PATCH] libpng: bump version and add apng support
 (required by firefox)
In-Reply-To: <5024D8B5.2020605@petroprogram.com>
References: <50240DDE.4000901@petroprogram.com> <20120810090232.7ca6f885@skate>
 <5024D8B5.2020605@petroprogram.com>
Message-ID: <20120810220052.6a596ce3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

Le Fri, 10 Aug 2012 12:47:33 +0300,
Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :

> >  (1) Your patch has been line-wrapped by your e-mail client. Try to use
> >      git send-email instead, which will guarantee that your patch
> >      remains intact and can be applied properly.
> Ok, I try to get used to using git for sending these patches.
> Im still git newbie :-)

No problem :)

> >  (2) As far as I know, the bump from libpng 1.4 to libpng 1.5 changes
> >      the API, and is therefore causing build failures in other
> >      packages. Have you tested things like DirectFB and other packages
> >      that rely on libpng?
> Well, firefox is working nicely.
> 
> And the only DirectFB depending package I have here is the graphical
> version of links browser from buildroot.
> Links start's okay too but freezes after exiting. But it had done it
> before too, so I know it's not the issue of libpng
> in this specific case.
> 
> But will I check what applications I have currently linked against that
> 1.5 version and test them all.

I was more talking about all the other packages that we have in
Buildroot and that rely on libpng:

$ git grep "select BR2_PACKAGE_LIBPNG"
cairo/Config.in:	select BR2_PACKAGE_LIBPNG
collectd/Config.in:	select BR2_PACKAGE_LIBPNG
directfb/Config.in:	select BR2_PACKAGE_LIBPNG
efl/libevas/Config.in:	select BR2_PACKAGE_LIBPNG
fbgrab/Config.in:	select BR2_PACKAGE_LIBPNG
fbv/Config.in:	select BR2_PACKAGE_LIBPNG
imlib2/Config.in:	select BR2_PACKAGE_LIBPNG
links/Config.in:	select BR2_PACKAGE_LIBPNG
multimedia/gst-plugins-good/Config.in:	select BR2_PACKAGE_LIBPNG
opencv/Config.in:	select BR2_PACKAGE_LIBPNG
qt/Config.in:	select BR2_PACKAGE_LIBPNG
rrdtool/Config.in:	select BR2_PACKAGE_LIBPNG
sdl_image/Config.in:	select BR2_PACKAGE_LIBPNG
x11r7/Config.in:	select BR2_PACKAGE_LIBPNG
x11r7/xapp_xcursorgen/Config.in:	select BR2_PACKAGE_LIBPNG

> That's a good guestion.
> 
> I had to check from http://en.wikipedia.org/wiki/APNG
> and it says the following:
> 
> "The PNG group officially rejected APNG as an official extension on
> April 20, 2007.[3]
> There have been several subsequent proposals for a simple animated
> graphics format based on PNG using several different approaches.[4]
> 
> Mozilla Firefox added support for APNG in version 3 trunk builds on
> March 23, 2007.[5]
> However, because libpng is the PNG Group's reference implementation of
> the official specification,
> APNG support can never be supported in the main libpng distribution so
> long as it remains
> unratified by the Group. Iceweasel 3 now supports APNG by using
> Mozilla's unofficial variant of libpng."
> 
> So it seems that even tought APNG support is needed for libpng by
> Firefox the PNG group will never add it :(

Argh, so it sounds a bit nasty to include this apng patch.

> However, there is a solution:
> Firefox tarball contains it's own private copy of libpng with apng
> support included.
> 
> Ofcourse that's some extra disk space wasted for having two versions of
> libpng (private and system-wide)
> included in the final rootfs  and that's why I originally wanted to use
> as much buildroot made system libs as possible.
> But it's a simple matter to drop the "--with-system-png" from firefox
> mozconfig and trash that apng patch.

Yes, we usually don't like this solution either, but for now, it looks
like the easiest option.

> By the way Thomas, how should I split my patches if they become too large ?
> I have currently eight files for my firefox build and the total number
> of lines is...well...large.
> 
> So, should I chunk it to separately patches with git ([PATCH 1/8],
> [PATCH 2/8] etc ....) ,
> with each patch containing just one file or how ?

You can send all the files related to a particular package as a single
patch, even if it is large. However, we might be a bit reluctant to add
a package that requires such a number of big patches. We'll wait your
posting to see what those patches do, and whether they are acceptable
inside Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
