Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC23C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9883B4042F;
	Thu,  6 Jun 2024 19:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iV7sWxYJlE33; Thu,  6 Jun 2024 19:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 337E141720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 337E141720;
	Thu,  6 Jun 2024 19:24:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0781BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31E7181E2C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4sFWYNxKCrH for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44EFD81E1C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44EFD81E1C
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:24:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3633486FD5; Thu,  6 Jun 2024 19:24:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 21:20:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dafb8b5c2adb6208f56e2abda954e264b8e6fdd
X-Git-Newrev: ed05bfcab6b25653c997dbc98bef5604597471a9
X-Patchwork-Hint: ignore
Message-Id: <20240606192439.3633486FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bc: fix build with gcc 14.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed05bfcab6b25653c997dbc98bef5604597471a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4d3/4d3c0e0a08cd734699cb61412c99d705738e8ab4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...read-and-write-errors-on-input-and-output.patch | 41 +++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
index cc72e5cd69..87654e3c14 100644
--- a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
+++ b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
@@ -26,6 +26,10 @@ Origin: other
 Bug-Debian: http://bugs.debian.org/488735
 
 Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd:
+ Updated to incorporate changes by Matthias Klose <doko@debian.org>
+ on 2024-03-13 that fix Debian bug https://bugs.debian.org/1065375]
 ---
  bc/execute.c | 10 +++++++++-
  bc/main.c    |  3 +++
@@ -276,6 +280,14 @@ diff --git a/dc/dc.c b/dc/dc.c
 index 6a2bb26..ccdb1c2 100644
 --- a/dc/dc.c
 +++ b/dc/dc.c
+@@ -45,6 +45,7 @@
+ #include <getopt.h>
+ #include "dc.h"
+ #include "dc-proto.h"
++#include "number.h"
+ 
+ #ifndef EXIT_SUCCESS	/* C89 <stdlib.h> */
+ # define EXIT_SUCCESS	0
 @@ -59,6 +59,7 @@ static void
  bug_report_info DC_DECLVOID()
  {
@@ -304,6 +316,14 @@ diff --git a/dc/eval.c b/dc/eval.c
 index 05a3d9e..6c54e61 100644
 --- a/dc/eval.c
 +++ b/dc/eval.c
+@@ -41,6 +41,7 @@
+ #endif
+ #include "dc.h"
+ #include "dc-proto.h"
++#include "number.h"
+ 
+ typedef enum {DC_FALSE, DC_TRUE} dc_boolean;
+ 
 @@ -97,12 +97,15 @@ static int input_pushback;
  static int
  input_fil DC_DECLVOID()
@@ -512,6 +532,14 @@ diff --git a/dc/misc.c b/dc/misc.c
 index cd23602..cd910b8 100644
 --- a/dc/misc.c
 +++ b/dc/misc.c
+@@ -47,6 +47,7 @@
+ #include <getopt.h>
+ #include "dc.h"
+ #include "dc-proto.h"
++#include "number.h"
+ 
+ #ifndef EXIT_FAILURE	/* C89 <stdlib.h> */
+ # define EXIT_FAILURE	1
 @@ -89,6 +89,7 @@ dc_show_id DC_DECLARG((fp, id, suffix))
  		fprintf(fp, "'%c' (%#o)%s", (unsigned int) id, id, suffix);
  	else
@@ -593,8 +621,11 @@ diff --git a/dc/stack.c b/dc/stack.c
 index 49422df..174411d 100644
 --- a/dc/stack.c
 +++ b/dc/stack.c
-@@ -35,7 +35,10 @@
+@@ -33,9 +33,13 @@
+ #include "dc.h"
+ #include "dc-proto.h"
  #include "dc-regdef.h"
++#include "number.h"
  
  /* an oft-used error message: */
 -#define Empty_Stack	fprintf(stderr, "%s: stack empty\n", progname)
@@ -657,6 +688,14 @@ diff --git a/dc/string.c b/dc/string.c
 index dee9169..389d899 100644
 --- a/dc/string.c
 +++ b/dc/string.c
+@@ -45,6 +45,7 @@
+ #endif
+ #include "dc.h"
+ #include "dc-proto.h"
++#include "number.h"
+ 
+ /* here is the completion of the dc_string type: */
+ struct dc_string {
 @@ -94,6 +94,7 @@ dc_out_str DC_DECLARG((value, discard_flag))
  	dc_discard discard_flag DC_DECLEND
  {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
