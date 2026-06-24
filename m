Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BC6CDE003
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 10:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EBDA40C4A;
	Wed, 24 Jun 2026 10:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58asgG2wvkp7; Wed, 24 Jun 2026 10:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 207F640C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782296032;
	bh=GDkFSmfiB2ODn7m71zrWY55ZTs2Q83PAdOdCYepeZng=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ZGF22A92/J3wAJg1DEVPBaFIPjt6T7ppWaBqi0t4unPMj7WIHUeWFWpc5WJRIE2kH
	 CQuXkX1ZM5g2oV1CtXkVK9BVgJUxA+fuXddimNJ/9bOYoq8oLUSSBo5cOdBmr20Xpc
	 J5hK3p8BmmZ1uuZVVuCsJAXMuNdY1O6F/BWGKjxk7e3Mt2+Zq7X0fqNl19mhH+ZEKe
	 iyrRPjmX0hp8cAvwgADo9LY5aJwNsBqko1Lc+tZyr4NTUhms9XAoun4jyDOv4dqpxW
	 qhruF3IAlBgXMiRYFJJmNxjjbahr/qMWvy1gz9sCPioT5p7lkB1Q5zBkky/+Bpk9Sa
	 7NqIdftVqW+qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 207F640C3E;
	Wed, 24 Jun 2026 10:13:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C046367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F137D81ECA
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJQihSim7bSN for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 10:13:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E685481F1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E685481F1C
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E685481F1C
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 10:13:46 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4633193af19so663909f8f.2
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 03:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782296025; x=1782900825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bkySO14HqHlVUBWLybABT5bfnVIKoRZawKGYWrZoK5Q=;
 b=JOoAB+L6v3anPOcnIzzcVzFRMti9RD4vSPTr67nE0v0S4229aLA15183RR/ORHy1sa
 XhZJxaliGAtukU2T82T5Sq5AIYHwvZp2/uZadQHIBzG/cS96ijS+l2XV+3xSnhNvtjgO
 cMCXueKc9XuATFCew6pyZnywvs8tAyAGbwh5H+zN0EdIlWl2hJIqZruxvNUIv8exY6FV
 KL4vTnhlk2HcOfe4LfS62QKd52pHFbIxQR/QOgArAu0Fx4OWF4P+A7Q5i9G7Oh/5zjah
 t78DlJYaMmlTgKlzAartGdW7hPY9ojiO/2yAjmHIGvGy1lE70AjBLOLXCbVDTGCIlZBF
 9EwQ==
X-Gm-Message-State: AOJu0Yx6XYElRtM3Ri+TUNgDtB9k/FehDHb1z/MuLoZQ0F8i5qEo4bNT
 vM2C9tI+C5ELoeOhqfdtModM2u6bE2z1aU5WaMUgJEEe4mRH4bvWCiVY97j8Y/93eK9E4VcSr7a
 MJlHS
X-Gm-Gg: AfdE7cnSCE2uyzIezQxgD3Z8AM57UyJaXFVVpMK5D2VBWOG+LgLAlS8amwqvaTHpnFh
 qmwCuTPu56m6MrA/VYRK23U+pFc7Qbi9upzO4E96W4IMI9HR/M7qlR/JymvopBoiDi8GAqOkHVB
 rx7QFBftU0W7sePKmkv4E9L443SkkDK+6+txb7/9vNrSnYDQqh98mVW9/tETKNxvUPIH7MbjhLI
 wQiDfKow2Hktzb6fCpdIqo1crs7Uwon2FSVB11u4tq2O+TTbTYvkVAaFJvReMsGFzXFU1WH6Wda
 E+wRvehmtTHn/Sv8srcNP74y39YGNFrbAosbciL9UJ0YVs2UA1/8ABVN/PCMliqmMNH3SFqNpTt
 fv0d6M7AKrB0zt9xPHHmm5hzSiq0KiZAHCKvtME6qeIEiHxr7Z4NasyZ3SCt1vJzorogj3cEQRq
 o+lAtCzcbUh+Ab5NI=
X-Received: by 2002:a05:6000:4013:b0:454:a41f:d082 with SMTP id
 ffacd0b85a97d-466607440bcmr28745817f8f.3.1782296024814; 
 Wed, 24 Jun 2026 03:13:44 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c221d9a22sm5441002f8f.19.2026.06.24.03.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 03:13:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 12:13:38 +0200
Message-ID: <20260624101340.80670-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-1-thomas.perale@mind.be>
References: <20260624101340.80670-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782296025; x=1782900825; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkySO14HqHlVUBWLybABT5bfnVIKoRZawKGYWrZoK5Q=;
 b=ZW5R7dtwR1d7SBFMVjW2NCKicxG1TZMaz7a4pAmikYh1HR49jER8a9BZqMsoxN2xrN
 IIuBFbw9otIkYkhF5X+SlX83GIGRiCxDvDq9eYkrkv7xX40Wm5apX26jMFyfhXqz7SHV
 BAUQErTsf5YJMcnd+dTZkAjUnXiuv8t8O9To6Uq7xMxWoJ7ofvaFChoW4Sx8R0ZTXCDB
 kRRzclOuKiPmAJER6oC+1ZF7rP8jH190769mchkKOu3/A356e3YJd9U5k1pwMhFknVou
 lxDs6A5eEHvkbjClJyJGdo06krf23pfVimPbROdV7oKPJ0itAGlxY1bwl21mSTVjOb4+
 kXPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZW5R7dtw
Subject: [Buildroot] [PATCH 7/9] utils/generate-cyclonedx: support for v1.7,
 1.7.1
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
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See changes:

- https://cyclonedx.org/news/cyclonedx-v1.7-released/
- https://github.com/CycloneDX/specification/releases/tag/1.7
- https://github.com/CycloneDX/specification/releases/tag/1.7.1

Since some tools like DependencyTrack don't support CycloneDX SBOM v1.7
this bump is optional and default remains v1.6.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 utils/generate-cyclonedx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 8d055c3bbd..672e7ed815 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -539,7 +539,7 @@ def main():
     parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
                         help="Specify the project version to use in the SBOM metadata (default: builroot version)")
     parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
-                        choices=["1.6", "1.6.1", "1.6.2"],
+                        choices=["1.6", "1.6.1", "1.6.2", "1.7", "1.7.1"],
                         help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
 
     args = parser.parse_args()
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
