From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Apr 2014 22:26:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/libgc: add Boehm-Demers-Weiser
 gc library
In-Reply-To: <1396868422-5757-2-git-send-email-alex.bennee@linaro.org>
References: <1396868422-5757-1-git-send-email-alex.bennee@linaro.org>
 <1396868422-5757-2-git-send-email-alex.bennee@linaro.org>
Message-ID: <20140407202610.GB3215@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, Alex, All,

On 2014-04-07 12:00 +0100, Alex Benn?e spake thusly:
> This is needed for applications like Zile
> 
> Signed-off-by: Alex Benn?e <alex.bennee@linaro.org>
> Signed-off-by: Alex Benn?e <alex@bennee.com>

Woot! It's not that often with have a schizophrenic contributor! ;-)

[--SNIP--]
> diff --git a/package/libgc/libgc.mk b/package/libgc/libgc.mk
> new file mode 100644
> index 0000000..e5c4609
> --- /dev/null
> +++ b/package/libgc/libgc.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# Boehm-Demers-Weiser's GC
> +#
> +################################################################################
> +
> +LIBGC_VERSION = 7.4.0
> +LIBGC_SOURCE = gc-${LIBGC_VERSION}.tar.gz

Use parenthesis when evaluating variables, not curly-braces:
    LIBGC_SOURCE = gc-$(LIBGC_VERSION).tar.gz

> +LIBGC_SITE = http://www.hboehm.info/gc/gc_source/
> +LIBGC_EXTRA_DOWNLOADS = libatomic_ops-${LIBGC_VERSION}.tar.gz

Ditto, parenthesis.

> +LIBGC_LICENSE = GPLv1+
> +LIBGC_LICENSE_FILES = COPYING
> +LIBGC_INSTALL_STAGING = YES
> +
> +define LIBGC_POST_EXTRACT_INC_LIBATOMIC
> +	env

This is not needed.

> +	mkdir -p $(@D)/libatomic_ops
> +	tar -xvf ${BR2_DL_DIR}/libatomic_ops-${LIBGC_VERSION}.tar.gz --strip-components=1 -C $(@D)/libatomic_ops
> +endef
> +
> +LIBGC_POST_EXTRACT_HOOKS += LIBGC_POST_EXTRACT_INC_LIBATOMIC

I know this is how upstream suggests building, but I can refrain from
finding this really ugly... Yuck! :-(

Anyway: can't use you use something like:

    LIBGC_LIBATOMIC_OPS = libatomic_ops-${LIBGC_VERSION}.tar.gz
    LIBGC_EXTRA_DOWNLOADS = $(LIBGC_LIBATOMIC_OPS)

    define LIBGC_POST_EXTRACT_INC_LIBATOMIC
        $(INSTALL) -d -m 0755 $(LSOF_DIR)/libatomic_ops && \
        $(call suitable-extractor,$(LIBGC_LIBATOMIC_OPS)) $(DL_DIR)/$(LIBGC_LIBATOMIC_OPS) |\
            $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR)/libatomic_opsi $(TAR_OPTIONS) -
    endef
    LIBGC_POST_EXTRACT_HOOKS += LIBGC_POST_EXTRACT_INC_LIBATOMIC

Note LIBGC_LIBATOMIC_OPS is not strictly required, but I find it cleaner
to use, rather than call suitabel-extract on _EXTRA_DOWNLOADS, which is
a plual and could contain more than one file. That's purely for
aesthetics.

> +$(eval $(autotools-package))

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
