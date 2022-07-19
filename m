Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F43C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 22:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A7FB611F3;
	Tue, 19 Jul 2022 22:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A7FB611F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfeeDfsPASJ4; Tue, 19 Jul 2022 22:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E07A61117;
	Tue, 19 Jul 2022 22:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E07A61117
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE011BF577
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 22:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E49B261117
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 22:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E49B261117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJVE54rz4ImR for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 22:25:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 244E161103
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 244E161103
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 22:25:14 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z13so4066994wro.13
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tfDEIRvyElxdYvhak5onZkpnFZSaBQLuIatu6k1diZU=;
 b=RvZbSXOGUTzBx0CWBwbNEYKodjy+uaJv6SRl+3TsEU0hWh3EIV0oQTHK2p9Y/m4ZGg
 aBhTqU4J8cyWyLMgEyKmVO6+bz3MPrRDV67uiHVm/SEXMwwBM748mpeGPKS3A78gvNH9
 9m8MaJ1aGRyv0qCTH0cemhvaKtqvRYAi2/1UIytss32X5Dyt5RmRZTNY81KIy0Tv/23e
 HZaRmTPcckOQYfJjTOEORjyJVGoQ+mWvbUUwivjmD/nnfr4bqrmE5GZlnMMG/b/iq/5d
 Dq8O6/CVQjGlV+5kNKDpVbFdvGg9j/CUVnh+vkCEYfAldfQqFRUTtYo1CfX28n6aMYhH
 m3FQ==
X-Gm-Message-State: AJIora+K3PTvWEgbp7m9gQZ4lygrNPRjM34cKIgRwlZA1brWnDTQ1xil
 q92Ro4jUXlMql8JcjtqjPchooJISRgA=
X-Google-Smtp-Source: AGRyM1s4T+xzRCRmS92rWtzUIGlD0NGPTwTiSw9CI7kMJHF2hu7crebOrpMI14ORQp1gRyY/P8viDg==
X-Received: by 2002:a05:6000:887:b0:21e:24a0:f302 with SMTP id
 ca7-20020a056000088700b0021e24a0f302mr7731711wrb.466.1658269511925; 
 Tue, 19 Jul 2022 15:25:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003a3270735besm245090wmb.28.2022.07.19.15.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 15:25:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 00:21:59 +0200
Message-Id: <20220719222159.3194065-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tfDEIRvyElxdYvhak5onZkpnFZSaBQLuIatu6k1diZU=;
 b=UpE2S7LqYwv1IGF48uH/gPhaM4D+1PT7DdAE2Ji2F51W9UmazOgT+3D99EaCZCJA/t
 oFcxdDQDjdsgidZUXhLIelw1UpTkDkiPEWeLc+EQag/d756QGIhDQwqV30ZXWoDguMgO
 PnFmE1Kky5oifhS33Ww9og/uyunB9t1fHXXs2Zzu3l92RhWocGpFVbnGaq9f54yOgj0Z
 nMZMxovmP5ufpDpDQVML8xuXusW5snoYWETNdQTA7gCQ/25iwaoxSh29i07ST8LokaXD
 6VY8d06CPf191WEWjiQm/wjXFDhb32ZKRmfEmIaIjJWM5HY5dV39365+uf/zytXdtXHL
 CQ8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UpE2S7Lq
Subject: [Buildroot] [PATCH 1/1] package/protobuf-c: security bump to
 version 1.4.1
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

- Fix CVE-2022-33070: Protobuf-c v1.4.0 was discovered to contain an
  invalid arithmetic shift via the function parse_tag_and_wiretype in
  protobuf-c/protobuf-c.c. This vulnerability allows attackers to cause
  a Denial of Service (DoS) via unspecified vectors.
- Use official tarball (and so drop autoreconf)
- Update hash of COPYING (year updated with
  https://github.com/protobuf-c/protobuf-c/commit/471aaa5f6d54406c6c17bf3179d5aea18f15073b)

https://github.com/protobuf-c/protobuf-c/releases/tag/v1.4.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/protobuf-c/protobuf-c.hash | 4 ++--
 package/protobuf-c/protobuf-c.mk   | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index 13e1b474bc..ec00442277 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1068bca1e9870e9492096f97c409cd15f10c5019c183e52ec6d53e8d18630cbf  protobuf-c-1.4.0.tar.gz
-sha256  20e800cad4550f4b19bb37fc9577dac21de13333ae66497c4c45ae489c35c34a  LICENSE
+sha256  4cc4facd508172f3e0a4d3a8736225d472418aee35b4ad053384b137b220339f  protobuf-c-1.4.1.tar.gz
+sha256  b8999cb392cc5bbe8cd679de59584ad8d2f26033123e76f1d662fa14b9d4f287  LICENSE
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 7dd3b09a6c..0742a33db2 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 1.4.0
-PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,v$(PROTOBUF_C_VERSION))
+PROTOBUF_C_VERSION = 1.4.1
+PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
 PROTOBUF_C_MAKE = $(MAKE1)
@@ -14,8 +14,6 @@ PROTOBUF_C_INSTALL_STAGING = YES
 PROTOBUF_C_LICENSE = BSD-2-Clause
 PROTOBUF_C_LICENSE_FILES = LICENSE
 PROTOBUF_C_CPE_ID_VENDOR = protobuf-c_project
-PROTOBUF_C_AUTORECONF = YES
-HOST_PROTOBUF_C_AUTORECONF = YES
 
 # host-protobuf needs c++11 (since 3.6.0)
 HOST_PROTOBUF_C_CONF_ENV += CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
