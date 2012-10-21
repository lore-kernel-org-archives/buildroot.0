From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Oct 2012 21:15:45 +0200
Subject: [Buildroot] [PATCH] openssl: disable apps for NOMMU
In-Reply-To: <1350388760-5447-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 16 Oct 2012 08:59:20 -0300")
References: <1350388760-5447-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <876263tz4u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The openssl binary uses fork() so disable the option and build for !MMU.
 Gustavo> Fixes
 Gustavo> http://autobuild.buildroot.net/results/45a9b84c16caadbf77b6fc43d7a0001c981a4c87/build-end.log

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/openssl/Config.in  |    2 ++
 Gustavo>  package/openssl/openssl.mk |    9 +++++++++
 Gustavo>  2 files changed, 11 insertions(+), 0 deletions(-)

 Gustavo> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
 Gustavo> index 6ba644a..2187023 100644
 Gustavo> --- a/package/openssl/Config.in
 Gustavo> +++ b/package/openssl/Config.in
 Gustavo> @@ -12,6 +12,8 @@ config BR2_PACKAGE_OPENSSL
 Gustavo>  config BR2_PACKAGE_OPENSSL_BIN
 Gustavo>  	bool "openssl binary"
 Gustavo>  	depends on BR2_PACKAGE_OPENSSL
 Gustavo> +	# uses fork()
 Gustavo> +	depends on BR2_USE_MMU
 Gustavo>  	help
 Gustavo>  	  Install the openssl binary to the target file system. This is a
 Gustavo>  	  command line tool for doing various crypthographic stuff.
 Gustavo> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
 Gustavo> index 0917344..d283046 100644
 Gustavo> --- a/package/openssl/openssl.mk
 Gustavo> +++ b/package/openssl/openssl.mk
 Gustavo> @@ -13,6 +13,15 @@ OPENSSL_DEPENDENCIES = zlib
 Gustavo>  OPENSSL_TARGET_ARCH = generic32
 Gustavo>  OPENSSL_CFLAGS = $(TARGET_CFLAGS)
 
 Gustavo> +ifeq ($(BR2_USE_MMU),)

Why is this not BR2_PACKAGE_OPENSSL_BIN instead?

 Gustavo> +define OPENSSL_DISABLE_APPS
 Gustavo> +	$(SED) '/^build_apps/! s/build_apps//' $(@D)/Makefile.org
 Gustavo> +	$(Q)touch $(@D)/apps/openssl
 Gustavo> +endef
 Gustavo> +endif
 Gustavo> +
 Gustavo> +OPENSSL_PRE_CONFIGURE_HOOKS += OPENSSL_DISABLE_APPS
 Gustavo> +
 Gustavo>  ifeq ($(BR2_PACKAGE_OPENSSL_OCF),y)
 Gustavo>  	OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
 Gustavo>  	OPENSSL_DEPENDENCIES += ocf-linux
 Gustavo> -- 
 Gustavo> 1.7.8.6


-- 
Bye, Peter Korsgaard
