From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 11 Jul 2015 17:40:14 +0200
Subject: [Buildroot] [PATCH v3] pkg-generic: Fix host _DL_VERSION corner case
In-Reply-To: <1436628092-30192-1-git-send-email-arnout@mind.be>
References: <1436628092-30192-1-git-send-email-arnout@mind.be>
Message-ID: <1436629214-32106-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

In the case when a package has a host version, the package is dependent
on the host version, and the version contains a '/', the host version
does not evaluate properly. The host version will contain a '_' instead
of a '/', resulting in a failed download. To solve this corner case, add
a check to see if the _DL_VERSION of the package has been defined before
defining the host _DL_VERSION. If the package _DL_VERSION has not been
defined yet, then the version string has not been formatted yet and is
still good to use.

[Arnout: further simplify things by lifting the override over _VERSION
out of the condition - it is always the same.]

This error occured on a package in a BR2_EXTERNAL that uses a git repo
for its remote storage with '/' in the tag names. I do not believe this
affects any packages in the Buildroot mainline but it could in the
future.

[Arnout: rebase on master, fix existing whitespace error in the else
branch.]

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v3: Re-instate Clayton as author - sorry about that
v2: rebase, fix whitespace error, lift _VERSION assignment out of condition
---
 package/pkg-generic.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9fe01b8..5f630e4 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -298,17 +298,17 @@ $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
 # Similar for spaces and colons (:) that may appear in date-based revisions for
 # CVS.
 ifndef $(2)_VERSION
- ifdef $(3)_VERSION
-  $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
-  $(2)_VERSION := $$(call sanitize,$$($(3)_VERSION))
+ ifdef $(3)_DL_VERSION
+  $(2)_DL_VERSION := $$($(3)_DL_VERSION)
+ else ifdef $(3)_VERSION
+  $(2)_DL_VERSION := $$($(3)_VERSION)
  else
-  $(2)_VERSION = undefined
   $(2)_DL_VERSION = undefined
  endif
 else
-  $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
-  $(2)_VERSION := $$(call sanitize,$$($(2)_VERSION))
+ $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
 endif
+$(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
 
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
 $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
-- 
2.1.4
