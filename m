Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740C6C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:52:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39F8C60E78
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 21:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39F8C60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB7C740272;
	Tue, 27 Jul 2021 21:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcbMR69vNAsV; Tue, 27 Jul 2021 21:52:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3794A40121;
	Tue, 27 Jul 2021 21:52:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FC481BF2B1
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3928C40121
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 21:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_hyUFXnKm8J for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 21:51:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ACC8400E9
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 21:51:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 u15-20020a05600c19cfb02902501bdb23cdso2926621wmq.0
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=++3KMX3CLbPHlYQCI8EOomaJzp5TS+UezUoMu3g1AaM=;
 b=sixkC5ajD7UCe2FMcFLoVOKId8C1jJMlBHDcZJq8YW5n0sZ+/HFvkyjT82YxmUTP0A
 U7qKl9pg3Im8YQ5A0A+g+jhbvzZJpb0+WluYQi79aS2Q5oHXNBBLryH+11l+nzQJL5+C
 FEKG33tTj1yysUg4HMRxYL42ufhdRNiVLQvtHbsIbs8fjh3isbRq6WbI53fVRAREJQ3u
 PudF4VjPXmfSPJ6O4EavCVwPPJQAKjtk/sWAhDrXp7PXsdJqIY7gpPKtQ8a9njcf0k1r
 e8JiOaFoZPQkMY8vp49DeLfjJhfL9rScF4AXGXE+F/aPUjYr+guPMCED5bbYIq03jkvQ
 StOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=++3KMX3CLbPHlYQCI8EOomaJzp5TS+UezUoMu3g1AaM=;
 b=HXuzTXhd26I4dQOUdWukaaTcoD1d9VmoepdSJzWB1lYdz+unpxHS3v+KnJNwLtcRWQ
 wEV3mcvsO34bJ0K/eFOnC+8hr2dAsQ3uBGH1uNmxzBMacUJel4cBEOpU0ORYfu+q7lLH
 Jvf3d3nQvXNo+oMWMMRixINW+cWjw0xkrNiHVfcdb0PHoPLsvi6XhGpFKwj3h5q2QDET
 wGhRM0+shUad966ZOpFZKvrIHkv+jxsfoiYcL7BiEkjl8867VhH9vjh+02PEkBRLiO5d
 MmRHprhGipwFSkgXqeFOvg5WzguUIhxl76cZmqsOu02EguLzBxQlvljlUss0R+GIy0Ew
 dpZA==
X-Gm-Message-State: AOAM532fHCR/B/38F/3b4kDBpmsD6W0o6jxzSGHGyB3BbXUH2uK/vfjA
 AoE7KYPYypl2+KZb4kXaf7WXQPExXIgdDg==
X-Google-Smtp-Source: ABdhPJwoaXhayyg2C3uWg+lyRxLdwlDWQoy0rr5ZIBeKFULI+5M0zMyKSidvDOuyAn1fp86n0CTItg==
X-Received: by 2002:a1c:7407:: with SMTP id p7mr23574473wmc.111.1627422716143; 
 Tue, 27 Jul 2021 14:51:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id h4sm4612754wru.2.2021.07.27.14.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:51:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 23:51:48 +0200
Message-Id: <20210727215148.3397117-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv4: add CPE variables
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

cpe:2.3:a:opencv:opencv is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopencv%3Aopencv

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv4/opencv4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 20e192fe7c..3cc6c05769 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -9,6 +9,8 @@ OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
 OPENCV4_LICENSE_FILES = LICENSE
+OPENCV4_CPE_ID_VENDOR = opencv
+OPENCV4_CPE_ID_PRODUCT = opencv
 OPENCV4_SUPPORTS_IN_SOURCE_BUILD = NO
 
 OPENCV4_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
