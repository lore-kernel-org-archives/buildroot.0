From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 16:16:54 +0200
Subject: [Buildroot] [PATCH] pcm-tools: new package
In-Reply-To: <20180123140324.20801-2-casantos@datacom.ind.br>
References: <20180123140324.20801-1-casantos@datacom.ind.br>
 <20180123140324.20801-2-casantos@datacom.ind.br>
Message-ID: <20180401161654.6412d152@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here are some additional comments, on top of the ones made by Romain.

On Tue, 23 Jan 2018 12:03:24 -0200, Carlos Santos wrote:

> diff --git a/package/pcm-tools/0001-Appease-GCC-snprintf-outut-size-larger-than-destinat.patch b/package/pcm-tools/0001-Appease-GCC-snprintf-outut-size-larger-than-destinat.patch
> new file mode 100644
> index 0000000000..5d77ebfcb6
> --- /dev/null
> +++ b/package/pcm-tools/0001-Appease-GCC-snprintf-outut-size-larger-than-destinat.patch
> @@ -0,0 +1,40 @@
> +From d07d6602ac2d4c90f7e448bdc5b780e8aa9faf7c Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@datacom.ind.br>
> +Date: Sun, 21 Jan 2018 23:44:46 -0200
> +Subject: [PATCH 1/3] Appease GCC: snprintf outut size larger than destination
> + size
> +
> +GCC ignores that PCI function numbers range from 0 to 7, generations are
> +up to 4 (5, by 2019 Q2) and link speeds are up to 16x. So it warns that
> +snprintf output may be truncated in build_pci_header (in pcm-iio.cpp).
> +
> +Solve this by increasing the buffer sizes, since the additional three
> +bytes are harmless. We could satisfy GCC by masking p.bdf.funcno and
> +p.link_speed to 0x07, thus limitting the output to one decimal digit,
> +and p.link_width to 0x1f (two decimal digits). This approach, however,
> +would hide invalid arguments, preventing the user from noticing the
> +error.
> +
> +Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Have the patches been submitted upstream ?

> diff --git a/package/pcm-tools/0002-Look-for-pci.ids-at-usr-share-hwdata.patch b/package/pcm-tools/0002-Look-for-pci.ids-at-usr-share-hwdata.patch
> new file mode 100644
> index 0000000000..4c04589867
> --- /dev/null
> +++ b/package/pcm-tools/0002-Look-for-pci.ids-at-usr-share-hwdata.patch
> @@ -0,0 +1,34 @@
> +From 9213e92ec5aaee0e319b94f9501458e44e7873ba Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@datacom.ind.br>
> +Date: Tue, 23 Jan 2018 08:27:49 -0200
> +Subject: [PATCH 2/3] Look for pci.ids at /usr/share/hwdata
> +
> +For Buildroot, on which pci.ids is provided by the "hwdata" package.

It's not really nice to have Buildroot specific patches. Can you find a
solution that is acceptable upstream ? Config option perhaps ?

> diff --git a/package/pcm-tools/0003-Look-for-pcm-core-at-usr-bin.patch b/package/pcm-tools/0003-Look-for-pcm-core-at-usr-bin.patch
> new file mode 100644
> index 0000000000..92dc06c197
> --- /dev/null
> +++ b/package/pcm-tools/0003-Look-for-pcm-core-at-usr-bin.patch
> @@ -0,0 +1,28 @@
> +From bef36c901e7f2cca3c21ee057b75f73065830774 Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@datacom.ind.br>
> +Date: Tue, 23 Jan 2018 10:56:55 -0200
> +Subject: [PATCH 3/3] Look for pcm-core at /usr/bin
> +
> +For Buildroot, on which pcm-core.x ins installed as /usr/bin/pcm-core.
> +
> +Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> +---
> + pmu-query.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pmu-query.py b/pmu-query.py
> +index 4c596c7..71aa1b1 100755
> +--- a/pmu-query.py
> ++++ b/pmu-query.py
> +@@ -43,7 +43,7 @@ if filename == None:
> +     elif platform.system() == 'Windows':
> +         p = subprocess.Popen(['pcm-core.exe -c'],stdout=subprocess.PIPE,shell=True)
> +     else:
> +-        p = subprocess.Popen(['./pcm-core.x -c'],stdout=subprocess.PIPE,shell=True)
> ++        p = subprocess.Popen(['/usr/bin/pcm-core -c'],stdout=subprocess.PIPE,shell=True)

Same here, can we find an upstreamable solution, ideally ?

> +if BR2_PACKAGE_PCM_TOOLS
> +
> +# The pmu-query script is not compatible with Python 3
> +config BR2_PACKAGE_PCM_TOOLS_PMU_QUERY_REQS
> +	bool
> +	default y
> +	depends on BR2_PACKAGE_PYTHON && BR2_PACKAGE_PYTHON_SSL && BR2_PACKAGE_PYTHON_HASHLIB # urllib2
> +	depends on BR2_PACKAGE_CA_CERTIFICATES # https

There's really no need for a separate
BR2_PACKAGE_PCM_TOOLS_PMU_QUERY_REQS option, just put the
selects/depends on inside BR2_PACKAGE_PCM_TOOLS_PMU_QUERY.

As Romain said, only "depends on BR2_PACKAGE_PYTHON" should remain a
"depends on", everything else should be a "select".

> +
> +config BR2_PACKAGE_PCM_TOOLS_PMU_QUERY
> +	bool "install the pmu-query script"
> +	default y
> +	depends on BR2_PACKAGE_PCM_TOOLS_PMU_QUERY_REQS
> +
> +comment "pmu-query needs Python 2.x w/ ssl + hashlib modules, ca-certificates"
> +	depends on !BR2_PACKAGE_PCM_TOOLS_PMU_QUERY_REQS

Which simplifies that quite a lot.


> +PCM_TOOLS_VERSION = 201710
> +PCM_TOOLS_SITE = $(call github,opcm,pcm,$(PCM_TOOLS_VERSION))
> +PCM_TOOLS_LICENSE = BSD-3-Clause
> +PCM_TOOLS_LICENSE_FILES = LICENSE
> +
> +PCM_TOOLS_EXE_FILES = \
> +	pcm-core pcm-iio pcm-lspci pcm-memory pcm-msr pcm-numa \
> +	pcm-pcie pcm-power pcm-sensor pcm-tsx pcm
> +
> +define PCM_TOOLS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
> +		UNAME=Linux HOST=_LINUX CC="$(TARGET_CC)"

TARGET_CONFIGURE_OPTS already contains CC="$(TARGET_CC)"

> +define PCM_TOOLS_INSTALL_TARGET_CMDS
> +	$(Q) set -x -e; \
> +	for f in $(PCM_TOOLS_EXE_FILES); do \
> +		$(INSTALL) -D -m 755 $(@D)/$$f.x $(TARGET_DIR)/usr/bin/$$f; \
> +	done;
> +	if test "$(BR2_PACKAGE_PCM_TOOLS_PMU_QUERY)" = "y"; then \
> +		$(INSTALL) -D -m 755 $(@D)/pmu-query.py $(TARGET_DIR)/usr/bin/pmu-query; \
> +	fi
> +endef

That's not a very Buildroot-ish way of doing this. Here is a more
Buildroot-ish solution:

ifeq ($(BR2_PACKAGE_PCM_TOOLS_PMU_QUERY),y)
define PCM_TOOLS_INSTALL_PMU_QUERY
	$(INSTALL) -D -m 755 $(@D)/pmu-query.py $(TARGET_DIR)/usr/bin/pmu-query
endef
endif

define PCM_TOOLS_INSTALL_TARGET_CMDS
	$(foreach f,$(PCM_TOOLS_EXE_FILES),\
		$(INSTALL) -D -m 755 $(@D)/$(f).x $(TARGET_DIR)/usr/bin/$(f)
	)
	$(PCM_TOOLS_INSTALL_PMU_QUERY)
endef

Could you rework your patch to take into Romain's comments and the
above comments ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
