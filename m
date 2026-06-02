Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6495ECD6E4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 12:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1775F60D5E;
	Tue,  2 Jun 2026 12:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQWrBxzKTSuS; Tue,  2 Jun 2026 12:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF93E60C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780404052;
	bh=FrfxXI5r0LhNic1ilaqg4gWFbXvf18pSfDPMyuymlU0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y0Yj32xWej1+SPDyhvMBzozs5BrkgPABEmysczPxXtiCi7ozZtyOmFAqZwoNERjG0
	 aqKaewqW/ziH6SCgYQtaKB3euSIwV8CCBQyEjmdbCClbQHzRLYEEBtVLG6GtPeet5w
	 C7vldwyhqgjEScRS4pO9XtkqlCBDdrHBNCvh9GHkaiD+/yxAkLngVVmJZlnmz1vXGU
	 4TTCMUWd20bCAhUlOLJLHbmWY4diCgFLYmjwRawQ3PpRDGUZMyd9wp1PBzEpmd+Tio
	 Qy7z29VE7zpAMAPrSqq1y2xZdTmroijEkdgUITI8Hghy281k94xbWgcZTV4Lw67Mjg
	 pt/RwCXwbbqgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF93E60C29;
	Tue,  2 Jun 2026 12:40:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15A96F4
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF8FB40585
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnAttrqMa13o for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 12:40:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF3CC40577
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF3CC40577
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF3CC40577
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 12:40:49 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-45ef779c1c2so2534476f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 05:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780404048; x=1781008848;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j70vp/Ke3dlBJWxoPs4To6m13gJ76thquMM6KFIPo3Q=;
 b=kwBEYUhdvAMR4hPLwZzkTyzMJm8XWFMK+c816ZTmCpg2MWvWgIx014k3xKybSv5vOB
 GTvd20ueK89W8OkD60kISUMlNW6vWEtFmNKbbwIYRhZ5H4vqtAlGMn+0/cwnlEu9q5lb
 Cfs8Q2uzgKDcz0Vw/COD8ukhJJsa3npBspOZLg8cVwpEM5OCyWqHCDAGFeqUQTgojQ8F
 PqwoGYpKzIgYiCZ4giwjMX+widFskP75YZSi5hGudtbUAv9eUbhOmL2ns3JO25zAJstI
 p9pDgQ4AJDOLE0WmYaQcf6Y8Pv9gXdo44zIbekZQfGiroLtn65iSmcR2YyGx1VaCmxyf
 1IsA==
X-Gm-Message-State: AOJu0Yy/1gsG89kXNucvoYowJynJt3gJ7sP/CD/YXADOo91vSJvK4TjI
 eXDs9suHx3WJUbtHVprnzmHO8rOKiUOY8VmVgbJGEohSBDj0VkCyAmSf/BaaGbVIQAtEaqxq2it
 f0K0J
X-Gm-Gg: Acq92OEIDa87x9l1i2O/Yp1Bpf1ShtD0sggqXtdsICXM7t015XIUGBt6SOoZ+d47eHY
 ELNrxK8qnmKKzs61KWHXRinOB7pEB2C0g+ReP4VXA3Jy5LvNPTqiHY9hK6kp5qcEGSEHUjvir1Q
 i08qtIS5UHwcDDK9O1MVOTbceqGOQwAM6RFPoL9+pCApBQ0a1/W6uKA4DycPqfuWaVOIWJuuYh3
 3sP24aQ86dbF+4Knbyt2U+4tKPh6bVNl+RI5QykGmHMlgKY2xrg1FxZzSh9Z/kDjmwk5Zt8XhOj
 Jc9HXglZwJfVwayE7yqQYLLxcWRbRBFP4ustHu0fay20PsBGGeJ18J+Si1OSOBOAlldrrEGTkW8
 MTR6e8eES7djcGk8tD5maV1tddrtfmtMnlRS97wB3DAZUx5nyEkHAo07oCIp/rn0CuRvP/76R38
 5qQh8OyO2SG4CmB8ULZg2xSF839hFHgChK3MZsrI36juwwBN+rLd74hhQzRQ==
X-Received: by 2002:a05:6000:4b08:b0:45e:fa17:a1d5 with SMTP id
 ffacd0b85a97d-45efa17a416mr27431524f8f.33.1780404047820; 
 Tue, 02 Jun 2026 05:40:47 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a037fsm34066780f8f.4.2026.06.02.05.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 05:40:47 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Jun 2026 14:40:47 +0200
Message-ID: <20260602124047.287780-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780404048; x=1781008848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j70vp/Ke3dlBJWxoPs4To6m13gJ76thquMM6KFIPo3Q=;
 b=AFERp2WsSShk8WZyKPNfButEY3ROYGRxuQ4g/VGXpP3gCdYdOIuy4BmYY/X3IeJl7e
 qieuk0A6qXteEpvPzS5o4vX9SdEKXxpgBdLNWbQiZfQgISIIeWgHXjmQ/Dp+lsoVr1ZS
 eAr6HujFskvrI+QUg8/CAAlQcKwi9mlluVSJtUG1ZNUyOVzu/XXwu/WHrf6tWEW94g9L
 krNW4hPtQoAAoDwZNdmMiOc0LG1j32OnTvFaCWgD3Sm/QQ9D9WiBhvVKKx9pifmKle5+
 ejmD1v5leQVBYrCY05zby9C+Z4YRZdqfCifiCUHYCAZZe6q/AgwTIlTdFMNmhwXuH1eN
 PRjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AFERp2Ws
Subject: [Buildroot] [PATCH] package/sane-backends: update CPE
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

The CPE 'sane-backends_project:sane-backends' only has a single CVE
assigned in 2017 while 'sane-project:sane_backends' has 9 since 2017
[1].

See the package CVE history at [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-46047
[2] https://security-tracker.debian.org/tracker/source-package/sane-backends

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sane-backends/sane-backends.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index fe89e7747d..de1375550c 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -10,7 +10,8 @@ SANE_BACKENDS_SITE = \
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 SANE_BACKENDS_LICENSE = GPL-2.0+
 SANE_BACKENDS_LICENSE_FILES = COPYING
-SANE_BACKENDS_CPE_ID_VALID = YES
+SANE_BACKENDS_CPE_ID_VENDOR = sane-project
+SANE_BACKENDS_CPE_ID_PRODUCT = sane_backends
 SANE_BACKENDS_INSTALL_STAGING = YES
 
 SANE_BACKENDS_CONF_OPTS = \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
