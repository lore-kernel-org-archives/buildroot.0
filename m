Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B17C77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 264B8402F3;
	Mon, 24 Apr 2023 20:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 264B8402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlerK4vgOfgI; Mon, 24 Apr 2023 20:28:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF527410D2;
	Mon, 24 Apr 2023 20:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF527410D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99FAF1BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 747494116B
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 747494116B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YGtSWLoLkEWx for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47B8041755
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47B8041755
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:28 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2471214cdd3so3477973a91.1
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367927; x=1684959927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PzPe8bwe3OtZhK7/AvZ4Jv33jDlvpUqcxGGw7gGiZSs=;
 b=hlqFBQF+/KR7vz5UhOc5HeEWWk2Nbj6/+oxcNb4mQhHlcpmvG1J5lXj423omJfxN2D
 5bM5VluX+AsS6AHJgTwwe1hHAvmAok5GKp7oj57IEezny3DMCAL7+lSoyLeH+k6Aq+gZ
 dmoW/RRrgrjn5pXSi48f8Nwgq242K57yCrf+kJiWVemLPi0+1JoTsc41zdkBx3XUyC3Q
 GtilCdspCW227+OI7Uru9FryDPQ61mUZIBT7vjmjqMIfOMoGHXEaHPwdiF2fFnbvAoza
 nsJu9q7O+JhjM6qRWGMy9D8y8I11ZcocIyW+XtUuq/gb2crncS4eNgIP/dgoI3iIsOH/
 wwGA==
X-Gm-Message-State: AAQBX9d3S+cJV4YA9AsJkzLqso4OnPr69+d62WB+a3UWUe1FXXZ9W6wG
 OrroT4Xv0ABjnA6hJ6V/giPEtKQL9EMxeg==
X-Google-Smtp-Source: AKy350ZJ2ashaAfXcHgLhzpg8jYQDn9HbCt8P53O5MKTGVnOuOaZ8UrvtRGN9ZW3NE7lD0Tn4cnzkg==
X-Received: by 2002:a17:90b:46d3:b0:23d:bbcb:c97f with SMTP id
 jx19-20020a17090b46d300b0023dbbcbc97fmr14566224pjb.1.1682367927103; 
 Mon, 24 Apr 2023 13:25:27 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:26 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:10 -0700
Message-Id: <20230424202514.1546092-10-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367927; x=1684959927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PzPe8bwe3OtZhK7/AvZ4Jv33jDlvpUqcxGGw7gGiZSs=;
 b=B7BGGYrLHyAGl1iceje3m6rTqK5dgK7VxJZze6ct0kfHrBQiokFT/8Tew1sbvyhGqA
 RU7RwW92kOH8ty7V3l7EvPWR5BrKsL64v/8o6iiYxxVnAnGzLVJFbm8h2wVNBNGAX8oa
 tFRnpTAFPdPpZqNZW1h79iLb9GKwuiu10wQJ1RMf4I3yqISY0UQvyJL3nlHncFUTSNEk
 qPHRiVDVSnsGwhij+JxN0R8J7mxN9f0dne4Hqf73k9PhUj+RTg7Du8UVSXAB9d6xOC9u
 Ha45CmIYCp/tIMj/MZ+/Hktl3hgMPWH+4CDWX5CXgyB+x5ja83gEuvYWF3ECdqkcPUwF
 vWww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=B7BGGYrL
Subject: [Buildroot] [PATCH 09/13] package/semodule-utils: bump to version
 3.5
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
