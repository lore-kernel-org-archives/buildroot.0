From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 Feb 2015 19:28:21 +0100
Subject: [Buildroot] [PATCH] br2-external: make it available to post-{build,
	image} scripts
Message-ID: <1423333701-9949-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, BR2_EXTERNAL is not always exported to sub-processes that we
spawn, like post-build or post-image scripts. This all depends on how
the user passes BR2_EXTERNAL; consider the following:

  - make BR2_EXTERNAL=/path/to/br2-ext
  - BR2_EXTERNAL=/path/to/br2-ext make

In the first case, it is just a make variable, not an environment
variable, and thus not exported, while in the second case it is an
environment variable and gets exported to all sub-processes make may
spawn.

Explicitly export it using EXTRA_ENV.

Reported-by: Julian Scheel <julian@jusst.de>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Julian Scheel <julian@jusst.de>
---
 package/Makefile.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 70529f8..803b162 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -326,7 +326,8 @@ HOST_MAKE_ENV = \
 EXTRA_ENV = \
 	PATH=$(BR_PATH) \
 	BR2_DL_DIR=$(BR2_DL_DIR) \
-	BUILD_DIR=$(BUILD_DIR)
+	BUILD_DIR=$(BUILD_DIR) \
+	BR2_EXTERNAL=$(BR2_EXTERNAL)
 
 ################################################################################
 # settings we need to pass to configure
-- 
1.9.1
