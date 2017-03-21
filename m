From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:07:08 +0100
Subject: [Buildroot] [PATCH 12/16] barebox: exclude from hash check except
	for latest version
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-13-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of excluding the hash specifically for the custom tarball and
custom version cases, exclude it always except in the one case where
we do have a hash: the latest version.

This simplifies the code a little because soon we will add hash checks
for git as well, so we also need an exclusion in that case.

It is not needed to exclude it twice for barebox and barebox-aux,
because they use the same source tarball and barebox-aux can only be
enabled if barebox is enabled. So simplify even further by pulling
the exclusion logic out of inner-barebox-package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/barebox/barebox.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 7a110d2145..dc19224c76 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -22,7 +22,6 @@ ifeq ($$($(1)_VERSION),custom)
 $(1)_TARBALL = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
 $(1)_SITE = $$(patsubst %/,%,$$(dir $$($(1)_TARBALL)))
 $(1)_SOURCE = $$(notdir $$($(1)_TARBALL))
-BR_NO_CHECK_HASH_FOR += $$($(1)_SOURCE)
 else ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
 $(1)_SITE = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
 $(1)_SITE_METHOD = git
@@ -30,9 +29,6 @@ else
 # Handle stable official Barebox versions
 $(1)_SOURCE = barebox-$$($(1)_VERSION).tar.bz2
 $(1)_SITE = http://www.barebox.org/download
-ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_VERSION),y)
-BR_NO_CHECK_HASH_FOR += $$($(1)_SOURCE)
-endif
 endif
 
 $(1)_DEPENDENCIES = host-lzop
@@ -155,3 +151,7 @@ barebox-package=$(call inner-barebox-package,$(call UPPERCASE,$(pkgname)))
 
 include boot/barebox/barebox/barebox.mk
 include boot/barebox/barebox-aux/barebox-aux.mk
+
+ifeq ($(BR2_TARGET_BAREBOX)$(BR2_TARGET_BAREBOX_LATEST_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)
+endif
-- 
2.11.0
