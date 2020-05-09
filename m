From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 16:27:22 +0200
Subject: [Buildroot] nano package fail to build; cannot include curses.h
In-Reply-To: <CAF8i9mP7Ztb6E-WQyN-HEho53m9+q8eM1tT6dyKEW=UvMHX8eA@mail.gmail.com>
References: <CAF8i9mNJroNYDMzHDOjwpWX6uwNOY=BN3Yj+RwmgfFqnB2OpLA@mail.gmail.com>
 <20200509120149.0540a23c@windsurf.home>
 <CAF8i9mMsfvAknQ-hOxgf8gUqx_6-8WvPFtZW=agV_fZi1Ek3QA@mail.gmail.com>
 <20200509151306.7c58cf1d@windsurf.home>
 <CAF8i9mP7Ztb6E-WQyN-HEho53m9+q8eM1tT6dyKEW=UvMHX8eA@mail.gmail.com>
Message-ID: <20200509162722.15880f08@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 9 May 2020 09:43:44 -0400
William Tambe <tambewilliam@gmail.com> wrote:

> > In any case, since we don't have access to your toolchain, we have no
> > way to reproduce/investigate. On other architectures, nano builds fine.  
> 
> My issue seems to be that it is not able to find curses.h headers
> which buildroot already installed at the following path:
> ./target/usr/include/curses.h
> ./target/usr/include/ncurses.h
> ./host/iron-buildroot-linux-gnu/sysroot/usr/include/curses.h
> ./host/iron-buildroot-linux-gnu/sysroot/usr/include/ncurses.h
> ./host/include/ncurses/curses.h
> ./host/include/ncurses/ncurses.h
> 
> Using something like this in nano.mk didn't help either:
> 
> NANO_MAKE_ENV += \
>         $(TARGET_MAKE_ENV) \
>         CFLAGS="$(TARGET_CFLAGS) -I$(HOST_DIR)/include/ncurses"

This is terribly wrong: you are point to the headers of host libraries,
while cross-compiling code for the target.

> Any other suggestion I could try in debugging the issue I am having ?

Can we have access to your "iron" toolchain to reproduce ?

Normally, the way it works is that Buildroot generates a toolchain
wrapper, which calls your toolchain "gcc" after adding
--sysroot=$(STAGING_DIR), and therefore, gcc should automatically find
headers in $(STAGING_DIR)/usr/include.

I'd suggest to create a simple C file with just #include <ncurses.h>,
and try to build it with $(HOST_DIR)/bin/iron-...-gcc. If that doesn't
work, pass BR2_DEBUG_WRAPPER=2 when calling gcc, and check what gets
passed to the gcc of your toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
