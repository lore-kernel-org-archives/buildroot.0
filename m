From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 13 Mar 2020 22:05:48 +0100
Subject: [Buildroot] [PATCH] tinyproxy: New package
Message-ID: <20200313220548.666cb3ef@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

three minor review remarks, see below...

On Fri, 13 Mar 2020 20:39:48 +0300, Alexander Mukhin <alexander.i.mukhin@gmail.com> wrote:

>
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
> ---
>  DEVELOPERS                                       |  3 +++
>  package/Config.in                                |  1 +
>  ...001-remove-docs-subdir-from-Makefile.am.patch | 15 +++++++++++++++
>  package/tinyproxy/Config.in                      | 16 ++++++++++++++++
>  package/tinyproxy/tinyproxy.hash                 |  2 ++
>  package/tinyproxy/tinyproxy.mk                   | 15 +++++++++++++++
>  6 files changed, 52 insertions(+)
>  create mode 100644 package/tinyproxy/0001-remove-docs-subdir-from-Makefile.am.patch
>  create mode 100644 package/tinyproxy/Config.in
>  create mode 100644 package/tinyproxy/tinyproxy.hash
>  create mode 100644 package/tinyproxy/tinyproxy.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 10768a19ee..79a5e4d544 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -131,6 +131,9 @@ F:	package/minimodem/
>  N:	Alexander Lukichev <alexander.lukichev@gmail.com>
>  F:	package/openpgm/
>
> +N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
> +F:	package/tinyproxy/
> +
>  N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
>  F:	package/mini-snmpd/
>
> diff --git a/package/Config.in b/package/Config.in
> index 146fc1bbc3..0da893801e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2169,6 +2169,7 @@ endif
>  	source "package/thttpd/Config.in"
>  	source "package/tinc/Config.in"
>  	source "package/tinyhttpd/Config.in"
> +	source "package/tinyproxy/Config.in"
>  	source "package/tinyssh/Config.in"
>  	source "package/tor/Config.in"
>  	source "package/traceroute/Config.in"
> diff --git a/package/tinyproxy/0001-remove-docs-subdir-from-Makefile.am.patch b/package/tinyproxy/0001-remove-docs-subdir-from-Makefile.am.patch
> new file mode 100644
> index 0000000000..646a4a53ba
> --- /dev/null
> +++ b/package/tinyproxy/0001-remove-docs-subdir-from-Makefile.am.patch
> @@ -0,0 +1,15 @@
> +diff --git a/Makefile.am b/Makefile.am
> +index 4a3ead6..a12cb98 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -2,7 +2,6 @@ SUBDIRS = \
> + 	src \
> + 	data \
> + 	etc \
> +-	docs \
> + 	m4macros \
> + 	tests
> +
> +--
> +2.20.1
> +

Patch missed a Signed-of-by line from you (and git formatted patches preferred)...

> diff --git a/package/tinyproxy/Config.in b/package/tinyproxy/Config.in
> new file mode 100644
> index 0000000000..50f40ba524
> --- /dev/null
> +++ b/package/tinyproxy/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_TINYPROXY
> +	bool "tinyproxy"
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  Tinyproxy is a small, efficient HTTP/SSL proxy daemon released
> +	  under the GNU General Public License.  Tinyproxy is very

One space before the new sentence is enough...

> +	  useful in a small network setting, where a larger proxy would
> +	  be too resource intensive.
> +

Empty line needs no tab...

> +	  https://tinyproxy.github.io
> +
> +comment "tinyproxy needs a toolchain w/ threads, wchar"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> +	depends on BR2_USE_MMU
> diff --git a/package/tinyproxy/tinyproxy.hash b/package/tinyproxy/tinyproxy.hash
> new file mode 100644
> index 0000000000..2d439de517
> --- /dev/null
> +++ b/package/tinyproxy/tinyproxy.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256 ff4f3d1331d6d855d8b6ed794c22ab0a4285dd81fe9c98a7aa7ed591248d4ab9 tinyproxy-1.10.0.tar.gz
> diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
> new file mode 100644
> index 0000000000..3e0479d22b
> --- /dev/null
> +++ b/package/tinyproxy/tinyproxy.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# tinyproxy
> +#
> +################################################################################
> +
> +TINYPROXY_VERSION = 1.10.0
> +TINYPROXY_SITE = $(call github,tinyproxy,tinyproxy,$(TINYPROXY_VERSION))
> +TINYPROXY_LICENSE = GPL-2.0
> +TINYPROXY_LICENSE_FILES = COPYING
> +
> +# building from a git clone
> +TINYPROXY_AUTORECONF = YES
> +
> +$(eval $(autotools-package))


Your can do a quick check doing:

	$ ./utils/check-package package/tinyproxy/*
package/tinyproxy/0001-remove-docs-subdir-from-Makefile.am.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
package/tinyproxy/Config.in:11: line contains trailing whitespace
48 lines processed
2 warnings generated

Regards,
Peter
