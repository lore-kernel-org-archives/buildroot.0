From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 23:53:21 +0200
Subject: [Buildroot] [git commit] Makefile: save MAKE_VERSION
Message-ID: <20150714215404.4AA5580163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ac7da07991bbe26119a8cf932a4c955f0c78ece
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Save MAKE_VERSION as RUNNING_MAKE_VERSION since this is later clobbered
by the make package.

It will be used by the webkitgtk24 package to check for older make
versions which have a bug building it with parallel jobs (it hangs).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9a18853..531ac5d 100644
--- a/Makefile
+++ b/Makefile
@@ -43,10 +43,13 @@ all:
 # Set and export the version string
 export BR2_VERSION := 2015.08-git
 
+# Save running make version since it's clobbered by the make package
+RUNNING_MAKE_VERSION := $(MAKE_VERSION)
+
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
-ifneq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
-$(error You have make '$(MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
+ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
+$(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
 endif
 
 export HOSTARCH := $(shell uname -m | \
