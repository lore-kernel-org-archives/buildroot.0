From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 23:40:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/openssl: drop libdl from more
 pc files
In-Reply-To: <1411835343-32736-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411835343-32736-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141029234038.7f3d1c11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 27 Sep 2014 18:29:03 +0200, Bernd Kuhls wrote:
> This is a follow-up patch for
> http://git.buildroot.net/buildroot/commit/package/openssl/openssl.mk?id=c130c5d4635e2a4c7338161953152faf8fca07c4
> 
> Fixes
> http://autobuild.buildroot.net/results/358/35899961b6dc01c1522b17f63946da5ab809bff8/
> http://autobuild.buildroot.net/results/c86/c865214e74dd3766b6343ef73c666fa89c0b5dec/
> http://autobuild.buildroot.net/results/fc1/fc12e88fb789e2b68d427c37f39789954309b05d/
> http://autobuild.buildroot.net/results/f4d/f4deef4e7d2e2cf5fbc9ce5f02289b4dc60cd23b/
> http://autobuild.buildroot.net/results/dfd/dfd81f1f1f0f315317b2a85d24b286a277ac7c16/
> http://autobuild.buildroot.net/results/918/9188fc9a63d880cac28c5a9a246ca5504dd11bb2/
> http://autobuild.buildroot.net/results/dd1/dd1c326345f8f9c8b5838601ace19002f5360bb2/
> http://autobuild.buildroot.net/results/27b/27b4544c59166a9f40092403ed3f530190544a82/
> http://autobuild.buildroot.net/results/c37/c37022e334d763bad2a59f7311b93504a569b2dd/
> http://autobuild.buildroot.net/results/e89/e89265937a6b4808b817be16bcab79bae4a9aed1/
> http://autobuild.buildroot.net/results/4a2/4a222a40d627fda6e49714b13b4321d62c9c2e51/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openssl/openssl.mk |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index 4911034..4800bea 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -118,6 +118,8 @@ endef
>  # libdl has no business in a static build
>  ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  define OPENSSL_FIXUP_STATIC_PKGCONFIG
> +	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/libcrypto.pc
> +	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/libssl.pc
>  	$(SED) 's/-ldl//' $(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc
>  endef
>  OPENSSL_POST_INSTALL_STAGING_HOOKS += OPENSSL_FIXUP_STATIC_PKGCONFIG

Is this patch still needed? According to
http://autobuild.buildroot.org/?reason=libcurl-7.37.1, the problem
doesn't seem to have appeared since September, 2nd. With just a simple
Blackfin FLAT config with openssl and libcurl enabled, I didn't
reproduce it:

BR2_bfin=y
BR2_BINFMT_FLAT=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBCURL=y
# BR2_TARGET_ROOTFS_TAR is not set

Is there some other package needed in the game to reproduce the issue?
Or was the issue fixed as a side effect of some other change (the
libssl.pc and libcrypto.pc still have -ldl in their Libs.private).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
