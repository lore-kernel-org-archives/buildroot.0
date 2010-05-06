From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 May 2010 20:56:25 +0200
Subject: [Buildroot] [git commit master] Makefile.package.in: optimize
	UPPERCASE macro
Message-ID: <20100506185652.823378F552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4efdd9f3d949576392d0f0a7ed06e41b125916c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Thomas, we call the UPPERCASE macro a lot, and it slows down
startup quite a bit.

Optimize it by implementing it in make, rather than forking a shell + tr.
The implementation is heavily based on the 'up' macro from gmsl
(http://gmsl.sf.net)

With this in place, startup time is ~5 times lower.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index e98fda8..c2f86c7 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -24,7 +24,21 @@
 
 # UPPERCASE Macro -- transform its argument to uppercase and replace dots and
 # hyphens to underscores
-UPPERCASE = $(shell echo $(1) | tr "a-z.-" "A-Z__")
+
+# Heavily inspired by the up macro from gmsl (http://gmsl.sf.net)
+# This is approx 5 times faster than forking a shell and tr, and
+# as this macro is used a lot it matters
+# This works by creating translation character pairs (E.G. a:A b:B)
+# and then looping though all of them running $(subst from,to,text)
+[FROM] := a b c d e f g h i j k l m n o p q r s t u v w x y z . -
+[TO]   := A B C D E F G H I J K L M N O P Q R S T U V W X Y Z _ _
+
+UPPERCASE = $(strip $(eval __tmp := $1) \
+     $(foreach c, $(join $(addsuffix :,$([FROM])),$([TO])), \
+	$(eval __tmp :=	\
+		$(subst $(word 1,$(subst :, ,$c)),$(word 2,$(subst :, ,$c)),\
+			$(__tmp)))) \
+     $(__tmp))
 
 # Define extrators for different archive suffixes
 INFLATE.bz2 = $(BZCAT)
-- 
1.6.3.3
