From: Guido Hatzsis <guido.hatzsis@yandex.com>
Date: Thu, 20 Aug 2015 17:54:49 -0400
Subject: [Buildroot] [PATCH v2] Add support for the x86-64 x32 ABI for
	glibc and musl.
In-Reply-To: <20150820231629.5688e5ed@free-electrons.com>
References: <1440070351-29057-1-git-send-email-Guido.Hatzsis@yandex.com>
 <20150820231629.5688e5ed@free-electrons.com>
Message-ID: <2360791440107689@web3h.yandex.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I just have a couple of questions:

20.08.2015, 17:16, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>:
>> ?+endchoice
>> ?+
>> ?+config BR2_GCC_TARGET_ABI
>> ?+ default "x32" if BR2_X86_64_ABI_X32
>
> Do we need to provide a value for BR2_X86_64_ABI_GNU ? Or the ABI is
> empty ?
>

>> ??define GLIBC_INSTALL_TARGET_CMDS
>> ??????????for libs in $(GLIBC_LIBS_LIB); do \
>> ?- $(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
>> ?+ $(call copy_toolchain_lib_root,$(STAGING_DIR)/,,$(if $(BR2_X86_64_ABI_X32),libx32,lib),$$libs,/lib) ; \
>
> Hum, I'm not too happy with this. How does it work for normal x86-64
> toolchains that want lib64 as the library directory?
>

I think that those two are related. The ABI is part of the x86-64 arch. Glibc uses libx32 and lib (not lib32 and lib64) when not using multilib.  This is done here.

205 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
206 HOST_GCC_COMMON_CONF_OPTS += --with-abi=$(BR2_GCC_TARGET_ABI)
207 endif

Do you need to set the BR2_GCC_TARGET_ABI to empty? Is this the convention?

Guido
