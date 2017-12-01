From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  1 Dec 2017 21:53:51 +0100
Subject: [Buildroot] [RFCv3 14/15] Makefile: evaluate CCACHE and HOST{CC,
 CXX} at time of use
In-Reply-To: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171201205352.24287-15-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we are going to move to per-package SDK, the location of CCACHE and
therefore the definitions of HOSTCC and HOSTCXX need to be evaluated
at the time of use and not at the time of assignment. Indeed, the
value of HOST_DIR changes from one package to the other.

Therefore, we need to change from := to =.

In addition, while doing A := $(something) $(A) is possible, doing A =
$(something) $(A) is not legal. So, instead of defining HOSTCC in
terms of the current HOSTCC variable, we re-use HOSTCC_NOCCACHE
instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v2:
 - New patch
---
 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index d8fa91120b..e05a1ec09a 100644
--- a/Makefile
+++ b/Makefile
@@ -446,11 +446,11 @@ BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 TARGET_DIR_WARNING_FILE = $(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 ifeq ($(BR2_CCACHE),y)
-CCACHE := $(HOST_DIR)/bin/ccache
+CCACHE = $(HOST_DIR)/bin/ccache
 BR_CACHE_DIR ?= $(call qstrip,$(BR2_CCACHE_DIR))
 export BR_CACHE_DIR
-HOSTCC := $(CCACHE) $(HOSTCC)
-HOSTCXX := $(CCACHE) $(HOSTCXX)
+HOSTCC = $(CCACHE) $(HOSTCC_NOCCACHE)
+HOSTCXX = $(CCACHE) $(HOSTCXX_NOCCACHE)
 else
 export BR_NO_CCACHE
 endif
-- 
2.13.6
