Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC23FCCFA13
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 12:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 813056179F;
	Thu, 30 Apr 2026 12:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76-IoF1HjcZ2; Thu, 30 Apr 2026 12:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC63A616D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777551335;
	bh=vY7oJXEEIUi+hm+kxsBYbO7wWrNne8u+4B7+rVaUqs8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=pl88DFTq+J9WGtrPI3o2ztQj0maX2IPxufGkpkkdIVZAkqFwspHe6ujRlODQiSVlF
	 QeDscrVPm8ceFFIy9WXfIiYIWbm1oi1HnJhDX3yfKEyE2KE0p8m+qy5OBlSCdkBkcj
	 kF/EdQQP8Fv2Ys8BrQTaIF8gqnQltSqg8tAfNzrH1lszdkeVr6L3sT13axIkBS+AOM
	 ncNHuKGnpz3ih+YQSRleCZdU/rQMmxKh9u4AHL5MMDuxqy/izwKkrO9hrsr1ZHaJ+r
	 2J2t/Xe33BpmOzR3LaLy3rW1b+A2RLenF51xrT/+AJeCrCcqDYlh/zmpEl/yLxPq6R
	 3gbYib1ESVkQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC63A616D6;
	Thu, 30 Apr 2026 12:15:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7870D18F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A180616D6
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYsuvehEloNS for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 12:15:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 575AF60F19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 575AF60F19
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 575AF60F19
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:15:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso6392605e9.1
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777551331; x=1778156131;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tV5KuhujszAYtpUUpJvSzzA77E6kQV57oHQLr4umrNc=;
 b=ns9T7lA/E1w/Zs7UQRQuYfkrsA+HZF8lOIp17CaBfDbRbWAPADEA5X07SrE4Dz0CI0
 GH7rZlsdC9dGWtyCwiMVolX0d/99JcGnERUtwUSQNpkh8nZ0gWkmz6GSPRVcWh3VmmXV
 J8jKug1269Icn/BxuiPTSYB0Ye2cYgTRsj9jcqwI5DTC0AwTUOJ6bwx5xtYPFpczo8Xa
 2sqp/JY+amFqxT+zk0hnm9JEvIMhu/YfMt4ccnkVWPuRAnXzlIi2Rua9XJWXSVByv1rm
 2tfUEm/TarKJmdna4Gk1HFPgUAh9rY/436nNH7kpf0gwGBp4mLVl8Ez3hIaFVoxZErVQ
 CpfQ==
X-Gm-Message-State: AOJu0Yzz6POzVVqvKIUmt3kXgdZ+GKIKi3pYTWh5FIBoaT66XdFEhfJx
 gKdcGWLaBn1VNTcjoRLoHOVkD0hPO9g7LS8auvJpgn7SSeaZhpIvhQtjmFAc3lnwxO5/IlgawRT
 ZZJCJ2/M=
X-Gm-Gg: AeBDieuzdaNnxBehtWzasKycfe1vW/nc3wG356Lav7c2/v/m7serLxpzR9Sm7eb/H8O
 lOWYgGprU7od+lFR2TEyzxOvTzyf6Glg+8lykqRLO9C30QvixYlCk+06K/Qz3NvncCGPGyibmh5
 f2jtQYLSOQy9WfVXoE2gMWNjzNz69ueYbXBuNz7Qyi0O7yGkEIqgrd14yilbByEQtzT2uqvWYLg
 cBbdLDaq8Wj7b85eXPjV2xY+cup6xYXVg0H4pAihIhl6zATm7yj2WQ9Oq8WF2aOib2DywV25qQf
 xYdwykXjUH6pUcM6fgt6cX/R28OQ3fFHPLkp3432YWGa+cRuh0EMdanFAMehu15hV3CCZnpGYOl
 A0TW8I13174o7nfmDwwB5PATf6C2Vp7qkK+ONeIWMUzr5O8azT6s3C1nCTZv4Amr0iWRjuajXIS
 eEhd0MDIhQE93LJVKQG/kkx8Dynkv7edxZiSgJXcPcI7NHKQ5f4dqdBgnMiUJ7CJQq2ng6Bi1xn
 3vIhwy7LQJf2kmGjFjdxwAEtzPPzg1RU74TBACcyD2DM0bstCw=
X-Received: by 2002:a05:600c:8708:b0:48a:5970:2003 with SMTP id
 5b1f17b1804b1-48a844e4a83mr43714195e9.3.1777551330232; 
 Thu, 30 Apr 2026 05:15:30 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b7218622sm12682907f8f.21.2026.04.30.05.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 05:15:29 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:15:12 +0200
Message-ID: <20260430121512.1020041-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1777551331; x=1778156131; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tV5KuhujszAYtpUUpJvSzzA77E6kQV57oHQLr4umrNc=;
 b=SUL7Skn5wIZM/7PIFcPKJIKWYUv7YHHXU5CNOcZRvCoe6mWHeVQty2/MNKgbArE7gM
 mRqIEzGm7Y2LMdGTFXwz6c19hq7cIw7kj692jTCZYsLD/s7bXViMxH6iPQwmYwUk44+7
 e/+ddZJSDtWjPwT2sdK30LczOckUnyF0Ftc47MGjmF8d+G0T9zbX/MsCfnRafIpsPGBU
 yGpcfjhoMe1OCbPWTUhecqZDAHvD0ukfEOTyCI4QpC39Z6VrSwMwKW/Fo21IMHCE3Dm7
 U0xd4NB97fcQYsSKsEaq95DjMpiixrweVzgmjQwPqqlG1/14huaFBoba7Pa2T+LgJy7S
 Nrzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=SUL7Skn5
Subject: [Buildroot] [PATCH] package/linux-firmware: add RTL8125D rev.b
 firmware
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGZpcm13YXJlIGZvciBSVEw4MTI1RCByZXYuYiBhZGRlZCBpbiBbMV0uIFRoZSByODE2OSBk
cml2ZXIgY3VycmVudGx5CnN1cHBvcnRzIHRoaXMgY2FyZCBzaW5jZSBMaW51eCA2LjE0LiBUaGUg
ZmlybXdhcmUgd2FzIGFkZGVkIGluIFsyXSBpbmNsdWRlZCBpbgpsaW51eC1maXJtd2FyZSBzaW5j
ZSB2ZXJzaW9uIDIwMjUwMTA5LgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9pZD1iMzU5M2RmMjZhYjE5
ZjExNGQ2MTM2OTNmYThhOTJhYjIwMjgwM2QwClsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtd2FyZS9saW51eC1maXJtd2FyZS5naXQvY29tbWl0
Lz9pZD0xNjMyOTY1MjNjZDRjY2ViYmJkOTAyNmE3NjljNzY5MDFjM2E4ZTgzCgpTaWduZWQtb2Zm
LWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+Ci0tLQogcGFja2FnZS9saW51eC1m
aXJtd2FyZS9saW51eC1maXJtd2FyZS5tayB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2Fy
ZS5tayBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKaW5kZXggNGQ3
YzYwODk0Ny4uODE4N2QxZmVhZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9s
aW51eC1maXJtd2FyZS5taworKysgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlLm1rCkBAIC03NjEsNiArNzYxLDcgQEAgTElOVVhfRklSTVdBUkVfRklMRVMgKz0gXAogCXJ0
bF9uaWMvcnRsODEyNWEtMy5mdyBcCiAJcnRsX25pYy9ydGw4MTI1Yi0yLmZ3IFwKIAlydGxfbmlj
L3J0bDgxMjVkLTEuZncgXAorCXJ0bF9uaWMvcnRsODEyNWQtMi5mdyBcCiAJcnRsX25pYy9ydGw4
MTY4ZC0xLmZ3IFwKIAlydGxfbmljL3J0bDgxNjhkLTIuZncgXAogCXJ0bF9uaWMvcnRsODE2OGUt
MS5mdyBcCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
