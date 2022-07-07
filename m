Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006AEC43334
	for <buildroot@archiver.kernel.org>; Thu,  7 Jul 2022 05:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B5680B6A;
	Thu,  7 Jul 2022 05:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B5680B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iB9o5LN4dK0P; Thu,  7 Jul 2022 05:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10AD980B60;
	Thu,  7 Jul 2022 05:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10AD980B60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56BA01BF488
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 05:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E921408AE
 for <buildroot@lists.busybox.net>; Thu,  7 Jul 2022 05:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E921408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ear-Zn8xOn_6 for <buildroot@lists.busybox.net>;
 Thu,  7 Jul 2022 05:32:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A94BA40151
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A94BA40151
 for <buildroot@buildroot.org>; Thu,  7 Jul 2022 05:32:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o16-20020a05600c379000b003a02eaea815so509825wmr.0
 for <buildroot@buildroot.org>; Wed, 06 Jul 2022 22:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eJzK+CcPgXMN+wSWgGMlJx0efRk8PrwLFAvvJy2cI0M=;
 b=7FdheylVm9D/+csMf+MXqZnqtdgXhIYvfb1VS0xWuz/AMM+IMCEy2ynAbd0jZidP4H
 BVrfWLCGnxg5K+7oZGs8c1VdyQpKYxRL4hHhxJ2CE5g1Qm/jwOOvW0bZBscq1+MBSoD0
 +bVCyO8oIxVF7T0Kb17RTXdWxNQ/vvaZMqIkueppl2AArR3cF6J/IHJ0wE0EgYQDSa0D
 XxfRKN5YDPMdzXJ3EqDanSyW7zwHldN2FO4OVNK9su7mHepqX29Z3KZKA5tbMPHeigCV
 MqTGVebJeEmjzW50h092KfoiuHjpbZTzDkkkZ2b9WbKF04+EpV2y7WUhwa0qOforUFOe
 qPKw==
X-Gm-Message-State: AJIora/+GCZTp+sQUi68B/3378o8+G1dXn0QjsBw/rc9wYYhQ4crp+++
 dWlnhiu6WQCOhccLLBf6/Ce+IhxDui8=
X-Google-Smtp-Source: AGRyM1seDUjDibdf02rPaeCqaNwaHZ2UG7JGpdCqnRXrwm/u48hmvYTiBqsmxuf0JWWETfsyQR+pdg==
X-Received: by 2002:a05:600c:4f08:b0:3a1:99ed:4f1f with SMTP id
 l8-20020a05600c4f0800b003a199ed4f1fmr2239773wmq.199.1657171946675; 
 Wed, 06 Jul 2022 22:32:26 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b0021d66cf9547sm13799500wro.0.2022.07.06.22.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 22:32:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Jul 2022 07:28:43 +0200
Message-Id: <20220707052843.419991-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eJzK+CcPgXMN+wSWgGMlJx0efRk8PrwLFAvvJy2cI0M=;
 b=jphW2jkLMPXu3Im0gutqVjL/+Yoj3TX3UZjNonB8m+GEM9htd3tN1Gb5b3qtKvIb1U
 iV2nhUtks54BCl/kSeA5LDqzjLptcp5i2cEAqEhA/crsb2S4RPVzieiMcXXSAHnYF2Wh
 raZ0B0/wv8dIy9XrhIXseoFaDYZHRFO0PkglOQHs7SYwmoZMZM0BGxwQwerKn/bb3OR4
 SrBj7oHASeh1gIZBmIUDTHFwZ3z7OFkECfwFATLXiwdn1Sv7fX7oDPXq89Kocxd3Cjl5
 M0Q3TmTo6JsaVmubx6FEavNqU1zPFX78u8e43xxnmWKl3z1JaAIS/JB6kf43yj294ceG
 04cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jphW2jkL
Subject: [Buildroot] [PATCH 1/1] package/protobuf-c: add
 PROTOBUF_C_CPE_ID_VENDOR
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:protobuf-c_project:protobuf-c is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aprotobuf-c_project%3Aprotobuf-c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/protobuf-c/protobuf-c.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index baea4d623f..7dd3b09a6c 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -13,6 +13,7 @@ PROTOBUF_C_CONF_OPTS = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
 PROTOBUF_C_LICENSE = BSD-2-Clause
 PROTOBUF_C_LICENSE_FILES = LICENSE
+PROTOBUF_C_CPE_ID_VENDOR = protobuf-c_project
 PROTOBUF_C_AUTORECONF = YES
 HOST_PROTOBUF_C_AUTORECONF = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
