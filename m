From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Sep 2016 22:53:28 +0200
Subject: [Buildroot] [git commit branch/2016.08.x] Update for 2016.08.1
Message-ID: <20160921205416.DAFA881E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1001acaf08da9d203953a5b4c3dee68e3c0d537
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 25 +++++++++++++++++++++++++
 Makefile |  2 +-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 97749ca..ef72ff8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,28 @@
+2016.08.1, Released September 21st, 2016
+
+	Fix potential entire root filesystem removal in the external
+	toolchain handling. This would trigger if (and only if) the
+	following conditions are met:
+
+	- The user has selected a "known toolchain profile", such as a
+	  Linaro toolchain, a Sourcery CodeBench toolchain etc. People
+	  using "custom toolchain profile" are not affected.
+
+	- The user has enabled BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
+	  to indicate that the toolchain is already locally available
+	  (as opposed to having Buildroot download and extract the
+	  toolchain)
+
+	- The user has left BR2_TOOLCHAIN_EXTERNAL_PATH empty, because
+	  his toolchain is directly available through the PATH
+	  environment variable. When BR2_TOOLCHAIN_EXTERNAL_PATH is
+	  non-empty, Buildroot will do something silly (remove the
+	  toolchain contents), but that are limited to the toolchain
+	  itself.
+
+	When such conditions are met, Buildroot will run "rm -rf /*"
+	due to TOOLCHAIN_EXTERNAL_INSTALL_DIR being empty.
+
 2016.08, Released Septermber 1st, 2016
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index 283147c..bd6f17b 100644
--- a/Makefile
+++ b/Makefile
@@ -46,7 +46,7 @@ else # umask
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.08
+export BR2_VERSION := 2016.08.1
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
