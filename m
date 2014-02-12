From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 12 Feb 2014 10:11:28 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140212090504.274a19f9@skate>
References: <20140211073008.EC16B101035@stock.ovh.net>
 <20140211101015.1b282bd3@skate> <20140211173724.GF5170@tarshish>
 <20140212090504.274a19f9@skate>
Message-ID: <20140212081128.GI5170@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Feb 12, 2014 at 09:05:04AM +0100, Thomas Petazzoni wrote:
> On Tue, 11 Feb 2014 19:37:24 +0200, Baruch Siach wrote:
> 
> > On Tue, Feb 11, 2014 at 10:10:15AM +0100, Thomas Petazzoni wrote:
> > > >     xtensa |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/246b3778a1a646afd1c8b9c17b4579fb5a27120e/
> > > 
> > > lib/spawn_faction_adddup2.c: In function 'posix_spawn_file_actions_adddup2':
> > > lib/spawn_faction_adddup2.c:50:19: error: 'posix_spawn_file_actions_t' has no member named '_used'
> > > lib/spawn_faction_adddup2.c:50:42: error: 'posix_spawn_file_actions_t' has no member named '_allocated'
> > > 
> > > uClibc problem?
> > 
> > Yes and no. uClibc (snapshot only) implements POSIX spawn, but unlike glibc, 
> > requires -lrt. coreutils configure script (actually gnulib) fails to detect 
> > the -lrt dependency. The next coreutils version (2.23) fixes avoids the 
> > problem by not using this gnulib module. I tried applying this fix, but it 
> > triggers a reconf and a fresh gnulib download from git, followed by a 
> > different build failure. Instead I added a patch fixing gnulib -lrt dependency 
> > detection.
> 
> Ok, thanks!
> 
> However, you mention the next coreutils version as being 2.23, but the
> latest version available today is 8.21. Aren't you confusing util-linux
> version numbers with coreutils version numbers here? Or did I miss
> something?

Yes, you're right. The next coreutils version is 8.23. The latest version as 
of today is 8.22, though, released on December, 13. I did the same mistake in 
the patch description. I'll send a fix for that shortly.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
