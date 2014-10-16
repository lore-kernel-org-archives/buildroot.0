From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 19:04:18 +0200
Subject: [Buildroot] [git commit] pkg-utils: describe the case conversion
	macros in more detail.
Message-ID: <20141016170426.0C87BB76B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a89b98ae2a0af31dbad881fd47d29b1fe15d11f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After the refactoring of the case conversion macros in dd5e620ac, the
macro became even harder to understand. Improve this explanation a
little so future generations can make sense of what we're doing here.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-utils.mk |   26 ++++++++++++++++++--------
 1 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ce39197..7eddc47 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -5,14 +5,24 @@
 #
 ################################################################################
 
-# UPPERCASE Macro -- transform its argument to uppercase and replace dots and
-# hyphens to underscores
-
-# Heavily inspired by the up macro from gmsl (http://gmsl.sf.net)
-# This is approx 5 times faster than forking a shell and tr, and
-# as this macro is used a lot it matters
-# This works by creating translation character pairs (E.G. a:A b:B)
-# and then looping though all of them running $(subst from,to,text)
+# Case conversion macros. This is inspired by the 'up' macro from gmsl
+# (http://gmsl.sf.net). It is optimised very heavily because these macros
+# are used a lot. It is about 5 times faster than forking a shell and tr.
+#
+# The caseconvert-helper creates a definition of the case conversion macro.
+# After expansion by the outer $(eval ), the UPPERCASE macro is defined as:
+# $(strip $(eval __tmp := $(1))  $(eval __tmp := $(subst a,A,$(__tmp))) ... )
+# In other words, every letter is substituted one by one.
+#
+# The caseconvert-helper allows us to create this definition out of the
+# [FROM] and [TO] lists, so we don't need to write down every substition
+# manually. The uses of $ and $$ quoting are chosen in order to do as
+# much expansion as possible up-front.
+#
+# Note that it would be possible to conceive a slightly more optimal
+# implementation that avoids the use of __tmp, but that would be even
+# more unreadable and is not worth the effort.
+
 [FROM] := a b c d e f g h i j k l m n o p q r s t u v w x y z - .
 [TO]   := A B C D E F G H I J K L M N O P Q R S T U V W X Y Z _ _
 
