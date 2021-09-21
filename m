Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84932C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:24:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C08C61178
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C08C61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0139A608B6;
	Tue, 21 Sep 2021 20:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zlmGBUNW0090; Tue, 21 Sep 2021 20:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 578BE606D5;
	Tue, 21 Sep 2021 20:24:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 008711BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC3BB400CF
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:23:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRQRLDeROT-b for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:23:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8208F40172
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:23:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w17so249532wrv.10
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d97mqY0pz8BhmZx3hHqTTlZjx0TkWUmoYC70EcbrnW0=;
 b=NGhygCrQO7XRFZ4vuyeGXji6IYqC+qqNzMD9yxvEWihmjacVWpDGZoX04piQxN9G90
 YxK7lrrRd64GsQD/FnrEE8N3iVij7nYLxDmjkee0hG9N/NPoa1eiV9TEKYllaZPwLrUI
 83f6A1WKNm0+l3W5azH+pAcg2uS+TqkIUtWlkEUA+cF4zaS0Udc2wwoVeYrV5COytUmy
 +/q6kqB5VMrf/ONqyDDSAor9pI0CQMzE7c3J1nQThS90FNUtaprTrqF2Dvr6o3UCHpvS
 AZZA4IkCYkvrU89Rci7lK0U7UymUtaIqDm662zwwQECdhcdqKavjlr9pVPejvUI2cI+Y
 lRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d97mqY0pz8BhmZx3hHqTTlZjx0TkWUmoYC70EcbrnW0=;
 b=BUXFRas4BgzuSkW8WCJH+uqoT0mtKyExRkKFR2sujeVRSu3F/MfX9aGp9UJrAbtOgz
 ReenStbUr0m8vMaKNH5K20uPpMP8vFaP3tEacAhxgcGptTHR8egb1iSfXLi+373rdWaB
 tN66ub5K626a8aqzCyMtAsaIgBgFj3G8y9H1BYRWmRLa9BdChCr+BLHo5aswO/tooaGd
 uX+BHoNHHvD5wxIN9iWICR26DOn13UBirDtSqsbdVerC/tP74PslX30vj+qqrLyJhkjz
 2dyYpt0NLGX98qJl9m4t8Y8AWi/UBSltwEv0HmsDLW95zwXxRn5PmVRoFVDwAJHlmhsq
 cnYw==
X-Gm-Message-State: AOAM532pn7593R1TTBZbZv8cABMAU26K/jR/+O9xeJRoXkvyrxWFgzeH
 7rgAKI8fiy2XekbrGPqffmPSOks15bg=
X-Google-Smtp-Source: ABdhPJw1oh4WwqXp7msBUuvV2D2qcMQQf6jTQPFeMqi+gk6QuhqzKsNh7dfFH94IeaBR5MN6BRC8ZQ==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr6556599wmi.157.1632255835696; 
 Tue, 21 Sep 2021 13:23:55 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id z13sm53787wrs.90.2021.09.21.13.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:23:55 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:23:49 +0200
Message-Id: <20210921202349.28206-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/debianutils: bump version to 5.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

New archive contains ".orig" in the name, thus update
DEBIANUTILS_SOURCE.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/debianutils/debianutils.hash | 4 ++--
 package/debianutils/debianutils.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index 16a45d4ea1..0b28ac705b 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,4 +1,4 @@
-# From http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_4.11.dsc
-sha256 bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151 debianutils_4.11.tar.xz
+# From https://snapshot.debian.org/archive/debian/20210919T024804Z/pool/main/d/debianutils/debianutils_5.5-1.dsc
+sha256 2b0fad5c00eb2b8461523b2950e6f06e6ddbb0ac3384c5a3377867d51098d102 debianutils_5.5.orig.tar.xz
 # Locally calculated
 sha256 3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567 debian/copyright
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index d2c41130fb..cc8e42a9d6 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DEBIANUTILS_VERSION = 4.11
-DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
-DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils
+DEBIANUTILS_VERSION = 5.5
+DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).orig.tar.xz
+DEBIANUTILS_SITE = https://snapshot.debian.org/archive/debian/20210919T024804Z/pool/main/d/debianutils/
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
 DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
 DEBIANUTILS_LICENSE_FILES = debian/copyright
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
