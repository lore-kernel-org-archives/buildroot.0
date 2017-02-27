From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 23:38:18 +0100
Subject: [Buildroot] Analysis of build results for 2017-02-26:
 libsidplay issue on PowerPC64
In-Reply-To: <20170227142854.34d3fb86@free-electrons.com>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
Message-ID: <20170227233818.1300436b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Feb 2017 14:28:54 +0100, Thomas Petazzoni wrote:

> >  powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/caba78cc2706accc187a428364c0e0d10a1dcd60  
> 
> Missing -fPIC apparently. Sam?

I had a closer look at this one. What happens is:

 1. libsidplay is autoreconf'ed due to <pkg>_AUTORECONF = YES

 2. we apply the powerpc64le trick that patches the configure script,
    thanks to this, during the configure step, the fact that shared
    libraries are supported is properly detected.

 3. for some reason, when the build starts, it auto-autoreconfs itself,
    which rewrites the configure script, without the powerpc64le
    trick. ./configure is re-executed, and this time doesn't detected
    shared library support anymore.

So the issue is: why does the package decides to auto-autoreconf itself
at the beginning of the build step.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
