From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 21:44:11 +0200
Subject: [Buildroot] [PATCH v1 1/4] package/python-colorzero: new package
In-Reply-To: <20200613192034.10286-1-ps.report@gmx.net>
References: <20200613192034.10286-1-ps.report@gmx.net>
Message-ID: <20200618214411.07323fbd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Jun 2020 21:20:31 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've applied, after doing some tweaks. See below.

> diff --git a/package/python-colorzero/Config.in b/package/python-colorzero/Config.in
> new file mode 100644
> index 0000000000..58af9f49e9
> --- /dev/null
> +++ b/package/python-colorzero/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_COLORZERO
> +	bool "python-colorzero"
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime

I couldn't see any trace of setuptools being needed on the target at
runtime, neither in the setup.py, nor in the code, and I was able to
run your test cases without python-setuptools on the target. So I
dropped this.

> diff --git a/package/python-colorzero/python-colorzero.hash b/package/python-colorzero/python-colorzero.hash
> new file mode 100644
> index 0000000000..12be3bb46e
> --- /dev/null
> +++ b/package/python-colorzero/python-colorzero.hash
> @@ -0,0 +1,4 @@
> +# Locally computed
> +sha256  24d30b55793150f9ae7478f8aa2126fe5598a31f928907eadbf9d5a19aa9964c  python-colorzero-release-1.1.tar.gz
> +# Locally computed
> +sha256  47778d78e05bb6c39c022814e3712a0327c6418c7251757e72167ab8ff12bb4d  LICENSE.txt
> diff --git a/package/python-colorzero/python-colorzero.mk b/package/python-colorzero/python-colorzero.mk
> new file mode 100644
> index 0000000000..6ba421f89c
> --- /dev/null
> +++ b/package/python-colorzero/python-colorzero.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-colorzero
> +#
> +################################################################################
> +
> +PYTHON_COLORZERO_VERSION = release-1.1
> +PYTHON_COLORZERO_SITE = $(call github,waveform80,colorzero,$(PYTHON_COLORZERO_VERSION))

We prefer this:

PYTHON_COLORZERO_VERSION = 1.1
PYTHON_COLORZERO_SITE = $(call github,waveform80,colorzero,release-$(PYTHON_COLORZERO_VERSION))

i.e, the VERSION field contains really just the version.

> +PYTHON_COLORZERO_LICENSE = BSD-3-Clause 

There was a trailing space on this line, reported by check-package.

I fixed those nits, and applied!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
