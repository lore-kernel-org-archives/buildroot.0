Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C886CCCF9EA
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 21:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AE96844CF;
	Mon, 27 Oct 2025 21:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZma5Z0uHPaF; Mon, 27 Oct 2025 21:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91FC4844C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91FC4844C9;
	Mon, 27 Oct 2025 21:07:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EAD370B
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E932E844C4
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hobukrqCFO6w for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 21:07:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB13C844C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB13C844C2
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB13C844C2
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:07:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4711810948aso37821205e9.2
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 14:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761599232; x=1762204032;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1wrPt0LuLFqcQzE1Ge2pZqBvqxIoe+r+6kxd4KGqd6k=;
 b=l91J+TA8YzEDmEiYCkPXI+78JTKy9e/yfpcmIZ6xAwzZkL3q0Rhn6yNoDgnuZzD/+v
 0UN9GGyBj+cdcrG95MALaOYyynKCa4X7OaKJSjZGigNn1oCArXpnaNS1C1f4UWHe4iN6
 Kx1EAUbdA+M1zRkkACXPfuB8knPLYRv9AI9Cx2PE7L5FL0TaabE0kEbmHrKVGW3/XrSp
 xOP3oZqny8KYxgKGveYEW2ts+ZLajWGDFjORKckhyA9k3h7FQ3uvtKmwU9+onJei+qd3
 g5OlNv88LKBeMyP4x13C18tDqIC4vttRELR7VSwv0Az4vMhPDMwHToPJF6/19tq03RWw
 7qfA==
X-Gm-Message-State: AOJu0Yw7tfTOW45yMJQ4vOfFTXqUFzoEb0M92YvXOHg1+nxac10GFt7k
 4s6Bl1egRpQveqWgIi/aDdYu50n4vHxnjHN3wlRSGZYTtKbMYx/fJ9W53r0lhd/2DqL0+eWNFr9
 gwEZo
X-Gm-Gg: ASbGncvE0DdZdvjAagBekBFrtWQK9a7V8P0VQZR1meqObsotrHDR2elWkylLRs3MZNP
 Dvb/5Le60n6X2YXuHZ2pgrRIMqBKDatA6REFfwQ9w4QsZh9wbUxzyNdeLAlZvOheJr2dYdV38ww
 6DQMkjrAOHq/t+0+mh3xnooUCs6E/HR9amQcvrmV+Yx0qU2kB44ibi91WVZPWGg+VcUJgSKFsUF
 xRcyw+HhJZjsGaCqxbznitQxcE+HtkqvJDxzHDr8MqVi3pvWxUnibI3KcZQ52q8rlsZvGnCyzEV
 iy9D4j8bvq9/StLD67mG7ac+QyqwJh81VKqqRTzowobYp/NmlJJnm9pbnMFnfE/QX1rfvFUutG2
 sGdwiUgP2Y757h2OJRMGRWP6aDiF57Ah5ezVK/1PQeeoSuF14iQNJetRnB/aHknxz6FBua/DyTb
 rHk+ANjQENh+zBAHljbu/VKyQRy6fY+A13hTZi
X-Google-Smtp-Source: AGHT+IFaQ/gHN2PdnmDE2OcSUGU9IUsKL170PHMtMMfT/vGJzBW+A5G/sN8F0yDLoagAYQsPGrxtbA==
X-Received: by 2002:a05:600c:5295:b0:477:1622:7f78 with SMTP id
 5b1f17b1804b1-47717e67bfamr9213065e9.40.1761599232072; 
 Mon, 27 Oct 2025 14:07:12 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4cc5efsm158261695e9.16.2025.10.27.14.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 14:07:11 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 27 Oct 2025 22:07:10 +0100
Message-ID: <20251027210710.15290-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761599232; x=1762204032; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1wrPt0LuLFqcQzE1Ge2pZqBvqxIoe+r+6kxd4KGqd6k=;
 b=Awmhf+ZY8EFksjWEQADQb5X3HzBpYNDgbh3h0u8YNrciCD/VKkejvxWuWlpQRMSZ4W
 T7BmQ7p2lST0WkOhydTIBeO3AYiZtqVX3Or/vnPkIMtYbixqlh3FrOSRThAurua323BZ
 sm+LgBcN01LwXf7r8KsSBBbCrSxwYkBJVQ+V4S1UPvlGV2Q/Ru+KHOhfuK1p+sEcTFij
 4bPX7STfEjJSfrxN1l8jZ47sNHysrTI5hj7zw5I1JSVX4ogH+omHNNFFMXwV23pBLje1
 lwbEstq/SetNkx2it4P5xW86jUEO4Q9j/5Nng48No1ErQmhDD07g18VIyVkO5dzozOKY
 Flwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Awmhf+ZY
Subject: [Buildroot] [PATCH] package/mbedtls: security bump to v3.6.5
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

For more details on the version bump, see:
 - https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5

Fixes the following vulnerabilities:

- CVE-2025-54764

    Mbed TLS before 3.6.5 allows a local timing attack against certain
    RSA operations, and direct calls to mbedtls_mpi_mod_inv or
    mbedtls_mpi_gcd.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-54764
  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-10-ssbleed-mstep/

- CVE-2025-59438

    Mbed TLS through 3.6.4 has an Observable Timing Discrepancy.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-59438
  - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2025-10-invalid-padding-error/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 8b82313c07..b86c66af3e 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.4:
-sha256  ec35b18a6c593cf98c3e30db8b98ff93e8940a8c4e690e66b41dfc011d678110  mbedtls-3.6.4.tar.bz2
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5:
+sha256  4a11f1777bb95bf4ad96721cac945a26e04bf19f57d905f241fe77ebeddf46d8  mbedtls-3.6.5.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index b46bbe888a..c1aa9f0850 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 3.6.4
+MBEDTLS_VERSION = 3.6.5
 MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
