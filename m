From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 09:11:46 +0100
Subject: [Buildroot] Analysis of build results for 2016-02-21
In-Reply-To: <CALdGskLWXoRtKZdqYErn6w4QmcAxLroxtzxkMFYiRsPuH_O7Hg@mail.gmail.com>
References: <CALdGskKUp-GtxeOBWq-5Tzp7b2zBad3=RoRxeN1eaJHPcg5Xww@mail.gmail.com>
 <20160222232144.61b99b32@free-electrons.com>
 <CALdGskLWXoRtKZdqYErn6w4QmcAxLroxtzxkMFYiRsPuH_O7Hg@mail.gmail.com>
Message-ID: <20160223091146.33e3f5b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Feb 2016 09:34:31 +0200, Olivier Schonken wrote:

> The suggestion from Romain to disable -fPIE as below works for both
> architectures.  Can I submit a patch for this? Or do you want to wait for a
> response from Alexey and Waldemar?
> 
> # Remove -fPIE -pie from CFLAGS
> ifeq ($(BR2_STATIC_LIBS),y)
> CUPS_CONF_OPTS += LSB_BUILD=y
> endif

Unfortunately, I don't like this, for several reasons:

 1/ LSB_BUILD=y will also disable stack protection support.

 2/ Only uClibc in static library build is affected by the problem, not
    musl for example.

 3/ It is not fixing the real problem.

The real fixes are:

 1/ Use AC_CACHE_VAL() in the configure.ac script to be able to force
    disable PIE, and then use that to disable it on ARC. Or
    alternatively, change the configure.ac to use:

++AX_CHECK_COMPILE_FLAG([-fPIE -DPIE], [PIE_CFLAGS="-fPIE -DPIE"])
++AX_CHECK_LINK_FLAG([-pie], [PIE_LDFLAGS="$PIE_LDFLAGS -pie"])

    Which also provide cache variables to override their results. See
    http://patchwork.ozlabs.org/patch/569556/.

 2/ Fix the uClibc static case by fixing the toolchain build process or
    uClibc itself (depending on which one is broken).

Of course, this requires effort than the quick hack of LSB_BUILD=y, but
those are IMO the real fixes, while LSB_BUILD=y is papering over the
real problem.

Note that there are other classes of cups-2.1.2 build failures visible
at http://autobuild.buildroot.org/?reason=cups-2.1.2.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
