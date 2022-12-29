Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C112AC4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E78360D5C;
	Thu, 29 Dec 2022 09:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E78360D5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6O09EuvsoG1C; Thu, 29 Dec 2022 09:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BFC960D54;
	Thu, 29 Dec 2022 09:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BFC960D54
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB15F1BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3E1C818AC
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3E1C818AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sv1gXOk34dHO for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:34:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D972C818A1
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D972C818A1
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:34:00 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id ay40so12786885wmb.2
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 01:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q3DA2reA4iGg+OxXzbjOrcMfS+yjLwlQVL0ENLJDL04=;
 b=32Bnu+mZj6HC0za8i6ZUTCNIt+MKmhIc9ziH/4N0avPymdeW+djtgQVnlG4+h6lEBz
 0YbsWKcJEahRgL8jF8WLJLv+F4u35NkXBSjT7Dya+TpwaRJ/pXWlKuZglt4lxNQGX7h5
 wMwGp2JREU2bYKOwT1Qk4BmTXLiLscvnKeYEM5BIu4ltXwednu+SJ1dEjc5rauwQjTqN
 8OuyKFQZduLTvRt1xnAC3U2mHSRLOecjW2asQa8s/tPTKxGCaIT+CcQu7x5Qj5DgUhhZ
 /3UerBBS4ZesUz+Xe8Q/wksKQFFXNPgsAsgvsv4AZFk8AZHvnOHkRoC4ol1BM7k2ZNlH
 5pKw==
X-Gm-Message-State: AFqh2kpnNkCeu5mZqMEl4OPjfuKEVqsxPYwwU6RxQ45PgsePO3uwpRy4
 Kb/mT+w4awbALJU6yKm5U29cRyGHxUQ=
X-Google-Smtp-Source: AMrXdXvFBOeb0xgoP07g3NpBgMx3M93pC2cuTDbO0W+ZOxLc2PBpX5JK19eb5W4PzrYfp7BN6mW6aw==
X-Received: by 2002:a05:600c:c0d:b0:3d9:7667:c0e4 with SMTP id
 fm13-20020a05600c0c0d00b003d97667c0e4mr11145349wmb.31.1672306438766; 
 Thu, 29 Dec 2022 01:33:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i25-20020a1c5419000000b003c6c182bef9sm33712013wmb.36.2022.12.29.01.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 01:33:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:33:55 +0100
Message-Id: <20221229093355.292967-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q3DA2reA4iGg+OxXzbjOrcMfS+yjLwlQVL0ENLJDL04=;
 b=jHG5u435xWHbnYKUPn6VkJ4OcsHs3AnXYF0sWsViZ/1StC6J6SasZqoU5bt/LcJJ0s
 mHpHdqXY+Bolc7AVdlwbfskLv/hHKy3gIgPrD0fOa8zkF3FzBUZgwXuW/St9iGCQ/pBL
 Hdyts96I53mRoAg9krTqqLHnqqzcWxQmDtFfBMticahOje8KTWU8WavKeeymSVjzMiG7
 IdLlu+w0UgmL7N5VWqqWsekgPrs/J6gsWZW9Q4HGaUxG/oSL+vzZM55SQJfHClzcBpq7
 IvkxuQabMUYjGQ3upSf/6fEXpyNxlB+0X+aIZbFlAwlDhjm3EiP8kxFQV2s0KMiyU5up
 +1Mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jHG5u435
Subject: [Buildroot] [PATCH 1/1] package/ulogd: add libdbi support
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ulogd/ulogd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 65280a2ba6..561429599c 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -7,7 +7,6 @@
 ULOGD_VERSION = 2.0.8
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
-ULOGD_CONF_OPTS = --disable-dbi
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
@@ -17,6 +16,12 @@ ULOGD_SELINUX_MODULES = ulogd
 
 # DB backends need threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+ifeq ($(BR2_PACKAGE_LIBDBI),y)
+ULOGD_CONF_OPTS += --enable-dbi
+ULOGD_DEPENDENCIES += libdbi
+else
+ULOGD_CONF_OPTS += --disable-dbi
+endif
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 ULOGD_CONF_OPTS += --enable-mysql
 ULOGD_DEPENDENCIES += mysql
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
