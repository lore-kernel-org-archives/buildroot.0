From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 18 May 2017 07:57:54 +0300
Subject: [Buildroot] [PATCH v2 1/3] toolchain: workaround musl/kernel
 headers conflict
In-Reply-To: <20170517153353.0bd784c9@free-electrons.com>
References: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
 <20170517153353.0bd784c9@free-electrons.com>
Message-ID: <20170518045754.ecwqdtj35acvzk6b@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, May 17, 2017 at 03:33:53PM +0200, Thomas Petazzoni wrote:
> I'm reviving this old thread, because my colleague Florent (in Cc) has
> found an issue with this patch.
> 
> On Thu, 10 Nov 2016 15:27:11 +0200, Baruch Siach wrote:
> 
> > +# [1] http://www.openwall.com/lists/musl/2015/10/08/2
> > +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> > +define TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
> > +	$(SED) 's/^#if defined(__GLIBC__)$$/#if 1/' \
> > +		$(STAGING_DIR)/usr/include/linux/libc-compat.h
> > +endef
> 
> The problem with this is that libc-compat.h was introduced only in
> kernel 3.12 (it seems). Therefore, trying to build a musl toolchain
> with kernel headers 3.10 currently fails, with this $(SED) command
> failing because $(STAGING_DIR)/usr/include/linux/libc-compat.h does not
> exist.
> 
> So, we could add a kernel headers >= 3.12 to the condition to make the
> build work, but then we wouldn't have the fix that these modifications
> provide to avoid conflicts between libc and kernel headers.
> 
> Do you know if kernel headers < 3.12 are unaffected by the libc/kernel
> headers conflict issue? If they are, do you know what the solution is
> for kernel headers < 3.12 ?

I have not tested kernel headers earlier than v3.12. Having a look at the 
headers and the log of kernel commit cfd280c91253cc28 (net: sync some IP 
headers with glibc), I'm pretty sure that the same issue also affects older 
kernels.

Should we just disallow build of musl toolchain with older kernels? Something 
like:

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 91cddc237429..396f6d8ec2a5 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -74,6 +74,8 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	# sh2 nommu is supported by musl, but we don't have support
 	# for it in Buildroot.
 	depends on BR2_USE_MMU
+	# We need the kernel libc-compat.h header
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
