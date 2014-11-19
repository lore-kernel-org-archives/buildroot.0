From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 19 Nov 2014 18:51:34 +0100
Subject: [Buildroot] [PATCH v4] Makefile: improve detection of make "-s" flag
Message-ID: <1416419494-14916-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because it's just checked the presence of the "s" character even a
  make --warn-undefined-variables
is detected as a silent build so fix this by filtering out long options.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---

Notes:
    v4:
     - split this patch from the patch set to send to muster as bugfix
    v2:
     - remove spurious space at the beginning of the QUIET variable (Arnout)

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 471edf9..6b97dc6 100644
--- a/Makefile
+++ b/Makefile
@@ -303,7 +303,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 TARGETS :=
 
 # silent mode requested?
-QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
+QUIET := $(if $(findstring s, $(filter-out --%, $(MAKEFLAGS))),-q)
 
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
-- 
2.1.3
