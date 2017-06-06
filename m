From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 22:14:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/php: use correct cxxflags for
 icu support
In-Reply-To: <20170605200726.21261-1-bernd.kuhls@t-online.de>
References: <20170605200726.21261-1-bernd.kuhls@t-online.de>
Message-ID: <20170606221401.27d6cb4d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 22:07:26 +0200, Bernd Kuhls wrote:
> Php lacks "-std=c++11", provided by icu-config, when compiling icu
> support leading to a build failure:
> 
> /home/peko/autobuild/instance-1/output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/include/unicode/umachine.h:347:13:
>  error: 'char16_t' does not name a type
>      typedef char16_t UChar;
> 
> Fixes
> http://autobuild.buildroot.net/results/238/238d0e4bb205c0e7288903c6498e6c1787d86a1b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/php/php.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/php/php.mk b/package/php/php.mk
> index cfc678991..2e4b667f9 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -173,6 +173,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
>  PHP_CONF_OPTS += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
> +PHP_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) `$(STAGING_DIR)/usr/bin/icu-config --cxxflags`"

Please use the same logic as the one used for PHP_CFLAGS, i.e:

PHP_CXXFLAGS = $(TARGET_CXXFLAGS)

...

ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
PHP_CXXFLAGS += `$(STAGING_DIR)/usr/bin/icu-config --cxxflags`"
endif

...

PHP_CONF_ENV += CFLAGS="$(PHP_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)"

Also, you forgot to add the dependency on gcc >= 4.8 in the ICU patch,
so it should be added here, because it clearly needs a C++11 compatible
compiler.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
