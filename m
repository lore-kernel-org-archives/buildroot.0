From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 12:00:24 +0200
Subject: [Buildroot] [git commit] reproducibility: override locale and
	timezone
Message-ID: <20160702100057.86B8481843@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5f3513b220015bceed2de231e90fe6e4b4431b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And export BR2_REPRODUCIBLE for post-build / post-image scripts.

[Peter: Extend commit message,
	move export together with our other exports,
	add comment explaining why we override local/timezone]
Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Makefile b/Makefile
index 41f0274..027f21c 100644
--- a/Makefile
+++ b/Makefile
@@ -213,6 +213,13 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(BR2_CONFIG)
 endif
 
+# timezone and locale may affect build output
+ifeq ($(BR2_REPRODUCIBLE),y)
+export TZ=UTC
+export LANG=C
+export LC_ALL=C
+endif
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifeq ("$(origin V)", "command line")
@@ -410,6 +417,7 @@ endif
 # Scripts in support/ or post-build scripts may need to reference
 # these locations, so export them so it is easier to use
 export BR2_CONFIG
+export BR2_REPRODUCIBLE
 export TARGET_DIR
 export STAGING_DIR
 export HOST_DIR
