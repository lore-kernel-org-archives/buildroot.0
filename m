From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2015 08:25:17 +0200
Subject: [Buildroot] [git commit] toolchain-wrapper.c: unbreak
	BR_CROSS_PATH_ABS handling
Message-ID: <20151005062814.4E0D67FDE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccdb179d24a2d99ce4f3078bfcd2ffee5af60701
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #8386

We should check if BR_CROSS_PATH_ABS is defined, not if it evalutates to
true for the pre processor.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-wrapper.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 11f93f0..632696c 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -144,7 +144,7 @@ int main(int argc, char **argv)
 	/* Fill in the relative paths */
 #ifdef BR_CROSS_PATH_REL
 	ret = snprintf(path, sizeof(path), "%s/" BR_CROSS_PATH_REL "/%s", absbasedir, basename);
-#elif BR_CROSS_PATH_ABS
+#elif defined(BR_CROSS_PATH_ABS)
 	ret = snprintf(path, sizeof(path), BR_CROSS_PATH_ABS "/%s", basename);
 #else /* BR_CROSS_PATH_SUFFIX */
 	ret = snprintf(path, sizeof(path), "%s/usr/bin/%s" BR_CROSS_PATH_SUFFIX, absbasedir, basename);
