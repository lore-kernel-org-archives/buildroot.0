From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 10 Mar 2017 16:37:46 +0100
Subject: [Buildroot] [PATCH v3 1/1] dc3dd: new package
In-Reply-To: <1489069259-4866-1-git-send-email-benoit.allard@greenbone.net>
References: <1488876138-19003-1-git-send-email-benoit.allard@greenbone.net>
 <1489069259-4866-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <1d5637bd-dafc-3c57-06ba-06c5dcd6e2f0@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Beno?t,

> We actually prefer the version 7.2.641 (over 7.2.646) as the
> content of the release is identical and the 641 has the advantage
> of providing a proper .tar.xz file.
>
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
> Changes v1 -> v2 (Suggestions by Arnoud)
>    - Fix line lengths in Config.in
>    - Add a locally calculated sha256
>    - Use a version that has a proper tar.xz file
>    - Correct license to be GPLv3+
>    - Add patch to not build the manpage
> Changes v2 -> v3
>    - Add dependency on THREADS
>    - Add conflict with musl
>
> ---
>   DEVELOPERS                      |  3 +++
>   package/Config.in               |  1 +
>   package/dc3dd/0001-no_man.patch | 12 ++++++++++++
>   package/dc3dd/Config.in         | 11 +++++++++++
>   package/dc3dd/dc3dd.hash        |  4 ++++
>   package/dc3dd/dc3dd.mk          | 13 +++++++++++++
>   6 files changed, 44 insertions(+)
>   create mode 100644 package/dc3dd/0001-no_man.patch
>   create mode 100644 package/dc3dd/Config.in
>   create mode 100644 package/dc3dd/dc3dd.hash
>   create mode 100644 package/dc3dd/dc3dd.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ff72ca1..e0a28a6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -147,6 +147,9 @@ F:	package/taskd/
>   N:	Benjamin Kamath <kamath.ben@gmail.com>
>   F:	package/lapack/
>   
> +N:	Beno?t Allard <benoit.allard@greenbone.net>
> +F:	package/dc3dd/
> +
>   N:	Bernd Kuhls <bernd.kuhls@t-online.de>
>   F:	package/apache/
>   F:	package/apr/
> diff --git a/package/Config.in b/package/Config.in
> index cfe7fc6..d0fdca4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1767,6 +1767,7 @@ menu "System tools"
>   	source "package/cpuload/Config.in"
>   	source "package/dcron/Config.in"
>   	source "package/ddrescue/Config.in"
> +	source "package/dc3dd/Config.in"

This should be alphabetically ordered.

>   	source "package/debianutils/Config.in"
>   	source "package/docker-containerd/Config.in"
>   	source "package/docker-engine/Config.in"
> diff --git a/package/dc3dd/0001-no_man.patch b/package/dc3dd/0001-no_man.patch
> new file mode 100644
> index 0000000..07bf713
> --- /dev/null
> +++ b/package/dc3dd/0001-no_man.patch
> @@ -0,0 +1,12 @@
> +--- a/Makefile.in	2017-03-06 16:42:29.728814841 +0100
> ++++ b/Makefile.in	2017-03-06 16:42:54.191899036 +0100
> +@@ -685,7 +685,7 @@
> + target_alias = @target_alias@
> + top_builddir = @top_builddir@
> + top_srcdir = @top_srcdir@
> +-SUBDIRS = lib src man po
> ++SUBDIRS = lib src po
> + EXTRA_DIST = cfg.mk maint.mk \
> +   .prev-version THANKS-to-translators THANKStt.in \
> +   .version \
> +
> diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
> new file mode 100644
> index 0000000..63066f9
> --- /dev/null
> +++ b/package/dc3dd/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_DC3DD
> +	bool "dc3dd"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
> +	help
> +	  dc3dd is a patch to the GNU dd program, this version has
> +	  several features intended for forensic acquisition of data.
> +	  Highlights include hashing on-the-fly, split output files,
> +	  pattern writing, a progress meter, and file verification.
> +
> +	  https://sourceforge.net/projects/dc3dd/
> diff --git a/package/dc3dd/dc3dd.hash b/package/dc3dd/dc3dd.hash
> new file mode 100644
> index 0000000..5490d8d
> --- /dev/null
> +++ b/package/dc3dd/dc3dd.hash
> @@ -0,0 +1,4 @@
> +# From https://sourceforge.net/projects/dc3dd/files/dc3dd/7.2/
> +sha1 1bfe81a921a8473a6ecb46f328ecaab761afb55d dc3dd-7.2.641.tar.xz
> +# Locally computed
> +sha256 7f50aadc38649845ab11014d11013928411c9d2128c941e9630939d4c28cae6d  dc3dd-7.2.641.tar.xz
> diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
> new file mode 100644
> index 0000000..3c2aebe
> --- /dev/null
> +++ b/package/dc3dd/dc3dd.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# dc3dd
> +#
> +################################################################################
> +

And here a cosmetic change:

+DC3DD_VERSION_MAJOR = 7.2
+DC3DD_VERSION = $(DC3DD_VERSION_MAJOR).641

> +DC3DD_VERSION = 7.2.641
> +DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).tar.xz
> +DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/7.2

+DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION_MAJOR)


Regards,
Jerzy

> +DC3DD_LICENSE = GPLv3+
> +DC3DD_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))
