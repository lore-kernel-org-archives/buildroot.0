From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Oct 2019 01:00:37 +0200
Subject: [Buildroot] [RFC PATCH 4/4] package/qt5/qt5base: support
 ti-sgx-libgbm
In-Reply-To: <20191015213101.27460-4-lothar.felten@gmail.com>
References: <20191015213101.27460-1-lothar.felten@gmail.com>
 <20191015213101.27460-4-lothar.felten@gmail.com>
Message-ID: <f174a50b-69c9-4171-994a-32be7ec74c7e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/10/2019 23:31, Lothar Felten wrote:
> qt5 configure options: add ti-sgx-libgbm as GBM backend
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index e4aa76908..0caa57000 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -74,10 +74,13 @@ else
>  QT5BASE_CONFIGURE_OPTS += -no-kms
>  endif
>  
> -# Uses libgbm from mesa3d
> +# Uses libgbm from mesa3d or ti-sgx-libgbm
>  ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
>  QT5BASE_CONFIGURE_OPTS += -gbm
>  QT5BASE_DEPENDENCIES += mesa3d
> +else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)

 I would swap the two so TI gets priority if both are selected.

 Note that there was also talk about making gbm a virtual package (with
currently mesa3d and ti-sgx-libgbm as providers). IIRC, though, the TI gbm
package was not 100% compatible. But apparently it's good enough to build qt5 then?

 And what about waffle and mesa3d-demos?

 Note that we don't require you to figure all of this out before we can apply
these patches. But maybe you know a little bit more about it.

 Regards,
 Arnout

> +QT5BASE_CONFIGURE_OPTS += -gbm
> +QT5BASE_DEPENDENCIES += ti-sgx-libgbm
>  else
>  QT5BASE_CONFIGURE_OPTS += -no-gbm
>  endif
> 
