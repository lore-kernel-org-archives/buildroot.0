From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 16:21:02 +0100
Subject: [Buildroot] [PATCH 2/2] enable static linking for libfuse
In-Reply-To: <20171214105706.4577-2-aep@exys.org>
References: <20171214105706.4577-1-aep@exys.org>
 <20171214105706.4577-2-aep@exys.org>
Message-ID: <20171214162102.25c6d252@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution. However...

On Thu, 14 Dec 2017 11:57:06 +0100, Arvid E. Picciani wrote:
> Signed-off-by: Arvid E. Picciani <aep@exys.org>
> ---
>  package/libfuse/Config.in  | 4 ----
>  package/libfuse/libfuse.mk | 3 ++-
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
> index 2b0e31a991..62b18c2444 100644
> --- a/package/libfuse/Config.in
> +++ b/package/libfuse/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_LIBFUSE
>  	bool "libfuse"
>  	# Really doesn't like static, see fuse/lib/fuse.c

...did you see this comment?

fuse.c uses dlopen(), this requires shared library support.

Apply your patch, and build the following configuration:

BR2_arm=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBFUSE=y
# BR2_TARGET_ROOTFS_TAR is not set

You'll get the following build failure:

fuse.c:33:19: fatal error: dlfcn.h: No such file or directory
 #include <dlfcn.h>
                   ^
compilation terminated.

Also, passing --enable-static is not necessary, this is already done by
the autotools-package infrastructure when BR2_STATIC_LIBS=y.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
