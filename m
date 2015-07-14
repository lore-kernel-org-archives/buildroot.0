From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jul 2015 16:42:50 -0300
Subject: [Buildroot] [PATCH v5 1/6] Makefile: save MAKE_VERSION
In-Reply-To: <1436902975-5004-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436902975-5004-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436902975-5004-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Save MAKE_VERSION as RUNNING_MAKE_VERSION since this is later clobbered
by the make package.

It will be used by the webkitgtk24 package to check for older make
versions which have a bug building it with parallel jobs (it hangs).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9a18853..06ca929 100644
--- a/Makefile
+++ b/Makefile
@@ -43,10 +43,13 @@ all:
 # Set and export the version string
 export BR2_VERSION := 2015.08-git
 
+# Save running make version since it's clobbered by the make package
+RUNNING_MAKE_VERSION = $(MAKE_VERSION)
+
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
-ifneq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
-$(error You have make '$(MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
+ifneq ($(firstword $(sort $(RUNNING_MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
+$(error You have make '$(RUNNING_MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
 endif
 
 export HOSTARCH := $(shell uname -m | \
-- 
2.3.6
