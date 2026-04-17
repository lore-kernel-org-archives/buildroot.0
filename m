Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A662F43680
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DAF240B57;
	Fri, 17 Apr 2026 09:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9yqTt5HnDew; Fri, 17 Apr 2026 09:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ADCA406F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416410;
	bh=Dl0GpeRNKUbJ/uPrCAr8obLUXctpfBGVK4tsBkJqERY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dIfPZylsxTxS5KyhbnRs/vqrvAoYy2SSB0SDSPgkGnodXooCgHmGUnbfVIz+422jV
	 Cv3sBUvXwiAz3VIBqG5n0BRpPJZ8VUdmcYqquxZ7p4aAQD9F9r6XAv28MI66y5OZSj
	 l6Clz2TTFLSU4ZKH4znzrWqIqApbcX1Kb3T6qSdKR2yNVUHYtYjkvvrzQbLBgvnEVZ
	 GZ5oKQiJpFj1IDUaduhGHvaQ5MgqaL76qD9fyc7bsdfrAQyvm8GAtVSiGmilGZ6aPp
	 ABkIZMl6yy8yywQ0Q7ZYjPiwgwp5eQyjJZiu+V+LMA0THFljPSPzKDq2Tg8TC+6As4
	 qOO5V5CTPAngw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ADCA406F9;
	Fri, 17 Apr 2026 09:00:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDF3A259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D428C805D3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCAqjISJP1f0 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF4F5805B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF4F5805B8
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF4F5805B8
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:56 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so3748115e9.3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416395; x=1777021195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tdQel/5GxgQeQzbiy1jXLdXdmj/RUN1RNqGNL+IuwyM=;
 b=rusfEESigQpgWanwJyfpKquFlYGtyyZVYZWoyxEiOYqJpvQC166kp+rpAaZsjgDdcO
 93mrsbFs64k5C+AIK8DEEyhFAYmWgGvvUQmkwCkOu7hEipmeA+kDP9tn6/D97wNnLitI
 //GpjzxMzDfkj1NxWrQHUbNy6ds7USwSgqn5t4rgDIT/HzLzaWnegSKHnvKw4aCQ7xNt
 kDYqqXTxxg1Yx4SQw6JDVzdIGb32lWHKCm8fp/gUUbmX4KHKfakR99Hjg2X+YUB8fCI3
 vdXKW656tswDjXbvRCgskdu+h6ekJMiiLfCAjcSAAKOGoMpxaIBs6iQqAI4rBumYQEJ2
 REWg==
X-Gm-Message-State: AOJu0YzwwWjur21cSMgcVVuRuDmH6DsHcnyaLUSQEzXhMjOFjS1iFryW
 n7nRvG58AVxcpXAeW7hBmYMcFF92Knbh6rd2rtpnJHZquiRW8q8EERPga+DJA9O2iPE211s6QWb
 Lfx6Q3sY=
X-Gm-Gg: AeBDievV5mSSyMuJhRvjt+9ffomx931dAlyDMn4GYJDYwEZ7mR7UtTOByOnkiwpnYXg
 MwfLtTdxnyDqOIZsuLtALdbP7JCHg0PSKGrUF+yrB7r7fd/Ze/8gRZE6aKT6/DrijVKBVphKtlo
 i511k2aAX4hLNDJY8zdPkMzvo4+i2FwCYAYwysx21YcRtfxBh9nBA1tK0fUbDDEHvnynzhICdvq
 2nfiGqErNMsafShC+HXiK09+hEv3FFKscmvXm+bzUe1c3GPA3REJS43UrusXsDQLDqiuIrMFL6M
 kifKxGRjeXp/UnxMwqldFEQnCLaJNiMAMiSvwuqSR8TZdjsSK+rdzzgKRdlpBMbtjm3yE/g9sFb
 IcvVNOEHhoFglBzGg9SSG5zZuKOK2KoDhQM5sLWm6s0hAgOGn8iKu/EVwz2i/uSs+9Lvo02EhAf
 shFOIr+ka3sXX82SxqB2aeeNccc0oC0cTlXdstJZCucqx2gygxwjGG1x1RVhGCf+V51H+K4M1m8
 SVBYUTzbBN3HAMWtq5zuh1K51d+b0c=
X-Received: by 2002:a05:600c:1987:b0:485:3a27:a961 with SMTP id
 5b1f17b1804b1-488fb6e823cmr31189355e9.0.1776416394724; 
 Fri, 17 Apr 2026 01:59:54 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:34 +0200
Message-ID: <20260417085936.200528-20-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416395; x=1777021195; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tdQel/5GxgQeQzbiy1jXLdXdmj/RUN1RNqGNL+IuwyM=;
 b=3f1i6yuGYTnXS1rENKtlgilpJMfemhH+sTZtvoAUme31TUiU3kYHYoRIzgik1mFKyg
 1afOaTmq8VyafGMCG7r1+IeGB76gTHTqGmENN/VX//EppbJFutpioBq3CSsBpkIhx+on
 ZOC9UeJ1Dl40QY+lyywX43zGkNNERHXJ9l1Pc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=3f1i6yuG
Subject: [Buildroot] [PATCH v1 19/21] support/testing :
 test_distribution_registry : Bump kernel version to last LTS (6.18)
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/package/test_distribution_registry.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_distribution_registry.py b/support/testing/tests/package/test_distribution_registry.py
index 65fe6d850e..35942db29c 100644
--- a/support/testing/tests/package/test_distribution_registry.py
+++ b/support/testing/tests/package/test_distribution_registry.py
@@ -15,10 +15,10 @@ class TestDistributionRegistry(infra.basetest.BRTest):
         BR2_SYSTEM_DHCP="eth0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+        BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
         BR2_PACKAGE_CA_CERTIFICATES=y
         BR2_PACKAGE_DISTRIBUTION_REGISTRY=y
         BR2_PACKAGE_SQLITE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
