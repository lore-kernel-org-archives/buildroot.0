From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Nov 2020 17:30:22 +0100
Subject: [Buildroot] [PATCH 4/5] Makefile: add pkg-stats target
In-Reply-To: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
References: <20201105163024.1387248-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201105163024.1387248-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that pkg-stats is not just a maintainer-oriented tool, but a tool
generally useful to users, introduce a make target to run
pkg-stats. Of course, it is run with the newly introduced -c option,
which produces a pkg-stats output for just the selection of packages
of the currently defined configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index d4751e278e..ad5121a062 100644
--- a/Makefile
+++ b/Makefile
@@ -937,6 +937,14 @@ show-info:
 		) \
 	)
 
+.PHONY: pkg-stats
+pkg-stats:
+	@cd "$(CONFIG_DIR)" ; \
+	$(TOPDIR)/support/scripts/pkg-stats -c \
+		--json $(O)/pkg-stats.json \
+		--html $(O)/pkg-stats.html \
+		--nvd-path $(DL_DIR)/buildroot-nvd
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 # Some subdirectories are also package names. To avoid that "make linux"
@@ -1156,6 +1164,7 @@ help:
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
+	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
-- 
2.26.2
