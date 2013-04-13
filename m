From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Apr 2013 16:31:26 +0200
Subject: [Buildroot] [PATCH v2 4/7] arch: toolchain: Introduce binary
 format FLAT types.
In-Reply-To: <CAJxxZ0P=w5Bv44jO6TMPnRC6e-tU6oWpV1zpsNnMAjBkofQpdw@mail.gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-4-git-send-email-sonic.adi@gmail.com>
 <20130407225132.38a9471c@skate>
 <CAJxxZ0P=w5Bv44jO6TMPnRC6e-tU6oWpV1zpsNnMAjBkofQpdw@mail.gmail.com>
Message-ID: <20130413163126.0726a238@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 12 Apr 2013 11:39:41 +0800, Sonic Zhang wrote:

> Just figure out the compiling flags for BINFMT_FLAT_SHARED and
> BINFMT_FLAT_SEP can't be put into the toolchain wrapper, because these
> flags are for application only, they can't be used to build Linux
> kernel.
> 
> -mid-shared-library -mshared-library-id=0
> -msep-data
> 
> So, I have to move them back to file package/Makefile.in .

Hum, that is not really nice, because the idea of the external
toolchain wrapper is to ensure that when the user will use
output/host/usr/bin/<arch>-gcc, he will get binaries that are built for
the same architecture/flags than the binaries built by Buildroot.
That's more or less the whole idea of the external toolchain wrapper
thing.

One option is to have something like:

ifeq ($(BR2_bfin),y)
LINUX_MAKE_FLAGS =
	KBUILD_CFLAGS = "$(TARGET_CFLAGS) -mno-id-shared-library ..."
endif

Not sure exactly if that's the right solution or not. Peter, you're the
one who did the external toolchain wrapper originally. Could you
comment on this specific issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
