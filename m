Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686E2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 23:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1571860B49;
	Sat, 18 Dec 2021 23:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dA7AuJt6mh_t; Sat, 18 Dec 2021 23:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E02D607DE;
	Sat, 18 Dec 2021 23:19:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7DD81BF306
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 23:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADD3440204
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 23:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4oLsrqsaMNk5 for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 23:19:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95560400AF
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 23:19:25 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q16so11636487wrg.7
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 15:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h+lMAte9OALclwmooZcNZF/tWhrL3Mux6rzvFaVXfKk=;
 b=mnhK8tw0B5Jpdpedc8MSWK3XFXPFpWQamKr/B9LtRylkf6N2pDP3RX2/B7iUrFYmpg
 UxJxO3nmJzbebXxrsO1vAQXWg6Y0o7mwxaRdw+EdZOJ4RqrnjKb3+aw38xBLqfFIr3SQ
 DVXClUSwZCXKr/8HjM+QAI7Nt29czmghWVROSdcRUlUlBjw/YNShrNWIGrfCUL6kFOzB
 i9fluUnj9EOMdjfrk8SGRKmROCz31B2JJPgdiG3u9D9AHSMD4USISa98UBkrqOykcbwK
 8XXwkXIMsU7AramfMSuHDaK9zqNcqUDWA52zhTdWcCgHY1hCE7gdrpQyNs/KGxXdw221
 uYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h+lMAte9OALclwmooZcNZF/tWhrL3Mux6rzvFaVXfKk=;
 b=u1OzrU6cLDsLfC8Bf7Cz/tpsO4CdmioYFaT7WkEwZW0CYO6WHoqKaiYOdjKdB7z7Zw
 fw4rAhzS9H1Dqjdj3eRejgJvbceEppfp85JykEsapFAwMIPID+7UusWu9gZyW/kcIRQi
 96LC5e2D1eSP22yyWaKXxvy1qQPEcgpgdmkeB30i7SSjHagC6eixsxmLVPu7Dwp+zj04
 2DzLN1Y71rb56BuPjJym1+tyZWqv6xDg0HatWDshI00OGCcdc9kTYZ8et7QNg2DRWizO
 Zu8skw+ByYKISeRf9DfGeYgC63v0TSXfOAz4A2kzR/LjAJ3CRhYXT/1+SiqpjOGKCF0a
 hmyA==
X-Gm-Message-State: AOAM530crGiJUEDXqxgVQ6yURLuVnPWGoj8UWsK0lZi+4xFaOQHR4sfc
 8uPeIZl9eLNnYZbYqfKMG+L/n9Tx20WOlw==
X-Google-Smtp-Source: ABdhPJwWMKZKCioVKKxmgSZHmiJXZisrDAeqAZNj5c4u6SoivIjJawOFcVK+knTrh+n2X0gBLJScIQ==
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr7389631wri.265.1639869563628; 
 Sat, 18 Dec 2021 15:19:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l26sm4228297wme.36.2021.12.18.15.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 15:19:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 00:18:55 +0100
Message-Id: <20211218231855.666502-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/adwaita-icon-theme: needs host gcc
 >= 4.9
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host gcc >= 4.9 is needed since bump of harfbuzz to version 3.1.2 in
commit 6861933d22006fbe8c961a41506beac826881f33 to avoid the following
build failure:

In file included from ../src/hb-serialize.hh:36:0,
                 from ../src/hb-machinery.hh:37,
                 from ../src/hb-common.cc:30:
../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
   static_assert (std::is_trivially_copyable<K>::value, "");
                  ^

Fixes:
 - http://autobuild.buildroot.org/results/ef12550581a32c8096f42d05575f0f6ea9411a6c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/adwaita-icon-theme/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/adwaita-icon-theme/Config.in b/package/adwaita-icon-theme/Config.in
index d200570e76..4e5a9f9cb9 100644
--- a/package/adwaita-icon-theme/Config.in
+++ b/package/adwaita-icon-theme/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_ADWAITA_ICON_THEME
 	bool "adwaita icon theme"
+	# host-libgtk3 -> host-librsvg -> host-pango -> host-harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
 	help
 	  Adwaita icon theme
+
+comment "adwaita icon theme needs a toolchain w/ host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
