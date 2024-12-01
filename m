Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57318D49789
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 20:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D460584396;
	Sun,  1 Dec 2024 20:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABi11t5bUxYd; Sun,  1 Dec 2024 20:43:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FB2484479
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FB2484479;
	Sun,  1 Dec 2024 20:43:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 957C76C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 20:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76F7C820F8
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 20:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4hIY0rJg5XX for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 20:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6527E845EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6527E845EA
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 20:43:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57E51867ED; Sun,  1 Dec 2024 20:43:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Dec 2024 21:42:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47c5ac28e1037881f5ea13f3ab2d676fb0e000aa
X-Git-Newrev: 58ff0cb5c43cd6909841b066a78a7689eeea6080
X-Patchwork-Hint: ignore
Message-Id: <20241201204301.57E51867ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lrzsz: fix FTBFS by upgrading and
 applying Debian fix
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7961654719266223162=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7961654719266223162==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=58ff0cb5c43cd6909841b066a78a7689eeea6080
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This failure appeared when trying to build lrzsz:

lsyslog.c:73:5: error: implicit declaration of function ‘vasprintf’; did you mean ‘vsprintf’? [-Wimplicit-function-declaration]

To fix the problem, let's follow Debian. Switch to 0.12.21rc (which is
already out there 25 years!) and import their patch adding includes.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[Peter: add Upstream tag to patch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../lrzsz/0001-configure-fix-main-prototype.patch  |  16 +--
 .../lrzsz/0004-FTBFS-fix-missing-includes.patch    | 124 +++++++++++++++++++++
 package/lrzsz/lrzsz.hash                           |   2 +-
 package/lrzsz/lrzsz.mk                             |   4 +-
 4 files changed, 136 insertions(+), 10 deletions(-)

diff --git a/package/lrzsz/0001-configure-fix-main-prototype.patch b/package/lrzsz/0001-configure-fix-main-prototype.patch
index 46b7aade00..dfe4385a1c 100644
--- a/package/lrzsz/0001-configure-fix-main-prototype.patch
+++ b/package/lrzsz/0001-configure-fix-main-prototype.patch
@@ -1,4 +1,4 @@
-From 43b2b711fedd3a28d497b3a5c0e9054fa203ef3d Mon Sep 17 00:00:00 2001
+From c2758812867a52a6bb56b87d52c35ebff797e777 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 15 Sep 2024 15:12:07 +0200
 Subject: [PATCH] configure: fix main() prototype
@@ -10,23 +10,25 @@ configure script directly.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Upstream: N/A, patching generated file
+[wsa: rebased to 0.12.21rc]
+Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
 ---
  configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index db26726..d160e27 100755
+index cc586d5..16a259a 100755
 --- a/configure
 +++ b/configure
-@@ -1008,7 +1008,7 @@ cross_compiling=$ac_cv_prog_cc_cross
- cat > conftest.$ac_ext <<EOF
- #line 1010 "configure"
+@@ -1053,7 +1053,7 @@ cat > conftest.$ac_ext << EOF
+ #line 1054 "configure"
  #include "confdefs.h"
+ 
 -main(){return(0);}
 +int main(){return(0);}
  EOF
- if { (eval echo configure:1014: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest; then
+ if { (eval echo configure:1059: \"$ac_link\") 1>&5; (eval $ac_link) 2>&5; } && test -s conftest${ac_exeext}; then
    ac_cv_prog_cc_works=yes
 -- 
-2.46.0
+2.45.2
 
diff --git a/package/lrzsz/0004-FTBFS-fix-missing-includes.patch b/package/lrzsz/0004-FTBFS-fix-missing-includes.patch
new file mode 100644
index 0000000000..51b5f09c26
--- /dev/null
+++ b/package/lrzsz/0004-FTBFS-fix-missing-includes.patch
@@ -0,0 +1,124 @@
+From a9faaf7f02811e7409074362700e963609885ba6 Mon Sep 17 00:00:00 2001
+From: Wolfram Sang <wsa+renesas@sang-engineering.com>
+Date: Fri, 29 Nov 2024 14:14:25 +0100
+Subject: [PATCH] FTBFS fix missing includes
+
+From: https://sources.debian.org/data/main/l/lrzsz/0.12.21rc-0.1/debian/patches/include.diff
+
+Description: Fixes FTBFS (missing includes)
+Author: Martin A. Godisch <godisch@debian.org>
+Bug-Debian: https://bugs.debian.org/1066514
+Forwarded: no
+
+Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
+Upstream: https://sources.debian.org/data/main/l/lrzsz/0.12.21rc-0.1/debian/patches/include.diff
+---
+ lib/error.c     | 1 +
+ src/canit.c     | 1 +
+ src/lrz.c       | 1 +
+ src/lsyslog.c   | 1 +
+ src/lsz.c       | 1 +
+ src/tcp.c       | 1 +
+ src/zperr.c     | 1 +
+ src/zreadline.c | 1 +
+ 8 files changed, 8 insertions(+)
+
+diff --git a/lib/error.c b/lib/error.c
+index 8b96b91..3861578 100644
+--- a/lib/error.c
++++ b/lib/error.c
+@@ -22,6 +22,7 @@ Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
+ #endif
+ 
+ #include <stdio.h>
++#include <string.h>
+ 
+ #if HAVE_VPRINTF || HAVE_DOPRNT || _LIBC || defined(__cplusplus)
+ # if __STDC__ || defined(__cplusplus)
+diff --git a/src/canit.c b/src/canit.c
+index f947a25..ae91807 100644
+--- a/src/canit.c
++++ b/src/canit.c
+@@ -24,6 +24,7 @@
+ #define SS_NORMAL 0
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <signal.h>
+ #include <setjmp.h>
+ #include <ctype.h>
+diff --git a/src/lrz.c b/src/lrz.c
+index 2f6a5ad..63e1326 100644
+--- a/src/lrz.c
++++ b/src/lrz.c
+@@ -27,6 +27,7 @@
+ #define SS_NORMAL 0
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <signal.h>
+ #include <ctype.h>
+ #include <errno.h>
+diff --git a/src/lsyslog.c b/src/lsyslog.c
+index d21ab35..24d8cd1 100644
+--- a/src/lsyslog.c
++++ b/src/lsyslog.c
+@@ -18,6 +18,7 @@
+   02111-1307, USA.
+ 
+ */
++#define _GNU_SOURCE
+ #include "config.h"
+ #ifdef ENABLE_SYSLOG
+ #include "zglobal.h"
+diff --git a/src/lsz.c b/src/lsz.c
+index b9d2545..1598150 100644
+--- a/src/lsz.c
++++ b/src/lsz.c
+@@ -28,6 +28,7 @@
+ #define SS_NORMAL 0
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <signal.h>
+ #include <setjmp.h>
+ #include <ctype.h>
+diff --git a/src/tcp.c b/src/tcp.c
+index 7e1ba3f..cdf9187 100644
+--- a/src/tcp.c
++++ b/src/tcp.c
+@@ -33,6 +33,7 @@
+ #include <ctype.h>
+ #include <stdio.h>
+ #include <signal.h>
++#include <string.h>
+ 
+ #include "zglobal.h"
+ #include <stdlib.h>
+diff --git a/src/zperr.c b/src/zperr.c
+index 31963de..0b9dc29 100644
+--- a/src/zperr.c
++++ b/src/zperr.c
+@@ -22,6 +22,7 @@
+ #include "zglobal.h"
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <errno.h>
+ 
+ #ifdef __STDC__
+diff --git a/src/zreadline.c b/src/zreadline.c
+index dd9736b..7bc3736 100644
+--- a/src/zreadline.c
++++ b/src/zreadline.c
+@@ -27,6 +27,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <signal.h>
+ #include <ctype.h>
+ #include <errno.h>
+-- 
+2.45.2
+
diff --git a/package/lrzsz/lrzsz.hash b/package/lrzsz/lrzsz.hash
index cd8dd6f489..5c2f2ef951 100644
--- a/package/lrzsz/lrzsz.hash
+++ b/package/lrzsz/lrzsz.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1  lrzsz-0.12.20.tar.gz
+sha256  4d845f239ddcd86735b5dbf01f3869b072ffb6f6c8aa24c346dc4a3c95453c55  lrzsz-0.12.21rc.tar.gz
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 7247a4bd59..12d52b8ebd 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LRZSZ_VERSION = 0.12.20
-LRZSZ_SITE = http://www.ohse.de/uwe/releases
+LRZSZ_VERSION = 0.12.21rc
+LRZSZ_SITE = http://www.ohse.de/uwe/testing
 LRZSZ_CONF_OPTS = --disable-timesync
 LRZSZ_LICENSE = GPL-2.0+
 LRZSZ_LICENSE_FILES = COPYING

--===============7961654719266223162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7961654719266223162==--
