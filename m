Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1820CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:19:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97216610CC
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97216610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61C2D6076C;
	Sun,  1 Aug 2021 12:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E9KrMRmzKXnR; Sun,  1 Aug 2021 12:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8B9060699;
	Sun,  1 Aug 2021 12:19:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 013A91BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC235401CF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LlCJc5HxL6rF for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:19:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2EB440155
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:19:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id x17so2490323wmc.5
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 05:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1rEK+pmukhVEO4uGiGh6nvq6ul/SIrUsHr9kHIwXIBo=;
 b=HoR+nltr5WL4k6OVCxVPUF5W8jWXdaJ9oH8pLiV4lk1qTr23Pk3dTs7pkqRdESmb63
 r9EFLLlGdPo5p6NwOqk5qw6yYGnwohVTAMl0+Yx42EGnY9yKjhNFKQAMUVVew2VPF9Yi
 NjQP50rbERB/ul07jKWcclSeT+J5nP5HyEHcabRU/euZchrOJoefXx7v6EQioIrUc9dF
 EoiDE91Ewn7hA2lV8hsdB9/TraqwLq5mnko5Ye8OSEXlGPHouoIDRqnD9LNbCTY0gwlL
 CG4MtawRP89UrTMLDp6dFd2wO/hI+jgHOop56Ap4uu+NIc9epxEfKNpx7SbTBsJ5/vnl
 dPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1rEK+pmukhVEO4uGiGh6nvq6ul/SIrUsHr9kHIwXIBo=;
 b=GNgiXXHfXFVxrzbDMZ4FpR2tdbo5E0LQvcYiek27iIe3XDdRCx5zOTzJ1gDNclnvcd
 PP5OVCthcZpb6YKSAfUqS76AKbLruFKsDnw6OIupO5o2CJKUFHZH3F0LdOc1Q14FLcZv
 wh5AlkSaDcWEs64Nn1qjznibrsqL3+RDgcEzB58eYgd1v2676azEePWA4RKzrVE15FzB
 qKFNd88cs19i+hZxjPZobZmAUj2n+V0egJyYAVGr1TEqHnZQSm5pB0v7tt+a8cQmdX8C
 oAx4EEQri4fNyJyawFdu66FeXberdqarMRVwIYFbrjHh7jn42Sei3w8JOZGkplDUnTOW
 OLuA==
X-Gm-Message-State: AOAM533lm4dfYpeW1ivBP3k2QoIbtYPJ+6Q955EJh8alsMPrWL3MaiuV
 W8LQ0tuhlPw2Te7nB4aN7H7j07WzZ/epNQ==
X-Google-Smtp-Source: ABdhPJxk3v9RRbjagbOqL5DLbW1RjfJsGWb/tEONCLT/vxh6YpgQ5N4KXG1br8sLoSmOxJNsfYoWRA==
X-Received: by 2002:a7b:c7d1:: with SMTP id z17mr12194269wmk.50.1627820385697; 
 Sun, 01 Aug 2021 05:19:45 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id v12sm7712473wrq.59.2021.08.01.05.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 05:19:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 14:19:36 +0200
Message-Id: <20210801121936.3060829-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libfreeimage: fix build with gcc 11
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
Cc: =?UTF-8?q?R=C3=A9mi=20R=C3=A9rolle?= <remi.rerolle@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from Source/FreeImage/../OpenEXR/IlmImf/ImfHeader.h:51,
                 from Source/FreeImage/../OpenEXR/IlmImf/ImfOutputFile.h:46,
                 from Source/FreeImage/PluginEXR.cpp:33:
Source/OpenEXR/Imath/ImathVec.h:228:41: error: ISO C++17 does not allow dynamic exception specifications
  228 |     const Vec2 &        normalizeExc () throw (IEX_NAMESPACE::MathExc);
      |                                         ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/953cd07402fe2f99f2361a3b4a7b086a88e0d72d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libfreeimage/libfreeimage.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
index 91299084a1..4775f92109 100644
--- a/package/libfreeimage/libfreeimage.mk
+++ b/package/libfreeimage/libfreeimage.mk
@@ -20,7 +20,8 @@ define LIBFREEIMAGE_EXTRACT_CMDS
 endef
 
 define LIBFREEIMAGE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" $(MAKE) -C $(@D)
 endef
 
 define LIBFREEIMAGE_INSTALL_STAGING_CMDS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
