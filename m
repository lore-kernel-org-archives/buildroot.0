From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 21:46:41 +0100
Subject: [Buildroot] [Patch v2 1/9] skalibs: new package
In-Reply-To: <1481397650-14664-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20161210214641.05e6af92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 10 Dec 2016 20:20:42 +0100, Eric Le Bihan wrote:
> This new package provides skalibs, a collection of free software / open
> source C development files used for building all software from
> skarnet.org.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

This looks pretty good, I only have a few comments, see below.

> diff --git a/package/skalibs/0001-No-runtime-tests-for-endianness.patch b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
> new file mode 100644
> index 0000000..7a711d5
> --- /dev/null
> +++ b/package/skalibs/0001-No-runtime-tests-for-endianness.patch
> @@ -0,0 +1,93 @@
> +From 1e6f0b094c6ce6454be572704b866d2ce0962e59 Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Sun, 4 Dec 2016 19:10:40 +0100
> +Subject: [PATCH 1/2] No runtime tests for endianness

Please generate your patches with "git format-patch -N", because we
want [PATCH] instead of [PATCH 1/2].

> +Replace build and execution of runtime test programs for determining
> +the endianness of the target with compile time test programs.
> +
> +This improves support for cross-compilation.

Missing your SoB.

> diff --git a/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
> new file mode 100644
> index 0000000..c58af33
> --- /dev/null
> +++ b/package/skalibs/0002-No-runtime-tests-for-type-sizes.patch
> @@ -0,0 +1,52 @@
> +From d868600a3f437750bc44a783d677a25a48100096 Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Sun, 4 Dec 2016 19:11:25 +0100
> +Subject: [PATCH 2/2] No runtime tests for type sizes
> +
> +Replace build and execution of runtime test programs for determining
> +some type sizes of the target with compile time test programs.
> +
> +This improves support for cross-compilation.

Same comments: git format-patch -N + SoB.

Have you submitted those patches upstream?

> diff --git a/package/skalibs/Config.in b/package/skalibs/Config.in
> new file mode 100644
> index 0000000..307b016
> --- /dev/null
> +++ b/package/skalibs/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_SKALIBS
> +	bool "skalibs"
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  skalibs is a package centralizing the free software / open source C

This line looks too long. Lines should be wrapped at 72 characters.


> +define SKALIBS_REMOVE_STATIC_LIB_DIR
> +	rm -rf $(TARGET_DIR)/usr/lib/skalibs
> +endef
> +
> +SKALIBS_POST_INSTALL_TARGET_HOOKS += SKALIBS_REMOVE_STATIC_LIB_DIR

What is this static lib dir thing? If skalibs installs its static
libraries in $(STAGING_DIR)/usr/lib/skalibs/ instead of the default
$(STAGING_DIR)/usr/lib, then the linker will not find them.

> +HOST_SKALIBS_CONF_OPTS = \
> +	--prefix=/usr \

This should be:

	--prefix=$(HOST_DIR)/usr

> +	--disable-static \
> +	--enable-shared \
> +	--disable-allstatic
> +
> +define HOST_SKALIBS_CONFIGURE_CMDS
> +	(cd $(@D); $(HOST_CONFIGURE_OPTS) ./configure $(HOST_SKALIBS_CONF_OPTS))
> +endef
> +
> +define HOST_SKALIBS_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR)

Why do you have DESTDIR set at build time? You're not passing DESTDIR
when building the target variant.

> +endef
> +
> +define HOST_SKALIBS_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) install

If you pass --prefix=$(HOST_DIR)/usr as suggested above, then passing
DESTDIR here should no longer be needed.

In the commit log, it would be good to mention why a host variant of
the package is introduced.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
