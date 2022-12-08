Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0909CC4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 07:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A18460B32;
	Thu,  8 Dec 2022 07:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A18460B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DdvXvGL7qZeo; Thu,  8 Dec 2022 07:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA3F660AD6;
	Thu,  8 Dec 2022 07:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA3F660AD6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 002C51BF41D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 07:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF98740339
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 07:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF98740339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MVduDTH-WMO for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 07:29:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6E7A400D1
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6E7A400D1
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 07:29:14 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id x22so1797474ejs.11
 for <buildroot@buildroot.org>; Wed, 07 Dec 2022 23:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=naq+dTBXHxCH95t1bOz4CCmLpVhc7jTbfukVzvkZvpQ=;
 b=CZPODxua0yQzu5qKdICBZGlg0FEcH5CrfprJtC+2xf2UXkk/cdEQGh8kj1v11Ue2ZK
 bjRQGVHOF8OXyOWhjLGxM38NCUVXg7TUAXLDcmi960UtZYUKEwqOODGJix9yUdqJ0XvT
 xb0qrzNA5xfEQmB8UEajRcAGV9Ev/ymevK9r9XHVIhKIkEYgmZKklsKHs8jp/HtxK804
 yYIMNxQ/8gL534Mw2VGOua5gds6FsiqaHHyIEphqDNy4O6ZKoL2FgXLxXXVJxPA8Lea7
 OLbH8KUtit9NxNs9MUcG0x0DMlkJs+B7co0NP5jDUZm+FtLIbcGncK8sQObcX4bg3Jsl
 NWAg==
X-Gm-Message-State: ANoB5plYNyttqcr62saPKgNWTz+8qHz6DrD0ItppDa1T78wm/KIcqtva
 7syyde7tmdhnlUJR6LlibepU586P9vyoUg==
X-Google-Smtp-Source: AA0mqf6daVYvcbK7tGJMWCU7Ur0hyHb0gDidLOqfnMEifoOfhxjGSOuP7CurX+F/NgMO2ebBa9+BlA==
X-Received: by 2002:a17:906:9c94:b0:7be:27ca:21aa with SMTP id
 fj20-20020a1709069c9400b007be27ca21aamr1290685ejc.43.1670484552402; 
 Wed, 07 Dec 2022 23:29:12 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 vs19-20020a170907139300b007bee745759bsm9336300ejb.20.2022.12.07.23.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 23:29:11 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 08:28:44 +0100
Message-Id: <20221208072843.6806-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221208072843.6806-1-heiko.thiery@gmail.com>
References: <20221208072843.6806-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naq+dTBXHxCH95t1bOz4CCmLpVhc7jTbfukVzvkZvpQ=;
 b=jt2jPFJUDoMGtn7KNgPmstStcQKty72i89zy7eqkHr4x3iJPRT3Ye/BkzawtwaP0id
 To5JJ2fkkgvuMfgPbrJ5U5PnCBqgSuIrpczb8pRJR53n1PX1SoFBLce7lQ8tTxm8wxh0
 6xG9MxpzAbGwectR7XDy4PxCy6WNQ7AoSQS4mzCq/K41il42RHjlawFNkuoiO/G7tYre
 3vwYDUXG1dS0HImDqJRRDUWYP6xluWCplmHOydukl6w8s6cgA0gvHkPYy29fDkfTd9kf
 py73rNj8DAnjJP3hORI0404qMUgbwUJGWFbrDHkQYhCbuqn5U2gxV97jhVCc02lcFan6
 bRSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jt2jPFJU
Subject: [Buildroot] [PATCH 2/3] package/libqmi: bump version to 1.33.2
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
 Heiko Thiery <heiko.thiery@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index dee2a94d93..79fcf08a12 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  b2e0285690f94fe6d0cc3c422514117b187c8ddb90133c2900993e13343f5a5e  libqmi-1.30.8.tar.gz
+sha256  0a9c0209a0d62706c05f8e585812956924d7930a25032e1ee93352c59317a00b  libqmi-1.33.2.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 6b7f45729e..ee1e424a99 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.30.8
+LIBQMI_VERSION = 1.33.2
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
