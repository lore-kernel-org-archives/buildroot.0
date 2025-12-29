Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ACAE92FDE
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4B3C40827;
	Mon, 29 Dec 2025 21:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rpt1bHaAxoIv; Mon, 29 Dec 2025 21:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 186F740822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043345;
	bh=8OBsMLUCbgoiVAyQa+fQOGLogpfKjz8VM6Yrsg1knvA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=NOfkIP5WYa5T/3CCrdiP+0ZyyA+Gufhw86UOoBRQUSgXdSgCbWnM31FBSkYCarimF
	 IEI9E+IsgrlOJxQ1xl/3J9IaQfgrGEVdYrQ8v/JVk6xRhRtCATJ1aBwLLUB9fD5/xW
	 +0RqLmHc2jCiviR0MA4BW4zMI0aMqLlXXSZoJMOEd61EoTDLO9/jtkSlPQUB1tDP0z
	 I91zCzfSmjwchS5DQDSDBCWKxE36qbe29fMmcK9gfoPDhyYwCu//XIygyUkx9FhFnw
	 6N7C3YqLBnYRPYvZtY6eyiW+l5GC6xKT9tr1sAdsvy6aQHVBqiJQs+DJ3/3j3ajRXq
	 D9OQic+kkWrcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186F740822;
	Mon, 29 Dec 2025 21:22:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C22FC177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B495680DB4
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gd9gdzw14Nbf for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94CE880E2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94CE880E2D
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94CE880E2D
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:21 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so54593195e9.0
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043339; x=1767648139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BqlvK550LsN8O2Xc+IoO9wNO0F+nyYRnod9Q6gEREu8=;
 b=Fy1TjdfQfMWMq0OELKw8tjSgxVrM+LqE/iL4wbuGwHdnTmL4kDRAFjCiat9xXP/XmX
 zq8WrglqnGr3iLHBqo/JRxOxpcGYcoQnIwg4+fJgdYt9UOMF7x8lrp64MGm2wbMMr/TO
 DK8kBv9obt8kY+XuY3afcR8IoZ8TNjR3dlsj8jrk/0n6zTKuTTQZjHL0CMsdP9vQeqXl
 SrpSj150ZgHMsHI/Q0mnvzi2EOgqCAE4ibBQz84u8VbBehtyXT1XZsGTlCnx24QE2Wn8
 Zg9mgP/f5enMNlS4/xuHEog9Zn3yEianpeVXkOOlDm0AoTBclnfoy12YgzUsiKaxrGI+
 WCpw==
X-Gm-Message-State: AOJu0YwOtJp/ZNWDhOtIh3OsdrEgDZAfRetxoHNqIB0kT70fAB4PhhLb
 JZ04bu2MjuaBJ+Tg90S1OPGuxmsgWBJXMmiI2Q3Ofx177QADGAOukErRPL5PzUNjJfW1Xkvstir
 9zYN31hc=
X-Gm-Gg: AY/fxX4QFi1aw+86RzgAawCP5QEG1Ceg6ga47xq/zXbd7OsUAwOGV+hjN5grNgWByFr
 p6R2kuECX8aK0KK2eHfLzBvhfT+MC89jdh6QtYSzVVwdkkQPSQAWyK8yxr5TgiviM6VK4+J7EbC
 5Q2Y49NirPobM1iTxN1+IyRISPuP5CyHzKnt7ElRh3odqGoOe0JX5COc6GXmXAEKZPSN8WHd7dX
 2YaRTKks5R5WiVbFsBo0/jy0I5YH3vTCzVfVscaVOGBAobxxE4TutWr9Rlj5uLJ98NC4JH3OLFF
 j6+o0gG+Go7tADEh6Z5u6ZMyb7b5A1BP7qJti+ShgLbd7pmL3AFwLkcP/k8JwMzcNrzy4fdN0Qd
 6qcWqlUbmB0ikS0E4CWHIgso9iJLyPKISFISJcn0QMo936o3otpPg1TDirP6PggG3QNi9nE6g/D
 zRvko=
X-Google-Smtp-Source: AGHT+IGLQvdIaOh0IArPJyH1X5mnB426cFS5OByWL5Vsi2JQOGykQuww2rpwLoxQ54sV9osXcBvwxw==
X-Received: by 2002:a05:600c:c493:b0:477:8b2e:aa7d with SMTP id
 5b1f17b1804b1-47d19586cd4mr353866955e9.30.1767043339301; 
 Mon, 29 Dec 2025 13:22:19 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:22:18 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:47 +0100
Message-ID: <20251229212149.167902-15-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043339; x=1767648139; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BqlvK550LsN8O2Xc+IoO9wNO0F+nyYRnod9Q6gEREu8=;
 b=LKLTUKB3yy9rpWE0GrKKWw8IV4vHTBZ+hBsks0hDQXFsuELgY0BsaI6QDW1P+B92/6
 rmoPDHafUdao8/PzMtkhecmJDia8y77Qf9T+6Q5Ei/UyQtcpBC8jUEyYIhnceU1v20ax
 ut2UfaO3cuK2ynovFiSMnC8NyZkTAlOBG8OKBWJR0yVSRX6uwJpI3j7w6cSZYs2w5nzi
 dbJKwrkapb8wBfrEawjISgrbIQZBz/QLBXLk1LpNdYF5MzZJBfG64W/K13MEMyRj6Oyu
 rr4iZ8YvHMISSQsiu15pPRi4ZoIsJhw66aTMMzMD5Kd7iyTUKizYz7WF3rkyZNL5+yJ7
 SOOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LKLTUKB3
Subject: [Buildroot] [PATCH 14/15] package/dovecot: remove stale IGNORE_CVES
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entry introduced in [2] is then no longer matched to
the dovecot package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 948e71689a package/dovecot: ignore CVE-2016-4983

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dovecot/dovecot.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 6612787a94..a4c799221c 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -21,12 +21,7 @@ DOVECOT_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	openssl
 
-# CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm, which
-# is part of the Red Hat packaging and not part of upstream dovecot
-DOVECOT_IGNORE_CVES += CVE-2016-4983
-
 # 0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
-
 # Note: this ignore CVE entry is reported as stale by pkg-stats, but
 # the NVD database is incorrect:
 # https://lore.kernel.org/buildroot/20250517181815.02ce0393@windsurf/
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
