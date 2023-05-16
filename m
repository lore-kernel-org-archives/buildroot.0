Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58897C77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 18:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F268C40BB6;
	Tue, 16 May 2023 18:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F268C40BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbB3182Pm45t; Tue, 16 May 2023 18:58:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27E2340BDF;
	Tue, 16 May 2023 18:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27E2340BDF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 469A31BF295
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 18:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 202048412D
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 18:58:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 202048412D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5h5AvBw1a7kU for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 18:58:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F28C4840FE
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F28C4840FE
 for <buildroot@buildroot.org>; Tue, 16 May 2023 18:58:19 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout07.t-online.de (Postfix) with SMTP id 0ECB1C6D0
 for <buildroot@buildroot.org>; Tue, 16 May 2023 20:58:17 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd76.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pyzsG-2BHEiv0; Tue, 16 May 2023 20:58:16 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48524)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pyzsF-00057v-2V
 for buildroot@buildroot.org; Tue, 16 May 2023 20:58:15 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 20:58:15 +0200
Message-Id: <20230516185815.1175350-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684263496-16FFE3A1-0EDCC452/0/0 CLEAN NORMAL
X-TOI-MSGID: c97e7a61-40ac-46f2-ad1f-cc21871c845d
Subject: [Buildroot] [PATCH 1/1] package/vdr: Fix patch for uclibc build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uClibc-ng 1.0.42 added support for getloadavg:
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=ad3a130dad88ad7a59dcd965b0cf9bd0d713595e

leading to build errors of the vdr package:

skinlcars.c:1105:12: error: 'int getloadavg(double*, int)' was declared 'extern' and later 'static' [-fpermissive]

since its version bump in buildroot:
https://git.busybox.net/buildroot/commit/?id=61ae6add9e5d4761536fa4ff24150d5f8f82a61d

Fixes:
http://autobuild.buildroot.net/results/d3a/d3a65044fabdafa1b6d75a508eae006a2cfebdc0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
I do not know whether all external toolchains were already updated to
uClibc-ng >= 1.0.42 so I fixed the patch instead of removing it.
Due to uClibc-ng providing getloadavg() sending 0001-getloadavg.patch
makes no sense imho.

 package/vdr/0001-getloadavg.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vdr/0001-getloadavg.patch b/package/vdr/0001-getloadavg.patch
index 9e6316e284..f6ba84c9e5 100644
--- a/package/vdr/0001-getloadavg.patch
+++ b/package/vdr/0001-getloadavg.patch
@@ -14,7 +14,7 @@ diff -uwNr vdr-2.3.1.org/skinlcars.c vdr-2.3.1/skinlcars.c
  
 +/* uclibc and dietlibc do not have this junk -ReneR */
 +#if defined (__UCLIBC__) || defined (__dietlibc__)
-+static int getloadavg (double loadavg[], int nelem)
++int getloadavg (double loadavg[], int nelem)
 +{
 +  int fd;
 +
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
