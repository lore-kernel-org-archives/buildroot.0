Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A39C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 16:48:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D23C60295
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 16:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D23C60295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 068DD400DB;
	Tue, 12 Oct 2021 16:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6xOxfgx2n-og; Tue, 12 Oct 2021 16:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D726940256;
	Tue, 12 Oct 2021 16:48:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25DED1BF9B6
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 16:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1528980F81
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 16:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFWvse1JuC4E for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 16:48:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 702D780F83
 for <buildroot@busybox.net>; Tue, 12 Oct 2021 16:48:30 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g25so22295563wrb.2
 for <buildroot@busybox.net>; Tue, 12 Oct 2021 09:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OzEBY+rsQH12CAKZ7B6cOPFgLSnPrR+pghMHblgKWPU=;
 b=XKo+meq+c8U5X5TWpR1ITRoIHKtF1vKaCTAFxNxACtP5sSpXT0SVbTIy8tdjeByWbT
 1lmxtJGnl1p1g34VZaY5NhOYhyYloP5tCprCX7/HQmqdzDUZWONerXtfDpGBPBZjSC1K
 hF5wtUeXu0qcKrZAYtxjQSwdz3fJs2bDAzLQr+qzdwjt4HfZ4ITmylOQ3E/44oetv1TR
 a2SqX/7cVHQ0p6EgYtoPyIR9T2y+LbcCbT6Oj9h8E06exUCEcfaKufxDlpCRQ2U0A3L5
 TCyCihVOOP+dQJIjB9yjMltVuBG5kUTw2a1Iw4A0LDhuYP+9A0vOxy4yc1SYcUaRuqMV
 Gz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OzEBY+rsQH12CAKZ7B6cOPFgLSnPrR+pghMHblgKWPU=;
 b=K857kXqfaH+sdVpKX7wg3KTzEhQRPcQtgP2pFQy56VXadb64V0Ih5R8boOW0pE23fz
 ZNDoJTVoloMVRBO0xEeag29dEF05PCTDaAWzciyBGBouFL1WcM47O4m3Fo10hjWo/9lb
 qQvLEhUZz44SP9KCd4PL/GdoaYeOZFUpr9IyLCOtwaHd1GmxEtl7xWL1ngzm6CpvDdev
 YC3AFg3u1AC8NuwIqR6ahXEcREOb5XBqEFPKeoufRN/1txf2Y9kPoRly1L0FvBcSIegS
 uyczLMBoropGtb87i9xVp0iOthHDW3uKfX4SplkSmYeVVXiUCO19VcJsEegQUqi5kum5
 VOPw==
X-Gm-Message-State: AOAM530lMzfZKizz4qTGLhLZjja0QeSSZ4zUXXx/HoUwlqTToAJAr/1n
 4cEP7fzxLJnFK8SYaisLy4WBnMmbdXw=
X-Google-Smtp-Source: ABdhPJzqF1hqp066g7EKr9VX3auWRwUVjvGhl5TsaEDJc7Vt2RWu0huLmEZ1t/6/kbfkdYHFgFkc3g==
X-Received: by 2002:adf:a10f:: with SMTP id o15mr34084506wro.286.1634057308671; 
 Tue, 12 Oct 2021 09:48:28 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id a5sm9245660wrn.71.2021.10.12.09.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:48:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Oct 2021 18:48:22 +0200
Message-Id: <20211012164822.233962-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libatomic_ops: bump to version 7.6.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libatomic_ops/libatomic_ops.hash | 6 +++---
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 3fca4a8c5..991c3fbe8 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 e6b0909cf4e63cec693fe6c48191ce864c32c5113e16c3f517aa2a244b46992f  libatomic_ops-7.6.10.tar.gz
-sha256 f0e630c0ca489767033da5a0c869fb4231db522c5ff479ce55a853a923a00f69  doc/LICENSING.txt
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  18091d5f3cb7008b0432016390ff437b9d1d76c10b92c8e63ff63f0c1331b030  libatomic_ops-7.6.12.tar.gz
+sha256  f0e630c0ca489767033da5a0c869fb4231db522c5ff479ce55a853a923a00f69  doc/LICENSING.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index cc890a7f2..96b8e1a40 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.6.10
+LIBATOMIC_OPS_VERSION = 7.6.12
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
