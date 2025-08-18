Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE61CA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 14:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 407C9848CF;
	Mon, 18 Aug 2025 14:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJH8xB6faG74; Mon, 18 Aug 2025 14:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C0648489B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C0648489B;
	Mon, 18 Aug 2025 14:30:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77E6EE2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A12E4175C
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUDpxV222rwJ for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 14:30:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.224.244.102;
 helo=mail-244102.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6CFBE41413
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CFBE41413
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CFBE41413
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 14:30:44 +0000 (UTC)
Date: Mon, 18 Aug 2025 14:22:58 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Cc: Philip Molloy <philip.molloy@analog.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip@philipmolloy.com>
Message-ID: <20250818142203.421300-5-philip@philipmolloy.com>
In-Reply-To: <20250818142203.421300-1-philip@philipmolloy.com>
References: <20250818142203.421300-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: fb39f5da1aad4402006f61a5edb07a57cb3763c0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1755526983; x=1755786183;
 bh=zyl056mocc34Hndn45eZ04D61c8WkFuL/BTg9/6kDwo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ssoQoun02Jsil93FC7D0PYn92oyNp0V1gdv5b6BpJb9mYtZQiIk9zIbELGhqbdwT9
 ODgdCXFvxGUXcRzzXEVKeK0OeDc532TbigI6TxrX7gKU1Lgv5Q3fj+49Peu7rery/9
 aB2056C3dZfWwX0BCNVcfj0BAEjxt1IkiOLLqyPQOwTxbB3/7RCAExmfEMzWEfS1uG
 Cjc8VIgRjwoGeFUV+yd1+cgg46914Cr77cXkb4MOZBcUxI7P9wPFlc0KdJW3a/Q1JX
 kC5T850iJA6Ro0cBBl459BBAtfihheFbMJouEGPfzTsWunrvM+CE8bYKaioHHyVZ33
 WLp+tyXu0XmxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=ssoQoun0
Subject: [Buildroot] [PATCH 4/4] DEVELOPERS: add Philip Molloy for adsp-ldr
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

Signed-off-by: Philip Molloy <philip@philipmolloy.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a7bb3bd834..792f230e4c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2742,6 +2742,9 @@ F:	package/psplash/
 F:	package/sispmctl/
 F:	package/zsh/
 
+N:	Philip Molloy <philip@philipmolloy.com>
+F:	package/adsp-ldr/
+
 N:	Philipp Richter <richterphilipp.pops@gmail.com>
 F:	package/libtorrent-rasterbar/
 
-- 
2.50.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
