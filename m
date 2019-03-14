From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 11:07:46 +0100
Subject: [Buildroot] [PATCH v2 01/13] qt5base: Do not build shared libs
 if BR2_STATIC_LIBS is chosen
In-Reply-To: <20190314094024.1961-2-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
 <20190314094024.1961-2-anaumann@ultratronik.de>
Message-ID: <20190314110746.71b77979@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Mar 2019 10:40:12 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> Traditionlly we configured qt5 to always build shared libraries. This resulted

Typo: traditionally

> in many conditionals when setting buildroot to static-libs only, because each
> module's target install had to be guarded.
> So to avoid this and simplify target install in a subsequent commit, configure
> qt to build (and install) only the type of libs which the buildroot defconfig
> is set to.
> Unfortunately it seems that Qt does not support building both dynamic and static
> libs at the same time, so we still set it shared if buildroot asks for both.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/qt5/qt5base/qt5base.mk | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index e7f6e658f1..a0492418be 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -24,8 +24,15 @@ QT5BASE_CONFIGURE_OPTS += \
>  	-no-iconv \
>  	-system-zlib \
>  	-system-pcre \
> -	-no-pch \
> -	-shared
> +	-no-pch
> +
> +ifeq ($(BR2_SHARED_LIBS),y)
> +QT5BASE_CONFIGURE_OPTS += -shared -no-static
> +else ifeq ($(BR2_STATIC_LIBS),y)
> +QT5BASE_CONFIGURE_OPTS += -no-shared -static
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +QT5BASE_CONFIGURE_OPTS += -shared

Is there any difference between "-shared -no-static" and just
"-shared" ?

IOW, if Qt doesn't support building both shared and static, then we
should probably do:

ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
QT5BASE_CONFIGURE_OPTS += -shared -no-static
else
QT5BASE_CONFIGURE_OPTS += -no-shared -static
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
