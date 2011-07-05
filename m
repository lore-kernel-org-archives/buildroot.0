From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2011 21:54:11 +0200
Subject: [Buildroot] [PATCH 20/28] package: add support for post-download
	hooks
In-Reply-To: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <396f22aadbba052e2dff88a399347f001292d099.1309895466.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will be needed for the Linux kernel package, which needs to
download patches in a custom way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index e407cdb..0236024 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -234,6 +234,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
 endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE)))
 	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))
+	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
 	$(Q)mkdir -p $(@D)
 	$(Q)touch $@
@@ -437,6 +438,7 @@ $(2)_EXTRACT_CMDS ?= \
 	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
 
 # post-steps hooks
+$(2)_POST_DOWNLOAD_HOOKS        ?=
 $(2)_POST_EXTRACT_HOOKS         ?=
 $(2)_POST_PATCH_HOOKS           ?=
 $(2)_PRE_CONFIGURE_HOOKS        ?=
-- 
1.7.4.1
