From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 4 Jan 2018 12:28:15 +0100
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: need NPTL threads
In-Reply-To: <20180104105154.l24rvscxbsliquv3@tarshish>
References: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20180104101927.oexxtwusya3wppyk@tarshish>
 <20180104113336.6b7ed00a@windsurf.lan>
 <20180104105154.l24rvscxbsliquv3@tarshish>
Message-ID: <20180104112815.GD18339@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi Thomas,
> 
> On Thu, Jan 04, 2018 at 11:33:36AM +0100, Thomas Petazzoni wrote:
> > On Thu, 4 Jan 2018 12:19:27 +0200, Baruch Siach wrote:
> > 
> > > On Thu, Jan 04, 2018 at 11:10:51AM +0100, Kurt Van Dijck wrote:
> > > > nilfs-utils use clock_nanosleep(), which comes with NPTL threads  
> > > 
> > > What is your indication that this is the case?

The input of Thomas below indeed was my indication.
Adding this effectively solved/avoided build problems
using toolchains with threads but without NPTL threads.
So I thought the puzzle was complete here ...

> > > In the uClibc-ng config 
> > > UCLIBC_HAS_REALTIME is selected by both linuxthreads and NPTL. When 
> > > UCLIBC_HAS_REALTIME is enabled, UCLIBC_HAS_ADVANCED_REALTIME is also enabled 
> > > by default. UCLIBC_HAS_ADVANCED_REALTIME provides clock_nanosleep().
> > 
> > I haven't looked at it in detail, but:
> > 
> > package/blktrace/Config.in:     depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
> 
> Added in commit 08b9e24eaa4e. No previous threads dependency.
> 
> > package/can-utils/Config.in:    depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
> 
> Added in commit dbfca7963049. No previous threads dependency.
> 
> > package/dvblast/Config.in:      depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
> 
> Added in commit ec875d9bf9b183, changed from a previous plain threads 
> dependency.

> 
> Yann, do you remember the reason why "clock_nanosleep() is only availabe with 
> NPTL" as commit ec875d9bf9b183 says?
> 
> baruch
