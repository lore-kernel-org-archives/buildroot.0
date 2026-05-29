Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320A1CD6E50
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D33E441F68;
	Fri, 29 May 2026 15:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMTYsCsjp3oc; Fri, 29 May 2026 15:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11F2A41E56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780067197;
	bh=jS5252KhHl+IhKfmBuZtipQRjXaU3oJK0oHNaATgXXM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SpAGe+5/niFQAciHsuugsn38panW3W0/fgZSIBaZ6D5tARhBCJ/5MH4mGpc6VEmrw
	 3XiIaHVTkpwxN0D/if3sxSes8M4N1Hb0qOMt9EE8ZHi7d+2nXJfjaSY5rgFbk9Ibq4
	 axQxqlRfI0PglQmBWGBt7bYYN+MOnNqL/Cgz1mRfR2U3vn8OGQPdcju9XfPDhglXv/
	 7zS7qkTgEpcpj1Hb82lrrYB3bKB2TpO805WhcOm6atxQeIBAxSecoPM4btSWKobV8y
	 0ExBHpa9AHu39FMillyt+NF01IHgXdqPEBB19Bdg+0hSkqtOpp+7EWDMowBJESjJba
	 FtRnDhZ3LI2fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11F2A41E56;
	Fri, 29 May 2026 15:06:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF38D288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDF8D60EB5
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fde6Khum0PD4 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E864760EAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E864760EAE
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E864760EAE
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45ee6d32402so1090947f8f.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780067193; x=1780671993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UG3CykQQip6nsrrE0tr+JMu04gL3JvQOsWlP5fd4IQo=;
 b=Cpg33SHLDNCPaXdKj1XXXKrXRP9JEbI2r7dJMvuyzhJCkYlfDEQSiZPwv9OzPZQN3G
 +hG/ij9g1u2fs6hNXi1ULdEy5kBKGYtTW3vLbj6GpGqcSMKEORKsU/gpIr5L3H9DyQ8C
 T1tH0HgVIV0RdmFsE7HI0mbuYqBTMWiDmXHHSxIvv8OVrJO1gq3aK1t/5FAPtidFOmiP
 cuqLS0tMZkzd+vvv+xxvZyoZL2GOEehN9fMSC8d/rtD4fDHH/x04NqT8MOCkI5kZNsRG
 Vien+nl/8IMHstYErpCdoca2k8RepjfAWkmad8C+GFaYSu9joZXkHkpvl1QYe28nagxr
 JIfg==
X-Gm-Message-State: AOJu0Yxtmaplu1U7lSoAEIklj2iy7+8VOpmj6CNLfTk5mkKQuEUQDV9u
 DMirVBrlNQ4BnD9abFlVn4QM3E6+2WvasT985h9ulokUaJS3XpTQRWXCybpEZiJ/122+hlr9JBp
 hf9Ox
X-Gm-Gg: Acq92OHLyo9dl1oUBG7qTLMnzqQiQe5nPiJCGaU0iZIMqWbUs8ga1JKS5/Htke4WMRN
 SSJ+WdnNyj1clvWHOplLcY1EMO/mbUllE6X+u5skGli93IfQi9afhOXbAyJFvKqkMEZaUDhpSkr
 tKIc07KLTKwjnGF6T6E7aOq8Pg5lDp3dcfGegqrsXDpIVGprgb0xm6732drDiIxf2Ze8X1dijpg
 8zvIqfm+qO+kANOsvEpzhOV5f4W4Kf32znNvi3QV5LS/wRwgQ/WiOX4ujZj4A1LPLeugLdqLTcJ
 zxoRSkYEpHiDClLUVedxe7EVMsiLm8vMWG4efZ9GE6iOxIIaSPO57kTGEUcIjSbRLjEzy2mfEDZ
 31WSESbIOmJFcc8e+Kv2FOXmqgN6V4J8LGGCHl03E33ECkmxcFDNpzu7mX3UMrLDOKAVWQHx6/D
 OracSEwWQkruoATZ+CQWzFckllloA7bn9UGNMnF27CgmrusQ/BRl7IfzrD3A==
X-Received: by 2002:a5d:4bc8:0:b0:45e:ed7e:f8fd with SMTP id
 ffacd0b85a97d-45ef6b01eb3mr333396f8f.2.1780067192601; 
 Fri, 29 May 2026 08:06:32 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3559645sm4091190f8f.26.2026.05.29.08.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:06:32 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2026 17:06:28 +0200
Message-ID: <20260529150631.447940-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529150631.447940-1-thomas.perale@mind.be>
References: <20260529150631.447940-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780067193; x=1780671993; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UG3CykQQip6nsrrE0tr+JMu04gL3JvQOsWlP5fd4IQo=;
 b=Qpi+3w+J7JaQ2qIIPRi+jvmM0gq1Io7jjJFYvLytMy1PojcgGP5kaUX1N+QnOr6Rdq
 1h9iwpRD2YdQxCPMEZ18drDnFatsy00vlLQUFiPmI8qoyyj4dE25+9PG4OxGzOFGsI6E
 Rw2FW4biEURw4lQJj6oUZw5Y4MD4piM39o6lFReoMGlzS1vXY9VFWaGtIA/4Cz8PtvIP
 dkskGLSuBWzzTivC0F55RzitE4IOfC/9yASq96ETLL5W9zBYU05grW3VX6Ukw244OcWu
 Qa4PBLnXV1fzfY2V4kRCTqidms95nutuKdBV2dDjHe5Ze6kHjM6uEmlie3oEAP7+SVcQ
 5WtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qpi+3w+J
Subject: [Buildroot] [PATCH v2 2/5] support/scripts/cve-check: add
 indication how to run
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Always run this script from the output of 'generate-cyclonedx'. Do not re-run
this script over an already analysed SBOMs.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/cve-check | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index 5047523ade..c045d7ea27 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -29,6 +29,9 @@ database.
 
 The NVD database is cloned using a mirror of it and the content is compared
 locally.
+
+Always run this script from the output of 'generate-cyclonedx'. Do not re-run
+this script over an already analysed SBOMs.
 """
 
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
