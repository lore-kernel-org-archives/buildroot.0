From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 30 Dec 2014 14:58:37 +0100
Subject: [Buildroot] [PATCH v7 1/4] Makefile: improve detection of make "-s"
	flag
In-Reply-To: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
References: <1419947920-22047-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1419947920-22047-2-git-send-email-fabio.porcedda@gmail.com>
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
    v6:
     - use QUIET instead of BR_QUIET
    v5:
      - remove spaces after commas (Yann)
    v4:
      - split this patch from the patch set to send to muster as bugfix
    v2:
      - remove spurious space at the beginning of the QUIET variable (Arnout)
    v4:
      - split this patch from the patch set to send to muster as bugfix
    v2:
      - remove spurious space at the beginning of the QUIET variable (Arnout)

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e18a87e..c033620 100644
--- a/Makefile
+++ b/Makefile
@@ -303,7 +303,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 TARGETS :=
 
 # silent mode requested?
-QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
+QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
 
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
-- 
2.1.0
