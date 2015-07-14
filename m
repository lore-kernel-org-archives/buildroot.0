From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 14 Jul 2015 19:35:11 +0200
Subject: [Buildroot] [PATCH v5 4/8] package/perf: use correct definition of
	ARCH on x86_64
In-Reply-To: <1436895315-15554-1-git-send-email-romain.naour@openwide.fr>
References: <1436895315-15554-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1436895315-15554-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Steven Noonan <steven@uplinklabs.net>

LINUX_MAKE_FLAGS defines ARCH=$(KERNEL_ARCH), and KERNEL_ARCH is x86_64 on
a 64-bit x86 kernel build. The perf Makefiles expect that the ARCH will be
"x86" on both 32-bit x86 and 64-bit x86.

I didn't experience issues with the Linux 3.14.x version of perf, but this
issue cropped up once I started building 3.19.x.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
[Romain:
  - fix coding style]
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
v5: new patch
---
 package/perf/perf.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index 42fbe24..2bdd555 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -10,8 +10,15 @@ PERF_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 
 PERF_DEPENDENCIES = linux host-flex host-bison
 
+ifeq ($(KERNEL_ARCH),x86_64)
+PERF_ARCH=x86
+else
+PERF_ARCH=$(KERNEL_ARCH)
+endif
+
 PERF_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
+	ARCH=$(PERF_ARCH) \
 	NO_LIBAUDIT=1 \
 	NO_NEWT=1 \
 	NO_GTK2=1 \
-- 
2.4.3
