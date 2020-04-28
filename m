From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Apr 2020 21:20:52 +0200
Subject: [Buildroot] [PATCH v3] package/matio: new package
In-Reply-To: <20200428064224.21475-1-gwenj@trabucayre.com>
References: <20200428064224.21475-1-gwenj@trabucayre.com>
Message-ID: <20200428192052.GI11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2020-04-28 08:42 +0200, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> matio is an C library for reading and writing MATLAB MAT files.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>  * locally sha256 not mandatory (Thomas)
>  * since extended-sparse takes 2KB, enable this feature and drop option (Yann)
>  * add comment about mat73 (Yann)
>  * enableXX=yes/no -> enable-XX/disable-XX (Yann, Thomas)
> Changes v1 -> v2:
>  * add one blank line befor URL (Heiko)
>  * drop blank lines around MATIO_DEPENDENCIES and MATIO_INSTALL_STAGING (Heiko)
>  * drop comment about STAGING (Heiko)
>  * += -> + for MATIO_CONF_ENV (Heiko)
> ---
>  DEVELOPERS               |  1 +
>  package/Config.in        |  1 +
>  package/matio/Config.in  |  8 ++++++++
>  package/matio/matio.hash |  4 ++++
>  package/matio/matio.mk   | 20 ++++++++++++++++++++
>  5 files changed, 34 insertions(+)
>  create mode 100644 package/matio/Config.in
>  create mode 100644 package/matio/matio.hash
>  create mode 100644 package/matio/matio.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fd584bb6e4..23cde66082 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1104,6 +1104,7 @@ F:	package/gnuradio/
>  F:	package/gqrx/
>  F:	package/gr-osmosdr/
>  F:	package/libusbgx/
> +F:	package/matio/
>  F:	package/python-cheetah/
>  F:	package/python-markdown/
>  F:	package/python-remi/
> diff --git a/package/Config.in b/package/Config.in
> index bf02870ea2..53c8ce0e29 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1871,6 +1871,7 @@ endif
>  	source "package/liquid-dsp/Config.in"
>  	source "package/llvm/Config.in"
>  	source "package/lttng-libust/Config.in"
> +	source "package/matio/Config.in"
>  	source "package/mpc/Config.in"
>  	source "package/mpdecimal/Config.in"
>  	source "package/mpfr/Config.in"
> diff --git a/package/matio/Config.in b/package/matio/Config.in
> new file mode 100644
> index 0000000000..9e2ea6800b
> --- /dev/null
> +++ b/package/matio/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_MATIO
> +	bool "matio"
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  matio is an C library for reading and writing MATLAB MAT
> +	  files.
> +
> +	  https://sourceforge.net/projects/matio
> diff --git a/package/matio/matio.hash b/package/matio/matio.hash
> new file mode 100644
> index 0000000000..65da53a6f2
> --- /dev/null
> +++ b/package/matio/matio.hash
> @@ -0,0 +1,4 @@
> +# From https://sourceforge.net/projects/matio/files/matio/1.5.17/
> +sha512  af8ff11c7c44fea9ea6886e381f49ef9186946f3def98ad9695f2d5d1df045c35e8f4ceac12a44be397f7bbd708b4803762b5ce54c45b60a9f446d551c04f5d2  matio-1.5.17.tar.gz
> +# Locally computed
> +sha256  62a0cab69eeadb3697a2249d5a869915b89e62b59b794dd70802c2b8624ed374  COPYING
> diff --git a/package/matio/matio.mk b/package/matio/matio.mk
> new file mode 100644
> index 0000000000..8af39ce22c
> --- /dev/null
> +++ b/package/matio/matio.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# matio
> +#
> +################################################################################
> +
> +MATIO_VERSION = 1.5.17
> +MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
> +MATIO_LICENSE = BSD-2-Clause
> +MATIO_LICENSE_FILES = COPYING
> +MATIO_DEPENDENCIES = zlib
> +MATIO_INSTALL_STAGING = YES
> +
> +# va_copy()
> +MATIO_CONF_ENV = ac_cv_va_copy=yes
> +
> +# mat73 require hdf5 (not available), extented-sparse take 2KB
> +MATIO_CONF_OPTS = --disable-mat73 --enable-extended-sparse
> +
> +$(eval $(autotools-package))
> -- 
> 2.26.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
