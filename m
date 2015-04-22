From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Apr 2015 01:08:08 +0200
Subject: [Buildroot] [PATCH] pkg-generic: substitute colon and space out of
	PKG_VERSION
In-Reply-To: <1429737867-1754-1-git-send-email-arnout@mind.be>
References: <1429737867-1754-1-git-send-email-arnout@mind.be>
Message-ID: <1429744088-19590-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using a colon or a space in a make target doesn't work, so they have to
be filtered out of the PKG_VERSION variable just like the / currently
already is.

This will be needed for date-based CVS versions.

Add a helper macro 'sanitize' in pkg-utils.mk to implement this. This
also moves the strip to the inner level for the target branch.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
  - Move to a helper macro (Thomas).
  - Add moving of strip to commit message (Yann).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-generic.mk | 6 ++++--
 package/pkg-utils.mk   | 5 +++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d1a1811..455bdf1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -322,17 +322,19 @@ $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
 # sanitize the package version that is used in paths, directory and file names.
 # Forward slashes may appear in the package's version when pointing to a
 # version control system branch or tag, for example remotes/origin/1_10_stable.
+# Similar for spaces and colons (:) that may appear in date-based revisions for
+# CVS.
 ifndef $(2)_VERSION
  ifdef $(3)_VERSION
   $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
-  $(2)_VERSION := $$(subst /,_,$$(strip $$($(3)_VERSION)))
+  $(2)_VERSION := $$(call sanitize,$$($(3)_VERSION))
  else
   $(2)_VERSION = undefined
   $(2)_DL_VERSION = undefined
  endif
 else
   $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
-  $(2)_VERSION := $$(strip $$(subst /,_,$$($(2)_VERSION)))
+  $(2)_VERSION := $$(call sanitize,$$($(2)_VERSION))
 endif
 
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 5a385f8..99a3c1e 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -37,6 +37,11 @@ endef
 $(eval $(call caseconvert-helper,UPPERCASE,$(join $(addsuffix :,$([FROM])),$([TO]))))
 $(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM]))))
 
+# Sanitize macro cleans up generic strings so it can be used as a filename
+# and in rules. Particularly useful for VCS version strings, that can contain
+# slashes, colons (OK in filenames but not in rules), and spaces.
+sanitize = $(subst $(space),_,$(subst :,_,$(subst /,_,$(strip $(1)))))
+
 #
 # Manipulation of .config files based on the Kconfig
 # infrastructure. Used by the BusyBox package, the Linux kernel
-- 
2.1.4
