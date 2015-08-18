From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 11:43:24 +0200
Subject: [Buildroot] [PATCH 1/3] package/beecrypt: add host variant
In-Reply-To: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
References: <1439486091-6564-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150818114324.748acba6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

On Thu, 13 Aug 2015 13:14:49 -0400, James Knight wrote:
> Required by an upcoming host variant of the `rpm` package.
> 
> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  package/beecrypt/beecrypt.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
> index cd0b4ac..0d7b360 100644
> --- a/package/beecrypt/beecrypt.mk
> +++ b/package/beecrypt/beecrypt.mk
> @@ -11,16 +11,21 @@ BEECRYPT_INSTALL_STAGING = YES
>  BEECRYPT_LICENSE = LGPLv2.1+
>  BEECRYPT_LICENSE_FILES = COPYING.LIB
>  
> -BEECRYPT_CONF_OPTS = \
> +BEECRYPT_CONFIGURE_ARGS = \
>  	--disable-expert-mode \
>  	--without-java \
>  	--without-python \
>  	--disable-openmp
>  
> +BEECRYPT_CONF_OPTS = $(BEECRYPT_CONFIGURE_ARGS)
> +HOST_BEECRYPT_CONF_OPTS = $(BEECRYPT_CONFIGURE_ARGS)
> +
>  ifeq ($(BR2_PACKAGE_BEECRYPT_CPP),y)
>  BEECRYPT_DEPENDENCIES += icu
> +HOST_BEECRYPT_DEPENDENCIES += host-icu

This is really wrong. BR2_PACKAGE_BEECRYPT_CPP indicates that we want
the C++ support of Beecrypt for the target. It says nothing about what
should be done for the host variant of Beecrypt.

Target configuration options (BR2_PACKAGE_*) should not affect how host
packages are built.

Just decide if you need C++ support in host-beecrypt. If you need it,
enable it. If you don't, do not enable it. But don't make it
conditional.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
