From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Apr 2018 11:10:54 +0200
Subject: [Buildroot] [PATCH 5/7] core/package: add possibility to declare
 download dependencies
In-Reply-To: <cover.1524301847.git.yann.morin.1998@free.fr>
References: <cover.1524301847.git.yann.morin.1998@free.fr>
Message-ID: <84c119a06517599853f67712361eeb48e4edef2f.1524301847.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some packages, we may need to have a certain set of host-tools built
before the download of said packages are attempted. For example, when
the system tar is not suitable, we will want to build our own tar before
we attempt a git download (because we generate a tarball in the git
backend).

Mimick the _EXTRACT_DEPENDENCIES, and introduce _DOWNLOAD_DEPENDENCIES.
As for _EXTRACT_DEPENDENCIES, we do not document _DOWNLOAD_DEPENDENCIES,
on the assumption that it is mostly for internal use.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 12e3981752..6222d238c6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -586,11 +586,13 @@ endif
 
 # Eliminate duplicates in dependencies
 $(2)_FINAL_DEPENDENCIES = $$(sort $$($(2)_DEPENDENCIES))
+$(2)_FINAL_DOWNLOAD_DEPENDENCIES = $$(sort $$($(2)_DOWNLOAD_DEPENDENCIES))
 $(2)_FINAL_EXTRACT_DEPENDENCIES = $$(sort $$($(2)_EXTRACT_DEPENDENCIES))
 $(2)_FINAL_PATCH_DEPENDENCIES = $$(sort $$($(2)_PATCH_DEPENDENCIES))
 $(2)_FINAL_ALL_DEPENDENCIES = \
 	$$(sort \
 		$$($(2)_FINAL_DEPENDENCIES) \
+		$$($(2)_FINAL_DOWNLOAD_DEPENDENCIES) \
 		$$($(2)_FINAL_EXTRACT_DEPENDENCIES) \
 		$$($(2)_FINAL_PATCH_DEPENDENCIES))
 
@@ -717,6 +719,7 @@ $$($(2)_TARGET_EXTRACT): | $$($(2)_FINAL_EXTRACT_DEPENDENCIES)
 $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
+$$($(2)_TARGET_SOURCE): | $$($(2)_FINAL_DOWNLOAD_DEPENDENCIES)
 
 $(1)-all-source:	$(1)-legal-source
 $(1)-legal-info:	$(1)-legal-source
-- 
2.14.1
