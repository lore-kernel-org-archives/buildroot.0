From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 11 Nov 2013 15:36:36 +0100
Subject: [Buildroot] [PATCH] gcc: don't patch gcc if there are no patches to
	apply
Message-ID: <1384180596-15125-1-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While the generic package handler checks for a directory with patches
before starting apply-patches.sh, this is not the case for gcc: the
script is called, even if there is no directory with patches. This results
into a build failure, as apply-patches exits with error code 1 if the
directory doesn't exist.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 package/gcc/gcc.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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
 
-- 
1.7.9.5
