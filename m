From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Nov 2016 23:44:25 +0200
Subject: [Buildroot] [PATCH for-master] package/strace: disable libmpers
 with musl toolchains
In-Reply-To: <20161113124323.lf6cjab4rp3lf36t@tarshish>
References: <1478964612-7028-1-git-send-email-romain.naour@gmail.com>
 <20161113125518.2797806f@free-electrons.com>
 <20161113124323.lf6cjab4rp3lf36t@tarshish>
Message-ID: <20161116214425.kyuut5osptb3rbp7@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Nov 13, 2016 at 02:43:23PM +0200, Baruch Siach wrote:
> On Sun, Nov 13, 2016 at 12:55:18PM +0100, Thomas Petazzoni wrote:
> > On Sat, 12 Nov 2016 16:30:12 +0100, Romain Naour wrote:
> > > strace bundle some kernel headers to build libmpers, this mixes userspace
> > > headers and kernel headers which break the build with musl.
> > > The stddef.h from gcc is used instead of the one from musl.
> > > 
> > > Disable libmpers for musl toolchains.
> > > 
> > > Fixes:
> > > http://autobuild.buildroot.net/results/6f6/6f63fa2537ff316ba259a20966faadcf5ab9deff
> > > 
> > > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > 
> > Hum, Alpine Linux is not doing this, and they support strace 4.14. Why
> > are we having this issue and not Alpine Linux?
> > 
> > I've asked on #musl, we'll see if they come back with some explanation.
> 
> I think they are tweaking the headers in some way to make them more compatible 
> with many packages. I investigate the tcpreplay musl build issue that the 
> autobuilder shows. It turns out that there is an upstream commit[1] fixing 
> some musl build issues. When I tested it I found that is still a 'struct 
> ethhdr' conflict, even with the compatibility hack[2] applied. There must be 
> something else in patch author's environment that avoids this issue.
> 
> [1] https://github.com/appneta/tcpreplay/commit/7c942b71d4ace7425a26e4670f8fbd5814b2339b
> [2] http://patchwork.ozlabs.org/patch/693222/

Just to answer my own wondering, Alpine patches[1] kernel headers to make 
libc-compat.h cover the 'struct ethhdr' definition as well.

[1] http://git.alpinelinux.org/cgit/aports/tree/main/linux-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch?id=f483f49692b97950b680d987fe31f8ddb9277842

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
