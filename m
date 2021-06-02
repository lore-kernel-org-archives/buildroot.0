From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Jun 2021 22:59:36 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/python3: add optional
 support for berkeleydb
In-Reply-To: <20210408152601.5129-1-bernd.kuhls@t-online.de>
References: <20210408152601.5129-1-bernd.kuhls@t-online.de>
Message-ID: <2f73408f-5142-66b7-e249-8d90d92cd313@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/04/2021 17:26, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Is there any chance to upstream the patch?

 Regards,
 Arnout

> ---
> v3: rebased
> v2: added patch to explicitly disable the build of the dbm module
>     (Thomas)
> 
>  ...ion-to-disable-the-berkeleydb-module.patch | 30 +++++++++++++++++++
>  package/python3/Config.in                     |  6 ++++
>  package/python3/python3.mk                    |  6 ++++
>  3 files changed, 42 insertions(+)
>  create mode 100644 package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
> 
> diff --git a/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
> new file mode 100644
> index 0000000000..f763fcaa82
> --- /dev/null
> +++ b/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
> @@ -0,0 +1,30 @@
> +From cf4d7fd9f7cb6c1ced32ee323b2b5755640051b7 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 11 Apr 2020 22:01:40 +0200
> +Subject: [PATCH] Add an option to disable the berkeleydb module
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + configure.ac | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 72c1d86e82..8c3912d237 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3326,6 +3326,12 @@ if test "$UUID" = "no"; then
> +    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
> + fi
> + 
> ++AC_ARG_ENABLE(berkeleydb,
> ++	AS_HELP_STRING([--disable-berkeleydb], [disable berkeleydb]),
> ++	[ if test "$enableval" = "no"; then
> ++	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _dbm"
> ++	  fi])
> ++
> + AC_SUBST(PYDOC)
> + 
> + AC_ARG_ENABLE(pydoc,
> +-- 
> +2.25.0
> +
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index 3a9dd4b2f4..efc4dbb3d4 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -46,6 +46,12 @@ config BR2_PACKAGE_PYTHON3_2TO3
>  	help
>  	  code translation from python 2 to 3
>  
> +config BR2_PACKAGE_PYTHON3_BERKELEYDB
> +	bool "berkeleydb"
> +	select BR2_PACKAGE_BERKELEYDB
> +	help
> +	  berkeleydb module for Python3
> +
>  config BR2_PACKAGE_PYTHON3_BZIP2
>  	bool "bz2 module"
>  	select BR2_PACKAGE_BZIP2
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 345c6a8699..9959ad6303 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -57,6 +57,12 @@ else
>  PYTHON3_CONF_OPTS += --disable-lib2to3
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
> +PYTHON3_DEPENDENCIES += berkeleydb
> +else
> +PYTHON3_CONF_OPTS += --disable-berkeleydb
> +endif
> +
>  ifeq ($(BR2_PACKAGE_PYTHON3_READLINE),y)
>  PYTHON3_DEPENDENCIES += readline
>  else
> 
