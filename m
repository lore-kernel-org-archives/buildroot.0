From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 8 Jun 2014 20:53:22 +0200
Subject: [Buildroot] [PATCH 1/1] Option to copy Linaro gconv libs to
	target
In-Reply-To: <CADYw_J+TWZWFa6vA=arnLymR46xwXpT56qOu9vQig2mar1v0rg@mail.gmail.com>
References: <1383428236-3842-1-git-send-email-svlasic@gmail.com>
 <20140608172310.GO3266@free.fr>
 <CADYw_J+TWZWFa6vA=arnLymR46xwXpT56qOu9vQig2mar1v0rg@mail.gmail.com>
Message-ID: <CAGduivyc7DUBHJcUHac=4Vu4r_erMo1rCarrjho6v0u9HOXb7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stanislav, Yann, all

On Sun, Jun 8, 2014 at 8:18 PM, Stanislav Vlasic <svlasic@gmail.com> wrote:
> Hi Yann, all,
>
> if GCONV_PATH is not exported, xbmc doesn't see it and decoding subtitles or
> whatever which have special characters (eg cp1250) fails. Also, w/o gconv
> libs XBMC 13.0+ doesn't draw menus etc. I exported GCONV_PATH in xbmc
> startup script, but I guess exporting it in profile would also work.
>
Just a quick question, where did you export theses libraries ?
As Yann stated, we did not need to export this variable to make it
work for XBMC.
And I can assure you that it's nowhere in my env.
>
> On Sun, Jun 8, 2014 at 7:23 PM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
>>
>> Stanislav, All,
>>
>> On 2013-11-02 22:37 +0100, Stanislav Vasic spake thusly:
>> > This patch adds an option for external Linaro toolchains
>> > which allows buildroot to copy gconv libs to target.
>>
>> We have another, more generic patch in the making:
>>     http://patchwork.ozlabs.org/patch/357067/
>>
>> which I'm still working on:
>>
>> https://www.gitorious.org/buildroot/buildroot/commit/9a86575442f9861fa5a4777798fc84b999a12f7f
>>
>> and which should supersed this patch.
>>
>> As such, I marked this patch superseded in the pathwork.
>>
>> > Also exports GCONV_PATH if folder exists on target.
>> > That is needed because some programs (eg. XBMC) dont
>> > see gconv libs if GCONV_PATH is not exported.
>>
>> I haven't seen the need to export GCONV_PATH when running my XBMC,
>> neither did Maxime.
>>
>> What is the reason for exporting GCONV_PATH, if the gconv libs are
>> properly installed in /usr/lib/gconv ?
>>
>> Is it because Linaro toolchains install them in
>> libc/usr/lib/arm-linux-gnueabihf/gconv ?
>>
>> Regards,
>> Yann E. MORIN.
>>
>> > Signed-off-by: Stanislav Vasic <svlasic@gmail.com>
>> > ---
>> >  system/skeleton/etc/profile                        |  6 ++++++
>> >  toolchain/helpers.mk                               | 12 ++++++++++++
>> >  toolchain/toolchain-external/Config.in             |  6 ++++++
>> >  toolchain/toolchain-external/toolchain-external.mk |  4 ++++
>> >  4 files changed, 28 insertions(+)
>> >
>> > diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
>> > index 31d3180..d7fef65 100644
>> > --- a/system/skeleton/etc/profile
>> > +++ b/system/skeleton/etc/profile
>> > @@ -8,6 +8,12 @@ export PATH=\
>> >  /usr/bin/X11:\
>> >  /usr/local/bin
>> >
>> > +# If gconv folder exists, export GCONV_PATH
>> > +
>> > +if [ -d /usr/lib/gconv ]; then
>> > +    export GCONV_PATH = /usr/lib/gconv
>> > +fi
>> > +
>> >  # If running interactively, then:
>> >  if [ "$PS1" ]; then
>> >
>> > diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>> > index a8944ce..a778cef 100644
>> > --- a/toolchain/helpers.mk
>> > +++ b/toolchain/helpers.mk
>> > @@ -83,6 +83,18 @@ copy_toolchain_lib_root = \
>> >   \
>> >       echo -n
>> >
>> > +# Function for Linaro toolchains (EABIhf) that copies gconv libs to
>> > target
>> > +# Expects 1 param:
>> > +# $1: toolchain root
>> > +copy_toolchain_gconv = \
>> > +    BASE_DIR="$(strip $1)"; \
>> > +    if [ -d $${BASE_DIR}usr/lib/arm-linux-gnueabihf/gconv ] ; then \
>> > +     mkdir -p $(TARGET_DIR)/usr/lib/gconv ; \
>> > +     cp -r $${BASE_DIR}usr/lib/arm-linux-gnueabihf/gconv/*
>> > $(TARGET_DIR)/usr/lib/gconv ; \
>> > +    fi; \
>> > + \
>> > +    echo -n
>> > +
>> >  #
>> >  # Copy the full external toolchain sysroot directory to the staging
>> >  # dir. The operation of this function is rendered a little bit
>> > diff --git a/toolchain/toolchain-external/Config.in
>> > b/toolchain/toolchain-external/Config.in
>> > index 48b5865..fc328b1 100644
>> > --- a/toolchain/toolchain-external/Config.in
>> > +++ b/toolchain/toolchain-external/Config.in
>> > @@ -864,6 +864,12 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL
>> >       bool
>> >       select BR2_TOOLCHAIN_USES_MUSL
>> >
>> > +config BR2_TOOLCHAIN_EXTERNAL_LINARO_GCONV
>> > +     bool "Copy GCONV libraries to target"
>> > +     depends on BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07 \
>> > +         || BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_08 \
>> > +         || BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
>> > +
>> >  if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
>> >
>> >  choice
>> > diff --git a/toolchain/toolchain-external/toolchain-external.mk
>> > b/toolchain/toolchain-external/toolchain-external.mk
>> > index d41cc7c..c1a3dc7 100644
>> > --- a/toolchain/toolchain-external/toolchain-external.mk
>> > +++ b/toolchain/toolchain-external/toolchain-external.mk
>> > @@ -496,6 +496,10 @@ define TOOLCHAIN_EXTERNAL_INSTALL_CORE
>> >                       echo "Could not find gdbserver in external
>> > toolchain" ; \
>> >                       exit 1 ; \
>> >               fi ; \
>> > +     fi; \
>> > +     if test "$(BR2_TOOLCHAIN_EXTERNAL_LINARO_GCONV)" = "y" ; then \
>> > +             $(call MESSAGE,"Copying external toolchain gconv to
>> > target...") ; \
>> > +             $(call copy_toolchain_gconv,$${SYSROOT_DIR}) ; \
>> >       fi
>> >  endef
>> >
>> > --
>> > 1.8.3.2
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot at busybox.net
>> > http://lists.busybox.net/mailman/listinfo/buildroot
>>
>> --
>>
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
>> conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>> |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
>> no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>> conspiracy.  |
>>
>> '------------------------------^-------^------------------^--------------------'
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
