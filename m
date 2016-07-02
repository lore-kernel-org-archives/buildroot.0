From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 02 Jul 2016 19:47:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: needs
	BR2_TOOLCHAIN_HAS_SYNC_4
References: <1467477991-13051-1-git-send-email-bernd.kuhls@t-online.de>
 <20160702185004.34235606@free-electrons.com>
Message-ID: <XnsA639C964540A5ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-
wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote in 
news:20160702185004.34235606 at free-electrons.com:

> So it's the internal copy of ffmpeg that mplayer carries that uses
> those atomic operations.
> 
> In this case, why doesn't the standalone ffmpeg package also use atomic
> operations ? Is the ffmpeg code base different ?

no, but the build system is different. While ffmpeg uses its own configure 
script to determine the capabilities of the arch target used for 
compilation mplayer provides a hard-coded config.h file...

The difference on sparc, the arch I am trying to fix, looks like this:

ffmpeg-2.8.7$ grep "ATOMIC\|_SYNC" config.h
#define HAVE_ATOMICS_GCC 0
#define HAVE_ATOMICS_SUNCC 0
#define HAVE_ATOMICS_WIN32 0
#define HAVE_ATOMIC_CAS_PTR 0
#define HAVE_ATOMIC_COMPARE_EXCHANGE 0
#define HAVE_SYNC_VAL_COMPARE_AND_SWAP 0
#define HAVE_ATOMICS_NATIVE 0

mplayer-1.3.0$ grep "ATOMIC\|_SYNC" config.h
#define HAVE_ATOMICS_GCC 1
#define HAVE_SYNC_VAL_COMPARE_AND_SWAP 1
#define HAVE_ATOMICS_NATIVE 1
#define HAVE_SYNC_SYNCHRONIZE 1

Have a look at mplayer configure script at line 9260 for details.

Of course we could try to use sed to change config.h in a 
_POST_CONFIGURE_HOOK, but getting the details right could result in a pita, 
I tried already and gave up after ~30 minutes.

Unless someone comes up with a better solution my patch should be applied 
as obviously the mplayer build system has no support for archs lacking 
_sync4.

Regards, Bernd
