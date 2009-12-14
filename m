From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 14 Dec 2009 05:56:08 -0600
Subject: [Buildroot] [Bug 769] Update configuration menu for MIPS target
In-Reply-To: <20091213184620.D1DD9777D7@busybox.osuosl.org>
References: <bug-769-163@https.bugs.busybox.net/>
	<20091213184620.D1DD9777D7@busybox.osuosl.org>
Message-ID: <200912140556.10177.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun December 13 2009, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=769 
> 
> --- Comment #1 from Mike Z <minimod@morethan.org>  2009-12-13 18:46:19 UTC ---
> Screenshot of new MIPS target configuration sub-menu here:
> http://morethan.org/bldrt/xconfig2.png
> 

Well, in spite of all the feedback I am getting on this project,
I think it looks good.  It also generates the required gcc 
options for cores from 1984 to October 2009.

Supports three modes:
"Full automatic" - based on Core codenames
"Semi-automatic" - Core codename + Manual modification of feature sets.
"Full manual" - Baby, your on your own.

The real key to this project was the splitting of Config.in.arch
into per-target files (Config.in.mips, Config.in.arm, ...).

That leaves each target arch to be dealt with by the lead contributor
and/or target maintainer (12 people rather than 1) **without**
any cross-target symbol dependencies (which Config.in.arch is full of).

Each target configuration sub-menu is "wrapped" with:
menu "MyArch target configuration"
  depends on MyArch
- - - -
endmenu

Giving the closest thing to a namespace that kbuild understands.

The output interfaces with the existing Buildroot using the existing
symbol names + plus target generated booleans to drive the CFLAGS
option list generation.

Makes it much, much easier to add/remove/mark broken targets by arch.
Note: GCC supports 46 targets, **NO** I am not going to write 45 more
of these things!  Not even if someone paid me.

But getting the other current targets to continue working again is 
almost trivial - I planned it that way.

Mike
