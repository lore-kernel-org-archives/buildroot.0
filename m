From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Nov 2016 14:43:23 +0200
Subject: [Buildroot] [PATCH for-master] package/strace: disable libmpers
 with musl toolchains
In-Reply-To: <20161113125518.2797806f@free-electrons.com>
References: <1478964612-7028-1-git-send-email-romain.naour@gmail.com>
 <20161113125518.2797806f@free-electrons.com>
Message-ID: <20161113124323.lf6cjab4rp3lf36t@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Nov 13, 2016 at 12:55:18PM +0100, Thomas Petazzoni wrote:
> On Sat, 12 Nov 2016 16:30:12 +0100, Romain Naour wrote:
> > strace bundle some kernel headers to build libmpers, this mixes userspace
> > headers and kernel headers which break the build with musl.
> > The stddef.h from gcc is used instead of the one from musl.
> > 
> > Disable libmpers for musl toolchains.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/6f6/6f63fa2537ff316ba259a20966faadcf5ab9deff
> > 
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> 
> Hum, Alpine Linux is not doing this, and they support strace 4.14. Why
> are we having this issue and not Alpine Linux?
> 
> I've asked on #musl, we'll see if they come back with some explanation.

I think they are tweaking the headers in some way to make them more compatible 
with many packages. I investigate the tcpreplay musl build issue that the 
autobuilder shows. It turns out that there is an upstream commit[1] fixing 
some musl build issues. When I tested it I found that is still a 'struct 
ethhdr' conflict, even with the compatibility hack[2] applied. There must be 
something else in patch author's environment that avoids this issue.

[1] https://github.com/appneta/tcpreplay/commit/7c942b71d4ace7425a26e4670f8fbd5814b2339b
[2] http://patchwork.ozlabs.org/patch/693222/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
