From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Dec 2014 22:47:38 +0100
Subject: [Buildroot] [buildroot-test 2/2] Enable paranoid path checking
In-Reply-To: <1418852858-818-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1418852858-818-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1418852858-818-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that Buildroot has support for paranoid path checking (check for
clearly invalid header and library directories used when
cross-compiling), let's enable this in the autobuilders.

Without this, the paranoid path checking only emits warnings. With
this patch enabled, whenever an invalid header or library path is
used, the build will stop and fail, which will allow us to clearly
notice such cases.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Do we want to apply this right now? We already have a lot of failures
caused by the static/shared change. Do we want to have more?

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 scripts/autobuild-run | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ce89e1e..b27b2fc 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -341,6 +341,7 @@ def gen_config(instance, log, sysinfo):
     # Amend the configuration with a few things.
     configlines.append("BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y\n")
     configlines.append("# BR2_TARGET_ROOTFS_TAR is not set\n")
+    configlines.append("BR2_COMPILER_PARANOID_UNSAFE_PATH=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_ENABLE_DEBUG=y\n")
     if randint(0, 30) == 0:
-- 
2.1.0
