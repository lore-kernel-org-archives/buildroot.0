Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC6CC5DF6A
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 214D860A90;
	Fri, 14 Aug 2026 19:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEvE9Gtl5Mv3; Fri, 14 Aug 2026 19:59:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92083608B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737568;
	bh=nwFq0gXrlDKSuEXki/7Kqx4fR9UO2fQSZ6gGr+CQ65c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ao04rbUY3FtXjpyZUc+jLwhN51sHjnOwB8z2SY1T+wrVvHS1aDHPvk4nbFFGXiAJv
	 Wm7kD5/l6TGXgHlChsW3TW/nmTcCohI4yrOPnGg0LLAKHFcGdPlb8VQ0wLUg78Wg3M
	 PLJ12pi1GmeB/y6NUaF6d2r1PdHzHKgReBzAVDd7G19xhhDu05JNwiDr4FgaiH3a+2
	 pyOZzomJn4Nw5DygBuGxjYuzRO+BG7SKxwUlw0Ury+BVS2Wi70GnE9o/QaMiSizKGk
	 2FLfvL0r7tHb/C7D/1Jrxr2NpnPhGTLB2MvrLk1dvo9hApBpJf+ifQcxYXyPfMQylZ
	 zUaYI36Gj8PEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92083608B4;
	Fri, 14 Aug 2026 19:59:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF3403A0
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFEC740C2E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNFN6iwjQAFc for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60CF340C1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60CF340C1A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60CF340C1A
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1x9Le92znA-015P7U; Fri, 14
 Aug 2026 21:59:21 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:56 +0200
Message-ID: <20260814195856.3295644-11-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:L6ZVdWmBTfk1WYUP4Aecvv3+arpKc/lTku3rElmx5O8iUyQARaa
 ba24ngujp6suguURSi4ADhRuZkaHmgzUZrVn0xQefXSmIVr76hn1cSGtQXYHVMKQ39TxeXo
 UlT3XzCPGDCuz594LzxggKUAZgPltFHrzM+gctucXNo2Jbq2ky2oBnzrsuJna6Rz4BePU8E
 I+dVdQ7yPykgGVCwwtsNA==
UI-OutboundReport: notjunk:1;M01:P0:YYT1OoYKpGA=;MPbwimbwfq0yR+KuGJtDLW6jC+P
 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
 674fELA==
Subject: [Buildroot] [PATCH 10/10] package/rygel: update project URL
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project website instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/rygel/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rygel/Config.in b/package/rygel/Config.in
index a3c2bd29da..1a5c1493ea 100644
--- a/package/rygel/Config.in
+++ b/package/rygel/Config.in
@@ -34,7 +34,7 @@ config BR2_PACKAGE_RYGEL
 	  Most Rygel functionality is implemented through a plug-in
 	  mechanism.
 
-	  https://wiki.gnome.org/Projects/Rygel
+	  https://rygel-project.org/
 
 if BR2_PACKAGE_RYGEL
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
