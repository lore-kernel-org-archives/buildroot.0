Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8580DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:31:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 512D660F22
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 512D660F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2002540264;
	Sat, 13 Nov 2021 13:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qjIkcHZ6zJBZ; Sat, 13 Nov 2021 13:31:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4696E40245;
	Sat, 13 Nov 2021 13:31:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2DA21BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE62A40219
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id keJQeakFDi6i for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F101C40017
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u18so20645544wrg.5
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yaLpGg+51ueKLsTBiqRx6sXd9zY0vWeWuMLXu4vJAQs=;
 b=HeufsgXr4TNvFeqSZ0h9mUjCIg4qu9KegzWOusbD4C8K/eOUcz2987cgz7zOHfvpmv
 bylu347Ob7OFQoEHFwE7S7hXwGlKgz0kZqeXBXNE0XLnX6uCWPHA7TBrdpypYxlBSQC2
 E11Drj/YKQBNxw+/9n0V0IzYe4KZwRH3nDfzg6Srs9/R+7xs0TP/NqxxKA4QCZcdm7G0
 XXEvpASRtTJvbvBrXavHSy1SlWJ4VCuAdH291QV/GBZB7eB2eB0C+5RUFLwLPE0X+jEr
 BTaCy0nZs8YPabhLMJussO/bIEtlTwIO86ViuiLenw9xF6t59LpzrykUDk8oAIvyAWwP
 2ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yaLpGg+51ueKLsTBiqRx6sXd9zY0vWeWuMLXu4vJAQs=;
 b=qJbG3EQhHwzzNZz30L8SaKVouvgcX6rW7i7BN0wMYWY8g+g6keJjNNGvoTFsWAL3La
 EgmegS1cIJMmuWYe/LNmlW3sWpbIusGmjLGjBS5hjmkj8CFhqy5FfLBEteBr4ELCY7tR
 0tJUnt5Url1FPrOSfvAxcUfpzJFi1+5cXm+bJyMLHRf66vnS7br+FhSCdCLxYcX6WeaS
 D9iQ227TvxPhOXNPphvmbmY1s4yNSueXxYva3mSlPKREvE/zgs33sbrDo3TyYkCHT+Ja
 k5ByuzWJ7uXGscJXNnyo6WuqJiM1Ze31A3Kny27UQqAAWLmxk5SoNm308ydOVQ5K5IQZ
 b7BA==
X-Gm-Message-State: AOAM530pg3YNBEmZWbv/GjutsRA1VH/qPt5/2dR4rqhQREsevQi+ue/T
 7MhwGyi/EWkMjztU2cmmXGELqNDh++pHqQ==
X-Google-Smtp-Source: ABdhPJxsFXzslRQtTfAlJwuQ1Tp21ag0dKZvcaY4OQ7WKLit2pqZLiIDAahbYUstEfa5q0ojl9sS0g==
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr28632530wrg.45.1636810117307; 
 Sat, 13 Nov 2021 05:28:37 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:37 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:24 +0100
Message-Id: <04d568a84678569e4aed9a17d0609009271e146f.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 13/16 v2] core/show-info: report whether a
 package is overriden
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Vadim Kochan <vadim4j@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eeppeliteloop@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The show-info output can be used in quite some ways, like to assess the
validity of the current configuration, like a production build in a CI
would do for example. One such assessment would be to ensure that no
package is overriden.

Additionally, when we will (later!) want to check whether we can re-use
cached artefacts of a package, we will not want to do so for packages
that are overridden (nor would we want to actually cache such a result
either).

We do not expose the override location, because this is a purely-local
information, and show info should never contain such local information
(the output of show-info can be shared). Besides, that information is
already known by the user, as they passed it to Buildroot via local.mk
to begin with.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: eeppeliteloop@gmail.com
---
 package/pkg-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0b0ff77419..da123a6ed2 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -113,6 +113,7 @@ define _json-info-pkg
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
+	"overriden": $(if $($(1)_OVERRIDE_SRCDIR),true,false),
 	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),
 	$(if $(filter target,$($(1)_TYPE)), \
 		"install_target": $(call yesno-to-bool,$($(1)_INSTALL_TARGET))$(comma) \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
