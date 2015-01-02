From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 2 Jan 2015 22:28:06 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: pass host PKG_CONFIG_PATH
 at "make menuconfig" time
In-Reply-To: <20150102161603.GF4392@free.fr>
References: <1420145678-11134-1-git-send-email-bjorn.forsman@gmail.com>
 <1420145678-11134-3-git-send-email-bjorn.forsman@gmail.com>
 <20150102161603.GF4392@free.fr>
Message-ID: <CAEYzJUGqVDVv5Khyr_=BGhfWSxvhp6WO6uWfuqehPCWmSYTHpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Thanks for the feedback. Comments below.

On 2 January 2015 at 17:16, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Bj?rn, All,
>
> On 2015-01-01 21:54 +0100, Bj?rn Forsman spake thusly:
>> Buildroot unexports PKG_CONFIG_PATH in the top-level Makefile for purity
>> reasons. But it has an unfortunate side-effect in that "make menuconfig"
>> will not (necessarily) be able to pick up ncurses via host pkg-config,
>> breaking "make menuconfig" on systems where ncurses is installed in a
>> non-standard location.
>>
>> This patch saves the original PKG_CONFIG_PATH variable in
>> HOST_PKG_CONFIG_PATH and restores the original PKG_CONFIG_PATH variable
>> only in the sub-processes that builds the various menuconfig/nconfig/...
>> targets.
>>
>> With this change, I am able to run "make menuconfig" on NixOS[1].
>>
>> [1]: http://nixos.org/
>>
>> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
>> ---
>>  Makefile | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 5e0b4f2..2f1108f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -264,6 +264,7 @@ export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
>>  export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
>>
>>  # Make sure pkg-config doesn't look outside the buildroot tree
>> +export HOST_PKG_CONFIG_PATH=$(PKG_CONFIG_PATH)
>
> I think you'd want to do an immediate assignment here, and not do an
> export (see below):
>
>     HOST_PKG_CONFIG_PATH:=$(PKG_CONFIG_PATH)

Will fix.

>>  unexport PKG_CONFIG_PATH
>>  unexport PKG_CONFIG_SYSROOT_DIR
>>  unexport PKG_CONFIG_LIBDIR
>> @@ -692,7 +693,10 @@ export HOSTCFLAGS
>>
>>  $(BUILD_DIR)/buildroot-config/%onf:
>>       mkdir -p $(@D)/lxdialog
>> -     $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
>> +     (export PKG_CONFIG_PATH=$(HOST_PKG_CONFIG_PATH); \
>> +      $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
>> +              obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F) \
>> +     )
>
> Well, you do not need this convoluted sub-shell. Just pass the variable
> as a make option:
>
>     $(MAKE) PKG_CONFIG_PATH=$(HOST_PKG_CONFIG_PATH) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)

I tested that. It doesn't work. I guess when the variable is given on
the command line to make (not 'exported') it is not available to
sub-processes that make spawns.

- Bj?rn
