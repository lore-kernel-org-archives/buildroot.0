Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494E9D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C5A40566;
	Sun, 28 Dec 2025 18:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6OBGFbmyR6k; Sun, 28 Dec 2025 18:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E0EA405C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948209;
	bh=VB8Qkvqlf3c0k5DyTLMWmr09ECC4E3CfMbbNyD6iCvE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fucKPAXW48ZwGzvJ6uk2Xwy65VmSPJAQF22ifSrv6fcohotOND0quh7BZHohDbkQz
	 neQ85JWbE7V2VuwVH/7wAbe9yvxATMPiPajVf5iQCeZS+TROFkehy8uid6wNetfAo6
	 lh0lkavFcaI0zQtAkg+CpumDsiSTjYVZ9y7SolTvQL9ls0KluNEZgR4oHnl4r1zsQs
	 Alhme7Cmb7Q3+lo1eZgkpl7Vd+4GIIUg4fPnY5X72IENzoVKzfyOkfHBR763jrffNu
	 n5cN75t/iaBSmuQxonA6vIIxkGXezBuRwdaxN26q9xbhHByvNkIKpVKHAu7cTfq2nd
	 c6+X+HF8jE4Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E0EA405C3;
	Sun, 28 Dec 2025 18:56:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1A03B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D062B400D8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y2yS24Gh_KfE for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9D8F40077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9D8F40077
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9D8F40077
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso45380885e9.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766948201; x=1767553001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kPl2DB6a3Z8B5Kj0s/pUgtCheAOb3IcqG00lSda0tz8=;
 b=DZ5cArR/EbNqYHv8nRLGW07Hebf8gzdBTvOw+beAr07SIvvqyZfweQgM0UbCwYjsuo
 1+Gf0Bm9Tmq9c48f9fHX6JmkUDtwyje7ICKyxQsaOJrTuv65JOya9aqTnVtOr6HrYSiN
 6dKEmQdGFCyH3fOuqgrao/yttdQ4+/EDID4/twbM67FcWYBJSiENNNm9KZCgfcsUOE/j
 E8NqSeeJ3iB+Y1Gv0eJJhf7YcIuhEkLCQtCs6Kc9EUTLA2sGPkEFHg2FPH121riXyWNQ
 sBQbwe5QZWjajk7UOaMPryV7TR2+oG4idYYnuqla1+zakJRWyME/BKXp5S/M/q/w9M4B
 5phQ==
X-Gm-Message-State: AOJu0Yxg8Da0Yu2T7ETXZ6B/c0zfMAllYvG15WsJxWDriPVuM43HC6IZ
 Sb1r3ogmYxLduBXY3dS/0IGx0zazguTn5WNHd+xvVHoK1+N9euXEHv3yV9gtI+gn7MzqKXCHAS1
 isVXRrZo=
X-Gm-Gg: AY/fxX7T9l99TGZNlnbcP00Acr1RCeDPpyRmIw2lVua7UT0mb6xm6ce9ynpkZ3P7Rtu
 BwADFbScGaO8rCtnWtWdQgRO2hvHEfys/hb6xKIb1YOt+7yur+DeCeNvW48QvA6BIISM55DvKaG
 Iz2opdCZ3CxGGTOwe+2GvX4VNgkEs0hHQkkbK5Jsj7o9FO1YGNgtlrrLkEN342acYPD+7EBoZSl
 VuHkts1wwp8CeUX/L1Fh7IdFXBQOzBBRvf8qCoxW2vN7Wt/be6MnMbKEBiD+3BzTUZ1g5sxDoD7
 Jnxnt7V2do1CtIifZYhvI/FXHTH1DPppSJP8NmHhBpdvYA9h7Cj4IMc30cQ+78Zwm9gj4UDxX3f
 1vIBDQF2zuhL9ASWkvHWxytA3dn7/57t0YM4JzIffqI4VlqcL8cElEzUoQyLLGSsvks2T6xWLM/
 4JHnAx+e7Qz/1UP7kmP6uCb/6iLaKvzQsc4GF27r8jv9wuPJHCDAzDxuKKSXwY4yZH77S8WQCQs
 SCyg7xtJIA=
X-Google-Smtp-Source: AGHT+IG7fY9yhWW2V5SBYOXhtWMNfx4hLhJck+2RN+1a6WvMFS5IwJqGdP8RbB32xBwDZBcV4V59ng==
X-Received: by 2002:a05:6000:2889:b0:42f:b6ea:5e4 with SMTP id
 ffacd0b85a97d-432448ca347mr43366077f8f.28.1766948201225; 
 Sun, 28 Dec 2025 10:56:41 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm24426954f8f.6.2025.12.28.10.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:56:40 -0800 (PST)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Karoly Kasza <kaszak@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 19:56:29 +0100
Message-ID: <20251228185637.58072-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-1-thomas.perale@mind.be>
References: <20251228185637.58072-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766948201; x=1767553001; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kPl2DB6a3Z8B5Kj0s/pUgtCheAOb3IcqG00lSda0tz8=;
 b=KSvnnyoIzvQs0Ysttguf8wepCq4E5KyIzOgUlMwEpsdwqCY2vf71F9tYZZUgMEbuaN
 57xq142J7WPe0dIZMTAoClSqHIo8x0G6GDi7kIzVh212oK8ErRIpjPR2MDmr/HBLoPf+
 WN3Jdyox9ch4zrRyG4zxOCFPq1xt3zCFp/c6/fp0RygvpvcbSlMN4Fuue8wGmBN4wYhF
 KX5QhQ8E96htUQtWS0s4fuIW+KpA8UieUbK7hAw8y0ENLR1PYzv6rqG7LeOHh479+6yz
 G/U9HcJFj8IsF+WBInaNjAcH8grAcAtwFasHdDmh9O3pUFnDB6haKzE2RBAq+NVIXSQr
 Wt3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KSvnnyoI
Subject: [Buildroot] [PATCH 04/10] package/openvmtools: add CVE trailer in
 patch
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

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...13-Properly-check-authorization-on-incoming-guestOps-re.patch | 1 +
 .../0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
index 91e379b9a6..c257e77504 100644
--- a/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
+++ b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
@@ -7,6 +7,7 @@ Subject: [PATCH] Properly check authorization on incoming guestOps requests
 Fix public pipe request checks.  Only a SessionRequest type should
 be accepted on the public pipe.
 
+CVE: CVE-2022-31676
 Upstream: https://github.com/vmware/open-vm-tools/blob/CVE-2022-31676.patch/1205-Properly-check-authorization-on-incoming-guestOps-re.patch
 Signed-off-by: Stefan Agner <stefan@agner.ch>
 ---
diff --git a/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch b/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
index f47fabb71b..48962857ba 100644
--- a/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
+++ b/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
@@ -19,6 +19,7 @@ The 2025 Broadcom copyright information update is not part of this
 patch set to allow the patch to be easily applied to previous
 open-vm-tools source releases.
 
+CVE: CVE-2025-22247
 Upstream: https://github.com/vmware/blob/CVE-2025-22247.patch/CVE-2025-22247-1100-1225-VGAuth-updates.patch
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
