From: Mason <slash.tmp@free.fr>
Date: Tue, 5 Apr 2016 13:09:40 +0200
Subject: [Buildroot] [PATCH v3] ltp-testsuite: build kernel modules when
	appropriate
In-Reply-To: <57038409.20600@mind.be>
References: <56F3F393.6020407@free.fr>
 <20160324222555.21f04320@free-electrons.com> <56F92840.9090206@free.fr>
 <56FAD38B.8040201@mind.be> <57026754.50205@free.fr> <57038409.20600@mind.be>
Message-ID: <57039CF4.5060902@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>

If we're building a kernel, we can also build LTP's test modules.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
Tested using the defconfig provided by Thomas Petazzoni.

$ find output/build/ltp-testsuite-20160126 -name *.ko
output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/uaccess/ltp_uaccess.ko
output/build/ltp-testsuite-20160126/testcases/kernel/device-drivers/block/block_dev_kernel/ltp_block_dev.ko
output/build/ltp-testsuite-20160126/testcases/kernel/module/delete_module/dummy_del_mod.ko
output/build/ltp-testsuite-20160126/testcases/kernel/module/delete_module/dummy_del_mod_dep.ko
output/build/ltp-testsuite-20160126/testcases/kernel/firmware/fw_load_kernel/ltp_fw_load.ko

Three modules still fail to build, but I think this depends on the kernel config.

Building modules: ltp_acpi_cmds.c
Building modules: ltp_tpci.c
Building modules: ltp_tbio.c
---
 package/ltp-testsuite/ltp-testsuite.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 8adfdef68d69..e9202afbbf3f 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -13,6 +13,14 @@ LTP_TESTSUITE_CONF_OPTS += \
 	--with-power-management-testsuite \
 	--with-realtime-testsuite
 
+ifeq ($(BR2_LINUX_KERNEL),y)
+LTP_TESTSUITE_DEPENDENCIES += linux
+LTP_TESTSUITE_MAKE_ENV = $(LINUX_MAKE_FLAGS)
+LTP_TESTSUITE_CONF_OPTS += --with-linux-dir=$(LINUX_DIR)
+else
+LTP_TESTSUITE_CONF_OPTS += --without-modules
+endif
+
 # Needs libcap with file attrs which needs attr, so both required
 ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_ATTR),yy)
 LTP_TESTSUITE_DEPENDENCIES += libcap
-- 
2.8.1
