Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC1CE8FDCC
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 13:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E462940428;
	Sat, 27 Dec 2025 13:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EaD8GiXO_UW; Sat, 27 Dec 2025 13:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19FC74050C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766840782;
	bh=SfkSLyBiFJyIJbfBfRCZA7s96Ptm9jr3oIkq9pHf83s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PjHBGgO9rh2SHtJGn8NpjaPHedgNsOoPupXUWgC3duaxJn6K2pRliKRRpbAAd5Uhr
	 6tCPp5oR60FtiCu00oK/BEmvm4eUj4rFTcEALfzyFrjy6LVxD8OL8vS+JGSoQhXTVS
	 BKGzSRps/0OWi+h+a20qhggbmLa6mNg4jON99/9JAbpADy69nAR1Kmfo7Gg2ecgzYZ
	 OndZJgqKXcYoHNY1p8CRXnCRsG3/hjMVAxGKuLTG7MWcnmKDYxvYWSjjwABh1NvI7f
	 frC8Txc8y6rZJQUr11fYzLEuBGFSE7stPvXPcsMJHDAM5nbYde4rEvBzk6b4ct3bo0
	 iRFz8SeRh/IjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19FC74050C;
	Sat, 27 Dec 2025 13:06:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A9C9119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 797B880E49
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpk3qpRO2R8Y for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 13:06:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 676CE80A52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 676CE80A52
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 676CE80A52
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 13:06:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477aa218f20so47342735e9.0
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 05:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766840773; x=1767445573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/cC0ihsgIjkeZ3EWiysYrYQnCOgzXCr3F6CcSEJXdEQ=;
 b=qMJ+n0xdVirRFp6oXSezAQsZoYG0+iT6nPdKwhnE4dVDZDTncynFrcnd6DZ2DYDa0R
 4zKFLmYTTXEteBYvEnnrQTH3jXSRGW652LLdgpQgFzLFa+a94E843kGDL0CBW1K2n4S6
 ziil1YI5uyrQR9RDkD8PhYd2lHqvulujylWFVuWgWInztFWq5JGV/A5njYR4CLYadzvN
 qb0ApWISq0GYeNmBxIvtYUMICQGDBTsCCz1cE/KJmNbrthl4JKfT95ynhP98FheiQIz3
 my4554QpCzIkXakHz+86gwXYvRT/gGaczuB5KpF2P1xGBVNJcCL5Tq2vSwlGpHeyLydH
 XZNQ==
X-Gm-Message-State: AOJu0YysSm3PCAVN7ZnkROIA89IzNlyHEujNNZcJt/GAgdkdRGwSVRMG
 PUQAx1V5pB5LwsD47iU6ztYpuUq4ZjRZi1DGJFU5mczjCIongX+fAHAnBtL7eM0s+f4FDPeVXW/
 ggUeYoPQ=
X-Gm-Gg: AY/fxX6EdsRxw8FoztAxqGI+jelOTOg8Is2yVu6mEoQp6gPJfRKfEne7y7ug69S6IEh
 JSExDVSa1eDFUZTkE3Ch07TTeJz8sG7aUtoEvNqQhFIuU3BSzNv1637zBhRFY6UilUXEM/H0Qig
 Psaa/69Q0s/rFciv2nPeI/fZhTRc8AWvl4WVFCBMpY3NjBxqXLtroFP652TeUzX0rRVLWyLyYPn
 P43CM267h77rkJRrjuACDTj5srxabOqobYOIn3EFmtLmyWJ95hX2Vx/diLpURYjPwdO1RItkgXA
 ipkwqEnEMCtZxvIPxX6pvfEBqr2wio0awOwbJaS7QQ3LOLEDABXkvLnfVtH2dpEI6Qtvq4mrrDk
 1J7sj4TtZdsciDUXaaQfmrCCkuuqfVnujnqm8rrRt2cR2eJRbG1IKy2J+rJ5WPKj4KrYuDcVpVF
 g7QKRmBNfQfE60dBm6h2m8yc/7kf5CC8YQ901c6siFTcuVFszGPVZg/fZ/cOMmuGOFwYlGe7Zn
X-Google-Smtp-Source: AGHT+IHmVS4UuU2Z3Tj+Kc4t+ryOm/Puo3htwT2u10gdVlUZPtTyMbsUKb67llV8v9WC5Um8rH1TEg==
X-Received: by 2002:a05:600c:46c4:b0:471:14af:c715 with SMTP id
 5b1f17b1804b1-47d19533472mr337785805e9.3.1766840773067; 
 Sat, 27 Dec 2025 05:06:13 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d28bede16sm134369885e9.20.2025.12.27.05.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 05:06:12 -0800 (PST)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 14:06:10 +0100
Message-ID: <20251227130610.163006-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766840773; x=1767445573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/cC0ihsgIjkeZ3EWiysYrYQnCOgzXCr3F6CcSEJXdEQ=;
 b=P4s+/Ily+JNDrjLg+zgh8ota3ww3X2JvJ8r4W1wxuKh+T7qrc+msEiE1Svb6ViNjMD
 Uk3yRVJFoJjx2KIfT7gC8/3hDQIQHHj5efzv7TCPxIsXsavnJV3oQXoXZzLd4h6Pz81+
 RiQ/2x1BM8/hSCoc1LR2ODeavldQjtQuSKEdFE0r7m0TmCbRIAMWHaHZDoDzRZHQaco9
 c48AC3WIsG+gobLgxGxoNboxW+KREBWxg+n7MrF13EJ3GJRlKMOq7+nE0IOpbG6PAoCB
 WQktNcLLl+HXRtXaibXqai/M7juPRUJpmu6Cn1S4S8HlTU55ETFCU8GvEbTHBWc1DtwJ
 acmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=P4s+/Ily
Subject: [Buildroot] [PATCH 1/1] package/linenoise: add CPE
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

The CPE 'cpe:2.3:a:antirez:linenoise:1.0:*:*:*:*:*:*:*' is valid for the
package linenoise [1].

Since the latest version is '1.0' since 2015 the CPE_ID_VERSION is set
to that version.

The CVE that applies on version 1.0 were checked with the 'cve-check'
script:

```
echo '{"components": [{"bom-ref": "linenoise", "name": "linenoise", "version": "1.0", "cpe": "cpe:2.3:a:antirez:linenoise:1.0:-:*:*:*:*:*:*"}]}' | support/scripts/cve-check | jq -r '.vulnerabilities[].id'
```

Only the CVE-2025-9810 exists and that was fixed in [2].

[1] https://nvd.nist.gov/products/cpe/detail/10423C23-6AAA-439E-B723-1FCDEB3A769F
[2] 3c7cbf97d7 package/linenoise: security bump to version e26268de5e

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linenoise/linenoise.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 05f8aa4845..29bed3ce4f 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -8,10 +8,15 @@ LINENOISE_VERSION = e26268de5e56bfaad773786471844578fe9f7f4b
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2-Clause
 LINENOISE_LICENSE_FILES = LICENSE
+LINENOISE_CPE_ID_VENDOR = antirez
+LINENOISE_CPE_ID_VERSION = 1.0
 LINENOISE_INSTALL_STAGING = YES
 # Static library only, nothing to install on target
 LINENOISE_INSTALL_TARGET = NO
 
+# Fixed in https://github.com/antirez/linenoise/commit/880b94130ffa5f8236392392b447ff2234b11983
+LINENOISE_IGNORE_CVES += CVE-2025-9810
+
 define LINENOISE_BUILD_CMDS
 	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) -c linenoise.c
 	cd $(@D); $(TARGET_AR) rcu liblinenoise.a linenoise.o
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
