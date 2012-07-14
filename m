From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 14 Jul 2012 22:31:19 +0200
Subject: [Buildroot] [PATCH v2 1/6] pkg-infra: remove self-dependency from
	host packages
In-Reply-To: <20120714121644.6d62142b@skate>
Message-ID: <1342297879-9881-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When HOST_XXX_DEPENDENCIES are derived automatically from
XXX_DEPENDENCIES, a self-dependency is created if host-xxx is a dependency
of xxx.  This was the case for miniperl.

Filter out the self-dependency.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2:
 - Also update pkg-autotargets and pkg-cmaketargets (as suggested by
   Simon Dawson)

 package/pkg-autotargets.mk  |    2 +-
 package/pkg-cmaketargets.mk |    2 +-
 package/pkg-gentargets.mk   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-autotargets.mk b/package/pkg-autotargets.mk
index c9887c2..d31230d 100644
--- a/package/pkg-autotargets.mk
+++ b/package/pkg-autotargets.mk
@@ -201,7 +201,7 @@ endef
 # This must be repeated from GENTARGETS_INNER, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # away from the non-host rule
-$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool,\
+$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool $(1),\
     $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 
diff --git a/package/pkg-cmaketargets.mk b/package/pkg-cmaketargets.mk
index 371ab11..b405df5 100644
--- a/package/pkg-cmaketargets.mk
+++ b/package/pkg-cmaketargets.mk
@@ -98,7 +98,7 @@ endif
 
 # This must be repeated from GENTARGETS_INNER, otherwise we only get
 # host-cmake in _DEPENDENCIES because of the following line
-$(2)_DEPENDENCIES ?= $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES)))
+$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 $(2)_DEPENDENCIES += host-cmake
 
diff --git a/package/pkg-gentargets.mk b/package/pkg-gentargets.mk
index 1c9b458..5da9cdc 100644
--- a/package/pkg-gentargets.mk
+++ b/package/pkg-gentargets.mk
@@ -245,7 +245,7 @@ $(2)_OVERRIDE_SRCDIR = $($(2)_SITE)
 endif
 endif
 
-$(2)_DEPENDENCIES ?= $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES)))
+$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
-- 
tg: (830c586..) t/host-no-circular-dep (depends on: master)
