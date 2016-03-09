From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  9 Mar 2016 23:58:58 +0100
Subject: [Buildroot] [PATCH v7 17/18] core: add check-leaks-in-{target, host,
	staging} targets
In-Reply-To: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1457564339-27294-18-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new targets allow identifying what need to be fixed to fulfill the
ultimate goal of removing any trace of the host in the target filesystem
or the SDK.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v6->v7:
- none

changes v5->v6:
- new patch
---
 Makefile             | 15 +++++++++++++++
 package/pkg-utils.mk |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/Makefile b/Makefile
index e4e9c65..45e8d41 100644
--- a/Makefile
+++ b/Makefile
@@ -616,6 +616,21 @@ endef
 TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 
+# Checks for build machine leaks into target filesystem, SDK
+check-leaks-in-target:
+	@$(call MESSAGE,Checking leaks in the target)
+	$(Q)$(call check-for-build-machine-leaks-in,$(TARGET_DIR))
+
+check-leaks-in-host:
+	@$(call MESSAGE,Checking leaks in the host)
+	$(Q)$(call check-for-build-machine-leaks-in,$(HOST_DIR))
+
+check-leaks-in-staging:
+	@$(call MESSAGE,Checking leaks in the staging)
+	$(Q)$(call check-for-build-machine-leaks-in,$(STAGING_DIR))
+
+check-leaks:	check-leaks-in-target check-leaks-in-host check-leaks-in-staging
+
 # RPATH fixing
 # - The host hook sets RPATH in host ELF binaries, using relative paths to the
 #   library locations.
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index f88313a..6a2cbb6 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -150,3 +150,8 @@ define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
 	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
 	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
 endef
+
+define check-for-build-machine-leaks-in
+	$(TOPDIR)/support/scripts/check-host-leaks $(1) \
+		$(TOPDIR) $(BASE_DIR) $(HOST_DIR) $(STAGING_DIR)
+endef
-- 
2.7.2
