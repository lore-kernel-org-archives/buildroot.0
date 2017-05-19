From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 19 May 2017 03:29:16 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-17
In-Reply-To: <20170518175758.6fb2c43d@free-electrons.com>
References: <20170518063152.500E82080B@mail.free-electrons.com>
 <20170518175758.6fb2c43d@free-electrons.com>
Message-ID: <20170519012916.GA6202@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> >       successes : 206
> >        failures : 8  
> 
> Wowo!
> 
> On 8 failures, we have:
> 
>  - 5 already fixed
>  - 1 with a patch in progress
>  - 2 that need investigation
> 
> Looks good!
> 
> On Thu, 18 May 2017 08:31:52 +0200 (CEST), Thomas Petazzoni wrote:
> 
> >         bfin |                       icu-58.2 | NOK | http://autobuild.buildroot.net/results/4828d9fc18283bda4c07af2c67f8ca9490dca28d | ORPH
> 
> Toolchain issue:
> 
>   bfin-buildroot-linux-uclibc/bin/ld: LINKER BUG: .rofixup section size mismatch
> 
> Waldemar, do you have an idea? Is this a recent regression?

We have seen this error in the past and we could fix it by applying
following patch:
https://git.busybox.net/buildroot/tree/package/binutils/2.26.1/0905-bfin-rofixup-bug.patch

It seems the workaround does not work when FDPIC + static +
-Wl,--gc-sections used. It seems icu is adding  -Wl,--gc-sections
only in the static case on a Linux host. 

This is a minor linker optimization. 

How should we handle this? Patching configure.ac and autoreconf the
package?

best regards
 Waldemar
