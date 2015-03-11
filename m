From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 21:42:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/Makefile.in: Do not add
 --enable-debug flag.
In-Reply-To: <1426093401-23108-1-git-send-email-johan.oudinet@gmail.com>
References: <1426093401-23108-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150311214225.746fe0cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Wed, 11 Mar 2015 18:03:21 +0100, Johan Oudinet wrote:
> Adding this flag when BR2_ENABLE_DEBUG is activated make several
> packages to produce binaries that do not work as expected (e.g., dhcp,
> lame, nano). Moreover, the help message of BR2_ENABLE_DEBUG does not
> say it is adding this flag. It is supposed to build packages with
> debugging symbols enabled. So, let it do that only.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

I am personally in favor of this change, so thanks for bringing it up.

> -ifeq ($(BR2_ENABLE_DEBUG),y)
> -ENABLE_DEBUG := --enable-debug
> -else
> +ifneq ($(BR2_ENABLE_DEBUG),y)
>  ENABLE_DEBUG := --disable-debug
>  endif

So if we have BR2_ENABLE_DEBUG enabled, then we don't pass
--disable-debug. And when BR2_ENABLE_DEBUG is disabled, we're passing
it. I'm not sure to understand the logic here.

Shouldn't we simply unconditionally pass --disable-debug, or not pass
anything at all?

Also, a number of packages had workarounds in their specific .mk file
to avoid --enable-debug. It would be good to get rid of such
workarounds as well.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
