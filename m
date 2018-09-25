From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:24:46 +0200
Subject: [Buildroot] [git commit] package/pkg-waf: properly escape HOST_DIR
 when defining <pkg>_WAF
Message-ID: <20180925202417.66BF888DAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1d2d0ac63cc1305a0c8264fd3f8c7605a8aeb8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When <pkg>_NEEDS_EXTERNAL_WAF is set to YES, <pkg>_WAF is set to
$(HOST_DIR)/bin/waf within the inner-waf-package macro. This reference
to $(HOST_DIR) should use $$(HOST_DIR) so that it is properly expanded
at the time of use, and not at the time of the macro expansion.

In the current Buildroot, this doesn't cause any visible problem
because $(HOST_DIR) points to the same directory for all
packages. However, with per-package host/target directories, this is
no longer the case. It causes a build issue because it tries to use
"waf" from the global host directory, which doesn't exist during the
build.

This commit fixes the following build issue with per package
host/target directories:

/home/test/autobuild/run/instance-2/output/per-package/mpv/host/bin/python2: can't open file '/home/test/autobuild/run/instance-2/output/host/bin/waf': [Errno 2] No such file or directory
make: *** [/home/test/autobuild/run/instance-2/output/build/mpv-0.27.2/.stamp_configured] Error 2

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-waf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index e5b606f063..3288dd63a0 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -44,7 +44,7 @@ $(2)_NEEDS_EXTERNAL_WAF ?= NO
 # If the package does not have its own waf, use our own.
 ifeq ($$($(2)_NEEDS_EXTERNAL_WAF),YES)
 $(2)_DEPENDENCIES += host-waf
-$(2)_WAF = $(HOST_DIR)/bin/waf
+$(2)_WAF = $$(HOST_DIR)/bin/waf
 else
 $(2)_WAF = ./waf
 endif
