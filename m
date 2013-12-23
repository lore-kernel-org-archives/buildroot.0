From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Dec 2013 20:21:15 +0200
Subject: [Buildroot] [PATCH] package/python-pycrypto: fix legal-info
In-Reply-To: <1387820388-30587-1-git-send-email-yann.morin.1998@free.fr>
References: <1387820388-30587-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20131223182115.GD4435@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Dec 23, 2013 at 06:39:48PM +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The pycrypto package contains a LICENSE.orig file, but apply-patches.sh
> removes all .orig file, so we can't list a .orig file asa license file,

as a

> as it would have disapeared by the time 'make legal-info' sould be called.
> 
> Add a post-extract hook that renames this license file, so it is renamed
> just before we apply patches and remove .orig files.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  package/python-pycrypto/python-pycrypto.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
> index eda48bd..f872ccc 100644
> --- a/package/python-pycrypto/python-pycrypto.mk
> +++ b/package/python-pycrypto/python-pycrypto.mk
> @@ -11,7 +11,17 @@ PYTHON_PYCRYPTO_SETUP_TYPE = distutils
>  
>  PYTHON_PYCRYPTO_LICENSE = Public Domain, Python 2.2 License (HMAC.py, setup.py)
>  PYTHON_PYCRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.libtom \
> -		LEGAL/copy/LICENSE.orig LEGAL/copy/LICENSE.python-2.2
> +		LEGAL/copy/LICENSE.python-2.2

You remove LICENSE.orig from the list, but don't add LICENSE.original.

> +
> +# The pycrypto package contains a LICENSE.orig file, but our patching
> +# infrastrucure removes all .orig file, so we must rename that license
> +# file prior to patching, so it is still available to the legal-info
> +# infrastructure
> +define PYTHON_PYCRYPTO_RENAME_LICENSE
> +	mv $(@D)/LEGAL/copy/LICENSE.orig $(@D)/LEGAL/copy/LICENSE.original
> +endef
> +PYTHON_PYCRYPTO_POST_EXTRACT_HOOKS += PYTHON_PYCRYPTO_RENAME_LICENSE
> +PYTHON_PYCRYPTO_LICENSE_FILES += LEGAL/copy/LICENSE.original
>  
>  PYTHON_PYCRYPTO_DEPENDENCIES = gmp

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
