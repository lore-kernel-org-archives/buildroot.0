From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 May 2018 22:40:17 +0200
Subject: [Buildroot] [PATCH 4/7 v2] core/package: postpone evaluation of
 dependency conditions
In-Reply-To: <cover.1525812011.git.yann.morin.1998@free.fr>
References: <cover.1525812011.git.yann.morin.1998@free.fr>
Message-ID: <30f2e071d783a9d6a5312fcb0da773ec091b5095.1525812011.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the pkg-inner macro, all variables, but he positional arguments,
must be $$-prefixed, so that they are expanded only when the macro
is evaluated in each package, not when the macro is parsed.

It is to be noted, though, that the current code, even though incorrect
by the above rules, seemed to work. However, the upcoming addition of
download dependencies, mimicking that code, would not work unless it
was $$-prefixed.

So, for consistency sake, and for correctness sake, let's always use
the $$-prefix in the inner macro.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - also fix BR2_{TAR,XZCAT,LZIP}_HOST_DEPENDENCY  (Arnout)
---
 package/pkg-generic.mk | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8a3b5f90a9..9d1fec396a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -567,26 +567,26 @@ ifneq ($(1),host-skeleton)
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
-- 
2.14.1
