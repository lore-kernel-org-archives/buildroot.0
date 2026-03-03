Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694ABE67A8D
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 08:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2100C83F52;
	Tue,  3 Mar 2026 08:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hm9brjiURG-j; Tue,  3 Mar 2026 08:13:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 424B583FA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772525611;
	bh=zEUJj0skyhqPhnD6joiQEroZRo9/hgkH7TrDjSuaHYY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tHvylTa7Otxz0Kl5Jlf4W3h1fXpLfJTg+VKe73IlCS9hmur1A7QuljyVRxcUMne83
	 cAQCpsu/c65E+ZTyiBa8pP0jWTck15PAnSZDhuB64CU5yumc7h2PSKL2CWWFDAPJ+0
	 SsUyXxe9NYMvKdQkBUKFw800+qTcD6bDoG1C2buRVvwa3nmPJji23obxMdzyfObiZb
	 2DSrGS0Nuk44ODSN9z8BVNe2FukaHce6dGlfgfK73URnXT9EatmYcORobV2PGWI9tR
	 6YUSk+UNIxSP/g+TjKP/LnAP7dVrvket1r8Zdtm6SwqgwZ/kQyl2HBOQKfj1ZpLrNf
	 OuBjSBfl2Zhtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 424B583FA5;
	Tue,  3 Mar 2026 08:13:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 135F725B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04C8A83FAC
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ETJNK-tDztsp for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 08:13:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7204683F52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7204683F52
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7204683F52
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:13:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4833115090dso55140695e9.3
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 00:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772525605; x=1773130405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=A14gPM/SqFy/5UJGjWINIVcvTe2x/8ZRmL33PTQvRek=;
 b=ogcFIYIYfqb6rJjbI+F6Owa+BS+wKD2TLBXtmz8ije3kzwrqEfzCv/r/2lAfF7FFeO
 JxPIXM6vBbCgGps9CkcQ8l8p67kEb6c2qNSQliFViYzJKsmh2Jy8B8fqsEyzd96mt37c
 q448/TKGWo+HztZopXCYrs+p9CBbA0d0g7JDRg/IPl34Tm66VDGr13a6V2AHATcNRa5Q
 eTMO6DgVOLEClVdreaxQA/sn4sCZIDT/WTeZynVHIFsFq553fLnq4n3Ueg1CAt1Up7ce
 67EMZk1xscQPOMzgeLAQ/cUDy5FHopQ/4GmtiV3ehG5aWT9WUmFsd5ewhE0qOTi3mtJt
 0pAQ==
X-Gm-Message-State: AOJu0Yyk8FMb3iPO0lNUsjJgkU/Hm+Nc5m5+3J1ARGiGZTn+edOrgiG6
 buZCSiusagf1UL8iN95CgCjFeK7RbK1N6lQEurGu4hyRHDiXt3SS5lt4VjzW+T5UfcZFeNAw1cH
 Nqwy2
X-Gm-Gg: ATEYQzwYrmfsexKpDebSrjoEK4180o0TnOLBkSoYLj1yTUmWHiF2T3kDD9wZs5ya2dv
 7oZXi4sTdUhLNPqF/bD7sutLQDssz0Kt4Lbo2Q3EKa+NrfaUtxhllnQ5Xsbvc2w4Neya5vpVcha
 FWx0zX3ptltWXfUbX+BCLeg/BHsFjULhat8tSB+N1yc7gAuzP1JbAcoPkM27x6OB/fyuDknTPag
 Prt7r7a385qE8R9HXLWOuU1uOp/6D69F2hLjxG2y9nXqbrJuAeL4s17FvNyYm06/DE2mqqHD9IL
 eu2ESluWPLXQxXjv+5rdnPthw2pkMhiL7JwfRYlI2ees12Mq6rRlv8FVK86cRWZQ3TVm+X2jMZ4
 DMf6I8dwNpYfGVJWfhwywRFe0Nly0aIo8H9zZjMml76lRixSF7oU4JRPA+5Xw37Nxo3+Jf34k4l
 AFZwTqfMu1HsP7PXY=
X-Received: by 2002:a05:600c:3108:b0:483:887:59b0 with SMTP id
 5b1f17b1804b1-483c9c1cd2bmr287479525e9.35.1772525604973; 
 Tue, 03 Mar 2026 00:13:24 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d8870sm9242235e9.32.2026.03.03.00.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:13:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue,  3 Mar 2026 09:13:21 +0100
Message-ID: <20260303081323.53405-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303081323.53405-1-thomas.perale@mind.be>
References: <20260303081323.53405-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772525605; x=1773130405; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A14gPM/SqFy/5UJGjWINIVcvTe2x/8ZRmL33PTQvRek=;
 b=Epdu7+h6cWEMqX53fLfPohj9t1s2V2Cx07fa3L8xqqnCwJjjqXBcNZCw2MhEKntRrX
 VM8T+L8ya+hU9sE5RLR2+azbN65J/zQZjN67IvZx1Q+Tc4MQ4S+336L5T8+2jC3BG4Dw
 4KflGIZ64ngaO87bs2KKvJb2UX3WyDO2axvRfvx8WxjelmEDrPfsiZAA/u/uqdV5IZUE
 FgtYwkBRcvj6nz7UzY2bqB0BTS3L/wPTKuytACuK/kR9BEhtfmx9bMyl/Kjyclp9bw0J
 E6MJ7quPuh818IpYD0ZOxiQBpyNXxaYzHJp2jOV1Y4+4HZEw/2tCQg+qlHYRr/gKsMbz
 FqXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Epdu7+h6
Subject: [Buildroot] [PATCH 2/4] package/graphicsmagick: add CVE-2007-0770
 to IGNORE_CVES
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

This vulnerability match on every version of graphicsmagick [1].
It was issued because of an incomplete patch for CVE-2006-5456 and has
been since remediated [2].

Since it's really old it's unlikely it will be updated and is thus added
to IGNORE_CVES.

[1] https://nvd.nist.gov//vuln/detail/CVE-2007-0770
[2] https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/graphicsmagick/graphicsmagick.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 40107b3aae..6c2885b7d8 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -15,6 +15,11 @@ GRAPHICSMAGICK_CPE_ID_VENDOR = graphicsmagick
 # Fixed in version 1.2.3
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2008-6621
 
+# Wrong NVD annotations englobbing all versions
+# Wrong patch for CVE-2006-5456 later updated
+# https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5
+GRAPHICSMAGICK_IGNORE_CVES += CVE-2007-0770
+
 # 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
