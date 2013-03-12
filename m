From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 12 Mar 2013 18:16:32 +0100
Subject: [Buildroot] [PATCH 6/6] package/mtools: new host-package
In-Reply-To: <201303110102.06732.yann.morin.1998@free.fr>
References: <cover.1362693294.git.yann.morin.1998@free.fr>
 <296699691239a90d5118c5cbe72f1ff57b3761a5.1362693294.git.yann.morin.1998@free.fr>
 <20130310124944.261867c4@skate> <201303110102.06732.yann.morin.1998@free.fr>
Message-ID: <513F62F0.6050303@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN wrote:
 > Thomas, Luca, All,
 >
 > On Sunday 10 March 2013 Thomas Petazzoni wrote:
 >> On Thu,  7 Mar 2013 22:55:31 +0100, Yann E. MORIN wrote:
 >>
 >>> +MTOOLS_VERSION  = 4.0.18
 >>> +MTOOLS_SOURCE   = mtools-$(MTOOLS_VERSION).tar.bz2
 >>> +MTOOLS_SITE     = $(BR2_GNU_MIRROR)/mtools/
 >>
 >> MTOOLS_LICENSE = GPLv3+
 >> MTOOLS_LICENSE_FILES = COPYING
 >
 > Done.
 >
 >> However, this makes me realize that we don't distinguish host packages
 >> from target packages in the manifest.csv file. For example, once I had
 >> the licensing informations for this mtools file, I have the following
 >> line in my manifest.csv:
 >>
 >> "mtools","4.0.18","GPLv3+","COPYING","mtools-4.0.18.tar.bz2"
 >>
 >> And then, someone might think "damn, I have some GPLv3 software in my
 >> system, I now need to comply with the additional special requirements
 >> of GPLv3", while in fact it's not the case (as far as I know) because
 >> mtools is not distributed on the embedded device. Maybe we need to
 >> explicit which packages are on the target, which packages are on the
 >> host, and which packages are on both, no?
 >
 > Yes, fully agreed; this would be very puzzling.
 >
 > I would suggest that we not install licensing information about host
 > packages, unless they are also used on the target.

It would probably be sound in most cases, but not compliant to some
licenses, at least if there isa GPL package on the target.
Take what the GPLv2 saysin clause 3:

 > The source code for a work means the preferred form of the work for
 > making modifications to it.  For an executable work, complete source
 > code means all the source code for all modules it contains, plus any
 > associated interface definition files, plus the scripts used to
 > control compilation and installation of the executable.

What do the "scripts used to control compilation and installation"?
We use a toolchain, the autotools, CMake, Python etc on the host to build
packages. While these tools are arguably more complex than the average
"script", they are "used to control the cpmpilation and installation".

Reading on:

 >   However, as a
 > special exception, the source code distributed need not include
 > anything that is normally distributed (in either source or binary
 > form) with the major components (compiler, kernel, and so on) of the
 > operating system on which the executable runs, unless that component
 > itself accompanies the executable.

While this is saying you do not need to redistribute the Debian compiler,
it is using "compiler" and "kernel" as two examples of the "scripts used
to control compilation and installation". Hence my understanding that the
toolchain should be redistributed, along with all of the host tools that
are used to build anything on the target.

As far as the mtools are concerned, they are probably not used to produce
the executables on the target, so they actually do not need to be in the
redistribution list. But most other host packages are different.

Indeed, in the practice I'm retty sure almost nobody modify autotools,
or CMake or other host packages, so even redistributing them would not
disclose much industrial secret.

Bottom line, I think it would be useful to save in the package manifest
an additional column stating whether the package is on the target, on
the host, or both. But skipping host-only packages is not safe.

Luca
