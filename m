From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jan 2012 01:44:04 +0100
Subject: [Buildroot] [PATCH 1/7] libeina: Add new package along with EFL
	infrastructure.
In-Reply-To: <CAFbHwiShJCn=ni2Bc--8RYP8nFbiCma6JmLbnynmEwsDGSBdjQ@mail.gmail.com>
References: <CAFbHwiShJCn=ni2Bc--8RYP8nFbiCma6JmLbnynmEwsDGSBdjQ@mail.gmail.com>
Message-ID: <201201210144.05405.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 18 January 2012 12:15:20 Will Newton wrote:
> Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Nit-picking: the short commit message shouldn't end with a .

> ---
>  package/Config.in              |    2 ++
>  package/efl/Config.in          |   16 ++++++++++++++++
>  package/efl/efl.mk             |    3 +++
>  package/efl/libeina/Config.in  |    4 ++++
>  package/efl/libeina/libeina.mk |   18 ++++++++++++++++++
>  5 files changed, 43 insertions(+), 0 deletions(-)
>  create mode 100644 package/efl/Config.in
>  create mode 100644 package/efl/efl.mk
>  create mode 100644 package/efl/libeina/Config.in
>  create mode 100644 package/efl/libeina/libeina.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2e91427..e86b80e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -121,6 +121,8 @@ comment "other GUIs"
>  source "package/qt/Config.in"
>  source "package/x11r7/Config.in"
> 
> +source "package/efl/Config.in"
> +
 Should come before qt (to keep alphabetic order) and the empty line
is redundant.

>  comment "X libraries and helper libraries"
>  source "package/liberation/Config.in"
>  source "package/libsexy/Config.in"
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> new file mode 100644
> index 0000000..cc677cb
> --- /dev/null
> +++ b/package/efl/Config.in
> @@ -0,0 +1,16 @@
> +menuconfig BR2_PACKAGE_EFL
> +	bool "Enlightenment Foundation Libraries"
> +	depends on BR2_USE_WCHAR
> +	help
> +	  Enlightenment Foundation Libraries
> +
> +	  http://enlightenment.org
> +
> +if BR2_PACKAGE_EFL
> +
> +source "package/efl/libeina/Config.in"
> +
> +endif # BR2_PACKAGE_EFL
> +
> +comment "EFL requires WCHAR support in toolchain"
> +	depends on !BR2_USE_WCHAR
> diff --git a/package/efl/efl.mk b/package/efl/efl.mk
> new file mode 100644
> index 0000000..1f9f43a
> --- /dev/null
> +++ b/package/efl/efl.mk
> @@ -0,0 +1,3 @@
> +ifeq ($(BR2_PACKAGE_EFL),y)
 Personally I'm not in favour of this kind of conditional inclusion of .mk
files.  It removes the possibility to do a quick 'make libeina'.  And unlike
x11r7, EFL does not add 260 packages to the overhead is affordable.

> +include package/efl/*/*.mk
> +endif
> diff --git a/package/efl/libeina/Config.in b/package/efl/libeina/Config.in
> new file mode 100644
> index 0000000..b937b3b
> --- /dev/null
> +++ b/package/efl/libeina/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_LIBEINA
> +	bool "libeina"
> +	help
> +	  Eina is a tiny library to handle data types (list, hash, etc.)
> diff --git a/package/efl/libeina/libeina.mk b/package/efl/libeina/libeina.mk
> new file mode 100644
> index 0000000..879a878
> --- /dev/null
> +++ b/package/efl/libeina/libeina.mk
> @@ -0,0 +1,18 @@
> +#############################################################
> +#
> +# libeina
> +#
> +#############################################################
> +
> +LIBEINA_VERSION = 1.1.0
> +LIBEINA_SOURCE = eina-$(LIBEINA_VERSION).tar.bz2
> +LIBEINA_SITE = http://download.enlightenment.org/releases/
> +LIBEINA_AUTORECONF = YES
> +LIBEINA_LIBTOOL_PATCH = YES
 YES is default for _LIBTOOL_PATCH, so drop that.

> +LIBEINA_INSTALL_STAGING = YES
> +LIBEINA_INSTALL_TARGET = YES
 YES is default for _INSTALL_TARGET, so drop that.

> +
> +LIBEINA_DEPENDENCIES = host-pkg-config
> +
> +$(eval $(call AUTOTARGETS))
> +
 Nit-picking: redundant empty line.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
