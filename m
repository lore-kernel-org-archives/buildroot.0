From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 16:18:33 +0200
Subject: [Buildroot] [git commit] pkg-generic.mk: strip leading/trailing
	spaces
Message-ID: <20141012142330.82D4CB26AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f0748578166a4717bbbb941cf768f4dca75e971
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual gives this example for using the github macro:

  FOO_VERSION = v1.0 # tag or full commit ID

Unfortunately, people copy/pasting this example will face weird make errors,
because it leads the FOO_VERSION variable to end with a space.  Similar
problems can happen when testing a version bump or similar, so strip
leading/trailing spaces before the version is used to construct the build
directory path.

Reported-by: Edd Robbins <edd.robbins@gmail.com>
Cc: Edd Robbins <edd.robbins@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f09f83e..259ee02 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -318,15 +318,15 @@ $(2)_RAWNAME			=  $$(patsubst host-%,%,$(1))
 # version control system branch or tag, for example remotes/origin/1_10_stable.
 ifndef $(2)_VERSION
  ifdef $(3)_VERSION
-  $(2)_DL_VERSION := $$($(3)_VERSION)
-  $(2)_VERSION := $$(subst /,_,$$($(3)_VERSION))
+  $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
+  $(2)_VERSION := $$(subst /,_,$$(strip $$($(3)_VERSION)))
  else
   $(2)_VERSION = undefined
   $(2)_DL_VERSION = undefined
  endif
 else
-  $(2)_DL_VERSION := $$($(2)_VERSION)
-  $(2)_VERSION := $$(subst /,_,$$($(2)_VERSION))
+  $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
+  $(2)_VERSION := $$(strip $$(subst /,_,$$($(2)_VERSION)))
 endif
 
 $(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
