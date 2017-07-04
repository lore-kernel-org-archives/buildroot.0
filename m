From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 04 Jul 2017 12:06:10 +0200
Subject: [Buildroot]
	=?iso-8859-1?q?=5BPATCH_2/2=5D_toolchain-external=3A_?=
	=?iso-8859-1?q?install_libsanitizer_libraries_if_available?=
In-Reply-To: <20170703215803.6233-2-peter@korsgaard.com>
References: <20170703215803.6233-1-peter@korsgaard.com>
 <20170703215803.6233-2-peter@korsgaard.com>
Message-ID: <766c2a0b-3236-48bf-8d9e-996988d90cf9@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On pond?l? 3. ?ervence 2017 23:58:03 CEST, Peter Korsgaard wrote:
> Gcc builds libsanitizer (lib{a,l,t,u}san) for
> -fsanitize={address,thread,leak,undefined} if the needed dependencies are
> available, so ensure these also gets copied to the target fs to support
> -fsanitize.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git 
> a/toolchain/toolchain-external/pkg-toolchain-external.mk 
> b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 8460e37d09..0764b379b5 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -108,7 +108,7 @@ endif
>  # Definitions of the list of libraries that should be copied to the target.
>  #
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
> -TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* 
> libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* 
> libresolv.so.* librt.so.* libutil.so.*
> +TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* 
> libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* 
> libresolv.so.* librt.so.* libutil.so.* lib?san.so.*

Actually, this is not enough. There's also "libubsan" which doesn't match 
this glob.

The same applies to the other patch for the internal toolchain. Apart from 
that, I tested it and it works (ASAN is now included).

Cheers,
Jan

>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
>  TOOLCHAIN_EXTERNAL_LIBS += ld-linux-armhf.so.*
>  else
