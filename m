From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jan 2016 19:15:05 +0100
Subject: [Buildroot] [PATCH 07/16 v3] core/pkg-generic: add variable to
	store the package rawname-version
In-Reply-To: <cover.1454004518.git.yann.morin.1998@free.fr>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
Message-ID: <b9e50ce8292e968abe25a313399fce575b4c28b4.1454004518.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce a new per-package variable to store the 'rawname-version'
tuple, instead of computing it every time we need it.

Currently, it's only a single location, but follow-up patches will
introduce more use of it.

Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f8ff6f1..b7d374a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -387,6 +387,7 @@ else
  $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
 endif
 $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
+$(2)_RAWNAME_VERSION = $$($(2)_RAWNAME)-$$($(2)_VERSION)
 
 ifdef $(3)_OVERRIDE_SRCDIR
   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
@@ -423,7 +424,7 @@ ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
  else
-  $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
+  $(2)_SOURCE			?= $$($(2)_RAWNAME_VERSION).tar.gz
  endif
 endif
 
-- 
1.9.1
