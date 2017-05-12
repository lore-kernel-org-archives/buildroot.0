From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 May 2017 17:54:29 +0200
Subject: [Buildroot] [PATCH] core/download: fix source check for git method
Message-ID: <20170512155429.26176-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Running foo-source-check on packages retrieved from git fails.

This is because there is no associated stamp file, so we do not have a
rule-assignment that sets PKG for foo-source-check.

But it does not make sense to have a stamp file at all, because
source-check is not supposed to change anything: the status after is
exactly the same as before; nothing is downlaoded, so there is no
progress (whatsoever) to memorise.

Fix that by just defining PKG in the source-check rule definition.

Fixes #9796.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3b26e6b483..f474704980 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -694,6 +694,7 @@ $(1)-legal-source:	$$($(2)_TARGET_ACTUAL_SOURCE)
 endif # actual sources != sources
 endif # actual sources != ""
 
+$(1)-source-check: PKG=$(2)
 $(1)-source-check:
 	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
 
-- 
2.11.0
