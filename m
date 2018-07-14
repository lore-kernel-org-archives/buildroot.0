From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sat, 14 Jul 2018 15:57:54 -0700
Subject: [Buildroot] [PATCH v6 4/4] chromium: new package
In-Reply-To: <CAFGQKxfwQh2UDismPjiHtdnPQO4j7D_R-jxYcs1epkg6CVwtRw@mail.gmail.com>
References: <20180710234212.4297-1-joseph.kogut@gmail.com>
 <20180710234212.4297-5-joseph.kogut@gmail.com>
 <CAFGQKxfwQh2UDismPjiHtdnPQO4j7D_R-jxYcs1epkg6CVwtRw@mail.gmail.com>
Message-ID: <CAMWSM7guNAObwAvHG2T0R+J-w6nzYm2_YE=5QZG8S_G-btwWyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

On Sat, Jul 14, 2018 at 12:11 PM Martin Bark <martin@barkynet.com> wrote:
>
<snip>
>
> I tried building for an aarch64 target and it fails with the error
>
> ERROR at //chrome/installer/linux/BUILD.gn:413:7: Assertion failed.
>       assert(false, "Linux installer not configured for this architecture.")
>
> Looking at chrome/installer/linux/BUILD.gn it seems only i386, x86_64,
> arm, mipsel and mips64el target architectures are supported.  I think
> you need to remove BR2_aarch64 and add BR2_mipsel and BR2_mips64el
>

Can you try adding the argument "enable_linux_installer=false" to
CHROMIUM_OPTS in chromium.mk, then reconfiguring and rebuilding?

I believe the "linux installer" target here is simply packaging for
Debian and Fedora, which this package doesn't use.

> > +comment "chromium needs toolchain w/ Glibc, host gcc >= 4.9.0"
> > +       depends on !BR2_TOOLCHAIN_USES_GLIBC \
> > +               || !BR2_HOST_GCC_AT_LEAST_4_9
> > +
> > +comment "chromium depends on X.org and needs an OpenGL backend"
> > +       depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
>
> and the comments should also depend on BR2_PACKAGE_CHROMIUM_ARCH_SUPPORTS
>

> > +
> > +CHROMIUM_VERSION = 67.0.3396.79
>
> The current stable release of chromium is 67.0.3396.99
>

> > +CHROMIUM_DEPENDENCIES = alsa-lib cairo cups dbus freetype harfbuzz \
>
> cups should not be listed in CHROMIUM_DEPENDENCIES because you have it
> optionally compiled in below
>

Thanks for the tips, I'll fix these things in the next release.

> > +ifeq ($(BR2_PACKAGE_DBUS),y)
> > +CHROMIUM_OPTS += use_dbus=true
> > +else
> > +CHROMIUM_OPTS += use_dbus=false
> > +endif
>
> dbus is included in the CHROMIUM_DEPENDENCIES and the default
> CHROMIUM_OPTS set use_dbus=true so is dbus really optional?  I think
> you can remove this ifeq ($(BR2_PACKAGE_DBUS),y) section
>

I have this fixed in my WIP branch for next release.

> > +define CHROMIUM_CONFIGURE_CMDS
> > +       mkdir -p $(@D)/third_party/node/linux/node-linux-x64/bin
> > +       ln -sf $(HOST_DIR)/bin/node $(@D)/third_party/node/linux/node-linux-x64/bin/
>
> Given this is hard coded to node-linux-x64 does this mean chromium
> will only build if BR2_HOSTARCH is x86_64  ?
>

I haven't tried building on a different host arch, but this is likely
the case. I'm not aware of any other common processors using other
architectures that are fast enough to compile Chromium in a reasonable
amount of time. Additionally, compiling Chromium requires a minimum of
4 GiB of memory.

Is it reasonable to depend on BR2_HOSTARCH = x86_64, or is it worth
seeing what can be done to fix this?

Thanks,
Joseph
