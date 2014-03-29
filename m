From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Mar 2014 12:51:58 +0100
Subject: [Buildroot] [PATCH 5/6] python-m2crypto: requires host-python2
In-Reply-To: <1394057085-10399-6-git-send-email-s.martin49@gmail.com>
References: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
 <1394057085-10399-6-git-send-email-s.martin49@gmail.com>
Message-ID: <20140329115158.GH3227@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-03-05 23:04 +0100, Samuel Martin spake thusly:
> Acording to its homepage [1], m2crypto does not support python3 yet.
> 
> So, this patch forces building the host m2crypto module for pyhton2.
> 
> [1] https://pypi.python.org/pypi/M2Crypto
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewd-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

If the variable gets renamed, my reviewed-by still stands.

Regards,
Yann E. MORIN.

> ---
>  package/python-m2crypto/python-m2crypto.mk | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
> index dd0f77e..62dc720 100644
> --- a/package/python-m2crypto/python-m2crypto.mk
> +++ b/package/python-m2crypto/python-m2crypto.mk
> @@ -10,12 +10,16 @@ PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
>  PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
>  HOST_PYTHON_M2CRYPTO_DEPENDENCIES = host-openssl host-swig
>  
> -# We need to override the build commands to be able to use build_ext,
> -# which accepts the --openssl option.
> +# We need to use python2 because m2crypto is not python3 compliant.
> +HOST_PYTHON_M2CRYPTO_FORCE_HOST_PYTHON = python2
> +
> +# * We need to override the build commands to be able to use build_ext,
> +#   which accepts the --openssl option.
> +# * Use python2 interpreter to avoid trying building some python3 objects.
>  define HOST_PYTHON_M2CRYPTO_BUILD_CMDS
>  	(cd $(@D); \
>  		$(HOST_PKG_PYTHON_SETUPTOOLS_ENV) \
> -		$(HOST_DIR)/usr/bin/python setup.py build_ext \
> +		$(HOST_DIR)/usr/bin/python2 setup.py build_ext \
>  			--openssl=$(HOST_DIR)/usr)
>  endef
>  
> -- 
> 1.9.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
