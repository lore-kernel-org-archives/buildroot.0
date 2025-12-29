Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56028E92FE0
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A8C7407F5;
	Mon, 29 Dec 2025 21:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7smoIVu1ljm; Mon, 29 Dec 2025 21:22:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7899405A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043335;
	bh=Y0eo/3ojADmXUCbHdt40V1U3i9xxGEqDBEostxaiw3M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ZgIyFg/KYxYe063l4VKCFwE2y45VbUdJWTXYmLnLEEpH1c4c/x1uMbptCWVNY3YaP
	 K15CbHfFd3TXZFDGrUmUOodP8SoOaFJXd7EwxaheI1Tp46D/dFXebpKKJKQfJufCUt
	 t9vQ79PoLYPkz1pjY9e1trOIiqx1RbBQjO/mJtsWOOuNgPpIGbsMYmEkY0p7wE6NnB
	 FAEOEFYrTQaEBQXAdwEJNzrpnmvL78RCa0U3pCGunXX0CQADFoww2UW599m+UbM61r
	 GQMl1zYMo6cNb7v69ArTfScPfHL2LN7ot9Kw7dXsUleK/f3zJKmP0dUd8CXrr1xpX3
	 UuhyZzt2HFo8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7899405A6;
	Mon, 29 Dec 2025 21:22:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD31935B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEBD560AFB
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_CGxKnvBKZk for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A54A460AF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A54A460AF4
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A54A460AF4
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47d1d8a49f5so45101605e9.3
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043330; x=1767648130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9nHjh80G3vRxZ6gt1XG3LXgCp8ttsHHQz1JW2giDcv4=;
 b=E1wDYsiPMvp/ug2y89pfkFZnjHkzayWHLj/YSVgh3eTFH1wKC4h48GaIdA5o+/hZOT
 4DvaTc0qJP8MIE3uMDJzMZwqAEYwU5c1kcl0Bf2T3n6jcfBxwaU/7S++thL9vuPxk1L/
 RaeFaGTNdDnfMtxupzk4M9maee7ZMY5v1SzqoUqmXsWDTcsycKGpq26VCt75p+1koAnp
 zYPRuFObMlxoBy56b6vyF6XS68nr0ixADzH06dtHxo/uN9yObkg/aJeAQg1wR3LTAbxf
 6ohWYGXUVF23RrRRf8VUNaYIH35b8RlRx+6VtwkXvzMpoeOsvK3zAJl+DOhTDfrZpn4O
 qRnw==
X-Gm-Message-State: AOJu0Yw8wFkvkPWeGbMKlYaVv5avFIqMuQCObtbIIBA5bZYsRovFVkg5
 yRg6IjEHwpt3sqzDK5eodNtxL/xotcS4JlOIvmIQPCmji0GOh4pjceuTqZ26yKFn6hY7F2IeJgD
 sDZa2AZk=
X-Gm-Gg: AY/fxX5kYw00XZsRq/1d2JBF0TvZtGCXRdcGxvWKHTajpbcTmkYXiS9edlkWYW/SA+S
 nfqFvilrJl1MtmYH1vdrho3mbBsIXjl7wYofP8pwn45CJ7AuTvYt4lUAgWVYApy8u5/+lgZz6UV
 lzeD7dUGXi+ala+woBoCwNw/86ZHB6hlLucjYJzTw1oggS96RWcEWjAB42DYC5RvCAP/EtHAi8u
 r1RxqcM3xf4eZs+7phGs46o+9A70cmKB11020ujNosc26wIEqCxriXZ9wiTUxmwwfv5323XDohh
 BUfeiD7uA0PeSjOGmhtpf7O1UBD9mKQRPiCP2uOR32W6U0oRPWgmGdoZ+Bl6HbIomrDfbrX8gYq
 lE07GX2cayoSKwAJNbr/9tZ8urK46ALwHPyAGlYBM71mrV3443nmX1sfVI06hnd1kGNzjYAVr3u
 5aenY=
X-Google-Smtp-Source: AGHT+IHl73xHX1qzsk0qw6iW3fMunHQpcjVFAY0YFh5N+DWD+6Di3Du5sPO54A/jBO5nxG/awaajZA==
X-Received: by 2002:a05:600c:540e:b0:479:2651:3f9c with SMTP id
 5b1f17b1804b1-47d1955794dmr323133385e9.14.1767043330575; 
 Mon, 29 Dec 2025 13:22:10 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:22:06 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:43 +0100
Message-ID: <20251229212149.167902-11-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043330; x=1767648130; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nHjh80G3vRxZ6gt1XG3LXgCp8ttsHHQz1JW2giDcv4=;
 b=bYqUap8gRmmR0mDfeUq8cc0kV1KxKL4IGmgTN6mvuo2RWD+gNtWvSf/ua01PftIpi6
 +rMrTdNKknQrm5npdINVOq5o7fg02dQhkZHLAeS7Dlj5B/MO22L3S12mO6rbdgkNWTul
 HKuVqAL/gZrB9vCi+bl0teV6EUyksLmT0N4tAxmc480LHXV0iWLWgYZ0FVrFrtrr+yxI
 IEtO7WjcnMLkrZHGKPewRCGu9MZ3LgZJ0QLw4I6Iwfxfhag7X+J5WEZXgZzk70eYNz34
 YZ92TkYOnNzArVRcg6c42bzV+fF/2UVTXLCs9wdvlib5Ts5Wl1o+Q8w+JFK6SfToVMCG
 RrhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bYqUap8g
Subject: [Buildroot] [PATCH 10/15] boot/grub2: remove stale IGNORE_CVES
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

The IGNORE_CVES entries introduced in [2][3][4] are then no longer
matched to the grub2 package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 2495630383 boot/grub2: ignore CVE-2024-1048
[3] e2f46ed03d boot/grub2: ignore CVE-2023-4001
[4] a490687571 boot/grub2: ignore the last 3 remaining CVEs

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/grub2/grub2.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index f543c53cd8..fdf274d9aa 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -15,17 +15,6 @@ HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk \
 	$(BR2_PYTHON3_HOST_DEPENDENCY)
 GRUB2_INSTALL_IMAGES = YES
 
-# CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
-# doesn't exist upstream, but is added by the Redhat/Fedora
-# packaging. Not applicable to Buildroot.
-GRUB2_IGNORE_CVES += CVE-2019-14865
-# vulnerability is specific to the Redhat distribution, affects a
-# downstream change from Redhat related to password authentication
-GRUB2_IGNORE_CVES += CVE-2023-4001
-# vulnerability is specific to the Redhat distribution, affects the
-# grub2-set-bootflag tool, which doesn't exist upstream
-GRUB2_IGNORE_CVES += CVE-2024-1048
-
 # 0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch (yes, two
 # CVEs are fixed by this patch)
 GRUB2_IGNORE_CVES += CVE-2024-45782
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
