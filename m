Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936F2C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 19:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 483EC429A0;
	Tue, 16 May 2023 19:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 483EC429A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jm_tvNy1qULF; Tue, 16 May 2023 19:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69A9A429A1;
	Tue, 16 May 2023 19:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69A9A429A1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D02281BF8A8
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 19:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9E23616C3
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 19:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E23616C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jzaQmUJ1-uat for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 19:49:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B407616C9
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B407616C9
 for <buildroot@buildroot.org>; Tue, 16 May 2023 19:49:00 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout12.t-online.de (Postfix) with SMTP id 341C810DAA
 for <buildroot@buildroot.org>; Tue, 16 May 2023 21:48:58 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd73.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pz0fI-3qEg3l0; Tue, 16 May 2023 21:48:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:53394)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pz0fH-0005RO-2N
 for buildroot@buildroot.org; Tue, 16 May 2023 21:48:55 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 21:48:53 +0200
Message-Id: <20230516194855.1548486-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684266536-D2FEE2C5-04562CBA/0/0 CLEAN NORMAL
X-TOI-MSGID: 0a10dc20-38b6-44f9-8af5-1cb68a69425b
Subject: [Buildroot] [PATCH v2 1/3] package/vdr: Fix patch for uclibc build
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

v2: no changes

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
