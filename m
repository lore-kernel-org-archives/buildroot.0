Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF06CD37B2
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 19:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C282860871;
	Sun, 10 May 2026 19:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBdZGM0Q65ku; Sun, 10 May 2026 19:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E1E86085F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778441931;
	bh=Jjoif7Ib48OJyRJER2HMtfvBJIyVpO1+lbtFx56OCWQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N3CT53/gynVp14wgj5gpYBO/8uEEkeIDcPhHHwJAzLnVp3J6McsP9B53RHnnGejZk
	 TBb4ULjHkKuREozr8zSoB5QEBVIbQr7s8gJblf9nDqudLoGxFFKZinSOugptQrWt0G
	 zeiNWgsonNO72X2mWQHD0pXDQiruDb7tZP4YrhrN2gXuJSEnXCDWqenCVpAlTN5EF9
	 Na7veTmMxwnrPEkM1o7HfZhnTXtK+HhrFnF3EpLm9AwORstx9O3ATVcvuIc7/NKq02
	 TrnY/0eDXGnad3nPWqBf7wbQhiL5DoPFYS6uR6lq47mIHR8eJgTNqf5MOhLt9sHuW+
	 X2Fn05LQ96qoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1E86085F;
	Sun, 10 May 2026 19:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2512EC
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CBFE81168
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELPQ8qDGTXDj for <buildroot@buildroot.org>;
 Sun, 10 May 2026 19:38:48 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 389C28474A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 389C28474A
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 389C28474A
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:48 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3938cc204a7so29295251fa.1
 for <buildroot@buildroot.org>; Sun, 10 May 2026 12:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778441926; x=1779046726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iQYXdrLmMechhsu0w9lYnZaxduAFtpEFIhR8MyE0xrA=;
 b=PR3yj2qfJkL8IRrH9XZN2dyCjzyMBNw4V6UMsqF2DGqSnPWIIOE/BjCJkomCURjsMi
 ypZv7XzwdFY9EszZoOS3ilyIlW2NwBFyLjDCHgxOEY3zD4QDVSgWN1QXBw2TZIMLaG5B
 PKhZ3tMvLsUeCSCsjOsF1CXNNMOEcappKDG+8DMg4bc+bxN07gbUaAD09r8sY3mDKUNS
 GwTHyn6Tr6GKX2agXZfmn1HGjE4D9Ji6MWko+2naiP9PvMnzkGPOVkHUK30AauZdc+Rx
 A71Dx1Tjl8aLxB2eE9vAqOk0YCN64jFMBzWR8pSxEBrMHuQDED1KaZkxnu8V20xtv7kv
 XH5g==
X-Gm-Message-State: AOJu0YwG9UFh/K+cDzpThwzezu7rwL0C422dU/PBiQsh7Q+ISyB211ZZ
 X1Rw743t7dO7rarC8iZ0LD9bTQmRRyaRfkI9dMy9KH2iSZGmOJLQjUkEyXAhECZTaibYPnudTdX
 JPDfS7gWFGw==
X-Gm-Gg: Acq92OEwmm5l+h+VOGBb5Un7KdnN8hhJam9zUYjsjcUBtlgsxub5MPSczO5Urbg9hyS
 AZDLxwT+Ud4q5rlb2XSIXOqNw6ab6CEvn+8Wh9erUOil9IhFKhFAgs/UYMPns7ROzjQehL7tb5M
 gJWNOGWdeRH/z3nSC2NUu/kRB9GPCUwRMzLuH5E5WnK1tSzbwKwG5K/EIT1cki83jQwLYL+rASa
 vj9qRTBTzQ2qiX8Qcw3U4mH62i6p8BJEZBfiMsGG6avRpQfD8NAj4g98vpH/mSK2byQnCWxbSwt
 xT9Euhu1HxSgGEvt+4ovydCELZD1mOLT/dTvzGatwwNISZr56TeQgn+su4X7+RmKWxEZtZcK85g
 YEE+9jHHPwAIqo83rzvQbFmsIa0B1oIFdtRX/OUZS2ANi8UoTjzYK37M7jmZy/uspVI1Uj/pRYl
 w4191dGIR8Ffcs0Op5CP0GJmkiR/hilvWSXqeNDEDgiAah+35kc9s=
X-Received: by 2002:a05:6512:3e0e:b0:5a3:ffda:fa0 with SMTP id
 2adb3069b0e04-5a887ae3063mr7911931e87.16.1778441925915; 
 Sun, 10 May 2026 12:38:45 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5a8c66facc2sm619226e87.22.2026.05.10.12.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 12:38:45 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: john.ernberg@actia.se,
	John Ernberg <j@j-ernberg.se>
Date: Sun, 10 May 2026 21:38:26 +0200
Message-ID: <20260510193826.2846038-9-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510193826.2846038-1-j@j-ernberg.se>
References: <20260510193826.2846038-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1778441926; x=1779046726;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iQYXdrLmMechhsu0w9lYnZaxduAFtpEFIhR8MyE0xrA=;
 b=o+xYQ1o+1nakXpqHslbRsL/RxXzjIQKipHlKQVg0iye7QK20cFBcZgSCdkZq6cvak8
 0MCNo3uTq5n/K/3cMg/F65nOL+xmIZTSbTQbprRi4N208kqMqXF/NZDgsC04EfvXmxa1
 lXHkxZOqPvEEUVz89y9APWN/oz9qazQyG5QpsgyhUW30BGfbr0oRIMUC8RajSKDB8Hu0
 4ZhLpuG/KXmVFJCE9FL5f6cVSJw4dfEiD+CMp4S2y7LpM7LpuqiNj9pqIfxJb11RxblW
 wsJRr+NwAP/KUk3T+fVQDAgne+KATaexS/cWftLwfN9y7gwpzZc38SLsbYuQC4d7G5sW
 TjcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=o+xYQ1o+
Subject: [Buildroot] [RESEND PATCH 8/8] package/tpm2-tss: Correctly depend
 on util-linux-libs for fapi support
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

tpm2-tss is a dependency of systemd, which when enabled becomes a
dependency of util-linux.

tpm2-tss only really wants libuuid, so depend on util-linux-libs instead
breaking the dependency cycle.

Signed-off-by: John Ernberg <j@j-ernberg.se>
---

RESEND:
 - Forgot to subscribe this e-mail to the list

 package/tpm2-tss/tpm2-tss.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 08ff401328..11da37a5b4 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -33,7 +33,7 @@ TPM2_TSS_CONF_OPTS = \
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_PACKAGE_TPM2_TSS_FAPI),y)
-TPM2_TSS_DEPENDENCIES += json-c libcurl util-linux
+TPM2_TSS_DEPENDENCIES += json-c libcurl util-linux-libs
 TPM2_TSS_CONF_OPTS += --enable-fapi
 else
 TPM2_TSS_CONF_OPTS += --disable-fapi --disable-policy
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
