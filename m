From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Feb 2014 19:37:24 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140211101015.1b282bd3@skate>
References: <20140211073008.EC16B101035@stock.ovh.net>
 <20140211101015.1b282bd3@skate>
Message-ID: <20140211173724.GF5170@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 11, 2014 at 10:10:15AM +0100, Thomas Petazzoni wrote:
> >     xtensa |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/246b3778a1a646afd1c8b9c17b4579fb5a27120e/
> 
> lib/spawn_faction_adddup2.c: In function 'posix_spawn_file_actions_adddup2':
> lib/spawn_faction_adddup2.c:50:19: error: 'posix_spawn_file_actions_t' has no member named '_used'
> lib/spawn_faction_adddup2.c:50:42: error: 'posix_spawn_file_actions_t' has no member named '_allocated'
> 
> uClibc problem?

Yes and no. uClibc (snapshot only) implements POSIX spawn, but unlike glibc, 
requires -lrt. coreutils configure script (actually gnulib) fails to detect 
the -lrt dependency. The next coreutils version (2.23) fixes avoids the 
problem by not using this gnulib module. I tried applying this fix, but it 
triggers a reconf and a fresh gnulib download from git, followed by a 
different build failure. Instead I added a patch fixing gnulib -lrt dependency 
detection.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
