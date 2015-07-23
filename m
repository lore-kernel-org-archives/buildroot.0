From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:30:35 +0200
Subject: [Buildroot] [git commit] package/icu: icu-uc: provide -lstdc++ flag
	for static build
Message-ID: <20150723213351.D735A7F97A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13dc887cdaeda79ae3bc4f981c09448efa5eb04f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

icu-uc.pc must provide -lstdc++ for C application linked
statically with libicuuc.a.

Related to:
http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../icu/0005-fix-static-linking-with-icu-uc.patch  |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/icu/0005-fix-static-linking-with-icu-uc.patch b/package/icu/0005-fix-static-linking-with-icu-uc.patch
new file mode 100644
index 0000000..965906b
--- /dev/null
+++ b/package/icu/0005-fix-static-linking-with-icu-uc.patch
@@ -0,0 +1,34 @@
+From ffff12fd321c7a056e796e74cc508726b0626ae0 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 22 Jul 2015 22:43:25 +0200
+Subject: [PATCH] fix static linking with icu-uc
+
+During static linking with a C application and libicuuc.a,
+-lstdc++ is required.
+
+Add -lstdc++ in Libs.private of icu-uc.pc.
+
+Fixes:
+http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ source/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source/Makefile.in b/source/Makefile.in
+index 9db6c52..ca48e16 100644
+--- a/source/Makefile.in
++++ b/source/Makefile.in
+@@ -264,7 +264,7 @@ config/icu-uc.pc: config/icu.pc Makefile icudefs.mk
+ 	@echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data libraries" >> $@
+ 	@echo "Name: $(PACKAGE)-uc" >> $@
+ 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" >> $@
+-	@echo "Libs.private:" '$${baselibs}' >> $@
++	@echo "Libs.private:" '$${baselibs}' -lstdc++ >> $@
+ 	@echo $@ updated.
+ 
+ config/icu-i18n.pc: config/icu.pc Makefile icudefs.mk
+-- 
+2.4.3
+
