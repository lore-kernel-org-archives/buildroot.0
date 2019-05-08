From: Guo Ren <guoren@kernel.org>
Date: Wed, 8 May 2019 10:04:19 +0800
Subject: [Buildroot] [PATCH] support/check-kernel-headers: Fixup
 couldn't compile linux rc version
In-Reply-To: <cfa74b88-11af-ba38-3158-325d8fc2bc48@mind.be>
References: <1557222665-9498-1-git-send-email-guoren@kernel.org>
 <cfa74b88-11af-ba38-3158-325d8fc2bc48@mind.be>
Message-ID: <20190508020419.GA20613@guoren-Inspiron-7460>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx Arnout,

On Wed, May 08, 2019 at 12:24:02AM +0200, Arnout Vandecappelle wrote:
>  Hi Guo,
> 
> On 07/05/2019 11:51, guoren at kernel.org wrote:
> > From: Guo Ren <ren_guo@c-sky.com>
> > 
> > Sometimes we want to try newest kernel rc version, but the
> > check-kernel-headers will prevent it.
> 
>  It would indeed be good if we would be able to use newer kernel headers without
> requiring an update of Buildroot.
> 
> > In package/linux-headers we
> > use BR2_TOOLCHAIN_HEADERS_AT_LEAST for checking, I think AT_LEAST means
> > "<" not "!=".
> 
>  However, I think we should not treat it as "at least" in general, but only for
> the "newer" case. In other words, I think we should add
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_NEWER (and the equivalent in
> toolchain-external) which selects BR2_TOOLCHAIN_HEADERS_NEWER, and make the
> check > 5.0 (rather than == something) in that case.
> 
>  It's a bigger change though.

In linux-headers.mk:

ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL)$(BR2_KERNEL_HEADERS_CUSTOM_TARBALL)$(BR2_KERNEL_HEADERS_CUSTOM_GIT),y)
define LINUX_HEADERS_CHECK_VERSION
	$(call check_kernel_headers_version,\
		$(STAGING_DIR),\
		$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)))
endef
LINUX_HEADERS_POST_INSTALL_STAGING_HOOKS += LINUX_HEADERS_CHECK_VERSION
endif

If we use BR2_KERNEL_HEADERS_AS_KERNEL, I think it's no necessary to
check _AT_LEAST. Because user has specified the linux version and he want
the version without more checking.

Best Regards
 Guo Ren
