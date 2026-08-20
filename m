Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74462C5DF85
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 16:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D381260769;
	Thu, 20 Aug 2026 16:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tPBtNZ9L_gf; Thu, 20 Aug 2026 16:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787242333;
	bh=HzTBX/p1M9bLXTCm3XZqAIxfhLPjn/NLpurqo9D4uds=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=aWkAbbJF3gN1CyRdxXE5WTkUiTrORM9H5iWCU5oHAzJnINh8RxptOdhdwvP5/kSUo
	 36sfR5KKU57EaZ3keZHG3GCvbXDflhmThqxccouzhWhInu66w3LlZgEeuhnLvjQAGt
	 GTRYcLKk5/p7/zk5wGDb3A0U4TbTg/D1IwoIZ+adKZFxhMj+OQ1sLF5vFQ5pwQp2sC
	 SJcOjwHlYnXhWwv5fXwp/ILygrua0xA9cfjcNmlM14YqqfEQ079JKNGViU41W3p8PX
	 2dMy6Rbx0yVsrMj9OCMkdeg307rhvjw8qQyN9DsuinfpeqSpug6gKYXa0JFFzD+55X
	 +QuxwGYKvzVPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ACA5607E2;
	Thu, 20 Aug 2026 16:12:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BFB8429D
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 16:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC861407FE
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 16:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UJ2e3hIwUrSB for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 16:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.135.106.110;
 helo=mail-106110.protonmail.ch; envelope-from=benjamin8532@protonmail.com;
 receiver=<UNKNOWN> 
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F329A407E2
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 16:12:09 +0000 (UTC)
Date: Thu, 20 Aug 2026 16:11:52 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Message-ID: <c-LIqtVGERPuiF6keYuaBafYyc7kAd3_m1-5cU1R2x-Akg3D5jWjzo1SgFGQOE_Hfwms6HQBgSjm3pQqgd584wZWumaMDikhOKE3IMN2ct0=@protonmail.com>
Feedback-ID: 216224038:user:proton
X-Pm-Message-ID: b99b44d6eace07d9d57528726e528bbc111d0990
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-tools/S10hyperv: fix invalid
 return value
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
From: Benjamin DeCamp via buildroot <buildroot@buildroot.org>
Reply-To: Benjamin DeCamp <benjamin8532@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In both start() and stop(), ret is only assigned on failure. When
hypervkvpd starts or stops successfully, return "$ret" expands to an
empty string and causes:

  /etc/init.d/S10hyperv: return: line 31: Illegal number:

Remove the double quotes so an unset ret expands to a bare return while
preserving the existing return status behavior.

Signed-off-by: Benjamin DeCamp <benjamin8532@protonmail.com>
---
 package/linux-tools/S10hyperv | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/S10hyperv b/package/linux-tools/S10hyperv
index be9ed2c5df..11692ab313 100644
--- a/package/linux-tools/S10hyperv
+++ b/package/linux-tools/S10hyperv
@@ -28,7 +28,7 @@ start() {
 	for prog in ${PROGS}; do
 		start_one "${prog}" || ret=$?
 	done
-	return "$ret"
+	return $ret
 }
 
 stop_one() {
@@ -49,7 +49,7 @@ stop() {
 	for prog in ${PROGS}; do
 		stop_one "${prog}" || ret=$?
 	done
-	return "$ret"
+	return $ret
 }
 
 restart() {
-- 
2.47.3


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
