From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 May 2019 12:33:26 +0200
Subject: [Buildroot] [git commit branch/next] package/lmbench: use
 UPDATE_CONFIG_HOOK instead of CONFIG_UPDATE
Message-ID: <20190530103124.36C8B83D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b8b6767ab1cc803a888cca91730732945f95b85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

jimtcl, perl, usb_modeswitch and x264 are registering
UPDATE_CONFIG_HOOK as a post patch hook to get their gnuconfig files
updated. lmbench is the only package calling CONFIG_UPDATE directly,
so for consistency, let's make it use the same logic as jimtcl, perl,
usb_modeswitch and x264.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lmbench/lmbench.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index c52d6a5a39..2f3b19b5f8 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -18,8 +18,9 @@ LMBENCH_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 LMBENCH_LDLIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 endif
 
+LMBENCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
+
 define LMBENCH_CONFIGURE_CMDS
-	$(call CONFIG_UPDATE,$(@D))
 	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
 	sed -i 's/LDLIBS=/LDLIBS+=/g' $(@D)/scripts/build
 	sed -i '/cd .*doc/d' $(@D)/src/Makefile
