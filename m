From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Mar 2017 21:57:27 +0100
Subject: [Buildroot] [PATCH v2,1/2] libmediaart: new package
In-Reply-To: <1490387931-113759-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1490387931-113759-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <20170324215727.3d17fc1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Mar 2017 21:38:50 +0100, Fabrice Fontaine wrote:

> +else ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_QT),y)
> +# qt5 needs c++11 (since qt-5.7)
> +ifeq ($(BR2_QT5_VERSION_LATEST),y)

Should be:

 BR2_PACKAGE_QT5_VERSION_LATEST

It has been changed in commit
https://git.buildroot.org/buildroot/commit/package/qt5/Config.in?id=49a33d3a229571e22ab783cbb1e5cace06ad7b99.

> +LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
> +endif
> +LIBMEDIAART_DEPENDENCIES += \
> +	$(if $(BR2_PACKAGE_QT),qt) \
> +	$(if $(BR2_PACKAGE_QT5),qt5base)
> +LIBMEDIAART_CONF_OPTS += \
> +	--disable-gdkpixbuf \
> +	--enable-qt
> +else ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_NONE),y)
> +LIBMEDIAART_CONF_OPTS += \
> +	--disable-gdkpixbuf \
> +	--disable-qt
> +endif

Are the backends really mutually exclusive?

Why don't we simply do:

ifeq ($(BR2_PACKAGE_QT)$(BR2_PACKAGE_QT5),y)
... enable QT backend ...
else
... disable QT backend
endif

ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
... enable GDK pixbuf backend ...
else
... disable GDK pixbuf backend ...
endif

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
