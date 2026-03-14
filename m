Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7750910706F4
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 18:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35943413FE;
	Sat, 14 Mar 2026 18:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OiLdNZHHJxV; Sat, 14 Mar 2026 18:51:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5163413DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773514267;
	bh=wJBEQ1mPvMq8fjt2IRWfEaggKXMQVVHPJ0Cu2MMNwb0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N7o4yBDDC01bv+OhSeZgYdMI/4zUjqpFlL0uHkYhQhkoCn+2DpI/NIu0Gpz97YGx4
	 n6pSDjr5z/w/m7O+XwJumQT2PRc3vcT62KQ9Vm2zwv+BYS9u+BhrYdq8TS+G1f7Y97
	 hYC+GpKHgSuQtm7/6p6SRWLKy6HH1nQXet5GLqeb0oDfsgEF9akZxNsxN+dWwaXx4a
	 e2stHmRQefa/TVHiJ8vBUWy9dYNFzMJtAcSCT7evdTDHGBmzlwt0bW/+KdwGkqGX9n
	 DGFC01uiBRCeT3+1LGQTjNO0QCK3UVXP88tciPuUB7kPi54mFC5wrX/4GPRfOcDsQW
	 2CI/QwU2UCK4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5163413DA;
	Sat, 14 Mar 2026 18:51:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A76041B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98B2B8222F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scZ6D0xeFra2 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 18:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 72D8B8222D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D8B8222D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72D8B8222D
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 18:51:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1E58A4C0A61
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 19:51:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36564)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1U4j-000000004PV-1NcH
 for buildroot@buildroot.org; Sat, 14 Mar 2026 18:51:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 19:51:00 +0100
Message-ID: <20260314185101.3226151-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773514261;
 bh=VbjqTQPd9WV8Q7C0u7O+L83q5xHBFt7q3TleFsfQExc=;
 h=From:To:Subject:Date:From;
 b=O6xQ5akPmYkc8emNWF6TzON5aa/NmDu2CHeet1/iR9dy4ixxcekPgPXPvDKCj13zD
 yGoDCnKVSP7hkzOF7mi3uFAuXfp5XJbdZcguDQpjeUII0SS0AUvW5Q6fKA1VI/9dS+
 hr/KyM5VgtFaHTJ9QObbKkCto6TgOXiw3yQZvZTcutk57C0UpnZOQE8pnAe5Hlx3cp
 z2I0KUFiq2hEFmLrtK3P5/+7Sv5UKXKcCJYO4TTxLA4cqMpZ1741PCuM6l39EKpIip
 chIQiMJ/5rBYYSwwKw89QwyurghXhek5mASGP9Rm2ivZHK43K+u5O4On4nY3GgHB+o
 0YNRnMfVNgoHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=O6xQ5akP
Subject: [Buildroot] [PATCH 1/2] package/ell: bump version to 0.83
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

https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.83

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 034ab74c4b..ccd11151c7 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  672ca1e44dc0ddce1665941754b4e2b3b9203481d7d7a60e0b5f39829d73fa14  ell-0.81.tar.xz
+sha256  39a562f5ab2768e69da1ffbb1f98a8eb3483baffc7d2ef6adc3705e4fd4e53fb  ell-0.83.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index db9dc80366..799438e5e6 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.81
+ELL_VERSION = 0.83
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
