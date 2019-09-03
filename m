From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 3 Sep 2019 23:29:00 +0200
Subject: [Buildroot] [PATCH/next v10 01/12] package/python3-mako: new
 package
In-Reply-To: <20190828162146.19585-1-bernd.kuhls@t-online.de>
References: <20190828162146.19585-1-bernd.kuhls@t-online.de>
Message-ID: <9efedd39-c705-454f-7de5-7a943276719a@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

Le 28/08/2019 ? 18:21, Bernd Kuhls a ?crit?:
> From: Romain Naour <romain.naour@smile.fr>
> 
> host-python3-mako will be used by python 3 only script used in the
> build system of mesa3d package.
> 
> There is no way to force building host-oython-mako for python2 and
> python3 [1].
> 
> [1] http://patchwork.ozlabs.org/patch/1084248/

I believe this patch is blocking the series from being merged.

It's pity since several users already reported having tested the series [1] [2]
and waiting for the version bump.

During the last Buildroot summer camp, we have discussed about building
unconditionally python3 interpreter and it's modules for the host.

Only packages that need a python2 interpreter can explicitly add host-python2 as
dependency and use explicitly the path to the python2 interpreter. We assumes
that no python2 modules are needed in this case.

Maybe we can merge the series as is, and rework the python infra before 2019.11?

[1] https://bugs.busybox.net/show_bug.cgi?id=11906
[2] http://lists.busybox.net/pipermail/buildroot/2019-September/258392.html

Best Regards,
Romain

> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/python-mako/python-mako.mk     |  2 ++
>  package/python3-mako/python3-mako.hash |  1 +
>  package/python3-mako/python3-mako.mk   | 21 +++++++++++++++++++++
>  3 files changed, 24 insertions(+)
>  create mode 120000 package/python3-mako/python3-mako.hash
>  create mode 100644 package/python3-mako/python3-mako.mk
> 
> diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
> index 0d06dc4986..f8478cf031 100644
> --- a/package/python-mako/python-mako.mk
> +++ b/package/python-mako/python-mako.mk
> @@ -4,6 +4,8 @@
>  #
>  ################################################################################
>  
> +# Please keep in sync with
> +# package/python3-mako/python3-mako.mk
>  PYTHON_MAKO_VERSION = 1.0.6
>  PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
>  PYTHON_MAKO_SITE = https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e
> diff --git a/package/python3-mako/python3-mako.hash b/package/python3-mako/python3-mako.hash
> new file mode 120000
> index 0000000000..068be91fb0
> --- /dev/null
> +++ b/package/python3-mako/python3-mako.hash
> @@ -0,0 +1 @@
> +../python-mako/python-mako.hash
> \ No newline at end of file
> diff --git a/package/python3-mako/python3-mako.mk b/package/python3-mako/python3-mako.mk
> new file mode 100644
> index 0000000000..41249bb040
> --- /dev/null
> +++ b/package/python3-mako/python3-mako.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# python3-mako
> +#
> +################################################################################
> +
> +# Please keep in sync with
> +# package/python-mako/python-mako.mk
> +PYTHON3_MAKO_VERSION = 1.0.6
> +PYTHON3_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
> +PYTHON3_MAKO_SITE = https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e
> +PYTHON3_MAKO_SETUP_TYPE = setuptools
> +PYTHON3_MAKO_LICENSE = MIT
> +PYTHON3_MAKO_LICENSE_FILES = LICENSE
> +HOST_PYTHON3_MAKO_DL_SUBDIR = python-mako
> +HOST_PYTHON3_MAKO_NEEDS_HOST_PYTHON = python3
> +
> +# In host build, setup.py tries to download markupsafe if it is not installed
> +HOST_PYTHON3_MAKO_DEPENDENCIES = host-python-markupsafe
> +
> +$(eval $(host-python-package))
> 
