From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:41:51 +0200
Subject: [Buildroot] [git commit] ficl: fix build with gcc 7
Message-ID: <20170809214028.9C2707FA45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=128a16aceeb43d7d22b10c6845f7c4d09439e031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc 7 with -Os (optimize for size) takes the liberty to remove the code
of inline functions entirely - which is indeed allowed according to the
C99 standard, cfr. this [1] very complete StackOverflow answer. This
leads to undefined function references at link time.

The proper approach is to patch the code to use 'static inline'
instead. However, for various reasons such a patch is not entirely
trivial, and upstream has not moved since 7 years, so instead take the
simpler approach of restoring the gcc original inline behaviour with
-fgnu89-inline to fix this issue.

Fixes http://autobuild.buildroot.org/results/d72/d72a7e9775a10bc884b9953dd2eba3ad32100cca

[1] https://stackoverflow.com/questions/6312597/is-inline-without-static-or-extern-ever-useful-in-c99

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ficl/ficl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
index 5d2d600..af900fa 100644
--- a/package/ficl/ficl.mk
+++ b/package/ficl/ficl.mk
@@ -39,7 +39,7 @@ endif
 
 define FICL_BUILD_CMDS
 	$(MAKE) -C $(@D) -f Makefile.linux $(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS) -fPIC -I. -Dlinux" CPPFLAGS="" $(FICL_BUILD_TARGETS)
+		CFLAGS="$(TARGET_CFLAGS) -fgnu89-inline -fPIC -I. -Dlinux" CPPFLAGS="" $(FICL_BUILD_TARGETS)
 endef
 
 define FICL_INSTALL_STAGING_CMDS
