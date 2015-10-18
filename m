From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 15:09:18 +0200
Subject: [Buildroot] [PATCH 1/1] musl: Honor BR2_STATIC_LIBS /
 BR2_SHARED_LIBS
In-Reply-To: <1444796977-23004-1-git-send-email-chaduffy@cisco.com>
References: <1444796977-23004-1-git-send-email-chaduffy@cisco.com>
Message-ID: <20151018150918.7db2cc07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, Peter, Arnout, Yann,

On Tue, 13 Oct 2015 23:29:37 -0500, Charles Duffy wrote:
> From: Charles Duffy <charles@dyfis.net>
> 
> Signed-off-by: Charles Duffy <chaduffy@cisco.com>
> ---
>  package/musl/musl.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 22589f5..aca78ab 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -28,7 +28,9 @@ define MUSL_CONFIGURE_CMDS
>  			--host=$(GNU_TARGET_NAME) \
>  			--prefix=/usr \
>  			--libdir=/lib \
> -			--disable-gcc-wrapper)
> +			--disable-gcc-wrapper \
> +			$(if $(BR2_STATIC_LIBS),--disable-shared) \
> +			$(if $(BR2_SHARED_LIBS),--disable-static))
>  endef

In fact, this patch is causing some problems. Now, when
BR2_SHARED_LIBS=y, musl is built with --disable-static. Due to this,
there is no libc.a generated for musl. For the internal toolchain
backend, this is OK.

But when the produced toolchain gets re-used as an external toolchain,
it fails because the external toolchain logic in Buildroot uses "gcc
-print-file-name=libc.a" to find the sysroot. Since there is no libc.a,
it fails and the toolchain cannot be used.

Arnout, Yann, Peter, what do you think about this?

Should we always produce a libc.a in the musl case, so that it's more
like glibc and uClibc.

Or should we adjust our external toolchain logic to fallback on
searching for a different file than libc.a when libc.a is not available?

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
