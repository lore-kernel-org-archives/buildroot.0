From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 11 Sep 2013 11:12:19 +0200
Subject: [Buildroot] [PATCH 2/2] pkg-stats: fix proper identification of
	package infrastructure
In-Reply-To: <1378890739-3788-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1378890739-3788-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1378890739-3788-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Typically each package invokes the macro which generates the Makefile code, in the way
like this: e.g. $(eval $(generic-package)) or $(eval $(autotools-package)) ,
but a few packages have to invoke this macro in other way:
$(eval $(call generic-package)) e.g. dhcpcd.mk
$(eval $(call autotools-package)) e.g. wireshark.mk .
This patch make changes to fix proper identification of package infrastructure.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 support/scripts/pkg-stats |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 4effa59..e982d9c 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -118,7 +118,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	hashost=1
     fi
 
-    if grep -E "\(autotools-package\)" $i > /dev/null ; then
+    if grep -E "autotools-package\)" $i > /dev/null ; then
 	infratype="autotools"
 	hastarget=1
     fi
@@ -128,7 +128,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	hashost=1
     fi
 
-    if grep -E "\(generic-package\)" $i > /dev/null ; then
+    if grep -E "generic-package\)" $i > /dev/null ; then
 	infratype="generic"
 	hastarget=1
     fi
-- 
1.7.9.5
