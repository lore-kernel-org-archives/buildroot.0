From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 21:31:36 +0100
Subject: [Buildroot] [git commit] package/pkg-generic: postpone evaluation
 of dependency conditions
Message-ID: <20181101210018.9DFA2870DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8c0caadec8e2518364027855fa885b1fa884835
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the pkg-inner macros, all variables, but the positional arguments,
must be $$-prefixed, so that they are expanded only when the macro is
evaluated in each package, not when the macro is parsed.

It is to be noted, though, that the current code, even though
incorrect by the above rules, seemed to work. However, the upcoming
addition of download dependencies, mimicking that code, would not work
unless it was $$-prefixed.

So, for consistency sake, and for correctness sake, let's always use
the $$-prefix in the inner macro.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 39174edf6a..6c72e13632 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -582,26 +582,26 @@ ifneq ($(1),host-skeleton)
 $(2)_DEPENDENCIES += host-skeleton
 endif
 
-ifeq ($(filter host-tar host-skeleton host-fakedate,$(1)),)
-$(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
+ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
+$(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
 endif
 
-ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
-$(2)_EXTRACT_DEPENDENCIES += $(BR2_XZCAT_HOST_DEPENDENCY)
+ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
+$(2)_EXTRACT_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
 endif
 
-ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
-$(2)_EXTRACT_DEPENDENCIES += $(BR2_LZIP_HOST_DEPENDENCY)
+ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
+$(2)_EXTRACT_DEPENDENCIES += $$(BR2_LZIP_HOST_DEPENDENCY)
 endif
 
-ifeq ($(BR2_CCACHE),y)
-ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
+ifeq ($$(BR2_CCACHE),y)
+ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
 $(2)_DEPENDENCIES += host-ccache
 endif
 endif
 
-ifeq ($(BR2_REPRODUCIBLE),y)
-ifeq ($(filter host-skeleton host-fakedate,$(1)),)
+ifeq ($$(BR2_REPRODUCIBLE),y)
+ifeq ($$(filter host-skeleton host-fakedate,$(1)),)
 $(2)_DEPENDENCIES += host-fakedate
 endif
 endif
