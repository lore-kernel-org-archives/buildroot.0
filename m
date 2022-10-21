Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAD8C38A2D
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 22:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2434A417B2;
	Fri, 21 Oct 2022 22:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2434A417B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZ2iUU2dJ2Qz; Fri, 21 Oct 2022 22:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F246741774;
	Fri, 21 Oct 2022 22:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F246741774
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 085911BF94D
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4DCC843DC
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4DCC843DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Q7PSTeRosEg for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 22:11:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEE11843D1
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DEE11843D1
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 22:11:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f11so6604259wrm.6
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 15:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j+8GWeITF0dGsT2OFc5fTG0eIPrFcw4EYXWqicbsKIU=;
 b=qFciAMaekKGPHIPwSwEp+bMcyY9rWw1Xx+zHf1A1vRLqOAjTrAHiortqfX2qmP9+tV
 TLFRggL7RnK+wPxeQlvzarC1nwQHOe++vdq3PfPhudLaVxilvfOTYK9yKJ6GK2P8nH2v
 lwNkHHINFQiBqjY5WIbBIgx8fgGQkbmtr7evdxozkhsZUTtJAIMHki/goN4jm63W0WA/
 69DaYuS8rD2+jnP5OvXpdDU4VNdpcaqrK7payE7JJnyYzRvHOKq4Gd2NdOkUqpVfnnxT
 OY53zYYsFn2ynm6zgz+AUpXOoNq+mTZwcoyEhl6JIfyihQAMtB0NE6jcgpuGXNgY/g4w
 mLaw==
X-Gm-Message-State: ACrzQf1jcCj0ZdGYfIKv1ZQRkIX0HOEDm/dyJ391ctP6nKxS2IpEMDx7
 McIxP7HcM4f+vKMoyCvGZBmge9I4YV0=
X-Google-Smtp-Source: AMsMyM55oCEPO4uDuvv3uSrKZ9o99Vj4WVl3F/GFmsv2bMyNz4MjU4svP1Egj5L08oQkkg7UyHEG4g==
X-Received: by 2002:a5d:4950:0:b0:230:cc5a:f6b0 with SMTP id
 r16-20020a5d4950000000b00230cc5af6b0mr13794290wrs.656.1666390296612; 
 Fri, 21 Oct 2022 15:11:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u6-20020adfeb46000000b002258235bda3sm19621358wrn.61.2022.10.21.15.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 15:11:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 00:11:33 +0200
Message-Id: <20221021221133.13293-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j+8GWeITF0dGsT2OFc5fTG0eIPrFcw4EYXWqicbsKIU=;
 b=TtppqkdFK1AFROHRyK9A69hwC0YYx6hFjsdry+9DBfqAIIggFhy0UaC0AjdHbyvk52
 tW+1eIKL/KG4aN5J6d4b/UqUylW3wUbF2efHAc2Jj5WPSPeR+r0xnpMFzbWbhzqV9FmI
 dYiirw/smuvrC7YLg3UorM0T7aA0zjbHiGTGTee8uwrr+XAqHN+/vOKPbyEDRhQ4MwKN
 Xrski5/OBEP0/AWrgkc5z7K1Yz/Vc5kP14dJT8SUMV5njrm1sf5IXxZmNEwIjKjbavMM
 CZzAivU8NAp2I5Kmdl5tNHA+xGOBBt7nOAhB7ApjIp/WLP9wS9XPo83P3RKgSDdN9ofC
 4Pog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TtppqkdF
Subject: [Buildroot] [PATCH 1/1] package/easy-rsa: bump to version 3.1.1
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
Cc: Julien Viard de Galbert <julien@vdg.name>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/OpenVPN/easy-rsa/releases/tag/v3.1.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/easy-rsa/easy-rsa.hash | 2 +-
 package/easy-rsa/easy-rsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/easy-rsa/easy-rsa.hash b/package/easy-rsa/easy-rsa.hash
index e304c367fa..5be651bde0 100644
--- a/package/easy-rsa/easy-rsa.hash
+++ b/package/easy-rsa/easy-rsa.hash
@@ -1,5 +1,5 @@
 # Locally computed: (after verifying gpg sig)
-sha512  be2dedde19eaf923622da61db34ecb2e926b3f15a60a0c3d9858d3126dbe3b4af9c0f6674f964516572b50611ffd1d254952f27dc5de867bd7a67474c89be5f0  EasyRSA-3.1.0.tgz
+sha512  8c8d1f4baf90475d4cce334d116b7f12b82687157796b25560600b5098769226ae2f60f02982c75266b625d66b465360ffa815260ad44850923e3fbc9ba8540a  EasyRSA-3.1.1.tgz
 
 # Hash for license files
 sha256  7c4a4fc71745d93a87278801f1bca555562ca23f21e18293add64b9e6f6b7bf1  COPYING.md
diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 7c32c1d83d..4ea45506dd 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EASY_RSA_VERSION = 3.1.0
+EASY_RSA_VERSION = 3.1.1
 EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
 EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RSA_VERSION)
 EASY_RSA_LICENSE = GPL-2.0
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
