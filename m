From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 22:24:11 +0200
Subject: [Buildroot] [PATCH 14/34] reproducibility/python: also remove
 pyo files
In-Reply-To: <1462002570-14706-14-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-14-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507222411.4a47806a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:49:10 +0200, Gilles Chanteperdrix wrote:
> when BR2_PACKAGE_PYTHON_PY_ONLY is selected. Make that option the
> default when BR2_REPRODUCIBLE is selected in order to avoid problems
> with timestamps embedded in compiled python files.

The title of the patch says "also remove pyo files", but this patch
does a lot more.

> diff --git a/package/python/Config.in b/package/python/Config.in
> index fa83e77..2c62559 100644
> --- a/package/python/Config.in
> +++ b/package/python/Config.in
> @@ -19,7 +19,8 @@ if BR2_PACKAGE_PYTHON
>  
>  choice
>  	prompt "python module format to install"
> -	default BR2_PACKAGE_PYTHON_PYC_ONLY
> +	default BR2_PACKAGE_PYTHON_PYC_ONLY if !BR2_REPRODUCIBLE
> +	default BR2_PACKAGE_PYTHON_PY_ONLY if BR2_REPRODUCIBLE

If .pyc files are really not suitable for reproducible builds, then the
option of having .pyc files should be completely hidden when
BR2_REPRODUCIBLE=y.

> diff --git a/package/python/python.mk b/package/python/python.mk
> index 80ffbde..5c5ebb8 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -225,7 +225,7 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
>  define PYTHON_FINALIZE_TARGET
> -	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | xargs -0 rm -f
> +	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py[co]' -print0 | xargs -0 rm -f

This part is already handled in another patch series I have sent around
Python. See https://patchwork.ozlabs.org/patch/617272/ specifically.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
