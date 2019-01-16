From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Jan 2019 12:46:54 +0100
Subject: [Buildroot] [PATCH v4 1/2] libopenssl: bump version to 1.1.1a
In-Reply-To: <f0836ac8-ad36-b0f7-a6e1-8f9eef1fe7cd@gmail.com>
References: <20190115224239.26125-1-ps.report@gmx.net>
 <f0836ac8-ad36-b0f7-a6e1-8f9eef1fe7cd@gmail.com>
Message-ID: <0f76e938-4bda-3168-2699-52727529c04a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/01/2019 02:40, Ryan Coe wrote:
> I'm getting a build failure in wget with the patch.? The failure is:
> 
> checking for library containing psl_builtin... no
> configure: WARNING: *** libpsl was not found. Fallback to builtin cookie checking.
> checking for ZLIB... yes
> checking for OPENSSL... no
> configure: error: Package requirements (openssl) were not met:
> 
> Package 'openssl', required by 'virtual:world', not found
> 
> Consider adjusting the PKG_CONFIG_PATH environment variable if you
> installed software in a non-standard prefix.
> 
> Alternatively, you may set the environment variables OPENSSL_CFLAGS
> and OPENSSL_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> make: *** [package/pkg-generic.mk:223:
> /home/ryan/devel/buildroot/output/build/wget-1.20.1/.stamp_configured] Error 1
> 
> 
> The following tweak makes things build again for me:
> 
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index e461e08126..8046995720 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -74,7 +74,7 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
> ???? ??? ./config \
> ???? ??? --prefix=$(HOST_DIR) \
> ???? ??? --openssldir=$(HOST_DIR)/etc/ssl \
> -??? ??? --libdir=$(HOST_DIR)/lib \
> +??? ??? --libdir=lib \
> ???? ??? -Wl,-rpath,'$(HOST_DIR)/lib' \
> ???? ??? shared \
> ???? ??? zlib-dynamic \
> @@ -90,7 +90,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
> ???? ??? ??? linux-$(LIBOPENSSL_TARGET_ARCH) \
> ???? ??? ??? --prefix=/usr \
> ???? ??? ??? --openssldir=/etc/ssl \
> -??? ??? ??? --libdir=/lib \
> +??? ??? ??? --libdir=lib \
> ???? ??? ??? $(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
> ???? ??? ??? $(if $(BR2_STATIC_LIBS),no-shared,shared) \
> ???? ??? ??? no-rc5 \

 That is definitely not good, because it breaks things in other places.

 I think it's worth a try to remove the --libdir entirely instead, upstream is
supposed to have fixed the libdir handling to correspond to autotools
conventions. And if it doesn't work, we should fix it with an upstreamable patch.

 Regards,
 Arnout
