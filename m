From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 22 Apr 2016 22:50:21 +0200
Subject: [Buildroot] [PATCH v9 09/11] core: add check-leaks-in-{target, host,
	staging} targets
In-Reply-To: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
References: <1461358223-18312-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1461358223-18312-10-git-send-email-s.martin49@gmail.com>
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
changes v8->v9:
- none

changes v7->v8:
- update the check-host-leak script call

changes v6->v7:
- none

changes v5->v6:
- new patch
---
 Makefile             | 15 +++++++++++++++
 package/pkg-utils.mk |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/Makefile b/Makefile
index e92826f..a986c49 100644
--- a/Makefile
+++ b/Makefile
@@ -651,6 +651,21 @@ endef
 TARGET_FINALIZE_HOOKS += PURGE_LOCALES
 endif
 
+# Checks for build machine leaks into target filesystem, SDK
+check-leaks-in-target:
+	@$(call MESSAGE,Checking leaks in the target)
+	$(Q)$(call check-for-build-machine-leaks-in,$(TARGET_DIR))
+
+check-leaks-in-host:
+	@$(call MESSAGE,Checking leaks in the host)
+	$(Q)$(call check-for-build-machine-leaks-in,$(HOST_DIR),--exclude=$(STAGING_DIR))
+
+check-leaks-in-staging:
+	@$(call MESSAGE,Checking leaks in the staging)
+	$(Q)$(call check-for-build-machine-leaks-in,$(STAGING_DIR))
+
+check-leaks:	check-leaks-in-target check-leaks-in-host check-leaks-in-staging
+
 # Function sanitizing target/staging ELF files' RPATH.
 # i.e. it removes paths pointing to the staging or build location from the ELF
 # files' RPATH.
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index f88313a..8b80028 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -150,3 +150,8 @@ define legal-license-file # pkg, filename, file-fullpath, {HOST|TARGET}
 	mkdir -p $(LICENSE_FILES_DIR_$(4))/$(1)/$(dir $(2)) && \
 	cp $(3) $(LICENSE_FILES_DIR_$(4))/$(1)/$(2)
 endef
+
+define check-for-build-machine-leaks-in
+	$(TOPDIR)/support/scripts/check-host-leaks $(1) \
+		$(TOPDIR) $(BASE_DIR) $(HOST_DIR) $(STAGING_DIR) $(2)
+endef
-- 
2.8.0
