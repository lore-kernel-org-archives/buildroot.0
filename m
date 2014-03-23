From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Mar 2014 18:43:00 +0100
Subject: [Buildroot] [RFC 1/3] pkg-utils: introduce a make-based LOWERCASE
	function
In-Reply-To: <1395596582-7062-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1395596582-7062-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1395596582-7062-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, our UPPERCASE function was implemented purely in make for
performance reasons, but our LOWERCASE function was implemented by
calling "tr", which was reasonable due to the fact that LOWERCASE was
rarely used.

An upcoming change is going to make LOWERCASE used quite a bit more,
so we turn it into a pure make function.

Moreover, we want this LOWERCASE function to turn a "_" into a "-" and
not a ".", so we slightly adjust the existing FROM and TO lists to
make this possible. This doesn't change the behavior of the UPPERCASE
macro because both "-" and "." are converted into "_" by this
function.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-utils.mk | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 91a1981..8c3e534 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -13,7 +13,7 @@
 # as this macro is used a lot it matters
 # This works by creating translation character pairs (E.G. a:A b:B)
 # and then looping though all of them running $(subst from,to,text)
-[FROM] := a b c d e f g h i j k l m n o p q r s t u v w x y z . -
+[FROM] := a b c d e f g h i j k l m n o p q r s t u v w x y z - .
 [TO]   := A B C D E F G H I J K L M N O P Q R S T U V W X Y Z _ _
 
 UPPERCASE = $(strip $(eval __tmp := $1) \
@@ -23,13 +23,12 @@ UPPERCASE = $(strip $(eval __tmp := $1) \
 	$(__tmp)))) \
 	$(__tmp))
 
-# LOWERCASE macro -- transforms its arguments to lowercase
-# The above non-tr implementation is not needed, because LOWERCASE is not
-# called very often
-
-define LOWERCASE
-$(shell echo $1 | tr '[:upper:]' '[:lower:]')
-endef
+LOWERCASE = $(strip $(eval __tmp := $1) \
+	$(foreach c, $(join $(addsuffix :,$([TO])),$([FROM])), \
+		$(eval __tmp :=	\
+		$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),\
+	$(__tmp)))) \
+	$(__tmp))
 
 #
 # Manipulation of .config files based on the Kconfig
-- 
1.8.3.2
