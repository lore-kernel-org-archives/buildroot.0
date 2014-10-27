From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 27 Oct 2014 16:14:51 +0100
Subject: [Buildroot] [PATCH] Makefile: improve detection of make "-s" flag
Message-ID: <1414422891-7269-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because it's just checked the presence of the "s" character even a
  make --warn-undefined-variables
is detected as a silent build so fix this by filtering out long options.
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 907a0fc..4fd6b64 100644
--- a/Makefile
+++ b/Makefile
@@ -303,7 +303,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 TARGETS :=
 
 # silent mode requested?
-QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
+QUIET := $(if $(findstring s, $(filter-out --%, $(MAKEFLAGS))), -q)
 
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
-- 
2.1.1
