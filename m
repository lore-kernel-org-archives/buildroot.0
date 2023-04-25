Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2400C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CB2C61467;
	Tue, 25 Apr 2023 17:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CB2C61467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I8lC9VliFe-R; Tue, 25 Apr 2023 17:16:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4FA6145E;
	Tue, 25 Apr 2023 17:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA4FA6145E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9BFB1BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A034D6145E
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A034D6145E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKrvLPOOZp11 for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEE0361458
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEE0361458
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:09 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63f273b219eso2779625b3a.1
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442909; x=1685034909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PzPe8bwe3OtZhK7/AvZ4Jv33jDlvpUqcxGGw7gGiZSs=;
 b=Q4H1oCeejHh2FyJQ135mNNJSPs6oGsX8KN2a9gLYu8J3/32VXkmctvP8wuWJx60vWy
 R2RAZiluRBfwfFVKgMrNhO5QlgDELel6WPgKldouwzm76plofYqaXLip3hpH2yWZV5Fj
 VyJqq80QP3R14ZcX3JQkZpBzkBmNglxeFox+FTvR4EvOs9PrrCkQSRmh69SiIBwRDeIj
 ifScPElR9N2SFg5/naM2Dbh0coRUfQ7hv7Pf/vrH4tRLfAbHIODiG1NbDoQgfcFVSNTx
 pY+eaIM8jHy4Iu/YGNPaQehsCaqQ5EulCOl3gFFJYhTkJ1HzKx/0IXY+dA8PJPMb1bvl
 yU/g==
X-Gm-Message-State: AAQBX9cmNYSVDhRZLYIHv/mQu7NGzVJVigudbDIXIxM6Wb6W807zYLGU
 8OcShkkATpEvrr3TTRVqfItUW0WxOuJI/Q==
X-Google-Smtp-Source: AKy350aDR3E5GGOoGC98nEB8VLkNY5yKHoBBbhsFddfYdn50e5rkv+QsCjJKn/tzaIAzQ6Bd8jiRHA==
X-Received: by 2002:a05:6a20:914f:b0:ec:8ab9:9391 with SMTP id
 x15-20020a056a20914f00b000ec8ab99391mr23806926pzc.23.1682442908715; 
 Tue, 25 Apr 2023 10:15:08 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:15:08 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:50 -0700
Message-Id: <20230425171454.48802-10-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442909; x=1685034909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PzPe8bwe3OtZhK7/AvZ4Jv33jDlvpUqcxGGw7gGiZSs=;
 b=Lv/Oczdn6S0I5VAPP/x3oyh8i/lxACSGk6nXgi1oNi0M1Bs9b19lOUE1jTptYBLRDN
 imFydm/2Q13mp+Gq8pP/t6Uo4gbNrFBx94Wgr95+G6rIVW+judR0x2CKUgNHKeykzmzb
 +oYb25CGXW5Axwr8ZYnQn7+D81fjHlVoBuvV5MAFARlCBuFM9UDgX8YDhNvLq6PZP17n
 uDtutd67WPuwN4jm5W+mFNSooCrqpN2yvoPVJYNOjKGjIXg9SxHaM/oiIRgfpQNrzRDB
 fuR1GOrYnvviJCNMpKk0bPckMl1S9i3Nwht8FM+ygCV/dDcp0m7gUzcgSH/xL1YrnC54
 A0iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Lv/Oczdn
Subject: [Buildroot] [PATCH v2 09/13] package/semodule-utils: bump to
 version 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the license file to LICENSE. The hash remains the same.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/semodule-utils/semodule-utils.hash | 4 ++--
 package/semodule-utils/semodule-utils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index c252506df5..ac3357d3fa 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  3098ec5e5f04a1dbbf4aa569b63a4570750a9fe0d4da14ce45954aa300a17063  semodule-utils-3.3.tar.gz
+sha256  c9a550a737051ebaf2c102f665c7ec2f85e7232870980aa0067998459b414283  semodule-utils-3.5.tar.gz
 
 # Hash for license file
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index a9388f7ee8..9a0f084128 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 3.3
+SEMODULE_UTILS_VERSION = 3.5
 SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SEMODULE_UTILS_VERSION)
 SEMODULE_UTILS_LICENSE = GPL-2.0
-SEMODULE_UTILS_LICENSE_FILES = COPYING
+SEMODULE_UTILS_LICENSE_FILES = LICENSE
 SEMODULE_UTILS_DEPENDENCIES = libsepol
 
 SEMODULE_UTILS_MAKE_OPTS += \
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
