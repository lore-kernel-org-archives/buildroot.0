From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 4 Oct 2015 20:44:15 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libpjsip: new package
In-Reply-To: <1430078330-14821-1-git-send-email-bernd.kuhls@t-online.de>
References: <1430078330-14821-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <5611737F.3050109@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd,

are you still interested in this work?

Generally looks good. Below are a few comments.

Bernd Kuhls wrote:
[...]
> diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
> new file mode 100644
> index 0000000..c647ac4
> --- /dev/null
> +++ b/package/libpjsip/libpjsip.hash
> @@ -0,0 +1,2 @@
> +# From http://www.pjsip.org/release/2.4/MD5SUM.TXT
> +md5	39629ca3fcedbdc7dbd8c5a707060095	pjproject-2.4.tar.bz2

If no hash stronger that MD5 is published, you should compute one
manually.

> diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
> new file mode 100644
> index 0000000..6308da1
> --- /dev/null
> +++ b/package/libpjsip/libpjsip.mk
> @@ -0,0 +1,47 @@
> +################################################################################
> +#
> +# libpjsip
> +#
> +################################################################################
> +
> +LIBPJSIP_VERSION = 2.4

Of course if you respin this patch you'll have to upgrade the version.

> +LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
> +LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
> +LIBPJSIP_LICENSE = GPLv2+
> +LIBPJSIP_LICENSE_FILES = COPYING
> +LIBPJSIP_INSTALL_STAGING = YES
> +
> +LIBPJSIP_DEPENDENCIES = libgsm libsrtp portaudio
> +
> +LIBPJSIP_CONF_ENV = \
> +	LD="$(TARGET_CC)" \
> +	CFLAGS="$(TARGET_CFLAGS) -DPJ_HAS_IPV6=1"
> +
> +LIBPJSIP_CONF_OPTS = \
> +	--with-external-gsm \
> +	--with-external-pa \
> +	--with-external-srtp \
> +	--disable-sound \

If sound is disabled, does it make sense to forcibly enable gsm?

Incidentally, since you sent this patch alone and I didn't see v1, I
applied this one only, and of course it didn't build because libgsm is
not in Buildroot. This suggested me that the libpjsip patch might go
on on its own even without libgsm. After all pjsip has interesting
things besides audio, such as the NAT traversal techniques. I assume
these other features can be used with audio disabled.

So I'd forcibly disable gsm in the first run, and maybe optionally
enable it if/when libgsm gets merged.

-- 
Luca
