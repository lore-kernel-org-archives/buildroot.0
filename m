From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 17:50:12 +0100
Subject: [Buildroot] [PATCH v2 05/23]
 toolchain-external-blackfin-uclinux: new package
In-Reply-To: <1477742948-11490-6-git-send-email-romain.naour@gmail.com>
References: <1477742948-11490-1-git-send-email-romain.naour@gmail.com>
 <1477742948-11490-6-git-send-email-romain.naour@gmail.com>
Message-ID: <20161030165012.GB18077@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

Now for the review of this one external toolchain...

On 2016-10-29 14:08 +0200, Romain Naour spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This commit adds a new package for the Analog Devices external
> toolchain for the Blackfin architecture. As of this commit, the code
> is currently not used, but it will be used as soon as the external
> toolchain infrastructure gets introduced in a future commit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
[--SNIP--]
> diff --git a/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
> new file mode 100644
> index 0000000..0c3eb9b
> --- /dev/null
> +++ b/toolchain/toolchain-external/toolchain-external-blackfin-uclinux/toolchain-external-blackfin-uclinux.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# toolchain-external-blackfin-uclinux
> +#
> +################################################################################
> +
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION = 2014R1-RC2

    TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR = 2014R1
    TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION = $(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR)-RC2

Then drop the computation below...

> +ifeq ($(BR2_BINFMT_FLAT),y)
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SUBDIR = bfin-uclinux
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_PREFIX = bfin-uclinux
> +else
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SUBDIR = bfin-linux-uclibc
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_PREFIX = bfin-linux-uclibc
> +endif
> +
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR = $(firstword $(subst -, ,$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION)))

... here.

Regards,
Yann E. MORIN.

> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SITE = http://downloads.sourceforge.net/project/adi-toolchain/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION_MAJOR)/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION)/i386
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_SOURCE = blackfin-toolchain-$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION).i386.tar.bz2
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_VERSION).i386.tar.bz2
> +
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_STRIP_COMPONENTS = 3
> +
> +# Special handling for Blackfin toolchain, because of the split in two
> +# tarballs, and the organization of tarball contents. The tarballs
> +# contain ./opt/uClinux/{bfin-uclinux,bfin-linux-uclibc} directories,
> +# which themselves contain the toolchain. This is why we strip more
> +# components than usual.
> +define TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_UCLIBC_EXTRA_EXTRACT
> +	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_EXTRA_DOWNLOADS) | \
> +		$(TAR) --strip-components=3 -C $(@D) $(TAR_OPTIONS) -
> +endef
> +TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_POST_EXTRACT_HOOKS += TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_UCLIBC_EXTRA_EXTRACT
> +
> +$(eval $(toolchain-external-package))
> -- 
> 2.5.5
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
