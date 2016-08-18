From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:24:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/lldpd: disable use of libbsd
In-Reply-To: <1471554082-24303-1-git-send-email-yann.morin.1998@free.fr>
References: <1471554082-24303-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160818232414.4a44b95f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 23:01:21 +0200, Yann E. MORIN wrote:
> libbsd installs at least one .pc file that contains a -isystem include
> path (-isystem /usr.include/bsd), but -isystem is not munged by
> pkg-config, so we end up using /usr/include/bsd which is not suitable
> for the target. And breaks big time (see failures, below).
> 
> But using libbsd is completely optional. In fact, our lldpd.mk did not
> even express the dependency on libbsd, so we may well have had builds
> without libbsd.
> 
> The functionality brought in by using libbsd is very minor (just setting
> the neighbour name in /proc/self/smdline), so we just make lldpd not use
> libbsd at all. There is no --disable-libbsd or such, so we just patch it
> out of configure.ac.

I don't like this fix, for two reasons:

 * The patch is not upstreamable.

 * It works around the problem, living a potentially problematic
   libbsd.pc installed which can be used by other packages than lldpd.

Isn't the right solution to add support in pkg-config to mungle
-isystem flags?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
