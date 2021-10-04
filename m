Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80E3C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:49:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F27161154
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F27161154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A49B83365;
	Mon,  4 Oct 2021 17:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytmue2-wxB8X; Mon,  4 Oct 2021 17:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 830598331B;
	Mon,  4 Oct 2021 17:49:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D84F81BF308
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C776E6075A
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fkgkqWzpFyTX for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 17:49:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B684F6074B
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 17:49:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id v25so21489370wra.2
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gx6HrRbJHto0Mgiz2gu3ryMQck2gXPpmhIsWEB+gHRs=;
 b=Ir9ujPeremvt9FQffEeapIrciqfWEG6bsyp4MubQknKYBIOTkusV8pyliTRLP3xC+Y
 M/6XcW2kO8mCgL+wT2nAkugQN6lJ6N5eh/8wKWLiJVSkqP7e1CxiSF1SoAG4YhPlK85/
 S5SrTOp0Mtf2RWtNaKHIyympa8l1DrmxESA+tsFSLGdoxsqvE0wy1QJuLylLbntBDXAa
 KAUb0LZX7XRX3L+riK3Ov0giLb5KKKVzhQK56UHSU770+F442hm/RFfGYo5nml8vVgu2
 P+FAdcFLGav61Z7vdi7lwYeFKBGFwvKY6liwMV8H+L4TO/B0kmTLxkeHF1b+n5h+NAtb
 V43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gx6HrRbJHto0Mgiz2gu3ryMQck2gXPpmhIsWEB+gHRs=;
 b=jkcH32twYYMR3uxs1ehLwgeNvo+QycMWL7LamfmRrMJFOTBbfJTSUGE6Z6+zISve9+
 /2SwvC4B57rXjnviTZDwbfsQIGC8pbM0oGCcqAUppd8Q9wQiko7NrTz8Lnv4QTtOlOJO
 joXiJB4B2Qn97+YGxB5Y298ReYBLN6dbeEN4yeDZRdbFTgGarnfHB973ZnUQO3jWtpzb
 Ff7S8564ltspV8SivWUb+8NQCj8GNR6UAS1N5tF4YFHeFLSS418CHLpxdyZtOsO3HFIK
 DyqLZ4TgD6I0Wqp7qIBxlvOwPE09B+pfvTRADeL1soZZVo5d5PcPaw7kWBopoNJnhwn1
 QOaA==
X-Gm-Message-State: AOAM5333nS302hCOdLPN1sjz+pUiOaHcBTEBUBvQT5GFP50VfETCFbE5
 HWHvXZqqx5JqMahLz7KtxmQgJOIwguU=
X-Google-Smtp-Source: ABdhPJwqoYRCEQzTdK/V+0qBLFV0Z+AOA5hRBLePPTv5usic3SOrlvi7eLzFPanuTXte3zoFn0v/gQ==
X-Received: by 2002:adf:a4c8:: with SMTP id h8mr10990223wrb.227.1633369759741; 
 Mon, 04 Oct 2021 10:49:19 -0700 (PDT)
Received: from dell5510.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id x3sm3001946wru.34.2021.10.04.10.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:49:19 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 19:49:12 +0200
Message-Id: <20211004174912.4736-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 1/1] package/links: bump version to 2.25
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Petr,

from Changelog [1] it fixed DST Root CA X3 Expiration [2] => IMHO worth
to backport to stable releases.

	Delete the expired Let's encrypt certificate from the builtin
	certificate store


	Set the flag X509_V_FLAG_TRUSTED_FIRST, so that Let's encrypt works
	with openssl-1.0.2

[1] http://links.twibright.com/download/ChangeLog
[2] https://letsencrypt.org/docs/dst-root-ca-x3-expiration-september-2021/

 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 6dbb9d13c0..0f8cd32937 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9b12f5ba2d068306d7ff7385b520cdcafdc0e55c87eec877abb0e78288525430  links-2.24.tar.bz2
+sha256  2dd78508698e8279ef4f09a3a2a21e9595040113402da6c553974414fb49dd2c  links-2.25.tar.bz2
 sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
diff --git a/package/links/links.mk b/package/links/links.mk
index 5f075a70da..1f1a7a9189 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.24
+LINKS_VERSION = 2.25
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
