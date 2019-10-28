From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Oct 2019 23:35:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst1-validate: allow to use
 host-python3 and target python3
In-Reply-To: <20191028111556.245007-1-titouan.christophe@railnova.eu>
References: <20191028111556.245007-1-titouan.christophe@railnova.eu>
Message-ID: <79878267-e1f5-e992-985b-46d50c18e687@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 12:15, Titouan Christophe wrote:
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> ---
>  package/gstreamer1/gst1-validate/Config.in        | 6 ++++--
>  package/gstreamer1/gst1-validate/gst1-validate.mk | 8 ++++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
> index 2022d38d99..63bce613ed 100644
> --- a/package/gstreamer1/gst1-validate/Config.in
> +++ b/package/gstreamer1/gst1-validate/Config.in
> @@ -1,9 +1,10 @@
>  config BR2_PACKAGE_GST1_VALIDATE
>  	bool "gst1-validate"
> -	depends on BR2_PACKAGE_PYTHON
> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

 Not directly related to this patch, but it would be better to use a select
instead of a depends here. 'depends' is for packages that are really
Python-related. 'select' is for when it's a package that just happens to be
implemented in python, like e.g. dstat. The boundary is sometimes a bit thin,
but I think in this case it's clearly the latter. But anyway, that's a separate
patch.

>  	select BR2_PACKAGE_GST1_PLUGINS_BASE
>  	select BR2_PACKAGE_JSON_GLIB
> -	select BR2_PACKAGE_PYTHON_PYEXPAT
> +	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3

 There is no python3-pyexpat package. Target packages will automatically use the
python3 version if python3 is selected for the target. It is only when a
python3-only host package depends on some module that we need those python3-foo
packages.

>  	# cairo is autodetected but needs PNG support
>  	select BR2_PACKAGE_CAIRO_PNG if BR2_PACKAGE_CAIRO
>  	help
> @@ -15,3 +16,4 @@ config BR2_PACKAGE_GST1_VALIDATE
>  
>  comment "gst1-validate depends on python"
>  	depends on !BR2_PACKAGE_PYTHON
> +	depends on !BR2_PACKAGE_PYTHON3

 Although correct, we typically write this as

	depends on !(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)

 Regards,
 Arnout

> diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
> index da38aeb497..e9522e1568 100644
> --- a/package/gstreamer1/gst1-validate/gst1-validate.mk
> +++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
> @@ -14,10 +14,14 @@ GST1_VALIDATE_DEPENDENCIES = \
>  	gstreamer1 \
>  	gst1-plugins-base \
>  	json-glib \
> -	host-python \
> -	python \
>  	$(if $(BR2_PACKAGE_CAIRO),cairo)
>  
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +GST1_VALIDATE_DEPENDENCIES += host-python3 python3
> +else
> +GST1_VALIDATE_DEPENDENCIES += host-python python
> +endif
> +
>  GST1_VALIDATE_CONF_OPTS += --disable-sphinx-doc
>  
>  $(eval $(autotools-package))
> 
