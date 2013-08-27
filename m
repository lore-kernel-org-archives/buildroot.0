From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Aug 2013 18:57:37 +0200
Subject: [Buildroot] [PATCH 1/1] ola: new package
In-Reply-To: <1377525737-14420-1-git-send-email-blanco.ether@gmail.com>
References: <1377525737-14420-1-git-send-email-blanco.ether@gmail.com>
Message-ID: <521CDA81.1070908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/26/13 16:02, Dave Skok wrote:
> Signed-off-by: Dave Skok <blanco.ether@gmail.com>

  Two very small fixes:

> ---
>   package/Config.in     |   1 +
>   package/ola/Config.in | 136 ++++++++++++++++++++++++++++++++++++++++++++++
>   package/ola/ola.mk    | 146 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 283 insertions(+)
>   create mode 100644 package/ola/Config.in
>   create mode 100644 package/ola/ola.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 7069d77..fb52411 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -277,6 +277,7 @@ source "package/minicom/Config.in"
>   source "package/nanocom/Config.in"
>   source "package/neard/Config.in"
>   source "package/ofono/Config.in"
> +source "package/ola/Config.in"
>   source "package/on2-8170-modules/Config.in"
>   source "package/open2300/Config.in"
>   source "package/openocd/Config.in"
> diff --git a/package/ola/Config.in b/package/ola/Config.in
> new file mode 100644
> index 0000000..050f29b
> --- /dev/null
> +++ b/package/ola/Config.in
> @@ -0,0 +1,136 @@
> +config BR2_PACKAGE_OLA
> +	bool "ola (open lighting architecture)"
> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	select BR2_PACKAGE_UTIL_LINUX
> +	depends on BR2_INSTALL_LIBSTDCPP # protobuf
> +	depends on BR2_LARGEFILE # util-linux
> +	depends on BR2_USE_WCHAR # util-linux
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +	  Open Lighting Architecture provides applications
> +	  with a mechanism to send and receive DMX512 & RDM
> +	  commands using hardware devices and DMX over IP protocols.
> +
> +	  http://www.opendmx.net/index.php/OLA
> +
> +comment "ola requires a toolchain with C++, thread, largefile and wchar support"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

  This comment should go either above the BR2_PACKAGE_OLA config, or else 
at the end of the file. Otherwise the sub-menus will not be indented.

> +
> +if BR2_PACKAGE_OLA
> +
> +menu "bindings and interface"
> +
> +config BR2_PACKAGE_OLA_WEB
> +	bool "http interface"
> +	select BR2_PACKAGE_LIBMICROHTTPD
> +	help
> +	  Build OLA with browser interface.
> +
> +config BR2_PACKAGE_OLA_PYTHON_BINDINGS
> +	bool "python bindings"
> +	select BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_PROTOBUF
> +	depends on BR2_USE_MMU
> +	help
> +	  Build OLA with support for the Python language.
> +
> +config BR2_PACKAGE_OLA_SLP
> +	bool "slp tools"
> +	help
> +	  Build OLA with slp tools.
> +
> +endmenu
> +
> +menu "tests and examples"
> +
> +config BR2_PACKAGE_OLA_EXAMPLES
> +	bool "examples"
> +	select BR2_PACKAGE_NCURSES
> +	help
> +	  Build OLA examples.
> +
> +config BR2_PACKAGE_OLA_RDM_TESTS
> +	bool "rdm tests"
> +	select BR2_PACKAGE_OLA_PYTHON_BINDINGS
> +	select BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_PROTOBUF

  These two are already selected by BR2_PACKAGE_OLA_PYTHON_BINDINGS.

  Regards,
  Arnout

> +	depends on BR2_USE_MMU
> +	help
> +	  Build OLA RDM tests.
> +
> +endmenu

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
