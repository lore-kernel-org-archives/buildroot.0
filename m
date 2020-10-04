From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Oct 2020 21:43:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: custom configuration
 file
In-Reply-To: <CAFfn7UnFz=5Da91iWqwyE9m6VWpiOUsstGWe4mp3FpgE==UQ7w@mail.gmail.com>
References: <20200928092945.584196-1-pieter.degendt@basalte.be>
 <20200930215728.181df33f@windsurf.home>
 <CAFfn7Uk3-cwCEs=TeP5jLvUgyk3Hf0E8KjiY0z2MKda+AtBKiQ@mail.gmail.com>
 <20201001193142.GC11621@scaer>
 <CAFfn7UnFz=5Da91iWqwyE9m6VWpiOUsstGWe4mp3FpgE==UQ7w@mail.gmail.com>
Message-ID: <20201004194321.GL11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pieter, All,

On 2020-10-02 09:16 +0200, Pieter De Gendt spake thusly:
> On Thu, Oct 1, 2020 at 9:31 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2020-10-01 09:29 +0200, Pieter De Gendt spake thusly:
> > > Applying tweaks on the custom config also feels a bit awkward, since
> > > you already
> > > took the effort of creating the custom config and the "sed" commands might not
> > > even apply.
> > But that is what we are doing with the user-provided configuration files
> > for:
> >   - uClibc-ng
> >   - the linux kernel
> >   - busybox
> >   - uboot
> >   - and probably a few others as well...
[--SNIP--]
> The packages you list have a kconfig provided by the package itself,
> for mbedtls it's
> simply a header file. Do you suggest adding this, and maintaining it
> within buildroot?

What I suggest, and what I think Thomas would also suggest, is that the
user-supplied configuration file is copied over the one bundled in the
mbedtls source tree, then our tweaks are applied.

If the user does not supply any configuration file, we do as we do
today.

Basically, tht would be that patch (mbedtls.mk only):

    diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
    index 5094434e6c..487fe9a310 100644
    --- a/package/mbedtls/mbedtls.mk
    +++ b/package/mbedtls/mbedtls.mk
    @@ -13,6 +13,14 @@ MBEDTLS_INSTALL_STAGING = YES
     MBEDTLS_LICENSE = Apache-2.0
     MBEDTLS_LICENSE_FILES = apache-2.0.txt
     
    +MBEDTLS_CONFIG_H = $(call qstrip,$(BR2_PACKAGE_MBEDTLS_CONFIG_H))
    +ifneq ($(MBEDTLS_CONFIG_H),)
    +define MBEDTLS_INSTALL_CONFIG_H
    +	cp $(MBEDTLS_INSTALL_CONFIG_H) $(@D)/include/mbedtls/config.h
    +endef
    +MBEDTLS_POST_PATCH_HOOKS += MBEDTLS_INSTALL_CONFIG_H
    +endif
    +
     # This is mandatory for hiawatha
     ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
     define MBEDTLS_ENABLE_THREADING

Note however, that mbedtls uses a mix of _POST_PATCH and _POST_CONFIGURE
hooks to tweak config.h; this is not very sound. Instead, they should all
be switched over to using _POST_CONFIGURE hooks, except for hte copy of
the user supplied file, which should stay a post-patch hook.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
