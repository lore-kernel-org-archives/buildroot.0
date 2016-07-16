From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 11:53:17 +0200
Subject: [Buildroot] [PATCH] mtd: Add option to install mtd integrity
 test
In-Reply-To: <1468530227-28124-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1468530227-28124-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160716115317.4723e7a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 16:03:47 -0500, Matt Weber wrote:
> From: ynadupur <yugendra.sai.babu.nadupuru@rockwellcollins.com>

This From...

> 
> Description:
> 	The mtd tests have proven very useful in testing both flash stability
> 	and JFFS2 changes. Adding an option to install the integrity test.
> 
> Signed-off-by:[YUGENDRA SAI BABU NADUPURU]<yugendra.sai.babu.nadupuru@rockwellcollins.com>

... didn't match this SoB line.

> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/mtd/Config.in |  3 +++
>  package/mtd/mtd.mk    | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index 6e4346f..780ba94 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -159,4 +159,7 @@ config BR2_PACKAGE_MTD_UBIBLOCK
>  	bool "ubiblock"
>  	default y
>  
> +config BR2_PACKAGE_MTD_TESTS

Renamed to BR2_PACKAGE_MTD_INTEGCK, since it installs only this tool.


> +ifeq ($(BR2_PACKAGE_MTD_TESTS),y)
> +define MTD_TESTS_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
> +		BUILDDIR=$(@D) $(MTD_MAKE_OPTS) -C $(@D)/tests/fs-tests all
> +endef
> +MTD_POST_BUILD_HOOKS += MTD_TESTS_BUILD_CMDS
> +define MTD_TESTS_TARGET_INSTALL_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/tests/fs-tests/integrity/integck $(TARGET_DIR)/usr/sbin/integck
> +endef
> +MTD_POST_INSTALL_TARGET_HOOKS += MTD_TESTS_TARGET_INSTALL_CMDS
> +endif

Instead of hooks, I've used intermediate variables.

Also, integck was not building properly with uClibc or musl due to its
use of <execinfo.h>. I've added a patch to fix that, which I've
submitted upstream.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
