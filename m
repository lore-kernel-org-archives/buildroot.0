From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:38:30 +0200
Subject: [Buildroot] [PATCH] boost: disable locale and regex modules if
 static build and icu are enabled
In-Reply-To: <1494408354-20297-1-git-send-email-yegorslists@googlemail.com>
References: <1494408354-20297-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20170511213830.252bddbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 May 2017 11:25:54 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Boost build system doesn't support ICU static only building [1], so
> so disable locale and regex modules for this case.
> 
> [1] http://boost.2283326.n4.nabble.com/bjam-Building-Regex-with-static-runtime-linking-td2588874.html

This thread doesn't really say it doesn't support ICU static linking. I
found https://svn.boost.org/trac/boost/ticket/9685 to be somewhat more
informative.

>  config BR2_PACKAGE_BOOST_LOCALE
>  	bool "boost-locale"
> +	# Boost build system doesn't support ICU static only building
> +	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  
>  config BR2_PACKAGE_BOOST_LOG
> @@ -134,6 +136,8 @@ config BR2_PACKAGE_BOOST_RANDOM
>  
>  config BR2_PACKAGE_BOOST_REGEX
>  	bool "boost-regex"
> +	# Boost build system doesn't support ICU static only building
> +	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_ICU)

Is this the right way? Wouldn't it be better to do:

ifeq ($(BR2_PACKAGE_ICU):$(BR2_STATIC_LIBS),y:)
BOOST_FLAGS += --with-icu=$(STAGING_DIR)/usr
BOOST_DEPENDENCIES += icu
else
BOOST_FLAGS += --without-icu
endif

My understanding is that it's not Boost::Locale and Boost::Regex that
have a problem, but the fact of using ICU in a static linking
situation. If that's the case, then I believe tweaking the .mk file to
not use ICU in static linking scenarios is probably better.

What do you think? Could you test this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
