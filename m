From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 13:42:05 +0200
Subject: [Buildroot] [PATCH 0/2] Some more netsurf fixes
In-Reply-To: <20190509202808.6741-1-thomas.petazzoni@bootlin.com>
References: <20190509202808.6741-1-thomas.petazzoni@bootlin.com>
Message-ID: <2062251e-bdc4-8711-1725-336a9f84f86d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/05/2019 22:28, Thomas Petazzoni wrote:
> Hello,
> 
> On my machine, netsurf does not even build due to commit
> 6da049f8ae61b956d135526722ce58fc2f67626a. My PATCH 1/2 fixes that, but
> it still remains fragile as CFLAGS/LDFLAGS are used for both building
> target objects and host tools. For example, with my PATCH 1/2 applied,
> if BR2_STATIC_LIBS is enabled, -static is passed in LDFLAGS, and
> netsurf fails to build on my machine with "-lc not found" because it
> passes -static when building host tools, and I don't have a static
> glibc installed on my machine.
> 
> PATCH 2/2 disable static linking for netsurf, which was anyway failing
> to build for months in the autobuilders.
> 
> To be honest, the netsurf build system is broken beyond repair, and is
> a royal pain to work with. Since nobody has acted to fix those build

 I have taken a quick look, and it doesn't seem *that* bad... There's just
nsgenbind that needs to be built for the host, and it could be done by make a
host-netsurf package that sets NSLIB_TARG to empty, and set NSBUILD_TARG to
empty in the target build. It seems to find the binary through PATH, so there's
not even a need to patch anything.


> issues for the past months, if my patches are not sufficient (and as I
> said, they *are* fragile), I will propose to simply remove the netsurf
> package.

 However, since indeed nobody stepped up, I'm definitely in favour of removing
the package entirely.

 Regards,
 Arnout
