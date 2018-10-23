From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Oct 2018 11:43:35 +0200
Subject: [Buildroot] [git commit] core: support host gcc of the future
Message-ID: <20181023094415.60EB7885F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3950e69dad925b684aaf7462713e50aab882de28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we do a release, we know only of a set of gcc versions that the
host may have. But in the future, distributions with newer gcc versions
may show up.

Currently, we do not recognise those versions, and thus we do as if they
were older than the oldest we know of. This means that a set of packages
become unselectable, when they should be.

We fix that by capping the detected version to the highest we know of.

Reported-by: gargar_ on IRC
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in |  3 +++
 Makefile  | 10 ++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 6b5b2b043c..42cdf7a3eb 100644
--- a/Config.in
+++ b/Config.in
@@ -67,6 +67,9 @@ config BR2_HOST_GCC_AT_LEAST_8
 	default y if BR2_HOST_GCC_VERSION = "8"
 	select BR2_HOST_GCC_AT_LEAST_7
 
+# When adding new entries above, be sure to update
+# the HOSTCC_MAX_VERSION variable in the Makefile.
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: kodi)
 config BR2_NEEDS_HOST_JAVA
diff --git a/Makefile b/Makefile
index d39a94e832..a69af3b645 100644
--- a/Makefile
+++ b/Makefile
@@ -351,8 +351,14 @@ export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
 	    -e 's/macppc/powerpc/' \
 	    -e 's/sh.*/sh/' )
 
-HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
-	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p')
+# When adding a new host gcc version in Config.in,
+# update the HOSTCC_MAX_VERSION variable:
+HOSTCC_MAX_VERSION := 8
+
+HOSTCC_VERSION := $(shell V=$$($(HOSTCC_NOCCACHE) --version | \
+	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p'); \
+	[ "$${V%% *}" -le $(HOSTCC_MAX_VERSION) ] || V=$(HOSTCC_MAX_VERSION); \
+	printf "%s" "$${V}")
 
 # For gcc >= 5.x, we only need the major version.
 ifneq ($(firstword $(HOSTCC_VERSION)),4)
