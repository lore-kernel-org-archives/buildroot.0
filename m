From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 20:46:05 +0100
Subject: [Buildroot] [git commit] br2-external: make it available to
	post-{build, image} scripts
Message-ID: <20150207202909.DF0998046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e91dfc68d7e7957e37e8125bf1ee982d94f53c51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
