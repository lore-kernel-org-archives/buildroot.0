From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:27:05 +1300
Subject: [Buildroot] [PATCH 2/2] Update documentation of CMake
 infrastructure
In-Reply-To: <20170106223748.2203-2-cedric.marie@openmailbox.org>
References: <20170106223748.2203-1-cedric.marie@openmailbox.org>
 <20170106223748.2203-2-cedric.marie@openmailbox.org>
Message-ID: <20170125162705.7b50849e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Jan 2017 23:37:48 +0100, C?dric Marie wrote:

> diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
> index 6ccf390..06331dd 100644
> --- a/docs/manual/adding-packages-cmake.txt
> +++ b/docs/manual/adding-packages-cmake.txt
> @@ -117,25 +117,38 @@ typical packages will therefore only use a few of them.
>    the given package, for one reason or another. By default, set to
>    +$(MAKE)+. If parallel building is not supported by the package,
>    then it should be set to +LIBFOO_MAKE=$(MAKE1)+.
> +  When +BR2_CMAKE_USE_NINJA_BACKEND+ is enabled, the default value is
> +  +$(HOST_DIR)/usr/bin/ninja+. If parallel building is not supported by
> +  the package, then it should be set to
> +  +LIBFOO_MAKE=$(HOST_DIR)/usr/bin/ninja -j1+.

That's a bit annoying, because it means packages would have to do:

ifeq ($(BR2_CMAKE_USE_NINJA_BACKEND),y)
LIBFOO_MAKE = $(HOST_DIR)/usr/bin/ninja -j1
else
LIBFOO_MAKE = $(MAKE1)
endif

So perhaps in this case we instead need a variable like
LIBFOO_SUPPORTS_PARALLEL_BUILD so that the infrastructure can do the
right thing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
