From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 22:20:29 +1300
Subject: [Buildroot] [PATCH] ipmiutil: bump version and build fix
In-Reply-To: <1483376873-27023-1-git-send-email-david.bachelart@bbright.com>
References: <1483376873-27023-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <20170127222029.329c1ccd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Jan 2017 18:07:53 +0100, David Bachelart wrote:

> diff --git a/package/ipmiutil/0002-cross-compile-remove-linux-flavour-detection.patch b/package/ipmiutil/0002-cross-compile-remove-linux-flavour-detection.patch
> new file mode 100644
> index 0000000..68507f9
> --- /dev/null
> +++ b/package/ipmiutil/0002-cross-compile-remove-linux-flavour-detection.patch
> @@ -0,0 +1,93 @@
> +cross-compile: remove linux flavour detection

Why is this patch needed? Can we find a solution that can be
potentially accepted by the upstream developers?

> +-	if test "$sslver" = "1.1"; then
> +-		echo "Detected openssl-$sslver" 
> +-		MD2_CFLAGS="-DSKIP_MD2 -DSSL11"
> +-	else 
> ++#	if test "$sslver" = "1.1"; then
> ++#		echo "Detected openssl-$sslver" 
> ++#		MD2_CFLAGS="-DSKIP_MD2 -DSSL11"
> ++#	else 

So for some parts of the code, you're removing it, for other parts,
you're commenting it. Why so?

Also, is this really related to the "Linux flavor" detection? It seems
more related to the MD2 thing (next patch).

> diff --git a/package/ipmiutil/0003-cross-compilation-MD2-activation-is-now-a-configure-.patch b/package/ipmiutil/0003-cross-compilation-MD2-activation-is-now-a-configure-.patch
> new file mode 100644
> index 0000000..79f01c9
> --- /dev/null
> +++ b/package/ipmiutil/0003-cross-compilation-MD2-activation-is-now-a-configure-.patch
> @@ -0,0 +1,61 @@
> +cross compilation: MD2 activation is now a configure option

Why?

> ++MD2_CFLAGS="-DSKIP_MD2"
> ++AC_ARG_ENABLE([md2],
> ++    [  --enable-md2        build with MD2 support, requires later openssl.],

"later openssl" ?

> ++#	 if test -f "$LIB_DIR/libcrypto.so"; then
> ++#		strings $LIB_DIR/libcrypto.so | grep EVP_md2 >/dev/null 2>&1
> ++#		if test $? -ne 0; then
> ++#			echo "No MD2 detected in openssl libcrypto.so"
> ++#			MD2_CFLAGS="-DSKIP_MD2"
> ++#		fi
> ++#	 else
> ++#		echo "No openssl $LIB_DIR/libcrypto.so detected"
> ++#		MD2_CFLAGS="-DSKIP_MD2"
> ++#	 fi

Ah, ok, now I see why you're doing this.

Please replace all this crap by an ac_check_lib() check:

ac_check_lib([crypto], [EVP_md2])

This will do a compile test to see if libcrypto really provides the
EVP_md2() function.

> diff --git a/package/ipmiutil/0004-cross-compilation-remove-stack-protection.patch b/package/ipmiutil/0004-cross-compilation-remove-stack-protection.patch
> new file mode 100644
> index 0000000..d58602b
> --- /dev/null
> +++ b/package/ipmiutil/0004-cross-compilation-remove-stack-protection.patch
> @@ -0,0 +1,38 @@
> +cross compilation: remove stack protection
> +
> +Fixes:
> +    http://autobuild.buildroot.net/results/c01/c01548a751a08dcb176e8faa78a9850b68da2873/
> +    http://autobuild.buildroot.net/results/a35/a357ae5e96a8eca8b80f568870e08917c844ca05/
> +
> +Signed-off-by: David Bachelart <david.bachelart@bbright.com>

No, that's not a correct patch. The problem is in the toolchain. SSP
support is known to be broken on i586/musl. And it is broken for all
packages, not just for ipmiutil.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
