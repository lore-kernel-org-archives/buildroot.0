From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 5 Feb 2014 14:28:48 +0100
Subject: [Buildroot] [PATCH 4 of 7] packages: remove support for
 documentation on target
In-Reply-To: <20140205141626.654ac08a@skate>
References: <patchbomb.1391597406@argentina>
 <ab1e96c7872d5567b2a4.1391597410@argentina>
 <20140205134957.463211f6@skate>
 <CAAXf6LV0DwSccqT8Ur7p=NXn70FFka212O4t9pBbsS6t1VmuOQ@mail.gmail.com>
 <20140205141626.654ac08a@skate>
Message-ID: <CAAXf6LVJTnL67SZ0pSAahtndP_dPCkOHRjFd7bSydwkh__EqJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Feb 5, 2014 at 2:16 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>
>> > Then merge this KMOD_CONF_OPT += line with the existing KMOD_CONF_OPT
>> > line above.
>>
>> I did not do that because the --disable-static --enable-shared setting
>> is accompanied with a comment:
>> # static linking not supported, see
>> # https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
>> KMOD_CONF_OPT = --disable-static --enable-shared
>>
>> and I felt that adding --disable-manpages here would be confusing.
>> With this extra info, what is your position?
>
> Ah, ok. In that case then it would be more natural maybe to have first
> the mandatory normal options, and then this special shared/static
> thing. Like:
>
> KMOD_CONF_OPT = --disable-manpages
>
> # blabla static blabla shared
> KMOD_CONF_OPT += --disable-static --enable-shared
>

Looking at this file, I don't know if your suggestion makes sense.
Here is part of the original file:

-----------------------------------
KMOD_VERSION = 16
KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
KMOD_INSTALL_STAGING = YES
KMOD_DEPENDENCIES = host-pkgconf
HOST_KMOD_DEPENDENCIES = host-pkgconf

# license info for libkmod only, conditionally add more below
KMOD_LICENSE = LGPLv2.1+
KMOD_LICENSE_FILES = libkmod/COPYING

# static linking not supported, see
# https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8
KMOD_CONF_OPT = --disable-static --enable-shared

# manpages not installed and needs xsltproc
HOST_KMOD_CONF_OPT = --disable-manpages
KMOD_CONF_OPT += --disable-manpages

ifeq ($(BR2_PACKAGE_ZLIB),y)
KMOD_DEPENDENCIES += zlib
KMOD_CONF_OPT += --with-zlib
endif

ifeq ($(BR2_PACKAGE_XZ),y)
KMOD_DEPENDENCIES += xz
KMOD_CONF_OPT += --with-xz
endif
------------------------------------

I can certainly put the two manpage-related lines above the static
linking, but this is just a move in the file, right?

Thanks,
Thomas
