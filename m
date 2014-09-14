From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sun, 14 Sep 2014 08:42:45 +0200
Subject: [Buildroot] [PATCH 12/12] libffi and python: need threads
	support
In-Reply-To: <20140913095712.223528dd@free-electrons.com>
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-13-git-send-email-jezz@sysmic.org>
 <20140913095712.223528dd@free-electrons.com>
Message-ID: <88168771.CuPlRCWCIN@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 13 September 2014 09:57:12 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Fri, 12 Sep 2014 17:50:11 +0200, J?r?me Pouiller wrote:
> > libffi depends on pthreads.
> > 
> > Python depends on libffi (it can provide a builtin libffi, but also
> > depends on pthreads). Thus this patch also disable Python support if
> > toolchain is compiled w/o treads support.
> > 
> > Fixes http://sysmic.org/~jezz/results/204099dd:
> > 
> > ../src/closures.c:119:21: fatal error: pthread.h: No such file or
> > directory
> 
> This seems weird. We have a no threads toolchain in our autobuilders
> and it was never detected, even though I'm pretty sure libffi was built
> a number of times. Do you have the configuration that exhibits the
> problem?

I can reproduce problem using:

BR2_powerpc=y
BR2_powerpc_440=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PTHREADS_NONE=y
BR2_BINUTILS_VERSION_2_24=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_LIBFFI=y

In add, I found this patch :
  http://lists.busybox.net/pipermail/buildroot/2012-November/061976.html

It is seems is had never been applied and it should solve this issue.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
