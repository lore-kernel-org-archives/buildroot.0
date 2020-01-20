From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Mon, 20 Jan 2020 09:46:09 +0000
Subject: [Buildroot] [PATCH] package/olsr: needs -fPIC on Microblaze
In-Reply-To: <20200118222034.48072-1-giulio.benetti@benettiengineering.com>
References: <20200118222034.48072-1-giulio.benetti@benettiengineering.com>
Message-ID: <DM6PR12MB2876F2A5F2BBD3A59DD336DFD9320@DM6PR12MB2876.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giulio,

>When building on Microblaze package olsr needs to be compiled with
>-fPIC, so append -fPIC to CFLAGS when invoking make.

>Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>---
>  package/olsr/olsr.mk | 13 +++++++++++--
> 1 file changed, 11 insertions(+), 2 deletions(-)

> diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
>index 53bf874af0..ab4d5f1a76 100644
>--- a/package/olsr/olsr.mk
>+++ b/package/olsr/olsr.mk
>@@ -16,10 +16,19 @@ OLSR_LICENSE = BSD-3-Clause, LGPL-2.1+
> OLSR_LICENSE_FILES = license.txt lib/pud/nmealib/LICENSE
> OLSR_DEPENDENCIES = host-flex host-bison
>
>+OLSR_CFLAGS = $(TARGET_CFLAGS)
>+

This error appears for other architectures(ARC, RISCV, arm) as well:
http://autobuild.buildroot.net/results/0d3/0d3489b14f4f4f0d4837d00209b5c1ee8d6f6a98//
http://autobuild.buildroot.net/results/b85/b85d27b3a4bab5d68460401ff49e624177d55afa//

Could you please remove ifeq statement below so that the "-fPIC" option is applied for all purposes?

>+# microblaze needs -fPIC to link
>+ifeq ($(BR2_microblaze),y)
>+OLSR_CFLAGS += -fPIC
>+endif
>+
> define OLSR_BUILD_CMDS
>-       $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd
>+       $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
>+               CFLAGS="$(OLSR_CFLAGS)" -C $(@D) olsrd
>         $(foreach p,$(OLSR_PLUGINS), \
>-               $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D)/lib/$(p)
>+               $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) \
>+                       CFLAGS="$(OLSR_CFLAGS)" -C $(@D)/lib/$(p)
>        )
> endef

> --
> 2.20.1



Best regards,
Evgeniy Didin

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200120/1fba3b37/attachment.html>
