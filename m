From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:56 -0000
Subject: [Buildroot] [git commit branch/next] add host arch detection and
	Kconfig BR2_HOSTARCH
Message-ID: <20120802195255.B77638D2C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d4104f0d0428297a8b447a0e08c81a9eaee7f62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This will allow to install binary package only if they are supported by the
host. As example Atmel SAM-BA (x86 only).

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in |    4 ++++
 Makefile  |   10 ++++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index 925c247..c182f70 100644
--- a/Config.in
+++ b/Config.in
@@ -10,6 +10,10 @@ config BR2_VERSION
 	string
 	option env="BR2_VERSION_FULL"
 
+config BR2_HOSTARCH
+	string
+	option env="HOSTARCH"
+
 source "target/Config.in.arch"
 
 menu "Build options"
diff --git a/Makefile b/Makefile
index d55b136..639fdaa 100644
--- a/Makefile
+++ b/Makefile
@@ -32,6 +32,16 @@ ifneq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSI
 $(error You have make '$(MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
 endif
 
+export HOSTARCH := $(shell uname -m | \
+	sed -e s/i.86/x86/ \
+	    -e s/sun4u/sparc64/ \
+	    -e s/arm.*/arm/ \
+	    -e s/sa110/arm/ \
+	    -e s/ppc64/powerpc/ \
+	    -e s/ppc/powerpc/ \
+	    -e s/macppc/powerpc/\
+	    -e s/sh.*/sh/)
+
 # This top-level Makefile can *not* be executed in parallel
 .NOTPARALLEL:
 
