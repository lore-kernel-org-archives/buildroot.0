From: William Tambe <tambewilliam@gmail.com>
Date: Sat, 9 May 2020 09:43:44 -0400
Subject: [Buildroot] nano package fail to build; cannot include curses.h
In-Reply-To: <20200509151306.7c58cf1d@windsurf.home>
References: <CAF8i9mNJroNYDMzHDOjwpWX6uwNOY=BN3Yj+RwmgfFqnB2OpLA@mail.gmail.com>
 <20200509120149.0540a23c@windsurf.home>
 <CAF8i9mMsfvAknQ-hOxgf8gUqx_6-8WvPFtZW=agV_fZi1Ek3QA@mail.gmail.com>
 <20200509151306.7c58cf1d@windsurf.home>
Message-ID: <CAF8i9mP7Ztb6E-WQyN-HEho53m9+q8eM1tT6dyKEW=UvMHX8eA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 9, 2020 at 9:13 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello William,
>
> On Sat, 9 May 2020 09:04:03 -0400
> William Tambe <tambewilliam@gmail.com> wrote:
>
> > diff --git a/configs/iron_defconfig b/configs/iron_defconfig
> > new file mode 100644
> > index 0000000000..29cc533f7d
> > --- /dev/null
> > +++ b/configs/iron_defconfig
> > @@ -0,0 +1,15 @@
> > +BR2_iron=y
> > +BR2_STATIC_LIBS=y
> > +BR2_TOOLCHAIN_EXTERNAL=y
> > +BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/iron-toolchain/"
> > +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="$(ARCH)-elf"
>
> Usually, toolchains named $(ARCH)-elf are bare metal toolchains, i.e
> toolchains that don't have a C library with support for an operating
> system. Are you sure this toolchain is using glibc ?

Yes, this toolchain has glibc support.

>
> In any case, since we don't have access to your toolchain, we have no
> way to reproduce/investigate. On other architectures, nano builds fine.

My issue seems to be that it is not able to find curses.h headers
which buildroot already installed at the following path:
./target/usr/include/curses.h
./target/usr/include/ncurses.h
./host/iron-buildroot-linux-gnu/sysroot/usr/include/curses.h
./host/iron-buildroot-linux-gnu/sysroot/usr/include/ncurses.h
./host/include/ncurses/curses.h
./host/include/ncurses/ncurses.h

Using something like this in nano.mk didn't help either:

NANO_MAKE_ENV += \
        $(TARGET_MAKE_ENV) \
        CFLAGS="$(TARGET_CFLAGS) -I$(HOST_DIR)/include/ncurses"

Any other suggestion I could try in debugging the issue I am having ?

>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
