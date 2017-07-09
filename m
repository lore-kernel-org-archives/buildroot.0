From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jul 2017 01:21:22 +0200
Subject: [Buildroot] [PATCH 6/7] Makefile: add check that $(HOST_DIR)/usr is
	not a directory
In-Reply-To: <20170709232123.30120-1-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
Message-ID: <20170709232123.30120-7-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We create a compatibility symlink for $(HOST_DIR)/usr. However, if
that exists already as a directory, the link can't be created. Make
will not even try since it exists already and has no dependencies. If
it exists as a directory, any post-build script that is still using
$(HOST_DIR)/usr will fail to find what it needs. Therefore, add a
check that it is not a directory.

This check has to be made as part of some PHONY target. We can reuse
the dirs target, on which all packages depend.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
Personally I don't think it's important enough to add such a check.
If someone ends up in this situation, they'll be motivated to fix
their post-build scripts :-)
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 188ce9adc7..a94555d130 100644
--- a/Makefile
+++ b/Makefile
@@ -542,6 +542,11 @@ endif
 .PHONY: dirs
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(HOST_DIR)/usr $(BINARIES_DIR)
+	@if [ -d "$(HOST_DIR)/usr" -a ! -L "$(HOST_DIR)/usr" ]; then \
+		printf '%s is not allowed to be a directory\n' "$(HOST_DIR)/usr" 1>&2; \
+		printf 'Please remove this directory and rebuild\n' 1>&2; \
+		exit 1; \
+	fi
 
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
-- 
2.13.2
