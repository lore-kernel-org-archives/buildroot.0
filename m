From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Dec 2015 23:36:47 +0100
Subject: [Buildroot] [PATCH] python-m2crypto: different fix for the
	OpenSSL problem
In-Reply-To: <1449651316-31595-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1449651316-31595-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151209223647.GD3743@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-09 09:55 +0100, Thomas Petazzoni spake thusly:
> m2crypto provides a --openssl option to specify the location of the
> OpenSSL library, when not installed in /usr. However, this option does
> not apply to the standard "build" command normally called by the
> python-package infrastructure, but only to the "build_ext" command.
> 
> This already required to override the default python-package build
> commands for this package. Moreover, this the last bump to version
> 0.22.5, things got even more complicated since calling just
> "build_ext" does not work, and additional quirks are needed.
> 
> This commit proposes to get away with this by relying on the default
> python-package behavior, and simply hardcoding the OpenSSL location by
> patching the setup.py script in a post-patch hook.
> 
> This issue has also been reported upstream at
> https://gitlab.com/m2crypto/m2crypto/issues/89.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

As discussed on IRC, this is still an ugly hack. But it is less code
than the current situation, so it's better.

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  package/python-m2crypto/python-m2crypto.mk | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
> index 1f038e3..0416957 100644
> --- a/package/python-m2crypto/python-m2crypto.mk
> +++ b/package/python-m2crypto/python-m2crypto.mk
> @@ -13,20 +13,16 @@ HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
>  # We need to use python2 because m2crypto is not python3 compliant.
>  HOST_PYTHON_M2CRYPTO_NEEDS_HOST_PYTHON = python2
>  
> -HOST_PYTHON_M2CRYPTO_BUILD_DIR = $(@D)/build/lib.linux-$(HOSTARCH)-$(PYTHON_VERSION_MAJOR)
> -
> -# * We need to override the build commands to be able to use build_ext,
> -#   which accepts the --openssl option.
> -# * Use python2 interpreter to avoid trying building some python3 objects.
> -# * because build_ext is flawed, is forgets to copy the files prior to
> -#   the build, so we do it manually.
> -define HOST_PYTHON_M2CRYPTO_BUILD_CMDS
> -	mkdir -p $(HOST_PYTHON_M2CRYPTO_BUILD_DIR)
> -	cp -av $(@D)/M2Crypto $(HOST_PYTHON_M2CRYPTO_BUILD_DIR)/M2Crypto
> -	(cd $(@D); \
> -		$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
> -		$(HOST_DIR)/usr/bin/python2 setup.py build_ext \
> -			--openssl=$(HOST_DIR)/usr)
> +# The --openssl option that allows to specify a custom path to OpenSSL
> +# can only be used with the non-default build_ext setup.py command,
> +# and calling this command directly fails. To work around this, simply
> +# hardcode the path to OpenSSL in setup.py.
> +# Bug reported at https://gitlab.com/m2crypto/m2crypto/issues/89
> +define HOST_PYTHON_M2CRYPTO_SET_OPENSSL_PATH
> +	$(SED) "s%self.openssl = '/usr'%self.openssl = '$(HOST_DIR)/usr'%" \
> +		$(@D)/setup.py
>  endef
>  
> +HOST_PYTHON_M2CRYPTO_POST_PATCH_HOOKS += HOST_PYTHON_M2CRYPTO_SET_OPENSSL_PATH
> +
>  $(eval $(host-python-package))
> -- 
> 2.6.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
