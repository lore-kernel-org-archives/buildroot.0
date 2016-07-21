From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 21 Jul 2016 06:45:51 +0300
Subject: [Buildroot] [PATCH] gamin: improve PTHREAD_MUTEX_RECURSIVE_NP
 patch to fix build issue
In-Reply-To: <1469044031-2875-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1469044031-2875-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160721034551.GQ3697@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jul 20, 2016 at 09:47:11PM +0200, Thomas Petazzoni wrote:
> In the gamin package, patch
> 0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch was introduced to fix
> the build with musl. Indeed, while musl defines "linux", it does not
> define PTHREAD_MUTEX_RECURSIVE_NP, but only PTHREAD_MUTEX_RECURSIVE. So
> the check was simplified to only verify if PTHREAD_MUTEX_RECURSIVE_NP is
> defined.
> 
> However, this doesn't work well with uClibc linuxthreads. In uClibc,
> PTHREAD_MUTEX_RECURSIVE_NP and PTHREAD_MUTEX_RECURSIVE are not
> pre-processor defines, but enum values. For this reason, even if
> PTHREAD_MUTEX_RECURSIVE_NP actually exists, #if
> defined(PTHREAD_MUTEX_RECURSIVE_NP) is false. So, the gamin code falls
> back to using PTHREAD_MUTEX_RECURSIVE.
> 
> Except that for uClibc linuxthreads, PTHREAD_MUTEX_RECURSIVE is defined
> only if __USE_UNIX98 is defined. For the NPTL implementation,
> PTHREAD_MUTEX_RECURSIVE is defined either if __USE_UNIX98 or
> __USE_XOPEN2K8 are defined. This strange difference has been reported to
> uClibc-ng upstream [1].
> 
> However, regardless of this uClibc behavior, using #if defined to check
> for the availability of PTHREAD_MUTEX_RECURSIVE_NP is not good. This
> commit therefore switches to using a proper AC_CHECK_DECL() autoconf
> test, which works regardless of whether the value is #define'd or
> defined as an enum value.
> 
> This fixes the build of gamin on linuxthreads platforms, such as
> Microblaze or m68k.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/887df97196d7777efbf18a7bee91aa45c1a98700/ (Microblaze)
>   http://autobuild.buildroot.net/results/eb4389474e1b30b5c395a07a857da13a66763bdb/ (m68k)
> 
> [1] http://mailman.uclibc-ng.org/pipermail/devel/2016-July/001087.html
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Makes sense. I which upstream was more responsive.

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
