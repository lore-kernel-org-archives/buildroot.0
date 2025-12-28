Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF9AE9272A
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 469378131B;
	Sun, 28 Dec 2025 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFX4xRQLXIo3; Sun, 28 Dec 2025 18:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 630BD8131D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948211;
	bh=HiI97zp8HhleqzDViaeqrv0JN9GjU18q3NtSq8b1w2A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A+LdRGXIToCGITylsPBOtK6wqgjGFYBp+ZI7u9Afq/TOCgKqKfzLxmtqa3pK0dmIy
	 DCcMx7OAKLPCyDX9l+ucNMHTFblAFDRyVZke6xOaPjM5m5U+gQJScZGPcK8UxH00td
	 V9iO6YGJI5UfoAAPcIL+xVm4Gnx6cSJutlAXCIEStOMqc1E9QzJVkDBmvRdNCvWtnc
	 e1ORdLDkmdezEcfbYFZ21MAGiHEItY0WQBaBsqsfdfZb7gBXkUJm21knXwm8CBbrQq
	 sTeMBfGv5U01+oRqr0JZuO7c09KdwirdRai7czvGVTrSF1BXomgBJiy/3jIWQoJrLN
	 nJCQUxwI0yUrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 630BD8131D;
	Sun, 28 Dec 2025 18:56:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E79B1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 346D6608EE
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWCU-33NR4O5 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D687160702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D687160702
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D687160702
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:44 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso34462475e9.2
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766948203; x=1767553003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C3Gpozkbb2WIRMOI2AKTcfJvuejZTd8rugpcn4TfNPY=;
 b=Fn5bGqlwEuE4XRl2gEdC68sGl7i6LlpsoQhY1H7FdKnyClykVRVzAgYdqLTZQvGRqT
 PvLtEnhMGCKITwn5Cl5jA6IPqb6BsxNILiBai4HiVg8qxkWgap8tCiakN/5hJcQEO/9x
 DyzDDyPJDAq1qxPLc5/97ArNdCADKwNXAj6vsXw4TdGM9wRkUEb/LykyVDmNwFmxBAPw
 NvEHoWorg2zUKChlXOrGYBsuE8b2GxTvJSlCpp5SddALW4BEjypoEeEwDKoObCkSrwSt
 78Ggt1UAgPMbbrJFqdM2w9y/cvpcofFPi7K4wh6Cf8YyU8CYAjSurdDg1IuYK+gk0lGE
 qJAQ==
X-Gm-Message-State: AOJu0Yx2LUK3W4wNyK4bKToK0LCZS1rNoCGsai099rAclDJ/auyF01Kj
 zPHFs2h9SmPSN6f/eZa+bUMMefMYMk5lHNssX3CnJIdZHlqhsZgZIUAN7mXNGS52RdhrOdhHAbA
 QtkFqxtw=
X-Gm-Gg: AY/fxX4vo++2vAVLg9ZjVnYWfTXNfqq+eus/weGXl3M08wmoJHBCNIocDpEElCVvZ4w
 vV2940pce7BqxvXv99OWLLZofY36DFH+gsz/0ySSEnY852y9AnZdVck5qt+oLwF/OhL8StiMHfX
 GB2aVuoeGhcrT1OzBWFWgrX+yXhezrnoixjl/yFuQBLen9845tQ/gfGl2QDZl1QBqpFnED1tvAb
 TIDMCTiLRS0Ywr1LV3L3pVlYetFeKyhac3ymFHowkJe4ldm/C/kJc8smPBMI+DYm1o0Fd97PAWw
 rqOZ540z0LuZ7Q92tafk4ob1J1XPmlWjUlFTHTbIo9Nge2QuCOUSZC50XZ3kgxjz2cal9Lsw3Nb
 0zSHzbGflk+z/51E2T82uyem12z8Oe06y6DQ9PtF/AWavlac65spwRrKITOqtatJUgRwedVuhHw
 2A2vYdZ7D+avl2pJaw6hxT4A/MVNl3gIvtsYX7RML7umbsIuroRJyK+RxmB9GC5BS+B9zeA55M
X-Google-Smtp-Source: AGHT+IHG0PK7Y86XSrN234+nYRsYgI2swAMTQUjx3n0rfsDjR4xI4g0FZbphGkEtM6BbiH/OqXdY2Q==
X-Received: by 2002:a05:600c:4fd3:b0:477:9cdb:e337 with SMTP id
 5b1f17b1804b1-47d19532e14mr275767705e9.7.1766948202604; 
 Sun, 28 Dec 2025 10:56:42 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm24426954f8f.6.2025.12.28.10.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:56:42 -0800 (PST)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Karoly Kasza <kaszak@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 19:56:31 +0100
Message-ID: <20251228185637.58072-6-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-1-thomas.perale@mind.be>
References: <20251228185637.58072-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766948203; x=1767553003; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C3Gpozkbb2WIRMOI2AKTcfJvuejZTd8rugpcn4TfNPY=;
 b=C5K0bhYYqnLFx/QHkB42HmdLB9USo/txSgRbMahpHAJ2kFq60jVT/FhUeZZAD75Y+G
 p+MOWRSMH8j/J9vtyLyKELzSHVDe1ncR/ym6DZp/aisGOLvdrR3mqEf0j/ddRCpr3HHH
 f38twab5MgSbLB4P7gfTg+M9E72dfQvBOaXfrh2VVQGGDQxN/LuDsTgL168/+mAa9nqf
 350lPA0oe0JBImkiguw83pbp48TXY2/WqmDpMfz9mMLvDpj9Ii44zkE6o7r/gsRuEBfh
 XJ8lhW9qB09ZteIVP+CW/sV/sY+9FqbjpC6mlB5exGaZ5/GR9O5t/31jYxzlIvb8kMBU
 T6tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=C5K0bhYY
Subject: [Buildroot] [PATCH 06/10] package/graphicsmagick: add CVE trailer
 in patch
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
 ...0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch | 1 +
 ...0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch b/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
index 275738a71a..56122e466e 100644
--- a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
+++ b/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
@@ -6,6 +6,7 @@
 # Parent  db3ff8d00c28c38895e1600a28706ce251dac570
 ReadJXLImage(): Apply image dimension resource limits. Addresses oss-fuzz Issue 69728
 
+CVE: CVE-2025-27795
 Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/9bbae7314e3c3b19b830591010ed90bb136b9c42
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 [Peter: drop ChangeLog/version changes]
diff --git a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch b/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
index d1cc795b4c..004594523c 100644
--- a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
+++ b/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
@@ -6,6 +6,7 @@
 # Parent  036a1376a2a6dc9504c5148249cbd8feaef72de6
 ReadJXLImage(): pixel_format.num_channels needs to be 2 for grayscale matte.
 
+CVE: CVE-2025-32460
 Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/8e56520435df50f618a03f2721a39a70a515f1cb
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 [Peter: drop ChangeLog/version changes]
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
