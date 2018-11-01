From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 21:35:30 +0100
Subject: [Buildroot] [git commit] package/pkg-genric: add possibility to
 declare download dependencies
Message-ID: <20181101210018.AC8FF867CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60d8633ea331225eca24bf3279297091862aee41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 6c72e13632..747e286baf 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -608,11 +608,13 @@ endif
 
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
 $(2)_FINAL_RECURSIVE_DEPENDENCIES = \
@@ -753,6 +755,7 @@ $$($(2)_TARGET_EXTRACT): | $$($(2)_FINAL_EXTRACT_DEPENDENCIES)
 $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
+$$($(2)_TARGET_SOURCE): | $$($(2)_FINAL_DOWNLOAD_DEPENDENCIES)
 
 $(1)-all-source:	$(1)-legal-source
 $(1)-legal-info:	$(1)-legal-source
