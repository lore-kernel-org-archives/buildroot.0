From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 18:59:47 +0200
Subject: [Buildroot] [PATCH 1/4] package/efl: add OpenGL/OpenGLES support
In-Reply-To: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
References: <1473282523-12796-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160917185947.17d06a7c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Sep 2016 23:08:40 +0200, Romain Naour wrote:

> +choice
> +	bool "OpenGL support"
> +	default BR2_PACKAGE_EFL_OPENGL   if BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_XORG7
> +	default BR2_PACKAGE_EFL_OPENGLES if BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES

Those defaults are not really needed, and they are not great as they
duplicate the dependencies of the options.

Instead, I've moved the "none" choice at the end, and just relied on
kconfig's behavior that consists in automatically selecting the first
choice that has its dependencies met.


> +ifeq ($(BR2_PACKAGE_EFL_OPENGL),y)
> +EFL_CONF_OPTS += --with-opengl=full
> +EFL_DEPENDENCIES += libgl
> +endif
> +
> +# OpenGL ES requires EGL
> +ifeq ($(BR2_PACKAGE_EFL_OPENGLES),y)
> +EFL_CONF_OPTS += --with-opengl=es --enable-egl
> +EFL_DEPENDENCIES += libegl libgles
> +endif
> +
> +ifeq ($(BR2_PACKAGE_EFL_OPENGL_NONE),y)
> +EFL_CONF_OPTS += --with-opengl=none
> +endif

Since they are mutually exclusive, I've changed this by a:

ifeq ...
...
else ifeq ...
...
else ifeq ...
...
endif

block.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
