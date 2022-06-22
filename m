Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0763C43334
	for <buildroot@archiver.kernel.org>; Wed, 22 Jun 2022 20:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6636341A24;
	Wed, 22 Jun 2022 20:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6636341A24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HS4u8Q6MzMrq; Wed, 22 Jun 2022 20:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 072FC4177F;
	Wed, 22 Jun 2022 20:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 072FC4177F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDFBB1BF3B9
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C819A41964
 for <buildroot@lists.busybox.net>; Wed, 22 Jun 2022 20:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C819A41964
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O1wcbZtvNw_C for <buildroot@lists.busybox.net>;
 Wed, 22 Jun 2022 20:33:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58E2A417A5
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58E2A417A5
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 20:33:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id g27so18375553wrb.10
 for <buildroot@buildroot.org>; Wed, 22 Jun 2022 13:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DG9QTO1bJswoUStbScXrLbhA2p9JmHUAVkUrluybWPA=;
 b=GWrkoqoaQmjnPD0ut+stj4hZvbPst9kG234/at5f8qpXOa0O32WWJEZEIG7FVjrpVS
 ooBCjUhRwGTEmXnHuS00u6FmX0lqgiw7GatkaQ2bdrY6RCMpJBWrzVw7Lsvj06LHdcac
 Ju4zeUFZMORJiQT4MtDnYz2QoRxBRg3XfjoKksvEd/kF6T2HLzadRpjldR42Au3pmgDO
 zEwvu68Zp0komPfj8uM5qwiKdGUofikpWZ3oDEmBy9JnO61hNSPqcjf4iNequofHIDOH
 AvvB5UDx68oD0UPDIF4vgEXOgZuMLOA90bSyiD/6BSI4TfckaxqBGJ7vdE9Cc/c63IAt
 u23w==
X-Gm-Message-State: AJIora+ABdB9FnBqyn6CDiZgSS/sV/f+1Jy981Q/Dk8MBYOd++FtI2aR
 VWrRYv93fjpu32HpwpcSCYHIciDV764=
X-Google-Smtp-Source: AGRyM1u9GNc2Y8FGP2pTQTPDr7+XB58LzeADsU92hkQ2JLZyOjvZHuIVoGV1aV2/SZmP7v+JIiOpFw==
X-Received: by 2002:adf:f802:0:b0:21b:80e5:e3fd with SMTP id
 s2-20020adff802000000b0021b80e5e3fdmr5000875wrp.243.1655930029394; 
 Wed, 22 Jun 2022 13:33:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a05600c364200b003974d0d981dsm444408wmq.35.2022.06.22.13.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 13:33:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jun 2022 22:31:05 +0200
Message-Id: <20220622203105.266498-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DG9QTO1bJswoUStbScXrLbhA2p9JmHUAVkUrluybWPA=;
 b=MlVYAEyFdIR+w+Zm9NQxqYWIz4OseFKLNMYS59G6zXMcFLJikVR/7kD5fmUNd7GsyA
 1qTDnRM3lZiX4XlGqc+Cjufnu1HhEd69noru7ZBPVKNls4n/j4+zcu6Sw5RLjiHJRczV
 uWrfsOyZM7cq0DoZZRM78MTS7Vj4gYABuOIRAzIB4CPGneScqDGVufzgam9cFm4h5gsj
 Xo4OMgw39tKSaYWki1seUSb36L5fsR67IHaOjNITg3AYUCAGeeXF0EhZckzkHxz9UfHl
 4AzWsQvyNEGdW3BS/gTfoYZPhzamGT97Y8oGGmqcXuZ3G6EYrhjsY0XdAdAqwYjcoEkT
 iBMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MlVYAEyF
Subject: [Buildroot] [PATCH 1/1] package/nilfs-utils: bump to version 2.2.9
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
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/nilfs-dev/nilfs-utils/blob/v2.2.9/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nilfs-utils/nilfs-utils.hash | 4 ++--
 package/nilfs-utils/nilfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nilfs-utils/nilfs-utils.hash b/package/nilfs-utils/nilfs-utils.hash
index ad6a57d8f5..ec71751b00 100644
--- a/package/nilfs-utils/nilfs-utils.hash
+++ b/package/nilfs-utils/nilfs-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha512	3232390581f63de5ebe7b461b178a40dfbdaa4bc6aa96b218ea8182c5bf81b162a1e632a1c21d9f1e89fdba9393b4e268e001c335a99ce22f645a62ae3154783  nilfs-utils-2.2.8.tar.bz2
-sha512	4fc92d3998910acb108f81b1aee70a55a572b661a2766d0e57a55e48e2b737eea41415356cbd62593f26aec5797ab9fbb40211d7782b5834b4855ff1ce6ad5f7  COPYING
+sha512  dd8ab20ee0d6750a6d81f86fe4d1ad94a8a71aa53ee7cd38550ea32fffcc9527db1c75d34f732f0f8f6379a808249f8eec2619e54c595566a3fc434a87d9e66d  nilfs-utils-2.2.9.tar.bz2
+sha512  4fc92d3998910acb108f81b1aee70a55a572b661a2766d0e57a55e48e2b737eea41415356cbd62593f26aec5797ab9fbb40211d7782b5834b4855ff1ce6ad5f7  COPYING
diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
index 7335d87209..9f9bd091c3 100644
--- a/package/nilfs-utils/nilfs-utils.mk
+++ b/package/nilfs-utils/nilfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NILFS_UTILS_VERSION = 2.2.8
+NILFS_UTILS_VERSION = 2.2.9
 NILFS_UTILS_SOURCE = nilfs-utils-$(NILFS_UTILS_VERSION).tar.bz2
 NILFS_UTILS_SITE = https://nilfs.sourceforge.io/download
 NILFS_UTILS_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
