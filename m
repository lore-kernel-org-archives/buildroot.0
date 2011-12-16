From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 16 Dec 2011 08:09:02 +0100
Subject: [Buildroot] [PATCH 2 of 4 v4] dependencies: check minimal make
	version early on
In-Reply-To: <patchbomb.1324018824@devws108>
References: <patchbomb.1324018824@devws108>
Message-ID: <e30db73389390b3c1c72.1324018826@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 Makefile |  6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -26,6 +26,12 @@
 # Set and export the version string
 export BR2_VERSION:=2011.11-rc2
 
+# Check for minimal make version (note: this check will break at make 10.x)
+MIN_MAKE_VERSION=3.81
+ifeq (,$(filter $(MIN_MAKE_VERSION),$(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION)))))
+$(error You have make '$(MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
+endif
+
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
 
