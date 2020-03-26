From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 23:34:36 +0100
Subject: [Buildroot] [PATCH 1/2] package/libmicrohttpd: fix pthread
 detection
In-Reply-To: <20200324210041.628200-1-bernd.kuhls@t-online.de>
References: <20200324210041.628200-1-bernd.kuhls@t-online.de>
Message-ID: <20200326233436.7c9cc46e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Mar 2020 22:00:40 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> +# fixes pthreads detection
> +LIBMICROHTTPD_CFLAGS += -D_REENTRANT

Thanks, but unfortunately this is not the proper fix. The proper fix is
in gcc: when -pthread is passed, gcc should add -D_REENTRANT to the
CFLAGS.

We have a patch for gcc 7.x to fix this for RISC-V:

  package/gcc/7.5.0/0006-gcc-define-_REENTRANT-for-RISC-V-when-pthread-is-pas.patch

And this fix was merged in upstream gcc as of commit
75102502b3ee275c1d7aa8654dcb012e27c6a661.

We need the same fix for OpenRISC, i.e add:

#define CPP_SPEC "%{pthread:-D_REENTRANT}"

to gcc/config/or1k/linux.h.

Could you look into this instead, and report the bug to gcc ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
