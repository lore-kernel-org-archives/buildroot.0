Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D9EC4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 15:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C082402EF;
	Thu, 22 Dec 2022 15:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C082402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2K4NhIA1yxrD; Thu, 22 Dec 2022 15:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 029BA40305;
	Thu, 22 Dec 2022 15:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 029BA40305
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59D4B1BF352
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 15:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3509581E72
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 15:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3509581E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SjUK6lIcT7nM for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 15:25:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18DDF81E1A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18DDF81E1A
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 15:25:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id ay40so1666496wmb.2
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 07:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jMLiRSRBOnf5gt/GYM3sjhBJSeB1pG/Oe70E4ykcc6k=;
 b=DR9UlWU1zunaSVsV2WRtuvOyBNVqQIlSULUszspPV77gyybiYjVrBZwWSQxYRDMrwh
 /gdy3a6zvIn7Bfj9Mlu0c0oymrg618TWHngKJhNpKRF8O6brYzeF/c1Mfqp1KU4HCFLd
 stEqUncR4XmHdchp3QmQACY1cV3RGiazBTXfdhgVaMSq6MVhvLl5qDRJlA5qufVS6MF/
 Z1KU19HBsNv7KjFEWF0/vNrbvVnCLdbcKqiFh8FEO7hX1NZW2pXjFbwRRcbyfp6YT9IC
 3hqE1YXF5otNwBpkT812B8fodamshOmJ/SPI6TQ4fSsmwtnp6MAUjRUsb9yW9I4jTIKd
 aAmw==
X-Gm-Message-State: AFqh2kqaJ+nt9eHJjFpQyukcXykgIcv9F++2gzhORw4Tut6ORgHdqtIi
 HZgR3ymlDpg/pn0dqKV5EkiNSEGX5kk=
X-Google-Smtp-Source: AMrXdXvotULXA7umsdP+sFix58YCLJl5NwcUCz1o+c6xuPT+Gxx6usjwWGE0zr53P1ZEJIAKBzaM1A==
X-Received: by 2002:a05:600c:ace:b0:3d1:fe0a:f134 with SMTP id
 c14-20020a05600c0ace00b003d1fe0af134mr4631433wmr.19.1671722709965; 
 Thu, 22 Dec 2022 07:25:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 ay39-20020a05600c1e2700b003cfa80443a0sm1302812wmb.35.2022.12.22.07.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 07:25:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 16:25:06 +0100
Message-Id: <20221222152506.8310-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jMLiRSRBOnf5gt/GYM3sjhBJSeB1pG/Oe70E4ykcc6k=;
 b=Hrv7ZUgCl5usgAKO5Nhy4LQh0iNNgQ9i/P70KFjRyrunReBWkI82YvaqISshsBxLNT
 6XQJEtYgGYXLh6Cz12msImjVXZizkeUDvhi9UxrjCVGZIEsmodvzVkJEdDFB5s1CKkiC
 L9GPgj/Tr/ppFqH48mL3cRV5BYq0mYaOMUvBL9f9ztoqBMqqBlWuPPkXzZy05XNJkdl5
 54kQ7PX/p1uXxtBb2F2Ve7GNrH2Xewhb9o+oGvQxpl9VY03mcjOnIh6a/p5npY624QY4
 /5AN/lDLGAm3fI3oQL1Vi/Hkk6a7kBV6hcj4hoakJ+bAc7KwSVmO3sMPYmPgmYk/8qTM
 m5xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Hrv7ZUgC
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: add CPE variables
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:exfat_project:exfat is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aexfat_project%3Aexfat

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exfat-utils/exfat-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index d13ec6bab8..704641dd0a 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -8,6 +8,8 @@ EXFAT_UTILS_VERSION = 1.3.0
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 EXFAT_UTILS_LICENSE = GPL-2.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
+EXFAT_CPE_ID_VENDOR = exfat_project
+EXFAT_CPE_ID_PRODUCT = exfat
 
 EXFAT_UTILS_CONF_OPTS += --exec-prefix=/
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
