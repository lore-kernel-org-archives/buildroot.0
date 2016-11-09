From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Nov 2016 11:33:46 +0200
Subject: [Buildroot] [PATCH 1/2] python: fix double format detection
In-Reply-To: <20161109092508.4503-1-jezz@sysmic.org>
References: <20161109092508.4503-1-jezz@sysmic.org>
Message-ID: <20161109093346.czsh5oyvfcpzqjfa@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?r?me,

On Wed, Nov 09, 2016 at 10:25:07AM +0100, J?r?me Pouiller wrote:
> Python is not able to detect if compiler double representation is
> compliant with IEE754:
> 
>   checking whether C doubles are little-endian IEEE 754 binary64... no
>   checking whether C doubles are big-endian IEEE 754 binary64... no
>   checking whether C doubles are ARM mixed-endian IEEE 754 binary64... no
> 
> Accordingly 'legacy' mode isused. It is possible to check this at runtime by
> check if 'sys.float_repr_style' contains 'short' or 'legacy'. Calculus
> correctness is not garanteed with 'legacy'.
> 
> Problem is better described here:
> 
>   http://stackoverflow.com/questions/29920294/what-causes-pythons-float-repr-style-to-use-legacy
>   https://bugs.python.org/issue7117
> 
> However, all gcc architecture use a representation compliant with IEE754. So,
> we can enable it unconditionnaly.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/python/python.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/python/python.mk b/package/python/python.mk
> index cc65376..0191d59 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -140,6 +140,13 @@ PYTHON_CONF_ENV += \
>  	ac_cv_prog_HAS_HG=/bin/false \
>  	ac_cv_prog_SVNVERSION=/bin/false
>  
> +# GCC is always complient with IEEE754
> +ifeq ($(call qstrip,$(BR2_ENDIAN)),LITTLE)

I think that

  ifeq ($(BR2_ENDIAN),"LITTLE")

is more readable. That's what most other <pkg>.mk files do.

> +PYTHON_CONF_ENV += ac_cv_little_endian_double=yes
> +else
> +PYTHON_CONF_ENV += ac_cv_big_endian_double=yes
> +endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
