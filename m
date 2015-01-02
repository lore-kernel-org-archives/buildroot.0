From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 3 Jan 2015 00:32:43 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: pass host PKG_CONFIG_PATH
 at "make menuconfig" time
In-Reply-To: <20150102213913.GB24182@free.fr>
References: <1420145678-11134-1-git-send-email-bjorn.forsman@gmail.com>
 <1420145678-11134-3-git-send-email-bjorn.forsman@gmail.com>
 <20150102161603.GF4392@free.fr>
 <CAEYzJUGqVDVv5Khyr_=BGhfWSxvhp6WO6uWfuqehPCWmSYTHpg@mail.gmail.com>
 <20150102213913.GB24182@free.fr>
Message-ID: <CAEYzJUE79EB4uu1i+ut71F0UN0Ykd3xaKmqSq_xT5359VJ6_iw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2 January 2015 at 22:39, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Bj?rn, All,
>
> On 2015-01-02 22:28 +0100, Bj?rn Forsman spake thusly:
>> On 2 January 2015 at 17:16, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > On 2015-01-01 21:54 +0100, Bj?rn Forsman spake thusly:
>> >> Buildroot unexports PKG_CONFIG_PATH in the top-level Makefile for purity
>> >> reasons. But it has an unfortunate side-effect in that "make menuconfig"
>> >> will not (necessarily) be able to pick up ncurses via host pkg-config,
>> >> breaking "make menuconfig" on systems where ncurses is installed in a
>> >> non-standard location.
> [--SNIP--]
>> >> @@ -692,7 +693,10 @@ export HOSTCFLAGS
>> >>
>> >>  $(BUILD_DIR)/buildroot-config/%onf:
>> >>       mkdir -p $(@D)/lxdialog
>> >> -     $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
>> >> +     (export PKG_CONFIG_PATH=$(HOST_PKG_CONFIG_PATH); \
>> >> +      $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
>> >> +              obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F) \
>> >> +     )
>> >
>> > Well, you do not need this convoluted sub-shell. Just pass the variable
>> > as a make option:
>> >
>> >     $(MAKE) PKG_CONFIG_PATH=$(HOST_PKG_CONFIG_PATH) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
>>
>> I tested that. It doesn't work. I guess when the variable is given on
>> the command line to make (not 'exported') it is not available to
>> sub-processes that make spawns.
>
> In that case, just put it in front of it, like:
>
>     PKG_CONFIG_PATH=$(HOST_PKG_CONFIG_PATH) $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
>
> This will put PKG_CONFIG_PATH in the environment just for the duration
> of the sub-make.

Ah, good point. That works and looks cleaner. Will update.

- Bj?rn
