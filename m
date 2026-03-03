Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38D4EDEBFC
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 22:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEBE0813AD;
	Tue,  3 Mar 2026 22:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPmlOm6-Xbeb; Tue,  3 Mar 2026 22:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7B08813DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772576646;
	bh=vTN/deQtpvIQtL2zJ5pBTyp2ktivTxTg1/bXN++dfaI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YsiZAKTOypoezpTuGrUBwKIUSI4QVVr6UBCXd483qTlcUOArsWCFIoVE2BpYM7Mlj
	 mw8eYmW3ESKv5U3azRmWZspDb2jtkBhjLKabyxCUp6Pza5jVmsT/7dAd5f2Q/r2Sim
	 AP0kJgwxSkJBxYRSjXlAo8oj0Oz+FRvA9rqI96G2icPBtNGQ7pKqjZXi7eFxLeW45T
	 DGF+yuTPl7wBWUhmEfjD22F88uMew23IIN4VCuMPVtWsh3FT8yZB3vOBGwmcacL3kd
	 xKX5+TeKXuWdjr26yMzHCTZUOZDrEmOl42qI31rOgJV7rOBJ7niRits1PaiaNNovyM
	 Fb+974bg+Yg7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7B08813DB;
	Tue,  3 Mar 2026 22:24:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 668A325B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 588D840711
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGTYfWT4P-I7 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 22:24:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A04540715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A04540715
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A04540715
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 22:24:01 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so58250725e9.1
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 14:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576640; x=1773181440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3oxKGHYxRBIkhZ8elp792HgRmJUeJp+dmAj8lrrpSTo=;
 b=bVgxFJVCXRAvlk47Ymx+85dhReX0Xp0wUhT0aBgTjA5mstbFcr8zXVKcOmnrx8bHyT
 EprjAXfYhqoigalpjmojJb4JmEX3viibdT8PjJLRJNE+astls6UeyyCgw5jiSser9dyF
 aaCy1DVtQDIp3pDcj0nrpcGfhQe6sH2O9M6XKtBbwA7f+yByWT0YA0baCRDsAXZiv3TO
 w28ZmY4jP2Enc6u0/rqYzijOUPyBFEAxMmhMx2fSLxZxRVjiJSHxqbvSLgcCCwO/kHDe
 V6tDDn3GXd5pKeZsjkiBLbjegENw5D79QcQ+tC5Rdi+TB+1xGAdF2zwuDGnnbJKOe8wT
 n0zw==
X-Gm-Message-State: AOJu0Yw7Azvmh/p8fR38oCcJjkC0OdGS5IOcAwjljlFE3ZCIAz3lR/hg
 f4U7XnRMSnW0I6HN3oh0kSbC3mdCX+LZiTBJmVOQbSgRo/AtWdj9KOyIMBwxKvaAIX/YK54zFHw
 MoRC8
X-Gm-Gg: ATEYQzykuGfWKuZ8ws0s0O5RS2ByLaTiYqY+nDRO850PDyAzGfWtR1t1SE+LCNyHRci
 UhrdApuIxLXqnxbQh6N29A8S68fcNSvdbhJzKCePxq6vkWmIZCYRSwvkkyc5wzb9T4zomdY6b8g
 2qbuhhCGR2q2i95FzP4T+XL6t+2B9Lzr4iHZ7wYGuKMt4nRPFeNi18IMQGZRlg0GVW8zd1Q4byT
 E0AE1J9rcc8PkmDp8MrCKticE6Af+yi24RchW9/uhxUWSgQ7x2h3wbhMAGiB6fjzlP+aGFqAmXn
 LjvcnHLOGhOMsjH4XNf/0FTIgUMHNSH1kuKQirPkS3xLde95UgZOqNqHtYqiJi7JpnQ99Gy/xKj
 UkoKTdX7g9pIh7fd11B6b1mtkiz5/n8/leLPLLMQuKv24OVe+ilsvw3h4BvB2SIKcD8FgjbRQ2R
 1yN+5H/w4kElONI90=
X-Received: by 2002:a05:600c:350e:b0:477:9890:9ab8 with SMTP id
 5b1f17b1804b1-48513a56218mr58482455e9.3.1772576639960; 
 Tue, 03 Mar 2026 14:23:59 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187b6ffbsm7992775e9.2.2026.03.03.14.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:23:59 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  3 Mar 2026 23:23:52 +0100
Message-ID: <20260303222352.95612-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303222352.95612-1-thomas.perale@mind.be>
References: <20260303222352.95612-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772576640; x=1773181440; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3oxKGHYxRBIkhZ8elp792HgRmJUeJp+dmAj8lrrpSTo=;
 b=LXT4gWqJFC5U2Uq0XDM486DnSAqf2+kDxwF8DJGItdkcIhydBOV5vD6ylIfnI/neLQ
 llWviDRjpOId3wpKf6ybZKqa0XO8RF9rwYCcfnadxIkow25XrDzrZA+Aztwx8ebRjfXN
 B/va6VIobwRs6uNru+KIgF8QZj2XseHl9VNWMHha0tNUGvF2Vuz4AGu6mdWc53Ow5syV
 97bxsOorKTCg/PyyOCH/48vaypaxf8py2HAaZRdFP1t/Oy0etsBoNbuBviN/ElNpgKYn
 avUWshY4bsyVQPg1BRZhmFUrSxtLBoHUPFaNOPJExEdyX5IxBI8XrPwB6fldhD2dyoq4
 F1Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LXT4gWqJ
Subject: [Buildroot] [PATCH 4/4] package/pkg-generic.mk: replicate
 IGNORE_CVES to host packages
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

For host packages, this commit adds the same `ignore_cves` list as their
target counterpart and make it available from the `show-info` output.

When generating a CycloneDX SBOM with `make show-info-all |
utils/generate-cyclonedx` and running an analysis over it with
`support/script/cve-check`, multiple vulnerabilities
entries would be created with different analysis for packages that have
both a host and target variant that include IGNORE_CVES entries.

This is the case for the grub2 package that include ignored
vulnerabilities that patch both the target and host package but aren't
declared as ignored for the host package. This resulted in
vulnerabilities marked as 'exploitable' for the host variant while it
is patched.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-generic.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd440e4062..e5e0d49a16 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -745,6 +745,13 @@ ifeq ($$($(2)_CPE_ID_VALID),YES)
  $(2)_CPE_ID = $$($(2)_CPE_ID_PREFIX):$$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_PRODUCT):$$($(2)_CPE_ID_VERSION):$$($(2)_CPE_ID_UPDATE):*:*:*:*:*:*
 endif # ifeq ($$($(2)_CPE_ID_VALID),YES)
 
+# replicate the target '_IGNORE_CVES' to the host variant
+ifndef $(2)_IGNORE_CVES
+ ifdef $(3)_IGNORE_CVES
+  $(2)_IGNORE_CVES = $$($(3)_IGNORE_CVES)
+ endif
+endif
+
 # When a target package is a toolchain dependency set this variable to
 # 'NO' so the 'toolchain' dependency is not added to prevent a circular
 # dependency.
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
