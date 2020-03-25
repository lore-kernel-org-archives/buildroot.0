From: Vadym Kochan <vadim4j@gmail.com>
Date: Wed, 25 Mar 2020 18:42:40 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: selftests: add numactl
 dependency for net tests
Message-ID: <20200325164240.22747-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux selftests/net/reuseport_bpf_numa.c requires numa.h header which
is provided by numactl package. Otherwise net tests are failed to
install.

Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
---
 package/linux-tools/Config.in                  | 1 +
 package/linux-tools/linux-tool-selftests.mk.in | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index ceb58c668a..eda17440fe 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -91,6 +91,7 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	select BR2_PACKAGE_KMOD_TOOLS # runtime (modprobe -n)
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LIBCAP_NG
+	select BR2_PACKAGE_NUMACTL # required by net tests
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS # runtime (taskset)
 	help
diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index c4e5bf0fea..48849c5b52 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -16,7 +16,7 @@ SELFTESTS_ARCH=$(KERNEL_ARCH)
 endif
 endif
 
-SELFTESTS_DEPENDENCIES = libcap-ng popt
+SELFTESTS_DEPENDENCIES = libcap-ng popt numactl
 
 SELFTESTS_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
-- 
2.17.1
