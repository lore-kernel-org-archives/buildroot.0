From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 12:07:51 +0100
Subject: [Buildroot] [git commit] Makefile: add pkg-stats target
Message-ID: <20201111110343.A76E6814EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78568465228724efca9d0d98f247c0f253cfa8eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that pkg-stats is not just a maintainer-oriented tool, but a tool
generally useful to users, introduce a make target to run
pkg-stats. Of course, it is run with the newly introduced -c option,
which produces a pkg-stats output for just the selection of packages
of the currently defined configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index f9e9cfa968..fa648d5d54 100644
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
@@ -1154,6 +1162,7 @@ help:
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
+	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
