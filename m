From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:36:07 +0200
Subject: [Buildroot] nano package fail to build; cannot include curses.h
In-Reply-To: <CAF8i9mNSz6yHSj5DrdZd3CJHaX1zQXgYL3nMUBDXMHyC-C4kxw@mail.gmail.com>
References: <CAF8i9mNJroNYDMzHDOjwpWX6uwNOY=BN3Yj+RwmgfFqnB2OpLA@mail.gmail.com>
 <20200509120149.0540a23c@windsurf.home>
 <CAF8i9mMsfvAknQ-hOxgf8gUqx_6-8WvPFtZW=agV_fZi1Ek3QA@mail.gmail.com>
 <20200509151306.7c58cf1d@windsurf.home>
 <CAF8i9mP7Ztb6E-WQyN-HEho53m9+q8eM1tT6dyKEW=UvMHX8eA@mail.gmail.com>
 <20200509162722.15880f08@windsurf.home>
 <CAF8i9mNSz6yHSj5DrdZd3CJHaX1zQXgYL3nMUBDXMHyC-C4kxw@mail.gmail.com>
Message-ID: <20200509223607.089c169b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 9 May 2020 16:08:15 -0400
William Tambe <tambewilliam@gmail.com> wrote:

> Adjusting above NANO_MAKE_ENV, I am able to get a successfully
> compilation using:
> 
> NANO_CONF_ENV += \
>        CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include"
> 
> Not sure if above is still terribly wrong.

It is a lot less wrong in the sense that $(STAGING_DIR) contains
libraries built for the target. However, it is still weird, because
$(STAGING_DIR)/usr/include should be in the standard search path of
headers of your cross-compiler. If not, you will have *LOTS* of build
failures, with many packages.

> Toolchain wrapper was called with:
>     'host/bin/iron-elf-gcc'
>     'test.c'
>     '-v'
> Toolchain wrapper executing:
>     '/opt/iron-toolchain/bin/iron-elf-gcc'
>     '--sysroot'
>     '/buildroot-build/host/iron-buildroot-linux-gnu/sysroot'

See, we're passing a --sysroot option here, so
/buildroot-build/host/iron-buildroot-linux-gnu/sysroot/usr/include
should be in the search path for headers.

> GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
> ignoring nonexistent directory
> "/opt/iron-toolchain/lib/gcc/iron-elf/9.2.0/../../../../iron-elf/sys-include"
> #include "..." search starts here:
> #include <...> search starts here:
>  /opt/iron-toolchain/lib/gcc/iron-elf/9.2.0/include
>  /opt/iron-toolchain/lib/gcc/iron-elf/9.2.0/include-fixed
>  /opt/iron-toolchain/lib/gcc/iron-elf/9.2.0/../../../../iron-elf/include

But it is not. Again, this really looks like a bare metal compiler. I
think your compiler port for this (new?) CPU architecture is not
completely correct. Please compare the results with a known-working ARM
cross-compiler for example.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
