From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:47 +0100
Subject: [Buildroot] [PATCH 07/15] perf: add kernel version checks
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4961b9d2b797812191c4ccb7c6592139f3b660e9.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perf is only available since kernel 2.6.31, so if we can't find
tools/perf/Makefile, error out and tell the user about this.

perf without libelf can only be built since kernel 3.7, so error out
and tell the user about this if he's trying to build perf from a < 3.7
kernel without libelf.

Unfortunately, those tests can only be build-time checks as we either
need to know the real kernel version (i.e, using LINUX_VERSION would
not be correct as it can be a Git commit ID, or Git tag), or have
access to the kernel sources themselves. So we can't prevent those
invalid situations at the configuration, we can only nicely tell the
user at build time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perf/perf.mk |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index eed30a2..4356f5d 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -28,6 +28,18 @@ else
 endif
 
 define PERF_BUILD_CMDS
+	$(Q)if test ! -f $(LINUX_DIR)/tools/perf/Makefile ; then \
+		echo "Your kernel version is too old and does not have the perf tool." ; \
+		echo "At least kernel 2.6.31 must be used." ; \
+		exit 1 ; \
+	fi
+	$(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
+		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile ; then \
+			echo "The perf tool in your kernel cannot be built without libelf." ; \
+			echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
+			exit 1 ; \
+		fi \
+	fi
 	$(MAKE) -C $(LINUX_DIR)/tools/perf \
 		$(PERF_MAKE_FLAGS) O=$(@D)
 endef
-- 
1.7.9.5
