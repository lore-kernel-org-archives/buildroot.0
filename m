From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 9 Mar 2015 21:55:55 +0000
Subject: [Buildroot] [PATCH] gdb: fix target gdb building from git
In-Reply-To: <20150309185549.625180ba@free-electrons.com>
References: <1424768600-10056-1-git-send-email-abrodkin@synopsys.com>
 <20150309185549.625180ba@free-electrons.com>
Message-ID: <1425938155.2312.22.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2015-03-09 at 18:55 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Tue, 24 Feb 2015 12:03:20 +0300, Alexey Brodkin wrote:
> > Currently we only add "host-texinfo" dependency for host GDB built
> > from git sources. But in case of target gdb texinfo won't be built
> > and so gdb building will fail on attempt to build documentation.
> > 
> > Fix is trivial - add "host-texinfo" as a dependency for target gdb
> > in the sme way as we disable documentation building via both
> > GDB_CONF_ENV (for target) and HOST_GDB_CONF_ENV (host) GDB flavors.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Anton Kolesov <akolesov@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> Do you have a failing configuration for this one? I've tried to build
> the ARC target gdb today, without selecting cross-gdb (so that the
> host-texinfo dependency is not pulled in), and I couldn't get a failure.

Actually I discovered this issue when I tried to build target gdb with
external tools.

So to reproduce this issue please apply
http://patchwork.ozlabs.org/patch/448242/ to your local git tree, then
select external tools for ARC and try to build target gdb.

And this is my defconfig to reproduce the issue:
 --->8---
 BR2_arcle=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_PACKAGE_GDB=y
 BR2_PACKAGE_GDB_DEBUGGER=y
 --->8---

Indeed if you build toolchain yourself this issue won't happen because
"host-texinfo" gets built during toolchain building.

-Alexey
