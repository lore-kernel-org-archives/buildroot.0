Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEF7FF885C
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 21:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1910D84134;
	Sat, 25 Apr 2026 21:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCSwyLlLnWsg; Sat, 25 Apr 2026 21:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13D5884128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777151811;
	bh=WrwjA2TNzHCuEKsE4tyjU9b0QrJAUYaIcSKKtw/uNZY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=idqXswTTzcQAx0/wwmE7+xlghAgdiZVu9Esijwy+mD70gkjUHOlL4EJx5jULUOd44
	 kfRsmbbygFFeKsevw0PPz26JDgTkyFxYjpW0c+kQ/eazVrklG3tpvyPmbW0ajF6hfl
	 lVCSSzjfENQmxqhnwa/DWxyxis855OcbYT3q5CDUnqSLGmio8xoedg1JP+C8LpuuFa
	 My77tGwlniYPPggGxFMr9qZPESclBPW8cUm33B5GsZUZJm33uqLBe3jwIaEg1P/j0v
	 SmklNgS6ljhDNgGXA4ECVSDSFmkOCMUdP155xdN6Eh+p2pRjj63zcCZ3uppaGx71++
	 JVZKbPSQM8aHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D5884128;
	Sat, 25 Apr 2026 21:16:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8272A194
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F1B661296
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLCpeT0eaBhk for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 21:16:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C4DF461295
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4DF461295
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4DF461295
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 21:16:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 773DBA4C0F58;
 Sat, 25 Apr 2026 23:16:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48402)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGkMi-000000004gG-43J4;
 Sat, 25 Apr 2026 21:16:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Qais Yousef <qais.yousef@arm.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2026 23:16:34 +0200
Message-ID: <20260425211641.479665-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777151803;
 bh=RPIgymNxbrGsy5921NSh79WqbiTAGVXHieHwx8EadVg=;
 h=From:To:Cc:Subject:Date:From;
 b=kI6WTC8EssdmioVBAWgOXtUwXlHkTUi+oMkpLue19pjlVvTtXFtZ+zE/BFoxag3Q+
 3+4ZEmrfc3XqgXZ1DbPrX07EzwL8iL4Fyb+zEBMEsSz+M3F7G8y13vtCZFMsm2fDfv
 pDmqNPpQZJtDkbrj+C9YHjBKLBwrWDWs19Ac7PuyER3NMrSTx9c13uCiYw1mTF1fb4
 IHsKfYMdRs/X9EyXj5XgB3nMUNwUiIFDK8n/LynfbRTpF/VGXMQrt3LL01sxwPFrG0
 HRoMPsgr2o5LnF5/VhNpPz4ybXm28/IwNj9SF207paxbr4EmAjlf+6NlFrPO1Hun+Z
 HKN3MPTJLc+ig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=kI6WTC8E
Subject: [Buildroot] [PATCH 1/8] package/bpftrace: remove configure option
 USE_SYSTEM_BPF_BCC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 305c40613ceab985bfa2abd094a96f3eb2aba5d9 bumped the
package to 0.23.3 but forgot to remove the configure option
USE_SYSTEM_BPF_BCC which was removed upstream in version 0.20.0:
https://github.com/bpftrace/bpftrace/commit/ef6d9d42d3a7a87116651d6c561de3a0a2693185

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bpftrace/bpftrace.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 7b1b41781a..94f7c6b4f9 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -29,7 +29,6 @@ BPFTRACE_CONF_OPTS += \
 	-DBUILD_SHARED_LIBS:BOOL=OFF \
 	-DBUILD_TESTING:BOOL=OFF \
 	-DENABLE_MAN:BOOL=OFF \
-	-DINSTALL_TOOL_DOCS:BOOL=OFF \
-	-DUSE_SYSTEM_BPF_BCC:BOOL=ON
+	-DINSTALL_TOOL_DOCS:BOOL=OFF
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
