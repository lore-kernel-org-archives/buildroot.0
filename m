From: Guido Hatzsis <guido.hatzsis@yandex.com>
Date: Fri, 21 Aug 2015 06:11:18 -0400
Subject: [Buildroot] [PATCH v2] Add support for the x86-64 x32 ABI for
	glibc and musl.
In-Reply-To: <20150821104811.7c695a8b@free-electrons.com>
References: <1440070351-29057-1-git-send-email-Guido.Hatzsis@yandex.com>
 <20150820231629.5688e5ed@free-electrons.com>
 <2360791440107689@web3h.yandex.ru>
 <20150821104811.7c695a8b@free-electrons.com>
Message-ID: <3855831440151878@web11j.yandex.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ah ok, thanks for clarifying that.  I will remove that.

Cheers

Guido
21.08.2015, 04:48, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>:
> Dear Guido Hatzsis,
>
> On Thu, 20 Aug 2015 17:54:49 -0400, Guido Hatzsis wrote:
>
>> ?>> ??define GLIBC_INSTALL_TARGET_CMDS
>> ?>> ??????????for libs in $(GLIBC_LIBS_LIB); do \
>> ?>> ?- $(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
>> ?>> ?+ $(call copy_toolchain_lib_root,$(STAGING_DIR)/,,$(if $(BR2_X86_64_ABI_X32),libx32,lib),$$libs,/lib) ; \
>> ?>
>> ?> Hum, I'm not too happy with this. How does it work for normal x86-64
>> ?> toolchains that want lib64 as the library directory?
>> ?>
>>
>> ?I think that those two are related. The ABI is part of the x86-64 arch. Glibc uses libx32 and lib (not lib32 and lib64) when not using multilib. This is done here.
>>
>> ?205 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
>> ?206 HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
>> ?207 endif
>>
>> ?Do you need to set the BR2_GCC_TARGET_ABI to empty? Is this the convention?
>
> No, no.
>
> But you make some changes in the main Makefile to have a libx32 -> lib
> symbolic link in the staging directory. So I don't see why you need to
> change glibc.mk to account for the libx32 thing, since libx32 is just a
> symlink to lib.
>
> But maybe I need to test by myself to understand what's going on.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
