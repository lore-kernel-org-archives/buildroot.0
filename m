From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 23:16:40 +0200
Subject: [Buildroot] [PATCH 1/1] qhull: new package
In-Reply-To: <1397767755-17045-1-git-send-email-d.viti@infosolution.it>
References: <1397767755-17045-1-git-send-email-d.viti@infosolution.it>
Message-ID: <20140417231640.2d48cc6c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Thu, 17 Apr 2014 22:49:15 +0200, Davide Viti wrote:

> diff --git a/package/qhull/Config.in b/package/qhull/Config.in
> new file mode 100644
> index 0000000..e64025e
> --- /dev/null
> +++ b/package/qhull/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_QHULL
> +	bool "qhull"
> +	help
> +	  Qhull computes the convex hull, Delaunay triangulation,
> +	  Voronoi diagram, halfspace intersection about a point,
> +	  furthest-site Delaunay triangulation, and furthest-site
> +	  Voronoi diagram. The source code runs in 2-d, 3-d, 4-d, and
> +	  higher dimensions. Qhull implements the Quickhull algorithm
> +	  for computing the convex hull. It handles roundoff errors
> +	  from floating point arithmetic. It computes volumes, surface
> +	  areas, and approximations to the convex hull.

I'm just curious: are you using this kind of libraries in embedded
Linux systems? What kind of applications do they do?

> diff --git a/package/qhull/qhull.mk b/package/qhull/qhull.mk
> new file mode 100644
> index 0000000..08d3fa4
> --- /dev/null
> +++ b/package/qhull/qhull.mk
> @@ -0,0 +1,15 @@
> +###############################################################################
> +#
> +# qhull
> +#
> +###############################################################################
> +
> +QHULL_VERSION = 60d55819729d7b49391dde0271e15a56c70992b9
> +QHULL_SITE = git://gitorious.org/qhull/qhull.git

Is it possible to use an http:// URL instead for cloning? It usually
works better for people behind stupid corporate firewalls/proxies.

> +QHULL_SITE_METHOD = git
> +QHULL_INSTALL_STAGING = YES
> +QHULL_LICENSE = BSD-Style
> +QHULL_LICENSE_FILES = COPYING.txt
> +QHULL_CONF_OPT = -DCMAKE_BUILD_TYPE=Release

qhull seems to be using quite a bit of C++ code. Maybe it should
depends on BR2_INSTALL_LIBSTDCPP ?

Can you try building it with the following minimal configurations:

 http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-basic.config
 http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-full-nothread.config
 http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-uclinux.config

it is useful to check a few dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
