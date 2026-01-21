Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4FCC44501
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 11:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B9740735;
	Wed, 21 Jan 2026 11:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WbNT_zXrrCOf; Wed, 21 Jan 2026 11:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 490AF41B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768993355;
	bh=WdjQ8MIheOO0wDwG5XCxR/o99wll21ckmGuFgkoIFEs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ARlic/Nhs+xG4QsL2uSwoIM3jG3H7MYD/7qVViR6FA6vJYXn2SYcdBBa+kUNs685q
	 iiR6lCT8dLFJz4apU3rHquBz2MgRQOFVNY+3mwyxAJYWQo946z7uvMhTKrqEzkO1K4
	 i0eAEnq9u2lu4woR6PjUnoLubI8ix+RMazxUomBNKbR4Z14yq1LxU454MtDhdgPdkM
	 NPROsgrXe8cM/rIUtw4SqeXwmLvEk6shXbu2MM5ARzfFC5yH0wP1MYjmxlgDjnw3ni
	 dDgBM4nL5tAYOfoo9ooyXEAB1dNk5h24739Hi/2bgZqsWZzY5z5QZWXZhl++9XOvkI
	 vNr9/5ePyxZTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 490AF41B34;
	Wed, 21 Jan 2026 11:02:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1CF169
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84A9A41A3D
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21fzStDPzWeU for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 11:02:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 718FA403F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 718FA403F0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 718FA403F0
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:02:33 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -973232252; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 21 Jan 2026 11:02:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1viVyZ-0000000E4v0-2t9m;
 Wed, 21 Jan 2026 12:02:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 12:02:04 +0100
Message-ID: <20260121110208.3355429-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121110208.3355429-1-peter@korsgaard.com>
References: <20260121110208.3355429-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aygbUjiLtwodFPlx5WvZbgWZJ1tifV2dGFsy5nOXZ1zou+CQ6heDyX+HNmUDdJuMn1njFrOXWuHQ6bXzllwSMT2DUlzdqrjeLRzL2d1PVZfu0lSpHKqsdIDGxd245qB5Q54Cg9CXgtU19t42k8tFNpKSx7et2a1qMUednCaHVeyKhcEPKXEniLH41ojPa3SwgZ6pt/OMoeDGVGCkz+/aypCvSgTnlMwkqFvO+kA/Aev2uo1Mb6D01QE/PLESVU4mEERhKW3zH8ESp7z3Y9Y/piscmo01GS1oTN96FOO53TPU7KAtgm3kDBPGtcJye6e8l6dG7hJ6eP5GXs5/ER2Krg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=6w2xyt+gITvAY9Yo824F3IZGiWOPqqJiU+KKpsQAkA0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=aygbUjiL
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 4/4] arch/Config.in.arc: fix 'operations' typo
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 7dd564d7f7..f250ae5eeb 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -31,7 +31,7 @@ config BR2_archs38_full
 	bool "ARC HS38 with Quad MAC & FPU"
 	help
 	  Fully featured ARC HS with additional support for
-	   - Dual- and quad multiply and MC oprations
+	   - Dual- and quad multiply and MC operations
 	   - Double-precision FPU
 
 	  It corresponds to "hs38_slc_full" ARC HS template in
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
