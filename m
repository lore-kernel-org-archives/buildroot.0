Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B06CAC59D
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F9B741267;
	Tue, 16 Sep 2025 20:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdL19rSbBPgB; Tue, 16 Sep 2025 20:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D7B44126B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D7B44126B;
	Tue, 16 Sep 2025 20:27:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54BA3199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B97641C7F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8obFdwmB6D9m for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57DCE418D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57DCE418D4
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57DCE418D4
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso52788295e9.2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054464; x=1758659264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kLADQrcTj50gGltuHRM9CBLo7VSrbPjNsPGZLkgbTjA=;
 b=S3Sbo4JlVxDlainVM/u0D5we4/4Z7V+aMfmzkWbx3lGtYogwNlkj4KTht/xceOrd9q
 ue+4/EODL6CcOAgtE/ZyTraZ/hQCw3Ud4yYn8qSmezqbz0XKqswxU6TkfZni+l/nkhPq
 0f9khxObHMG7dWs1Tv+r4ZB5ufy7W3VOEg92W01kk7Mx6/tLXEosaGrjRkG/I8mn5xRl
 ntKNJog6czq82Y7ojZwQTB0Abg0JT84n1HYNYA72H5BkfUc+DruT3V4bDoQ/WXZXYdrp
 me6KrEWklRC00Pu9u68qPwyNZiroiDBsvIRkRJgQnc3+sINEO+31hfPo2ZjYeAWswFZa
 kvpA==
X-Gm-Message-State: AOJu0Yy1oWE++hhL6ngE7JHEJyTYAvFsvynAJEJYk6+ZqidywLgO8j0b
 +2mX3Gccg3eYjv+Jh255DkkRG6jtmoi4Xjq2QYOgsJJy8pyZaRwuUF5iA5492iWwODxuEMzKDGW
 KcklzSpg=
X-Gm-Gg: ASbGncsaFzRMAaJU70roAvIrPRnaqemB5CM/CB2rPGOwxz3C9V9xLQhR63gY/uoI6q1
 DNUo7ul9PyybKMNnKWIwmsLGQBatrYmP+uPGjx9xZIFFfT7vzdqUmidfd+pcVugNreO5sQcGBQT
 v58vwdulqeS0QKkpCFZ/JEPdXSqd6Sf6Mo+YdnCeoUqoW3dHeNNgENUDCGTjSf8hMlN3lzetY9Z
 BwAlFISKFUB/89PhG2TpK8E5JZNBKyd4Kie+WRlHqIFo81Fy9vIYxzHrkLswYskBkHMLbXpSZfz
 I50IOdOgQ21TOPDsZgC0Ayd9mLbyuhPDxZUg1rthjM457iQOZM3l5PJ2BaPo9pX8XxZRw121Kcj
 W5QZMJd1pDANj3t4=
X-Google-Smtp-Source: AGHT+IHANpWBFVoPOeAIAcpDS4jarCEPkTWfUmGGzWeBAFOXAauai9xS9ywIp7GhCljykThPFl6/tA==
X-Received: by 2002:a05:6000:2384:b0:3d1:e1b1:9645 with SMTP id
 ffacd0b85a97d-3e765a48952mr18039495f8f.43.1758054464049; 
 Tue, 16 Sep 2025 13:27:44 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:32 +0200
Message-ID: <20250916202735.1121872-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054464; x=1758659264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kLADQrcTj50gGltuHRM9CBLo7VSrbPjNsPGZLkgbTjA=;
 b=DWhLn8JUkHnuOI+ZP1F3rI8nuZ/6wlH6r/vu1z8uSPgvvr8BbLDP85uxSaDcCDhtlA
 POqHigzc+1PFviJ3zKYsFTgxCaPgrNBWs04XUD0bWg4ou78HCUKb4U1n3LSdl/oZsOVl
 KbdP2y0vseme16xZQxSZ96AQOdDpWHFF5oukI2XDkfn5bRWVWcLHCMgoUOUx/R5wF4N5
 p493x9mDvnBPW2NxWF9aZIPUgax6KjTHemFSz7/4ZpoqSTsku7qYbgG6Z20dp27p8VIk
 Hb7BWcKSEgD4fHlLs1SA87BTlaNproyPsETPbJpX+W+P1K2bYbfJ/UI4rfdlPj7wyqvV
 Yl5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DWhLn8JU
Subject: [Buildroot] [PATCH 09/12] package/modsecurity2: fix deprecated CPE
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
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'trustwave:modsecurity' has been deprecated in favour of
'owasp:modsecurity'.

See the following:
  - https://nvd.nist.gov/products/cpe/detail/B305D665-44EC-44A6-8C46-C68BFDAD7C38
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48866

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/modsecurity2/modsecurity2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index b644fe7407..402ba6317b 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -9,7 +9,7 @@ MODSECURITY2_SOURCE = modsecurity-v$(MODSECURITY2_VERSION).tar.gz
 MODSECURITY2_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
 MODSECURITY2_LICENSE = Apache-2.0
 MODSECURITY2_LICENSE_FILES = LICENSE
-MODSECURITY2_CPE_ID_VENDOR = trustwave
+MODSECURITY2_CPE_ID_VENDOR = owasp
 MODSECURITY2_CPE_ID_PRODUCT = modsecurity
 MODSECURITY2_INSTALL_STAGING = YES
 MODSECURITY2_DEPENDENCIES = host-pkgconf apache libxml2 pcre2
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
