From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Sep 2020 22:26:15 +0200
Subject: [Buildroot] [PATCH] package/python-m2crypto: add package
In-Reply-To: <20200918151852.1148219-1-gustavo@gsthnz.com>
References: <20200918151852.1148219-1-gustavo@gsthnz.com>
Message-ID: <20200922222615.797ea14d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Sep 2020 12:18:51 -0300
Gustavo Heinz <gustavo@gsthnz.com> wrote:

> Signed-off-by: Gustavo Heinz <gustavo@gsthnz.com>

Thanks for your contribution. I have applied, with just a few tweaks.

> diff --git a/package/python-m2crypto/Config.in b/package/python-m2crypto/Config.in
> new file mode 100644
> index 0000000000..385a16cac6
> --- /dev/null
> +++ b/package/python-m2crypto/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_PYTHON_M2CRYPTO
> +	bool "python-m2crypto"
> +	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
> +	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
> +    select BR2_PACKAGE_PYTHON_TYPING if BR2_PACKAGE_PYTHON # runtime

There was an indentation issue here, and you forgot to select
BR2_PACKAGE_OPENSSL: it is a build dependency, it must be selected.

> +PYTHON_M2CRYPTO_VERSION = 0.36.0
> +PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
> +PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/ff/df/84609ed874b5e6fcd3061a517bf4b6e4d0301f553baf9fa37bef2b509797
> +PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
> +PYTHON_M2CRYPTO_LICENSE = MIT
> +PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
> +PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
> +PYTHON_M2CRYPTO_BUILD_OPTS = "--openssl=$(TARGET_DIR)/usr"

No need for the double quotes, but more importantly, you should not use
TARGET_DIR here, but STAGING_DIR.

I fixed that up when applying.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
