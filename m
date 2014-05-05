From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 May 2014 21:53:19 +0200
Subject: [Buildroot] [git commit] perf: Fix compilation without libelf for
	post-3.10 kernels
Message-ID: <20140505200037.72EAA9C477@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=220490ceae9d66f45ce0d1d79fee0a6403e3f4de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kernel commit cf4cca10 (perf tools: Move libelf check config into config/Makefile)
removes the NO_LIBELF check from the top-level Makefile

for newer kernels, if config/Makefile exists, we can assume that NO_LIBELF is
also there

Signed-off-by: Peter Meerwald <pmeerw@pmeerw.net>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perf/perf.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/perf/perf.mk b/package/perf/perf.mk
index d7898d0..7610f3d 100644
--- a/package/perf/perf.mk
+++ b/package/perf/perf.mk
@@ -36,9 +36,11 @@ define PERF_BUILD_CMDS
 	fi
 	$(Q)if test "$(BR2_PACKAGE_ELFUTILS)" = "" ; then \
 		if ! grep -q NO_LIBELF $(LINUX_DIR)/tools/perf/Makefile ; then \
-			echo "The perf tool in your kernel cannot be built without libelf." ; \
-			echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
-			exit 1 ; \
+			if ! test -r $(LINUX_DIR)/tools/perf/config/Makefile ; then \
+				echo "The perf tool in your kernel cannot be built without libelf." ; \
+				echo "Either upgrade your kernel to >= 3.7, or enable the elfutils package." ; \
+				exit 1 ; \
+			fi \
 		fi \
 	fi
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools/perf \
