From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 18:55:44 +0200
Subject: [Buildroot] [git commit] pkg-generic: introduce helper function to
	check for a deprecated variable
Message-ID: <20141004170454.30A079D584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=220a583eb1662a949148b828125e5ed715cae662
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch introduces a helper check-deprecated-variable, that throws an
error when a package defines a deprecated variable. This helps in detecting
transition errors when changing the buildroot infrastructures, and also
helps users that have created packages not part of mainline buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4b6d818..a89425f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -264,6 +264,21 @@ endif
 endef
 
 ################################################################################
+# check-deprecated-variable -- throw an error on deprecated variables
+#
+# argument 1 is the deprecated variable
+# argument 2 is the new variable to use
+#
+# example:
+#   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
+################################################################################
+define check-deprecated-variable
+ifneq ($$(origin $(1)),undefined)
+$$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
+endif
+endef
+
+################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
 #
