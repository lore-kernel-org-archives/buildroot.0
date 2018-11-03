From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 14:18:24 +0100
Subject: [Buildroot] [PATCH 3/4] libv4l: add elfutils optional dependency
In-Reply-To: <20181103122758.10578-3-fontaine.fabrice@gmail.com>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
 <20181103122758.10578-3-fontaine.fabrice@gmail.com>
Message-ID: <20181103141824.6e47adbc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Nov 2018 13:27:57 +0100, Fabrice Fontaine wrote:
> Bump to version 1.61.1 added an optional dependency to elfutils:
> https://git.linuxtv.org/v4l-utils.git/commit/?id=d6025b0e8c7f57b0f9390f987acc5eed57360d80
> 
> host-clang is also needed to build PBF protocols, see:

PBF -> BPF

> https://git.linuxtv.org/v4l-utils.git/commit/?id=91b37c0d9cb71fc2d5f78cc96aa2ef9f3bba145b

I'm not sure to understand: there are two separate commits upstream,
one that adds the elfutils dependency, one that adds the clang
dependency. Are they both needed to have BPF protocols ? If so, why
were those two dependencies introduced in separate commits upstream ?

> +ifeq ($(BR2_PACKAGE_ELFUTILS),y)
> +# host-clang is needed to build BPF protocols
> +LIBV4L_DEPENDENCIES += elfutils host-clang
> +endif

I think an explicit sub-option would make sense in this case, because
it's not trivial at all to know that you need elfutils. So I would
prefer to have

config BR2_PACKAGE_LIBV4L_KEYTABLE_BPF_PROTOCOLS
	bool "keytable BPF protocols"
	select BR2_PACKAGE_ELFUTILS
        depends on BR2_USE_WCHAR # elfutils
        depends on !BR2_STATIC_LIBS # elfutils
        depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
