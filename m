Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A81E92FDE
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE7BD407E1;
	Mon, 29 Dec 2025 21:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRv8aCpcMvSo; Mon, 29 Dec 2025 21:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3AF74064F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043332;
	bh=fEd8iZmAktiHMH9IwggY7iOoHvb9NPTBZNfgpLEmsxU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=hzVXnzohmJ7DqxyLCqdqAu238DWQ571IHBAdgeT6Jc6Al5bjPTGtNJYcBpzUvVs8p
	 LkEezK9fToLuPwbdNHGAbE6yUtyGN151Q0DfIQaJBipgZlk96no3maKxG8d+19VWMc
	 PazxFWunhBw4iRy+sLyZv1mcwxEM5c7bVesB9aNGpLhfVBkcL+BE9hqtJBWNxnaUQu
	 20SAsbtV4ZYL8qlKjVAo64QSOCOGuXPfB9WBq7tM9M00pmhGHSvPHfuvWUIWz3zbNq
	 TCBxucho7idnSJl2ACti+oGK2vHW1PjTgRy/b5buYgNzUM+7gGMwQR9Bu7HRMi99zo
	 loRu5z3xTgy8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3AF74064F;
	Mon, 29 Dec 2025 21:22:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D299177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EBCB4005B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoj3QjCEUEVq for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36A584002C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36A584002C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36A584002C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47a95efd2ceso85715765e9.2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043326; x=1767648126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bVMV5AeFY2GJsS0O1pqUTkcDcw4JurAK58mD6piTRXM=;
 b=Go9l3zK78M4dK+MrCVxC1RnEv6Mc7911UCJdniJQtNoilPnEeGAhxJrsOCxHQ784JG
 CxsvgpkaiT1Bf5aHxMnWVxt1ivPH3g/B3hWtdjSOs2+JIqV2c4DV6cZJppqor39xJIEz
 TX9fMjcno9UTZRkEaDX9lJ17K2kjFiSYQF1OgCVBlrIhIeGrfh6iZMnqtVa5hl0VBl9I
 BluA3HROpEdxHvQQUD4woIWWjd4XMYDGER+yxcbpY+y7KtdM8XRXn4nNQfl/2QpL24qr
 xeY425qzd2N19uiW1AFHMQYsAdMyxEqdCD9i7fzPzmXNqWSnyGn1v2rvpJPS9lw5cC2O
 pDuw==
X-Gm-Message-State: AOJu0YznyszsSe/rzrHYT3dBt8rIPNp08nDvF4FYM9cc8eI+jzpRaVtW
 JzNZdcR407D3hDt28ETGp6HzOcnCWynbUxCDNOw7kWNV07A9Rwl9hbqPUhTK5006OhjPhulC3kj
 V1kO18iE=
X-Gm-Gg: AY/fxX4BpVC3FTdXmPfiRFyeWZGf2sDtg+FCMxTKXDRfBe/7YJ3fIYTCcspHXEFZlOZ
 pQgr6nTwbYoFkiw0ByiFH1rOlmDKBo+VuwVpIJT+2VBMnS7eqC83f6x/N/bIqxK4Dcn7NVx/LZE
 UR032YPTkkfiudyUmc5LK403sMa035eOcvJ7lmAt2RV1VrD7smg+pG0piEBa3jwE8TIdtJaBbhq
 lkgCzUCtR3Q6UcupMoaCTyUKAP2Mts+4Zct34izw0J+y/dgGBzXdn5V2YFTUfZyeTrloNwcDRSn
 hiqroAfGNyqNh2ADzJWoMAy+OiEglLpaLt/ZPC+TAPX+9NuCwqEb8/6fUFRhPbvY7czK5VYdvy2
 /VEnyKBcWsjccWJ9fZRo4lP8o5vqKrasxFygscHS+4Ndzc+xN+EoTRPntHzb0zoTGOJlU6Oh99I
 x/Rdw=
X-Google-Smtp-Source: AGHT+IGwThVEmgi3Ispk0j3JBWx3llvKorvscBXKPET4qlSQTOAiJxcwR8OWLyMrMJgwwNeRb1ilEw==
X-Received: by 2002:a05:600c:3b0e:b0:477:b0b9:3129 with SMTP id
 5b1f17b1804b1-47d1955b7d1mr358426505e9.3.1767043326075; 
 Mon, 29 Dec 2025 13:22:06 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:22:05 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:42 +0100
Message-ID: <20251229212149.167902-10-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043326; x=1767648126; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVMV5AeFY2GJsS0O1pqUTkcDcw4JurAK58mD6piTRXM=;
 b=PPaI5i39My6fbQphU5RvPP2tqTe5VADxv8cbdft70ZwEpcxkcgSRTaon8y+Ikkjrt8
 6Gw5rvVkX1Vql5NwtkWKqK8pPZqtfcSiBxxWtLQjapY0cbNC8NSMMQ5EFr7acCpeCnh8
 QU0oj/5giRrXzQEjCbFd6hVWcjYnW6abLy2hGepeT5p22TBiwk7E3GHx3l6KkmVnLudg
 7odwlaf2/Rh4AltW+dZ1fe0X5wGjdjW9VXGAckBkrLAUxy2AbOR5GYhL9hDOm+PqXMbN
 UTDRYd61Bljr6VZeEIyJ8VTgoUCS9Xn2VQG3I87oWHtTkNTGO/VdlZksB2Wg/MTtDzof
 W5vA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PPaI5i39
Subject: [Buildroot] [PATCH 09/15] package/libcurl: remove stale IGNORE_CVES
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

The CVE-2024-32928 introduced in [2] is then no longer matched to the
libcurl package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 7e739d49b2 package/libcurl: ignore CVE-2024-32928

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 9e32c38d97..6924631735 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -25,10 +25,6 @@ LIBCURL_CONF_OPTS = \
 	--disable-ldap \
 	--disable-ldaps
 
-# Only affects Nest products.
-# https://nvd.nist.gov/vuln/detail/CVE-2024-32928
-LIBCURL_IGNORE_CVES += CVE-2024-32928
-
 # threaded resolver cannot be used with c-ares
 # https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES),yx)
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
