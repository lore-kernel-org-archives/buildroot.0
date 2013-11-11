From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 22:44:08 +0100
Subject: [Buildroot] [git commit] gcc: don't patch gcc if there are no
	patches to apply
Message-ID: <20131111220328.526929BBE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=86a48c33b0f5cf7376c1fa1758ad1de5ec75380f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the generic package handler checks for a directory with patches
before starting apply-patches.sh, this is not the case for gcc: the
script is called, even if there is no directory with patches. This results
into a build failure, as apply-patches exits with error code 1 if the
directory doesn't exist.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 0c0cc99..41600ef 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -49,7 +49,9 @@ endif
 endif
 
 define HOST_GCC_APPLY_PATCHES
-	support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) \*.patch
+	if test -d package/gcc/$(GCC_VERSION); then \
+	  support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) \*.patch ; \
+	fi;
 	$(HOST_GCC_APPLY_POWERPC_PATCH)
 endef
 
