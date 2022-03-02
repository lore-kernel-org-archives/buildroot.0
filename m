Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46506C433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Mar 2022 21:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB9AA40270;
	Wed,  2 Mar 2022 21:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FaT0rK8bDIdC; Wed,  2 Mar 2022 21:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D6784020A;
	Wed,  2 Mar 2022 21:44:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79A341BF3F2
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 21:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75C4560D57
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 21:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFPlvNB7udjq for <buildroot@lists.busybox.net>;
 Wed,  2 Mar 2022 21:44:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7754A6066D
 for <buildroot@buildroot.org>; Wed,  2 Mar 2022 21:44:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so3699921wmj.2
 for <buildroot@buildroot.org>; Wed, 02 Mar 2022 13:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mj+NfZ09oLUVR12y0tkBQpt29LnbpF33RMTxcBs8p9Q=;
 b=eRYSlyjy1DvOUPyWcte2fuNiNaGI3ZexjFI6ko8cFJAP5x69H8yil6VaVTPZCPRwu5
 E2ouheIhWPfeVGKGePts0GNkJVTfzVTXf/zzWOywsvOwf7LpziWPIB75zMHOLb+uRjAU
 FrN36edEZJbzHB2IuJSkLbL/9z5eW7s+DM+OD4BZ4w8HNH6zz0UZ81u0zH1aC8XhmNe9
 gVaY5obWN4XX4hhemUJxlhPVrq3GCkMfe31YLJ5jACcYghFK/8Kf4QoYP+vBROJmD+xu
 V5GvkqK+9R9lRP5Z3Q5tK96hIXhWl643zzq+IDqHvV0a0cn+/yM8murxnPupVHKIHq9t
 QWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mj+NfZ09oLUVR12y0tkBQpt29LnbpF33RMTxcBs8p9Q=;
 b=bDsjfTZNDxb78Aa4l9mxOQHIfQvrciM0D9AfAMvz7did5s6x6TKE2mYlQiqlUl7P57
 X4RZFR6Br8/HkEcEntrgtYfKvp2fCYMv8LlkKcz9t9QxWZCTuoXIH6kBlXc68gCrfugg
 qUgamSUYhwcrvC3/QY0pewW6UJru4dU68teub+aoXMfO/MxCUxlMFAJWHIYMI25u6hLg
 1BLsx21vHEgaLNyru9qwzYG74EuwR1L9sUdSN8U+UwKcFBhDJDHcPzu02woPPzngHXSI
 2YvDsJNCtTdqcKxALG/iw5zdETqoXHeXQreMzeMlLBvdXOYBX3j0K2MxTFYb3/2PgYN3
 YaIw==
X-Gm-Message-State: AOAM53107PkpS1S24qNkMlZHOYLXah1FpPZZfgrTC4LSZ9z/YA07yoIB
 HEwm1dcCqQCai6HjMEEZLboZo/D77K4=
X-Google-Smtp-Source: ABdhPJy7Fm8beY19+ZojCpZlIJNHl3jxg7gV6mLJfTNkDLy5I0tR3VUnxtBWQoVFbivBvQwuYvO/RA==
X-Received: by 2002:a05:600c:216:b0:387:d3c0:8214 with SMTP id
 22-20020a05600c021600b00387d3c08214mr214635wmi.96.1646257484583; 
 Wed, 02 Mar 2022 13:44:44 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k184-20020a1ca1c1000000b0038617ae5297sm1817171wme.33.2022.03.02.13.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 13:44:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Mar 2022 22:44:04 +0100
Message-Id: <20220302214404.2476680-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/xdotool: bump to version
 3.20211022.1
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

- Retrieve official tarball
- Update indentation in hash file (two spaces)

https://github.com/jordansissel/xdotool/blob/v3.20211022.1/CHANGELIST

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xdotool/xdotool.hash | 4 ++--
 package/xdotool/xdotool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xdotool/xdotool.hash b/package/xdotool/xdotool.hash
index b0d5a7582a..549e807ccc 100644
--- a/package/xdotool/xdotool.hash
+++ b/package/xdotool/xdotool.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256 ddafca1239075c203769c17a5a184587731e56fbe0438c09d08f8af1704e117a  xdotool-3.20160805.1.tar.gz
-sha256 129d156c35b1cb19350f3716129173c8c89e019c0497d9df073db5b801becef2  COPYRIGHT
+sha256  96f0facfde6d78eacad35b91b0f46fecd0b35e474c03e00e30da3fdd345f9ada  xdotool-3.20211022.1.tar.gz
+sha256  129d156c35b1cb19350f3716129173c8c89e019c0497d9df073db5b801becef2  COPYRIGHT
diff --git a/package/xdotool/xdotool.mk b/package/xdotool/xdotool.mk
index 5c5603bd62..c430a49d06 100644
--- a/package/xdotool/xdotool.mk
+++ b/package/xdotool/xdotool.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XDOTOOL_VERSION = 3.20160805.1
-XDOTOOL_SITE = $(call github,jordansissel,xdotool,v$(XDOTOOL_VERSION))
+XDOTOOL_VERSION = 3.20211022.1
+XDOTOOL_SITE = https://github.com/jordansissel/xdotool/releases/download/v$(XDOTOOL_VERSION)
 XDOTOOL_LICENSE = BSD-3-Clause
 XDOTOOL_LICENSE_FILES = COPYRIGHT
 XDOTOOL_DEPENDENCIES = xlib_libXtst xlib_libXinerama libxkbcommon xlib_libX11
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
