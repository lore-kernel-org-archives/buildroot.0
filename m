From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Oct 2015 11:15:06 +0200
Subject: [Buildroot] [PATCHv5 2/2] pkg-generic: improve incorrectly used
	package detection
In-Reply-To: <1444382106-16019-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1444382106-16019-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1444382106-16019-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package infrastructure now detects when a target package is being
built even if its corresponding Config.in option is not enabled, and
aborts with an error. However, it does not indicate *which* package is
improperly depending on the current package without selecting it at
the kconfig level.

So, in this commit, in addition to displaying an error, we try to help
the user by saying which packages could be the culprit. To achieve
this, we register the reverse dependencies of each package in a
variable called <pkg>_DEPENDENT_OF, and display this variable for the
problematic package when the error is detected. Many thanks to Yann
E. Morin for the idea and implementation!

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a831199..1266a47 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -150,6 +150,8 @@ ifeq ($(MAKECMDGOALS),)
 	@if test "$($(PKG)_TYPE)" = "target" -a -z "$($($(PKG)_KCONFIG_VAR))" ; then \
 		echo "ERROR: A package must have added $($(PKG)_NAME) to its _DEPENDENCIES line but" ; \
 		echo "forgot to add the corresponding select / depends on $($(PKG)_KCONFIG_VAR)." ; \
+		echo "Potential culprits:" ; \
+		for p in $($(PKG)_DEPENDENT_OF) ; do echo " - $$p" ; done ; \
 		exit 1 ; \
 	fi
 endif
@@ -777,6 +779,12 @@ endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 # configuration
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
+# Store reverse build-dependency information: we add the name of the
+# current package to the <pkg>_DEPENDENT_OF variable of all packages
+# the current package depends on.
+$$(eval $$(foreach d,$$($(2)_FINAL_ALL_DEPENDENCIES),\
+	$$(call UPPERCASE,$$(d))_DEPENDENT_OF += $(1)$$(sep)))
+
 # Ensure the calling package is the declared provider for all the virtual
 # packages it claims to be an implementation of.
 ifneq ($$($(2)_PROVIDES),)
-- 
2.6.1
