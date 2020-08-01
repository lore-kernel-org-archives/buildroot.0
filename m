From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 1 Aug 2020 16:54:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/gdb: bump to version 9.2
In-Reply-To: <20200728051601.30930-1-fido_max@inbox.ru>
References: <20200728051601.30930-1-fido_max@inbox.ru>
Message-ID: <ea5da00c-347b-e6cf-bb82-162d34c517b9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 28/07/2020 ? 07:16, Maxim Kochetkov a ?crit?:
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Since gdb 9, we need to build gdb out of source.

Building gdb for the target fail with:

configure: error: GDB must be configured and built in a directory separate from
its sources.

To do so, create a dedicated directory for your GDB build and invoke
the configure script from that directory:

      $ mkdir build
      $ cd build
      $ <full path to your sources>/gdb-VERSION/configure [etc...]
      $ make

See:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=043a0010933a6b55081535ecaf7fde9cc1491be0

[...]

> @@ -90,4 +93,5 @@ config BR2_GDB_VERSION
>  	default "8.1.1"    if BR2_GDB_VERSION_8_1
>  	default "8.2.1"    if BR2_GDB_VERSION_8_2 || !BR2_PACKAGE_HOST_GDB
>  	default "8.3.1"    if BR2_GDB_VERSION_8_3
> +	default "9.2"      if BR2_GDB_VERSION_9_2
>  	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index 291c224b0f..54fe0ff2a4 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -2,6 +2,7 @@
>  sha512  7dcd5e8c90de92f577834d887b5f54edb93a07083bfe661bc46c270a6cc4919f0b348e7e2fe8ae4511298a570ef150eeefdc667ef7cf527f0cf60943177ab6c9  gdb-8.1.1.tar.xz
>  sha512  2aa81cfd389bb48c35d7d9f95cc10e88b4f7ad4597bdde0f8f1fd312f60f10d9fb2cc6e5a9355227d89ff328f7feb0fc411a69394560cafeb9fa75d35d896d11  gdb-8.2.1.tar.xz
>  sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b127fff000b65c334826ff8304a54ff6098428365a8e997cca886c39e9a  gdb-8.3.1.tar.xz
> +sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
>  
>  # Locally calculated (fetched from Github)
>  sha512  74346a2a2b2082d35377711946b12c824222005c66813d5648350b101697eac67d3d01617e1daea03e41c196c2b7b4a4b225d1ee58af91dc69731bffed0e5d51  gdb-arc-2020.03-release-gdb.tar.gz
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 8c74a0e2f6..78a601600a 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -227,6 +227,7 @@ HOST_GDB_CONF_OPTS = \
>  	--without-included-gettext \
>  	--with-curses \
>  	--without-mpfr \
> +	--enable-src-release-build \

Why do you turn this on ?

Best regards,
Romain


>  	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
>  
>  ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
> 
