From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 14 Jul 2015 13:31:17 +0200
Subject: [Buildroot] [PATCH v4 4/5] linux/perf: use correct definition of
	ARCH on x86_64
In-Reply-To: <1436873478-13533-1-git-send-email-romain.naour@openwide.fr>
References: <1436873478-13533-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1436873478-13533-5-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on the patch sent by Steven Noonan [1] and
reworked to use the newly introduced perf linux tool.

LINUX_MAKE_FLAGS defines ARCH=$(KERNEL_ARCH), and KERNEL_ARCH is x86_64 on
a 64-bit x86 kernel build. The perf Makefiles expect that the ARCH will be
"x86" on both 32-bit x86 and 64-bit x86.

I didn't experience issues with the Linux 3.14.x version of perf, but this
issue cropped up once I started building 3.19.x.

[1] http://lists.busybox.net/pipermail/buildroot/2015-March/122525.html

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Steven Noonan <steven@uplinklabs.net>
---
v4: new patch
---
 linux/linux-tool-perf.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux/linux-tool-perf.mk b/linux/linux-tool-perf.mk
index 463262c..b0ba00a 100644
--- a/linux/linux-tool-perf.mk
+++ b/linux/linux-tool-perf.mk
@@ -8,8 +8,15 @@ LINUX_TOOLS += perf
 
 PERF_DEPENDENCIES = host-flex host-bison
 
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
