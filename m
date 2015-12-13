From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2015 19:35:14 +0100
Subject: [Buildroot] [PATCH 05/13 v2] core/pkg-generic: add variable to
	store the package rawname-version
In-Reply-To: <cover.1450031251.git.yann.morin.1998@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
Message-ID: <4640c83000bc6b54c6949415dc94a50187766f15.1450031251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce a new per-package variable to store the 'rawname-version'
tuple, instead of computing it every time we need it.

Currently, it's only a single location, but follw-up patches will
introduce more use of it.

Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 832045e..784c39c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -388,6 +388,7 @@ else
  $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
 endif
 $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
+$(2)_RAWNAME_VERSION = $$($(2)_RAWNAME)-$$($(2)_VERSION)
 
 ifdef $(3)_OVERRIDE_SRCDIR
   $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
@@ -424,7 +425,7 @@ ifndef $(2)_SOURCE
  ifdef $(3)_SOURCE
   $(2)_SOURCE = $$($(3)_SOURCE)
  else
-  $(2)_SOURCE			?= $$($(2)_RAWNAME)-$$($(2)_VERSION).tar.gz
+  $(2)_SOURCE			?= $$($(2)_RAWNAME_VERSION).tar.gz
  endif
 endif
 
-- 
1.9.1
