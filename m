Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5884ACD6E51
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A2EF6142D;
	Fri, 29 May 2026 15:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebNUFDOe9m-8; Fri, 29 May 2026 15:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B713760EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780067201;
	bh=SX9vXhdSTALESXc9vJuaLyIXilSI0S+q41ABLS+l6DE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f8lOHuaiHNNGMI98jPeZeacf2xCYRc5BFMlOcED+ue47hYqcwMp8xjlkmthCIoMEr
	 +7dPWZhOi8xViNQMM8ijaRang8XTnqU1rURryPuEbP9peJieWhJ2ovK2WP/qNjEZwm
	 DO07lyJo/B08SuEzwGYp2cfg0wBFAEeCwZeMKzzAsA83N1Yw8j3yIv+Zo9fv0A7oFl
	 iTDKN2YThXF6T0wYSgizhlbtoPjyFy99DSWMmSVlEmF2egqGYi3MtM1kkW9c9fH6nx
	 LTRYiD4xEyL6FZcmV57bzS/kYXrhR0UmqiFDRI7NKr8ozrwdJcWIKe2QVkYWET3bFu
	 5g/UDW7tazrAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B713760EBA;
	Fri, 29 May 2026 15:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 819F3D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 696F7822D4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1t-R02xrk8i for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:06:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 916F0822F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 916F0822F3
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 916F0822F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:06:36 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-44c350a5b87so8262548f8f.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780067194; x=1780671994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hoKUyzWfM6402r6SzQXLUofDGPadVaaXL6JrN2vhwk8=;
 b=SK4saThjhYC3cpSQ/CDUlrsiwKwY7hMNa+IZtGfIIeKTQouFXcQ13RuOV1Gd4IgVS+
 oOVuz5I0Alm4qpTufvJJiWZNULd6AdBsZcyHQ08TxtMRlLRUiCW4u63KygcJlsyqn5Ky
 NxOBWWKa6ynJKHH7LSacXmD4osS5dBAlldA8GiuSrAEuSbx5lEwfLMw9hV5tjpSWYW1C
 nBG1s+Nv6aiitdc1vwQT+Yn3hFIABzcgneepTw2X3yS6yc3obicboeIF4ji7oOhX3ag+
 0UUg7PNL60Y6m16moYlO4xh7zdajsh2rbWVAkb/hB6kXp4riABR6pFrc9zlPhza2BOyH
 FDww==
X-Gm-Message-State: AOJu0Yy1hJzRzsMNcJJhSprgURF7uKDk9lUlpaPDlEOVJtnvoBP6sETk
 V7vAMm6irmUHGcESPQ3osXIp26+zlb4xhrWHWqCj9he6HZQYb+YrG7y/xj5fQhPyqZpGYbQig/u
 3vBj1
X-Gm-Gg: Acq92OHqNNpoppN8pNLM6em9zjzp2TmTTeEAZ2fEdEcMejH+03IpK/xaCUD0MtpkA6f
 RvLc6SeD4bUYonvHw1u8RxCBmo3aT7Olk2JCQvrEQ/MG1qw/9JjZacWLJSoLZdgoGBv38CNp2pg
 I5x+C0JOZf4PDquVjYHt/LsztVG+qadfO39B0AKO4x5W6s76W4RmneqAsfROlwpQwLaY0Qxyuom
 47hBIFcFHTWobiSr2BscGW2nlUrF5JRCJnhjh2EgeuTUJRHgK0R2GhlzvNVUZERBuAxzqXJ1H42
 /ME55UXOB0YXQAQt8tTARo7aBIjZiP9n3qNnSrSiRSEa7tzZSPSxVbCHOw1Eq8T9djUnn7ItjE8
 1EcZnHo8jhTPCM+VdZ/qI2eUixQVN75Gz0iHWpHA4Cdo9waYaswdGVYyROZNI/f1wGeJ5LmaGIp
 EvIUEOn0eXWzeKhBtVRrG0dGEIHPSEQy23NEwjdxlTNH39iONJOMQSgsMBcA==
X-Received: by 2002:a05:600c:4755:b0:490:4e3e:b483 with SMTP id
 5b1f17b1804b1-490a29335camr296515e9.22.1780067194280; 
 Fri, 29 May 2026 08:06:34 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3559645sm4091190f8f.26.2026.05.29.08.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:06:33 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2026 17:06:31 +0200
Message-ID: <20260529150631.447940-5-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529150631.447940-1-thomas.perale@mind.be>
References: <20260529150631.447940-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780067194; x=1780671994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hoKUyzWfM6402r6SzQXLUofDGPadVaaXL6JrN2vhwk8=;
 b=I8WkoAKmpILjkMwTHaYZSDaLtNtaL6LXEZeiLquoaWIH0TvwGDhw2fxlUUQodderSM
 bFNLCUrQ6HZqz5LzhzLEM0inivas/ovCA2cf/bDzdLO77HwRdeB3baczDw9IJ02xMfm1
 21kNokyyAdx9COdEMjNhD9UpWmttX5urQBvvHdrBeJ+bCGNvbuGojQ2cjLNySOJiy3LQ
 XT4Bm8EzZOy4v6N+nt4/bQUEsqhLoBwtifBUT85J5Gq4CnPEExyQo+gBBMqUTZVpB4FL
 qlZg+pP+mvsLqrMF+cH9mZ/X26J23pDv+Wtfvdcu6SEsDmvEsc+zjXK6y7vxAuCBFzJ8
 SQBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I8WkoAKm
Subject: [Buildroot] [PATCH v2 5/5] package/pkg-generic.mk: replicate
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
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
