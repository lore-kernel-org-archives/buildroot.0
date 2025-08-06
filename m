Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7C1C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 19:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7FF261C9D;
	Wed,  6 Aug 2025 19:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzZxhkSHXQf3; Wed,  6 Aug 2025 19:38:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00FBE61CAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00FBE61CAD;
	Wed,  6 Aug 2025 19:38:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 507E8233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36B4741E84
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yy-7NNCmUXv4 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 19:38:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3157441E69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3157441E69
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3157441E69
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 19:38:05 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b79bdc9a7dso103977f8f.1
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 12:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754509083; x=1755113883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WG/hORcg1q+QZJ///2uDnyeZsZglejc4du/bsFjq5DA=;
 b=ujEViEjJzPPIJ75paf7KYMd7o0RzA1JkUb/EzLbM5nD1mEdLBmBoVIKTxSzh+xaCS9
 lYgFsPaUkd3bFn3EOKlBaGvaI59jByQ2JNh4W6Q7QMjNt7/ZQAHFFZynSKnc0oPMRFzy
 qsEFhw0/Usa59uaNu+wmktAKWfnl0+8ktyfzL7feFysls8i6232WV9dTFaDJOQsMin4W
 I6KrptdUkrJXyCDhVVz/0yrR03geVo+ufK5y56TAzNhBre4wJEVPs87gyeRL9xLx3abG
 sv4Tp+MJHHTP6d7NOIAzaLPhnr4sB5BkG1R7Wp82NyKb6HmQBa/eMIp541q3jhHCJ14A
 d3tw==
X-Gm-Message-State: AOJu0YyFqoNozID3ebbnxmYHiJbJLyYklsPvyJoG2SISVQID2kD9jUio
 mPnyoGttNdsMuNB0m7U0NVHhl8zgbQtzTGjlc1vsqIsTGqYGH3SCRCMoHdBYpejrb5MDGlVjoEm
 vAMnB
X-Gm-Gg: ASbGncvbHHcFGifwW1ICFJyyLrq50S7UqyPzYh8ECTvyoSYll25EYtow5rSq90LaWop
 JoOqu2RIO7vcxbOQA9Ki8jzaaCHV37K3W38YKUzIx+mIBQlV0zWZbiyFMPNt4Gtvwpo5KSX3OLU
 EIAFNvxlKXPjtqC1+RDpZBg+MV1PmvzxyWS/9QS3/DSp7y1N1T5LG9QGEZIiWlGw0lMbi7akFdT
 ti8v7any8LDA1kIfDlhT2C7mXe5PgIWtZF/f/TEnNr1rsAipWmX/061aajWJgx+wDlLwW/0Adw3
 xJjkN0xD8yNJdYbF2AE0Ybexu9VVFLvACebUXR710dhice/4nn8k/IgVIHD47v4wmmHin0r2Yc+
 IS0EwCUZMxs2TKQ==
X-Google-Smtp-Source: AGHT+IGr6sHBti0kpoxnoDN8Ab67hhN3ZRrJvJmJ441dQo43+RYYZAB80Fz5y5wTg/0zXhY43S0/hg==
X-Received: by 2002:a05:6000:2b10:b0:3b7:9aff:ef22 with SMTP id
 ffacd0b85a97d-3b8f49162c4mr1831120f8f.27.1754509082998; 
 Wed, 06 Aug 2025 12:38:02 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b95f4sm23951168f8f.23.2025.08.06.12.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 12:38:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  6 Aug 2025 21:38:02 +0200
Message-ID: <20250806193802.532017-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754509083; x=1755113883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WG/hORcg1q+QZJ///2uDnyeZsZglejc4du/bsFjq5DA=;
 b=URfV7Nckiqyn67nIgIxpSFv6TsiGGv5MyvQaOExxkklhYPIKy2F3kC57JQkCd/MiAQ
 ITPFZfFWvwA/fCev9ztxmmr/aitW5iQrpJeZfW9odghQqYf6MrSMxuvqc+0NttM6+/2F
 loi1t3i4SnvbqvBoETYeEByZMOppDtFFZovU8LN/uPjRcsX2O5IuswA5CqcwBzKhRQgX
 JDmxRHXrasG5qL4UDlYIw2Osa4cWdutzIjmPQz9r2ILrVy4VC/VADpEskCUTTM5CpiPm
 6TK1PFnyDZuJ38UftIkjaO0tKfAuJCxNLYchvoLjXAn4gfPQJbWD6+Vcs9nJMwEYzNeC
 HMew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=URfV7Nck
Subject: [Buildroot] [PATCH] package/flatcc: add CPE identifier
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

The cpe:2.3:a:flatcc_project:flatcc:*:*:*:*:*:*:*:*
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/AA7FC7B6-537C-4735-B615-689D3A91C994

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
See https://nvd.nist.gov/vuln/detail/CVE-2021-33983
---
 package/flatcc/flatcc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
index 06be1a1338..b2d1efe00d 100644
--- a/package/flatcc/flatcc.mk
+++ b/package/flatcc/flatcc.mk
@@ -13,6 +13,8 @@ FLATCC_DEPENDENCIES = host-flatcc
 FLATCC_CONF_OPTS = -DFLATCC_ALLOW_WERROR=OFF
 HOST_FLATCC_CONF_OPTS = -DFLATCC_ALLOW_WERROR=OFF
 
+FLATCC_CPE_ID_VALID = YES
+
 # Disable build of tests and samples
 FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
 HOST_FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
