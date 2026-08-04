Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC91C55184
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 18:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C0B605B7;
	Tue,  4 Aug 2026 18:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUlg9Mo6HY97; Tue,  4 Aug 2026 18:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A27560600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785868992;
	bh=rLfCzHjOLkSNRpccib0cje7CX3V2fILXiXSOX4FvgfA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=WFyq2oGg59mHR34NdRUxYFnCfQwRqfBDHJYnbuIMGAyAvFq9Jrh4O3G5riejgBi1P
	 JWKR43EHkDr0wqlNHqAwWWgx4hHEwB1d7iOH33r6Cv/NV2CoK4rgux59u4EYEpfQ1H
	 wcQ0lDSKbTu6lvn0su9gXUkwHZQ2pei7lvIwlcsjem4FktooLX2M6A3TxycJTnxSdd
	 diIjkCXW6vPDzokHY/cjwvM0VZMjbjadV+CoOPT5NlmG6frxp/82fBDFvBZx8oDqQU
	 2kNKW9kITar3zBlSWtt8qFJXt4fdsdgPrAOhhK2UHqG+dJ9PpWdKgJyBw2PIUN/2se
	 KmKTd2fIFwbfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A27560600;
	Tue,  4 Aug 2026 18:43:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C53C4288
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 18:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9DF060600
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 18:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6RkunSLUjSv for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 18:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA518605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA518605B7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA518605B7
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 18:43:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5941219F57B;
 Tue,  4 Aug 2026 20:43:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Aug 2026 20:42:56 +0200
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue,  4 Aug 2026 20:42:56 +0200
Message-ID: <20260804184256.361490-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785868987;
 bh=NZ+u6NuL9fKDaI0B9KVSddqhAfoX5zqO0glDkmaQ2iY=;
 h=From:To:Cc:Subject:Date:From;
 b=cW33ELM8fEeyYbqlY1Z79datB42fAn9adjkf4TT+OP3VO/OACsbtpp2ssHXo9pL1V
 Jf+RYPRGaqZn6q+2lm2slceLhR3qKKcaS5mr8ykT6Q6o0e6XSWI7hYMsW3auYbA+vp
 GMYr3+BPjzjxYmegOocodSs++t8Kn88SZbVoRONk8cV2fw6KxV7lozR+VE+YeFVYMV
 XsFiHNxIiiES7svvYi55QShvRFyVlBrw2dWeiXOq+J4W1E70sgDuTEzOCXsrKjjctT
 ThzNmL8LCm5c5a0MfeZ+B07YB1CBpPyDMaDLjTyLRgFYyovRFLOuAHfFIpRyBjd1ci
 Xq+B8p0fPXr+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cW33ELM8
Subject: [Buildroot] [PATCH] docs/manual: fix indentation in pkg-hare example
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: 44d38432343e (package/pkg-hare.mk: new infrastructure)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Francois Perrad <francois.perrad.86@gmail.com>
---
 docs/manual/adding-packages-hare.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-hare.adoc b/docs/manual/adding-packages-hare.adoc
index b52d953b2e..e61d524acb 100644
--- a/docs/manual/adding-packages-hare.adoc
+++ b/docs/manual/adding-packages-hare.adoc
@@ -13,7 +13,7 @@ The +Config.in+ file of Hare-based package 'hare-foo' should contain:
 01: config BR2_PACKAGE_HARE_FOO
 02: 	bool "hare-foo"
 03: 	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
-04:	select BR2_PACKAGE_HOST_HARE
+04: 	select BR2_PACKAGE_HOST_HARE
 05: 	help
 06: 	  This is a comment that explains what foo is.
 07:
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
