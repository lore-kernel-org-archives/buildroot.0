From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 14:43:03 -0700
Subject: [Buildroot] [PATCH 7/7] package/perf: use correct definition of
	ARCH on x86_64
In-Reply-To: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
References: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426714983-24803-7-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LINUX_MAKE_FLAGS defines ARCH=$(KERNEL_ARCH), and KERNEL_ARCH is x86_64 on
a 64-bit x86 kernel build. The perf Makefiles expect that the ARCH will be
"x86" on both 32-bit x86 and 64-bit x86.

I didn't experience issues with the Linux 3.14.x version of perf, but this
issue cropped up once I started building 3.19.x.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/perf/perf.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 68bb430..3cc6a04 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -10,8 +10,14 @@ PERF_SOURCE = linux-$(PERF_VERSION).tar.xz
 
 PERF_DEPENDENCIES = host-flex host-bison
 
+PERF_ARCH=$(KERNEL_ARCH)
+ifeq ($(KERNEL_ARCH),x86_64)
+PERF_ARCH=x86
+endif
+
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
+	ARCH=$(PERF_ARCH) \
 	NO_LIBAUDIT=1 \
 	NO_NEWT=1 \
 	NO_GTK2=1 \
-- 
2.3.3
