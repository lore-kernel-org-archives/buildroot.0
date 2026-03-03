Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93D8E67A9B
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 10:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01F6E41D50;
	Tue,  3 Mar 2026 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Io9T1x4CbH3P; Tue,  3 Mar 2026 10:13:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37D26418AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772532782;
	bh=vWpdajm292ugpPRUilEmL8TwILiKp8o2IEhcM/Y0Z8Y=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=sRRtDZsfY+2CYbW9qVFtvPBDLCa+zfwncY1FksPE3+WJifgONpfTPXtXkfBPhpUWg
	 CF/SZallzpTmLn9E1t+uutu3R56NfPdoh/r87pjIESrKEwF43BjPbGAwmyQjylW+Kq
	 acm/vid1L7aP4V+tGbM5hT8pgzu5OiAco4Nvri0dGFsL9+W2+giyXLYUGsg4jUYhgh
	 3IPJaRToQUlOcwn8KXqXYKhxZ+PyZRlHkXqUwRMHVQcd/mnTJ/Ke6lKUKMaUCrqOnA
	 ProJALLECFFTzrsBrVLPEeECpiW4ZT678wEIYE1FNx+lQQ1nNWp64ypI34zC4VdZVz
	 tymyFMEE2PjbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37D26418AC;
	Tue,  3 Mar 2026 10:13:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95C9125B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 879E04063F
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbzYmhQDecyz for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 10:12:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CA3040448
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CA3040448
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CA3040448
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 10:12:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43992e3f9b8so5527410f8f.3
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 02:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772532776; x=1773137576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9Yn8XfEOwoE/1e4FlhJxcIIg9+6xIJFMOOQK/RQq4Yg=;
 b=wCDt2Kmb7a+j2j2YxDV9EuF0h9d0CJ38thqM1rdl/txBJb8utOzNG/RwHtvfu2LxMD
 l/ti0KbiGVg21q2qi+Q9r/bGIi+Wy1nOV037jIt2j4eL5yMM8DMfaxHwo0LZqVFUETo8
 0dVy0m2kHAGKhcwmJ7YZeHzxbBIGUJjDBGf1eyNhwlLb9LOePE9wT+ygypxwg2UWybM8
 LvRBbX7jtUv/D9gvv+CBlqYfJVfWSsg1Xz7XVgpSxwPb8Scbf1mYa/9D9ZKXqh2y25iL
 dWkFs3waC4lEbdpXe2Zj/WUWmXxQdrWiH3FT/L3zB1/TUzAu1JxmNIiU5D9sXlAw6aAb
 zjig==
X-Gm-Message-State: AOJu0YzKFgd7lNhnFfX5vfLXTvDkXXEra/hx0CGons7PeQPGcO5ctBBu
 AUbBNclalgG9VhbbdWEwUjgLklOLNDF13hYvURyH76xZ6xctCef0mzrgI4w2lqxj3ucZrzIPuQk
 h8/9j
X-Gm-Gg: ATEYQzw9nspNX3EE1f4JGlhxEqU09ZSmrINYDCMu//Numc1/Dy7Kw91hOwsCir3VFTA
 VmrDLoKHqI7rgm3ddeWwvvP+WhMF+cGbjUal/MP7Wt5np9RO7VnXzzgVdn+Ec5L5krQuoCTxrUi
 wFt5PfWech3Ne+XJNUST8OoFolWi8YN4JG0DV9Sesp3N2NwBkTKZJ2a/ilvNM7kRrxNFwo3izZ/
 xMBqL20qvaexxI3+RFv/lGnrFVTwqy+zzmpx+gGtwElMZr/LPcpix83Iy95HTz7dICZFokzU4mw
 x5eNnYm6V9Oevpfqj/Q1ezHZSDX76lSqKRCoZDC/yJGPtosyxnJDrU/eO6i9DH4xOSv6UbBNwIW
 Q+BhrXx3c+G9BaO57izgG/9j7VM0vlN5CZSJHrXBIQSE5YHiUGvAcI6JZJDjKFPZsMQfxGIiRNc
 n7i2rtn3vlgVA8HpQ99T3TMsjquw==
X-Received: by 2002:a05:6000:1866:b0:439:b3a3:722f with SMTP id
 ffacd0b85a97d-439b3a372dcmr14313960f8f.30.1772532776356; 
 Tue, 03 Mar 2026 02:12:56 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm32917418f8f.31.2026.03.03.02.12.55
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 02:12:56 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 11:12:53 +0100
Message-ID: <20260303101254.192225-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303101254.192225-1-thomas.perale@mind.be>
References: <20260303101254.192225-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772532776; x=1773137576; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Yn8XfEOwoE/1e4FlhJxcIIg9+6xIJFMOOQK/RQq4Yg=;
 b=VasQtEArEZqC7+LEiwgISPUNgZ+jIDWkBzKpMfm0t622OY/k+zVDU5isVTbYYNnleX
 FP2Iy00sxXJymYWV6J48UPj+k/z2XbO4sqmgqPkuEsmeIylqYRK9ZsTorGilUjsxkPsr
 AZl/e/DazB+y/OLPM2oZ+Cqm4luURe8TNFxjdz3JvWOZQAiC4UbAaAkueh5Cam9BlYg2
 RBVGacqLzjtsRen8leuyFfH9nYAX9A6No9jc6GoiPe4UrQxXT+82jINrrTHOVvhUUv7X
 lpSa0Ob9vozad7ok8KZN+tRUZWA1WNk8xNd9ztr9Isc7n1SHqE39KOwDuxANCBOh2EM1
 8EeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VasQtEAr
Subject: [Buildroot] [PATCH 3/4] package/freerdp: add CVE-2025-68118 to
 IGNORE_CVES
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

Only affects Windows platform. See [1] for more information.

[1] https://security-tracker.debian.org/tracker/CVE-2025-68118

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freerdp/freerdp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 889c6035f3..4017caa277 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -17,6 +17,10 @@ FREERDP_CPE_ID_VENDOR = freerdp
 # https://security-tracker.debian.org/tracker/CVE-2024-32662
 FREERDP_IGNORE_CVES += CVE-2024-32662
 
+# Windows only
+# https://security-tracker.debian.org/tracker/CVE-2025-68118
+FREERDP_IGNORE_CVES += CVE-2025-68118
+
 FREERDP_INSTALL_STAGING = YES
 
 FREERDP_CONF_OPTS = \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
