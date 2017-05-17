From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 15:33:53 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain: workaround musl/kernel
 headers conflict
In-Reply-To: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
References: <b2085612a223f59a2f7ef18a9bd97603226aa03d.1478784433.git.baruch@tkos.co.il>
Message-ID: <20170517153353.0bd784c9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

I'm reviving this old thread, because my colleague Florent (in Cc) has
found an issue with this patch.

On Thu, 10 Nov 2016 15:27:11 +0200, Baruch Siach wrote:

> +# [1] http://www.openwall.com/lists/musl/2015/10/08/2
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +define TOOLCHAIN_MUSL_KERNEL_HEADERS_COMPATIBILITY_HACK
> +	$(SED) 's/^#if defined(__GLIBC__)$$/#if 1/' \
> +		$(STAGING_DIR)/usr/include/linux/libc-compat.h
> +endef

The problem with this is that libc-compat.h was introduced only in
kernel 3.12 (it seems). Therefore, trying to build a musl toolchain
with kernel headers 3.10 currently fails, with this $(SED) command
failing because $(STAGING_DIR)/usr/include/linux/libc-compat.h does not
exist.

So, we could add a kernel headers >= 3.12 to the condition to make the
build work, but then we wouldn't have the fix that these modifications
provide to avoid conflicts between libc and kernel headers.

Do you know if kernel headers < 3.12 are unaffected by the libc/kernel
headers conflict issue? If they are, do you know what the solution is
for kernel headers < 3.12 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
