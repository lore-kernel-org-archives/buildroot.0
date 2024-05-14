Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0993C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 21:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 978A8814B1;
	Tue, 14 May 2024 21:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJZmOZ98a2Ql; Tue, 14 May 2024 21:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79FE981393
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79FE981393;
	Tue, 14 May 2024 21:54:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEF7F1BF42D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BA30405EB
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DHwbtmGoTAw8 for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 21:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F993404DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F993404DF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F993404DF
 for <buildroot@buildroot.org>; Tue, 14 May 2024 21:54:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09e6.dip0.t-ipconnect.de [91.58.9.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B9B3A4C0E95;
 Tue, 14 May 2024 23:54:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59422)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s7063-000000000Dp-0F62;
 Tue, 14 May 2024 21:54:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 23:54:02 +0200
Message-Id: <20240514215406.2866563-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715723647;
 bh=H2ciyIYdCgbhJNMlwzXTg46CGfzMjPeXL6dZjZJQOyg=;
 h=From:To:Cc:Subject:Date:From;
 b=V2GhMAnyjoe6JS5xaxzAMZPub1ZCEowoJpd2nQSdairrgkqQqgYKb8U5f0lH16zGr
 L9NGXMr/5EW2ixV69lMx1EzE68cnqkVE4Ka85LLNb58mMQS62mGmLWTKiMENp+1R8B
 JhDAxFYeeSMfTgvdnoOpzrrCgHmVOixuHzlbpxRmdUc7ilgeaJP+8SLpVTQfD5khC1
 rpHGsr6VJZEeEeIn3FtYr53uyySkuTZjColTykMpV6SBJ8Dpt9WIpwYA97vJNxYq31
 tN2wpwDobiv/wLF8ME2aEy/u8Eav9XNNu7HkbnsoHR7wETeiA5n3aoUWHAoTNDGtwE
 +VKvKVl2B66og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=V2GhMAny
Subject: [Buildroot] [PATCH 1/5] package/bc: fix build with gcc 14.x
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/4d3/4d3c0e0a08cd734699cb61412c99d705738e8ab4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...and-write-errors-on-input-and-output.patch | 41 ++++++++++++++++++-
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
