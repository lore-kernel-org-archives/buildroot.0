From: Eial Czerwacki <eial@scalemp.com>
Date: Thu, 01 Nov 2012 13:28:26 +0200
Subject: [Buildroot] [PATCH] uClibc: install libc.so even if
 BR2_PREFER_STATIC_LIB is enabled
In-Reply-To: <1351764953-24251-1-git-send-email-arnout@mind.be>
References: <1351764953-24251-1-git-send-email-arnout@mind.be>
Message-ID: <50925CDA.1060704@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/01/2012 12:15 PM, Arnout Vandecappelle (Essensium/Mind) wrote:
> BR2_PREFER_STATIC_LIB _prefers_ static linking, but doesn't force it for
> all packages.  So some binaries may still be built without -static, and
> they will need libc.so on the target.
>
> Therefore, put libc.so.0 in the target unconditionally.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Untested!
>
>  toolchain/uClibc/uclibc.mk |    2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
> index 397cdd4..65ff90b 100644
> --- a/toolchain/uClibc/uclibc.mk
> +++ b/toolchain/uClibc/uclibc.mk
> @@ -486,9 +486,7 @@ $(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
>  		PREFIX=$(TARGET_DIR) utils install_utils
>  	touch -c $@
>  
> -ifneq ($(BR2_PREFER_STATIC_LIB),y)
>  UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
> -endif
>  
>  ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
>  UCLIBC_TARGETS+=uclibc-test
I can confirm it works:
# find / -name "libc*"
/lib/libcrypt.so.0
/lib/libc.so.0
/lib/libcrypt-0.9.32.1.so
/usr/include/bits/libc-lock.h
/usr/lib/libc.a
/usr/lib/libcrypt_pic.a
/usr/lib/libc_pic.a
/usr/lib/libcurses.a
/usr/lib/libcrypt.a
