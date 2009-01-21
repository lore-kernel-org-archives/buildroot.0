From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 21 Jan 2009 00:27:12 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgicc
Message-ID: <20090121002712.88E7B77099@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-21 00:27:11 +0000 (Wed, 21 Jan 2009)
New Revision: 24933

Log:
add patch form cgicc'upstream, build now completes\!

Added:
   trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch


Changeset:
Added: trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch
===================================================================
--- trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch	                        (rev 0)
+++ trunk/buildroot/package/libcgicc/cgicc-3.2.7-sort-undeclared.patch	2009-01-21 00:27:11 UTC (rev 24933)
@@ -0,0 +1,38 @@
+From: Robert Schwebel <r.schwebel@pengutronix.de>
+Subject: [patch] sort is now in <algorithm>
+
+When built with gcc-4.3.2, cgicc-3.2.7 cannot be compiled any more; sort
+is now being part of <algorithm> and must be written as ::sort:
+
+cardgame.cpp:1232: error: 'sort' was not declared in this scope
+make[2]: *** [cardgame.o] Error 1
+
+Fix it.
+
+Signed-off-by: Robert Schwebel <r.schwebel@pengutronix.de>
+
+---
+ demo/cardgame.cpp |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: cgicc-3.2.7/demo/cardgame.cpp
+===================================================================
+--- cgicc-3.2.7.orig/demo/cardgame.cpp
++++ cgicc-3.2.7/demo/cardgame.cpp
+@@ -36,6 +36,7 @@
+ #include <sstream>
+ #include <fstream>
+ #include <queue>
++#include <algorithm>
+ 
+ #include "cgicc/CgiDefs.h"
+ #include "cgicc/Cgicc.h"
+@@ -1043,7 +1044,7 @@ namespace CardGameTools
+ 
+ 	void drawPlayerCards(datasplayer *vPlayer)
+ 	{
+-		sort (vPlayer->cardsList->begin(),vPlayer->cardsList->end());
++		std::sort (vPlayer->cardsList->begin(),vPlayer->cardsList->end());
+ 		cout <<"<form name=\"cards\">"; 
+ 		cout <<"<input type=\"hidden\" name=\"actionner\" value=\"\">"; 
+ 		cout <<"<input type=\"hidden\" name=\"card\" value=\"\">"; 
