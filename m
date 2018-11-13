From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 21:57:47 +0100
Subject: [Buildroot] [PATCH v2] linux-firmware: bump version to latest
 1baa348
In-Reply-To: <20181113202946.GH10271@scaer>
References: <20181108153322.17362-1-m.niestroj@grinn-global.com>
 <20181109215700.6b8dc6af@windsurf> <20181109210610.GB2445@scaer>
 <87bm6svqpy.fsf@grinn-global.com>
 <20181113210216.37879bd4@windsurf> <20181113202946.GH10271@scaer>
Message-ID: <20181113215747.6960cbb3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Nov 2018 21:29:46 +0100, Yann E. MORIN wrote:

> > On my side, I have updated to Fedora 29, which ships tar 1.30, that we
> > consider as broken, and therefore now for everything single small build
> > that I do, I'm paying the price of building tar, which is super
> > annoying. This is especially annoying as tar 1.30 is only problematic
> > when *creating* tarballs of git-fetched packages, which clearly does
> > not happen at every build.  
> 
> Well, we only need host-tar and host-gzip when creating tarballs, not
> extracting them, correct? So, we could very well envision the fact that
> host-tar (and host-gzip) are only added to FOO_DOWNLOAD dependecies when
> FOO_SITE_METHOD == git (and they are needed, of course), no?

For host-tar, it's a bit complicated, because we have two conditions:

 - tar must be >= 1.27 for *extraction* to work properly.

 - tar must be < 1.30 for *creation* to work properly

So, if we add $(BR2_TAR_HOST_DEPENDENCY) to the package dependencies
only when FOO_SITE_METHOD = git, we would miss the case where it is
needed for extracting plain regular tarballs.

> > It would be truly horrible to also have to build our own gzip. Maybe we
> > need to somehow revisit our requirement that we need to have
> > reproducible tarballs for git-fetched packages ?  
> 
> I am ready to pay the price for reproducibility any time.

Well, for a "normal" build, I agree. When doing active BR development,
where one regularly builds from scratch small configurations, every
additional amount of time/stuff to build is annoying.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
