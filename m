From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 19:14:34 +0200
Subject: [Buildroot] [git commit] pkg-utils: introduce a make-based
	LOWERCASE function
Message-ID: <20140420171625.B8B349C83D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd5e620ac8211e970a2b12bedf114066026592bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Until now, our UPPERCASE function was implemented purely in make for
performance reasons, but our LOWERCASE function was implemented by
calling "tr", which was reasonable due to the fact that LOWERCASE was
rarely used, but future changes might make a more heavy usage of the
LOWERCASE macro.

We want this LOWERCASE function to turn a "_" into a "-" and not a
".", so we slightly adjust the existing FROM and TO lists to make this
possible. This doesn't change the behavior of the UPPERCASE macro
because both "-" and "." are converted into "_" by this function.

This change takes advantage of suggestions made by Arnout
Vandecappelle, who said they further improve the performance of
UPPERCASE and LOWERCASE by 30%/40%.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-utils.mk |   24 ++++++++++--------------
 1 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 91a1981..da3f0fc 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -13,24 +13,20 @@
 # as this macro is used a lot it matters
 # This works by creating translation character pairs (E.G. a:A b:B)
 # and then looping though all of them running $(subst from,to,text)
-[FROM] := a b c d e f g h i j k l m n o p q r s t u v w x y z . -
+[FROM] := a b c d e f g h i j k l m n o p q r s t u v w x y z - .
 [TO]   := A B C D E F G H I J K L M N O P Q R S T U V W X Y Z _ _
 
-UPPERCASE = $(strip $(eval __tmp := $1) \
-	$(foreach c, $(join $(addsuffix :,$([FROM])),$([TO])), \
-		$(eval __tmp :=	\
-		$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),\
-	$(__tmp)))) \
-	$(__tmp))
-
-# LOWERCASE macro -- transforms its arguments to lowercase
-# The above non-tr implementation is not needed, because LOWERCASE is not
-# called very often
-
-define LOWERCASE
-$(shell echo $1 | tr '[:upper:]' '[:lower:]')
+define caseconvert-helper
+$(1) = $$(strip \
+	$$(eval __tmp := $$(1))\
+	$(foreach c, $(2),\
+		$$(eval __tmp := $$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),$$(__tmp))))\
+	$$(__tmp))
 endef
 
+$(eval $(call caseconvert-helper,UPPERCASE,$(join $(addsuffix :,$([FROM])),$([TO]))))
+$(eval $(call caseconvert-helper,LOWERCASE,$(join $(addsuffix :,$([TO])),$([FROM]))))
+
 #
 # Manipulation of .config files based on the Kconfig
 # infrastructure. Used by the Busybox package, the Linux kernel
