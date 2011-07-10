From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jul 2011 22:24:56 +0200
Subject: [Buildroot] [git commit] package: add support for post-download
	hooks
Message-ID: <20110710203105.5B5038A42E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c917550361feb0858e5cc479273f46af136d8347
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed for the Linux kernel package, which needs to
download patches in a custom way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 8b5657b..aa5c0d7 100644
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
1.7.3.4
