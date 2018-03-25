From: Calin Crisan <ccrisan@gmail.com>
Date: Sun, 25 Mar 2018 13:21:35 +0300
Subject: [Buildroot] [PATCH v2 1/1] toolchain-external-custom: allow
 specifying relative path to binaries
In-Reply-To: <20180325090135.GJ2620@scaer>
References: <20180324151135.24751-1-ccrisan@gmail.com>
 <20180325090135.GJ2620@scaer>
Message-ID: <CAN4QVaCu4fUMyHJEhXXTh35_jgyDUiYdr8PwR+QbDs11vmiNwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Thanks for reviewing my patch. I have now submitted a v3 that addresses
your remarks.

On Sun, Mar 25, 2018 at 12:01 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Calin, All,
>
> On 2018-03-24 17:11 +0200, Calin Crisan spake thusly:
> > There are cases where a downloaded toolchain doesn't have its binaries
> > placed directly in a "bin" subfolder (where BuildRoot currently looks
> > for them).
> >
> > A common example is the official Raspberry Pi Toolchain
> > (https://github.com/raspberrypi/tools), which has its binaries in
> > "arm-bcm2708/arm-linux-gnueabihf/bin".
> >
> > This commit introduces BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH that defaults
> > to "bin" and can be changed as needed.
> >
> > Signed-off-by: Calin Crisan <ccrisan@gmail.com>
> > ---
> >  toolchain/toolchain-external/pkg-toolchain-external.mk            | 8
> +++++++-
> >  .../toolchain-external-custom/Config.in.options                   | 8
> ++++++++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk
> b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > index 3bf9fac412..e0a34e1ca9 100644
> > --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> > +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> > @@ -71,13 +71,19 @@ else
> >  TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(call qstrip,$(BR2_TOOLCHAIN_
> EXTERNAL_PATH))
> >  endif
> >
> > +TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(call qstrip,$(BR2_TOOLCHAIN_
> EXTERNAL_REL_BIN_PATH))
> > +# if binary path unset (non-custom external toolchains), use "bin"
>
> Nit: uppercase at beginning of sentence:
>     # If binary path....
>
> > +ifeq ($(TOOLCHAIN_EXTERNAL_REL_BIN_PATH),)
> > +TOOLCHAIN_EXTERNAL_REL_BIN_PATH = bin
> > +endif
>
> This can be achieved without the if-block:
>
>     TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(call qstrip,$(BR2_TOOLCHAIN_
> EXTERNAL_REL_BIN_PATH))
>     # If binary path unset (non-custom external toolchains), use "bin"
>     TOOLCHAIN_EXTERNAL_REL_BIN_PATH ?= bin
>
> This can even be achieved with a single assignment, too:
>
>     # If binary path unset (non-custom external toolchains), use "bin"
>     TOOLCHAIN_EXTERNAL_REL_BIN_PATH = $(or \
>         $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH)), \
>         bin)
>
> I prefer that last solution (even if it's the same number os lines)...
>
> Regards,
> Yann E. MORIN.
>
> >  ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
> >  ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
> >  # if no path set, figure it out from path
> >  TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which
> $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
> >  endif
> >  else
> > -TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
> > +TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_
> DIR)/$(TOOLCHAIN_EXTERNAL_REL_BIN_PATH)
> >  endif
> >
> >  # If this is a buildroot toolchain, it already has a wrapper which we
> want to
> > diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> > index 70c7d8e3c3..b711d9b81f 100644
> > --- a/toolchain/toolchain-external/toolchain-external-
> custom/Config.in.options
> > +++ b/toolchain/toolchain-external/toolchain-external-
> custom/Config.in.options
> > @@ -12,6 +12,14 @@ config BR2_TOOLCHAIN_EXTERNAL_URL
> >       help
> >         URL of the custom toolchain tarball to download and install.
> >
> > +config BR2_TOOLCHAIN_EXTERNAL_REL_BIN_PATH
> > +     string "Toolchain relative bin path"
> > +     default "bin"
> > +     depends on BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD
> > +     help
> > +       Path to where the binaries (e.g. the compiler) can be found,
> > +       relative to the downloaded toolchain root directory.
> > +
> >  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
> >       string "Toolchain prefix"
> >       default "$(ARCH)-linux"
> > --
> > 2.16.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.-
> -------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
> '------------------------------^-------^------------------^-
> -------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180325/d377d3c5/attachment.html>
