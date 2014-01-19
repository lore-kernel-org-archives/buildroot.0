From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2014 16:25:09 +0100
Subject: [Buildroot] [PATCH v2 06/12] librtmp: new package
In-Reply-To: <1389831355-19983-7-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1389831355-19983-7-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140119152509.GB3387@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-01-16 01:15 +0100, Maxime Hadjinlian spake thusly:
> rtmpdump - RTMPDump Real-Time Messaging Protocol API
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
> 
> Note that this package will only install librtmp in this state.
> Hence the name librtmp instead of rtmpdump

Just call it rtmpdump, even if it currently only install librtmp: when
we also build rtmpdump, we'd have to rename the package, which would
require adding yet another Config.in.legacy option.

Better to avoid it from the beginning if we can, no?

You may just have the prompt read "librtmp" if you prefer (I'm OK with
that), but just name the package from its upstream name.

(IIRC, we already have some package (eg. flex?) that by default only
install a library, and require a specific option to activate the tool).

[--SNIP--]
> diff --git a/package/librtmp/librtmp.mk b/package/librtmp/librtmp.mk
> new file mode 100644
> index 0000000..3cb1b91
> --- /dev/null
> +++ b/package/librtmp/librtmp.mk
> @@ -0,0 +1,51 @@
> +################################################################################
> +#
> +#librtmp
> +#
> +################################################################################
> +
> +LIBRTMP_VERSION = e0056c51cc1710c9a44d2a2c4e2f344fa9cabcf4
> +LIBRTMP_SITE = git://git.ffmpeg.org/rtmpdump
> +LIBRTMP_INSTALL_STAGING = YES
> +# Note that LIBRTMP is GPLv2 but librtmp has its own license and since we only

s/LIBRTMP/rtmdump/

> +# care about the librtmp, it's LGPLv2.1+

s/the librtmp/librtmp/

> +LIBRTMP_LICENSE = LGPLv2.1+
> +LIBRTMP_LICENSE_FILES = librtmp/COPYING
> +LIBRTMP_DEPENDENCIES = zlib

> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +    LIBRTMP_DEPENDENCIES += gnutls
> +else
> +    ifeq ($(BR2_PACKAGE_POLARSSL),y)

We normaly don't indent nested ifeq-blocks.

> +        LIBRTMP_DEPENDENCIES += polarssl
> +    else
> +        LIBRTMP_DEPENDENCIES += openssl

What if opensl is not selected in the menuconfig?
You need to replicate these dependencies in the Config.in, too.

I was able to build librtmp without any of those dependencies, not even
with openssl, so I guess it also is optional?

What if all are selected? Which does librtmp will pick?
Don't you need to pass some flagsto the build to set which lib to use?

> +    endif
> +endif
> +
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +	LIBRTMP_PIC =
> +else
> +	LIBRTMP_PIC = -fPIC
> +endif
> +
> +define LIBRTMP_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) $(LIBRTMP_PIC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)/librtmp
> +endef
> +
> +define LIBRTMP_FIX_PREFIX
> +	sed -ie "s|prefix=/usr/local|prefix=/usr|" $(@D)/librtmp/Makefile
> +endef

Try to keep the definitions and hooks ordered: move the definition
before the BUILD_CMDS. It makes it easier to review and follow.

Also, should we netter do that with a patch, instead?
Or you could pass prefix=/usr as a make argument, it will override the
definition in the Makefile.

> +define LIBRTMP_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/local/lib
> +	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define LIBRTMP_INSTALL_TARGET_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/local/lib
> +	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR)
> +endef
> +
> +LIBRTMP_POST_EXTRACT_HOOKS += LIBRTMP_FIX_PREFIX

Put this just below the definition.

> +$(eval $(generic-package))
> -- 
> 1.8.5.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
