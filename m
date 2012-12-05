From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 10:17:56 -0800
Subject: [Buildroot] [git commit] jamvm: force ARM mode when building to
	avoid thumb2 build problems
Message-ID: <20121205181824.8313D99C29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac3ee237d96731b869eeca435e1b8351aacd245b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/jamvm/jamvm.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/jamvm/jamvm.mk b/package/jamvm/jamvm.mk
index f0765d7..3f05361 100644
--- a/package/jamvm/jamvm.mk
+++ b/package/jamvm/jamvm.mk
@@ -8,4 +8,10 @@ JAMVM_CONF_OPT = \
 	--disable-shared \
 	--without-pic
 
+# jamvm has ARM assembly code that cannot be compiled in Thumb2 mode,
+# so we must force traditional ARM mode.
+ifeq ($(BR2_arm),y)
+JAMVM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 $(eval $(autotools-package))
