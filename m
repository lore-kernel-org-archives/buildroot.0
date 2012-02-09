From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 22:06:05 +0100
Subject: [Buildroot] [git commit] dependencies: check minimal make version
	early on
Message-ID: <20120209213031.A495690A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0edfb24c3840dd8df7cd69b8bdc3d4244334d2a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although support/dependencies/dependencies.sh checks for the version of make,
this script doesn't get a chance to run if make encounters a syntax error as a
result of being too old.

For example, the following syntax is only supported from make 3.81 onwards:

ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
include toolchain/toolchain-buildroot.mk
else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
include toolchain/toolchain-external.mk
else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
include toolchain/toolchain-crosstool-ng.mk
endif

This patch adds a check for the version of make very early in the Makefile, so
that old make versions are handled gracefully.

[Peter: simplify check]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 90d1a9d..2b228f7 100644
--- a/Makefile
+++ b/Makefile
@@ -26,6 +26,12 @@
 # Set and export the version string
 export BR2_VERSION:=2012.02-git
 
+# Check for minimal make version (note: this check will break at make 10.x)
+MIN_MAKE_VERSION=3.81
+ifeq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MAKE_VERSION))
+$(error You have make '$(MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
+endif
+
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
 
