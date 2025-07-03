Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B98C83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 20:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBDA0615F5;
	Thu,  3 Jul 2025 20:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VyQNfvWmnfi7; Thu,  3 Jul 2025 20:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70696615E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70696615E6;
	Thu,  3 Jul 2025 20:09:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41152193
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32EA240A15
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:09:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9C8xpujNMUBg for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 20:09:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18963408B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18963408B6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18963408B6
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 20:09:22 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4537deebb01so1506025e9.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 13:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751573360; x=1752178160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XOs/xh0Em58oHKqGJyiZNpqzGSb/w6NbHtxL3eWmofo=;
 b=U67e0JXGdz4zg7K+YPAq2wC3op+TcP2mPuWKj+C0a6Yv7sbFQ386P9/hkKpxPUd9Rs
 +XzlQe9G8oGRJSouDIW+Q2QBnWIbidOZ5OGUgU1GT9gx8DB4AQH5sIvB4Z1gs/gUdgRI
 pXwsuUMDlU/r+2dIg/YskMEOwLQdGPm1VTwoHTyHEY8qc3BOTayx5LKN/4hzdzCpya/S
 BcEG0lOFPlIY5qGApx01Kz0qStrTnI0x9EMZxjd/dSSwAct1gaojefxX5KREI15Jg/iZ
 fM62Z7/bNGP3FDkLSY96ou/PV3J8QMKFVcO46iCmP4wcguPrWNaa1RNFJm4AQwB6eF39
 8TGw==
X-Gm-Message-State: AOJu0YyoKK2jnYhU3R3KnLaKkocgh8v1wcFAEJb9fKtBmlGO27SQTd3m
 sVPxCQuBphElg0h482uN5NRAVuY0Lxenucu33LEzOvtlSMdDBfbeBvz9SxkgUcbbD0kKMwDE+xa
 2o5Lj
X-Gm-Gg: ASbGnct9QUKs9g9IV3yRADgA+40K7HTRaLwhjy7W4EIoX/YPBCxBPZOY4CZOKDpRBEA
 8EU1sllXrw6xdVPdV3hQssLX9udInf5ctMriRqKmiYUXt5WTNjKCykEzHCMAfUdwSwbqDo8k8yZ
 bJNoOuHGzfQ8uvIHsGipoCPU5LJszD0LS5psgb1Ne8UXBagjKwY7BniWyiZPA8qbaXBxytwHYaa
 1YCtxwwhdwp08t3VcdCVFjMlYNzKaYt+74POsThL1tltBXTLvlxHs1j+Z9hkolAOruDuJVaye+M
 Uq0dZ6F+PIhc55y4faN5vnavh1SmO6b9lnahCaWXD0dKg0YYB4MzIY4okJ438mMzqdoCIzNjL3H
 ymAHQCUEMaA==
X-Google-Smtp-Source: AGHT+IE0THAaTr8xehQi6qLt1egfwW8VaEwJh/Cd1Yu0DkuqmOrxdjHH6rBcbVm1wb2xeCx+09A3og==
X-Received: by 2002:a05:600c:37c7:b0:453:1058:f8aa with SMTP id
 5b1f17b1804b1-454a36ec3fdmr95713035e9.15.1751573359745; 
 Thu, 03 Jul 2025 13:09:19 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47225a2e8sm576841f8f.75.2025.07.03.13.09.19
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 13:09:19 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  3 Jul 2025 22:09:16 +0200
Message-ID: <20250703200917.4054251-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751573360; x=1752178160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=XOs/xh0Em58oHKqGJyiZNpqzGSb/w6NbHtxL3eWmofo=;
 b=QW5pguGMUgWVs2q58dUcO3H4ji96E2Bvmx4G5SruPoL3RZmVCEmDnnXpaCMMdxtSDl
 1nyukfEc9c4nfyfZAQnFyekRbGVXVssIK8ItTLJrOfANhDZFdKhntKv00WKn+SFNtiZI
 eMpmRQPYFtz+Ja8WiS138LqjG8QsbR1D0p4GB0O2f6IHrOroC1mcUwb1Sj8tbsSK5D7L
 BJTPIt5lVSxWDTuNmfuRa41YA0SbjKWXMWuMNYB/NwXVL+binJDbNKMqt4/Em4GYVE5I
 /E8SAc6vL+ajwCybczOiBKGR4pBkGuNwTrmkg/sZI8avE9Ad0IXi+0RXLOG9cIxDFJQS
 Q6vQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QW5pguGM
Subject: [Buildroot] [PATCH] package/python-multipart: add CPE identifier
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

The cpe:2.3:a:fastapiexpert:python-multipart:0.0.20:*:*:*:*:*:*:* is
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/8C38E43A-00AD-4851-9AC9-80408FF89F52

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
See for instance https://nvd.nist.gov/vuln/detail/CVE-2024-24762
---
 package/python-multipart/python-multipart.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index 8c49e2df9c..8e11f5f6cd 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -10,5 +10,6 @@ PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/f3/87/f44d7c9f27
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
+PYTHON_MULTIPART_CPE_ID_VENDOR = fastapiexpert
 
 $(eval $(python-package))
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
