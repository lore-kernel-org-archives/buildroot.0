From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Apr 2018 11:10:53 +0200
Subject: [Buildroot] [PATCH 4/7] core/package: postpone evaluation of
 dependency conditions
In-Reply-To: <cover.1524301847.git.yann.morin.1998@free.fr>
References: <cover.1524301847.git.yann.morin.1998@free.fr>
Message-ID: <f274c0996622abccd5c65255b936010f37a22d66.1524301847.git.yann.morin.1998@free.fr>
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
Arnout: you the make expert, any idea why on Earth the single-expansion
was working in thefirst place?
---
 package/pkg-generic.mk | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1c9dd1d734..12e3981752 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -560,26 +560,26 @@ ifneq ($(1),host-skeleton)
 $(2)_DEPENDENCIES += host-skeleton
 endif
 
-ifeq ($(filter host-tar host-skeleton host-fakedate,$(1)),)
+ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_TAR_HOST_DEPENDENCY)
 endif
 
-ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
+ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_XZCAT_HOST_DEPENDENCY)
 endif
 
-ifeq ($(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
+ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
 $(2)_EXTRACT_DEPENDENCIES += $(BR2_LZIP_HOST_DEPENDENCY)
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
