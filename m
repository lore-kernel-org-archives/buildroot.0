From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 20 Nov 2013 15:15:07 +0100
Subject: [Buildroot] Help to fix Microblaze issues in Buildroot
In-Reply-To: <20131120150920.4eaf92a4@skate>
References: <20131006185441.0d5c2397@skate>
 <CAM+bi4vGmKHRA3j0ua-dsOBzTuj-BPrM2+z3papeyfDjjazhgw@mail.gmail.com>
 <CAM+bi4t7Z4RWQ=6r=qOUOXKpqV76hRSogU0iBp12FKvN+fGviA@mail.gmail.com>
 <20131120111027.472fe84b@skate>
 <CAM+bi4sKAyBrLjAKfBBkDMVDLReBHffqUCfdDvU61X1wErLfNA@mail.gmail.com>
 <20131120114112.03abac2f@skate>
 <CAM+bi4sL0io7iuRA7AE_CNhs5sTTqc2oRS7As2pCEqkFwcr2Sg@mail.gmail.com>
 <20131120150920.4eaf92a4@skate>
Message-ID: <CAM+bi4uLpkQjiQ3nh7oDd+kOPPjPUq2na6A9fnCCDG4fbV=DUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Spenser, Thomas

Sorry, no, I didn't read much and run wildly and foolishly to apply as few
patches as possible, for I've been very disconnected from buildroot
development for months, so I wasn't really following the dependencies
between patches. In retrospect, that was unwise.

For what it's worth, if by simply renaming and recompressing some files
I've managed to build a microblaze system with only Spenser's patches
applied to master... that seems to mean that everything is working really
great.

Thank you!



2013/11/20 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Alvaro Gamez,
>
> On Wed, 20 Nov 2013 14:56:17 +0100, Alvaro Gamez wrote:
>
> > The bad news is that Spenser's patches require some work. Most of it
> > is easy and I've already done it myself, I can resubmit these patches
> > with the little changes I made to have it fully working.
>
> Did you realize that Spenser patches apply on top of the patches from
> Mischa Jonker?
>
> > However, there's a detail that affects other buildroot parts.
> >
> >  gcc.mk file requires the source code to be downloaded as a .tar.bz2
> > file.
> >
> > However, the new github helper is only able to download .tar.gz
> > files. I don't think this is due to the new github helper but to
> > github itself, that only provides gziped versions of its files.
> >
> > gcc.mk defines HOST_GCC_EXTRACT_CMDS as:
> >
> >         $(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
> >                 $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
> >                 --exclude='libjava/*' \
> >                 --exclude='libgo/*' \
> >                 --exclude='gcc/testsuite/*' \
> >                 --exclude='libstdc++-v3/testsuite/*' \
> >                 $(TAR_OPTIONS) -
> >         mkdir -p $(@D)/libstdc++-v3/testsuite/
> >         echo "all:" > $(@D)/libstdc++-v3/testsuite/Makefile.in
> >         echo "install:" >> $(@D)/libstdc++-v3/testsuite/Makefile.in
> >
> > So... now I have the question:
> >
> > Is it necessary to manually invoke bzcat? Why don't we let tar deal
> > with the matter of deciding which uncompresser to use, since it now
> > by defaults can detect it without the need to pass any 'z' or 'j'
> > parameter?
>
> For example, this specific problem is solved by Mischa Jonker
> patches. See http://patchwork.ozlabs.org/patch/290981/.
>
> See also the cover letter from Spenser at
> http://lists.busybox.net/pipermail/buildroot/2013-November/082590.html,
> which explains what are the dependencies of his patch series.
>
> Which other problems have you seen?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131120/8b954276/attachment.html>
