From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:46:06 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] fbgrab: explicitly build
	fbgrab target to workaround gzip issue
Message-ID: <20170517204653.D2A2E82862@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e75f4d6f636af65750486ff746f49d7c26946488
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes #9871

gzip reads default command line options from the environment variable GZIP.
The fbgrab Makefile internally also uses a GZIP make variable to know what
command to use to compress the manpage. Unfortunaly make will export the
value of this make variable to the environment if GZIP is already present in
the enviroment, confusing gzip (as 'gzip' isn't a valid command line argument).

This can either be triggered by users having GZIP set in their environment
(E.G.  for custom options), or by enabling BR2_REPRODUCIBLE, where we use
this feature to force the -n option (to not store name/timestamp) to gzip.

We don't really need to compress the manpage as it isn't installed anyway,
so work around the issue by only building the fbgrab application.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit be8d1efd1e5b8c4ceed34e8144d2cac075ab364e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbgrab/fbgrab.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 4455423..5cdf028 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -11,7 +11,7 @@ FBGRAB_LICENSE = GPLv2
 FBGRAB_LICENSE_FILES = COPYING
 
 define FBGRAB_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) fbgrab
 endef
 
 define FBGRAB_INSTALL_TARGET_CMDS
