From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:08:41 +0200
Subject: [Buildroot] [git commit] core/download: fix source check for git
	method
Message-ID: <20170513131308.1EA6A81861@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c0aacbc317d298397cede593f74ece26d0a89f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3b26e6b..f474704 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -694,6 +694,7 @@ $(1)-legal-source:	$$($(2)_TARGET_ACTUAL_SOURCE)
 endif # actual sources != sources
 endif # actual sources != ""
 
+$(1)-source-check: PKG=$(2)
 $(1)-source-check:
 	$$(foreach p,$$($(2)_ALL_DOWNLOADS),$$(call SOURCE_CHECK,$$(p))$$(sep))
 
