From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 7 Apr 2017 12:17:26 +0200
Subject: [Buildroot] [PATCH] pkg-python: ignore user site-packages
	directory
In-Reply-To: <20170406184608.22111-1-yegorslists@googlemail.com>
References: <20170406184608.22111-1-yegorslists@googlemail.com>
Message-ID: <CAGm1_kvcgAXsGvWDq1X=op7DZkhALfJvujH3j=XWYSG1UHTnxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 6, 2017 at 8:46 PM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> According to PEP 370 Python will also search for the packages in the
> user site-packages directory. This can affect build reproducibility.
>
> The solution is to use PYTHONNOUSERSITE=1 for all Python packages,
> i.e. both host and target variants.

I've built a rather basic BR configuration with Python 2.7 and
experienced no problems.

@Anton: could you test the patch and let us know, whether it fixes your issue?

Yegor

> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/pkg-python.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index fb124e1dd..2418f5dfa 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -32,6 +32,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
>         LDFLAGS="$(TARGET_LDFLAGS)" \
>         LDSHARED="$(TARGET_CROSS)gcc -shared" \
>         PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
> +       PYTHONNOUSERSITE=1 \
>         _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>         _python_sysroot=$(STAGING_DIR) \
>         _python_prefix=/usr \
> @@ -48,7 +49,8 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
>
>  # Host distutils-based packages
>  HOST_PKG_PYTHON_DISTUTILS_ENV = \
> -       PATH=$(BR_PATH)
> +       PATH=$(BR_PATH) \
> +       PYTHONNOUSERSITE=1
>
>  HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
>         --prefix=$(HOST_DIR)/usr
> @@ -58,6 +60,7 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
>         _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>         PATH=$(BR_PATH) \
>         PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
> +       PYTHONNOUSERSITE=1 \
>         _python_sysroot=$(STAGING_DIR) \
>         _python_prefix=/usr \
>         _python_exec_prefix=/usr
> @@ -76,7 +79,8 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
>
>  # Host setuptools-based packages
>  HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
> -       PATH=$(BR_PATH)
> +       PATH=$(BR_PATH) \
> +       PYTHONNOUSERSITE=1
>
>  HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>         --prefix=$(HOST_DIR)/usr
> --
> 2.11.0
>
