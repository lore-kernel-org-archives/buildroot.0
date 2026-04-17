Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7412F43684
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 09:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B765960DF9;
	Fri, 17 Apr 2026 09:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgOW0bFkCpa2; Fri, 17 Apr 2026 09:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77EB360DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776416405;
	bh=oL3XAhda4oiFyaEXkZT85gogB1hpc9esLgTl4RP9riw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hu8Id2+XmVrvIYpnoQ+JiBmddbjmP8UQmWlMPRQN/+SnHfZgEhLdIfyFgibtiTru+
	 T1k57vgM+gEXIh1/cR2X+b918wizqBwqqJUrE7CI9weBwOPi2gOq9zkBofYnhCqVjo
	 RL3Q7isKTnLOfGWUMHqUgGBZ35ikCnjiIHbwomG1VKPaTG8KA6XbrDr76Natr+9AwA
	 SzW0O+F8Rbp2GXx5zmKw0/b5oJ2A1z6ViRIuBnzvHWxp4ZLMNuO02FOZwtzZVJJksN
	 4C9DfM3SD/J/68fX5FXKDFJbO9Z1DCV2JhIKJ8hIreYxuiQn5No5CZvqzbRrWq/8uj
	 QpheIN55j8HMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77EB360DEB;
	Fri, 17 Apr 2026 09:00:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 592C1396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52D444057B
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8e22uC989NNP for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:59:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D22940578
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D22940578
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D22940578
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:59:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so2834575e9.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776416392; x=1777021192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UZ+BK3MBll5VAJ+TgvLPTVq/urzHFNMQHnNE+c45l0g=;
 b=n5xvlhg2T9VAtHTQ5vPaNWW26egQEgLjzWr/+3M3+k/nXpakhby+Luhwa7YbXZKO15
 b39UN/YKTMJRcwYBD5IepWpuAi+xlbbHbLUAVk2F3phVgS+4qQQZSabBfZPHfoIIq1dt
 eM8lORxtXFSOhPZIwKrD5JQOeHUxpOxwyzAlcMbLrZ/PITJ7i15dLTQL7GOJOfxGl3FS
 VLn84NwRaR8HqaLQcrF6gyHJYhPfWY10pgZbPEJED+4pRnkt2bgIbQrEC2KZBBO/u3CE
 ae1MC8BMrOtxTaffnvG6XIxW7negKNEKUm6oFThy73uNfhlJAv7P8oB5r2aJ+nY78Wqm
 XPwg==
X-Gm-Message-State: AOJu0YxcCzTx7rv9lRrVGVqB69exVI6muMgh1giDC4+XBb6ASI0yClIo
 6llsrEmK7KfKM/iIvmmjR9oc115yw47AIazJNyXq7XVHaQQH0u/n/oBVP4VVznliuJVP8CEPdkN
 Nz4xzr2Y=
X-Gm-Gg: AeBDiet+exzEYVVVLeNHt2aFh9wCWTL+dkJ9an+SRD05cEXBZSJIJ6LMXZsh9ujKoa+
 WxE7bgSre27ZQaJ6+TUm8dD9dohvdhWifH/KwqogussrVQEolTssXGkCd5U4EiqJJUOHADnz0iq
 /ROwJ3whbsFkdnPiN+pBP0Ng95nDRgvU0MxhxLDXisQM3kV482b2s40ZQ5V/kXSIZeleSLX7JXV
 rq1J0zC+YgeJpdeKw1/7i5UKu+kmWulUM7qwM58i/0UQ3vSJoe03EYRdcHm7s2g36uyBg04VhII
 6oQiuwMx5hmDiL0Mmwtu4G1O5CgHxtfa8WjUyEE63Xu7CaAPy93fV+/kOIxrbsoCRmO/Wogd/j7
 O+xM+o0y7nWGYIeg78QandsDUUbF1XALaKaBjNZvahpNOakWFf9mgzcxxJDhfg4qQcSo8R5+4zi
 dLlqss+SvF/hw0PMPJpTccSwUJ8F98rJYtwZTvluZB1pIn8Q89QSqBnr7/mQCp9citwi/Djv1dx
 BtiTrk+v0+MTBjb+UsOvkilNMd9yj6MqewG7aKP7A==
X-Received: by 2002:a05:600c:3e05:b0:487:575:5e1 with SMTP id
 5b1f17b1804b1-488fb78280bmr28568935e9.24.1776416391810; 
 Fri, 17 Apr 2026 01:59:51 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0745sm15077795e9.9.2026.04.17.01.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:59:51 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri, 17 Apr 2026 10:59:30 +0200
Message-ID: <20260417085936.200528-16-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417085936.200528-1-dowan.gullient@smile.fr>
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776416392; x=1777021192; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZ+BK3MBll5VAJ+TgvLPTVq/urzHFNMQHnNE+c45l0g=;
 b=R417wNICrYm2pazjqo/u6KdyIDwbRlUTkQfYqEYZ2gAUI9Jv2zj/bvC9AGjxSlS9Xe
 kCrXaKHwaWsR390G11VtnA0TZ2p6Dy8oGs3TyR3WSjq8TqwdFM6JQKyAW1aQCjQdnFNS
 chDpQAzggngZ46DURu27QmbwUeYJP93cXKLK4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=R417wNIC
Subject: [Buildroot] [PATCH v1 15/21] support/testing : test_octave : Bump
 kernel version to last LTS (6.18)
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
 support/testing/tests/package/test_octave.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index cdbe2688df..4b269e3af0 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -13,7 +13,7 @@ class TestOctave(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.26"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.21"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
