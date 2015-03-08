From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 22:48:31 +0100
Subject: [Buildroot] [PATCHv2] toolchain: fix installing gconv libs with
 multi-arch toolchain
In-Reply-To: <1424643784-23210-1-git-send-email-yann.morin.1998@free.fr>
References: <1424643784-23210-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150308224831.246ff970@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 22 Feb 2015 23:23:04 +0100, Yann E. MORIN wrote:

> diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
> index 3f9900b..51294c3 100644
> --- a/toolchain/toolchain.mk
> +++ b/toolchain/toolchain.mk
> @@ -17,28 +17,39 @@ endif
>  ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
>  GCONV_LIBS = $(call qstrip,$(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_LIST))
>  define COPY_GCONV_LIBS
> -	$(Q)if [ -z "$(GCONV_LIBS)" ]; then \
> -		$(INSTALL) -m 0644 -D $(STAGING_DIR)/usr/lib/gconv/gconv-modules \
> -				      $(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
> -		$(INSTALL) -m 0644 $(STAGING_DIR)/usr/lib/gconv/*.so \
> +	$(Q)machine=$$($(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS) -dumpmachine); \

Unless I'm mistaken, this piece of code copying gconv libraries is used
for both the internal and external toolchain backends, no? If that's
the case, then using TOOLCHAIN_EXTERNAL_* here seems wrong, no?

And indeed, the resulting code is not really nice. For sure not worse
than the average toolchain-external.mk code :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
