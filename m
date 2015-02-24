From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Tue, 24 Feb 2015 16:26:10 -0600
Subject: [Buildroot] [PATCH] pkg-generic: Fix host _DL_VERSION corner case
Message-ID: <1424816770-14271-1-git-send-email-clayton.shotwell@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the case when a package has a host version, the package is dependent
on the host version, and the version contains a '/', the host version
does not evaluate properly. The host version will contain a '_' instead
of a '/', resulting in a failed download. To solve this corner case, add
a check to see if the _DL_VERSION of the package has been defined before
defining the host _DL_VERSION. If the package _DL_VERSION has not been
defined yet, then the version string has not been formatted yet and is
still good to use.

This error occured on a package in a BR2_EXTERNAL that uses a git repo
for its remote storage with '/' in the tag names. I do not believe this
affects any packages in the Buildroot mainline but it could in the
future.

Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
---
 package/pkg-generic.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1b09955..fcef461 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -323,7 +323,11 @@ $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
 # version control system branch or tag, for example remotes/origin/1_10_stable.
 ifndef $(2)_VERSION
  ifdef $(3)_VERSION
-  $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
+  ifdef $(3)_DL_VERSION
+   $(2)_DL_VERSION := $$(strip $$($(3)_DL_VERSION))
+  else
+   $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
+  endif
   $(2)_VERSION := $$(subst /,_,$$(strip $$($(3)_VERSION)))
  else
   $(2)_VERSION = undefined
-- 
1.9.1
