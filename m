Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FFBC05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 20:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0544541517;
	Sun, 29 Jan 2023 20:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0544541517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y4usVHTITN3w; Sun, 29 Jan 2023 20:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0A55415E7;
	Sun, 29 Jan 2023 20:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0A55415E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 241231BF3DE
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 20:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04C6881772
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 20:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04C6881772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XmPn4DbKyrQk for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 20:04:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03B748176E
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03B748176E
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 20:04:09 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ml19so2980556ejb.0
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 12:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4oo2wr2vOjnSQj6+2rqY0EeOn6xyZ4ccXRJ0MzjF5EQ=;
 b=3lxMoV8r+WTobeMzP3FMV2GGnWxbXoLmP6cmp85aHFp4rzvDbHfHA+heMbLDhZPKCC
 ASmPUp8bi4aioWLdiYiESI5wWMkMRcJu7DNvOe8lI6/B31ui26oI4/Ia8QR9Xkw+zYuj
 jQ+n/wOHO4PkvK0nJ2XsQpDXHz9C1XMJIuHQaFznkC+8ufWyXYs0rl1uEIm2Q75ZqNb/
 sxttWWm4m94i39kd4b997C9Pk/Wiil/1o8UUJNatUiZApPt1h0RKCedIe/C4Ore3T/w1
 j+59sU5s0++FMQS7TK0q5oxex7Gu506SlP27eO2901AqtVSfNgc8NkgzbiGVE4Q76K8A
 pdNQ==
X-Gm-Message-State: AO0yUKWhpkZx8V5xkqcNpdSP183dJsC89mQqP28fMBjhptFputHJCADd
 gBU9/C+BosGKQOfi8mKkdoEVzBg8Ss4v+q2Y3v4=
X-Google-Smtp-Source: AK7set9+G6uPsHQuvYQFVGBY4Ntz8AQ9fEFehxqJCSaX3WT7gNT9TvQIkQQbj15E1NCyG5BEdkSzYg==
X-Received: by 2002:a17:907:7642:b0:888:b471:8e46 with SMTP id
 kj2-20020a170907764200b00888b4718e46mr1081409ejc.50.1675022647877; 
 Sun, 29 Jan 2023 12:04:07 -0800 (PST)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 m5-20020aa7c485000000b0049e19136c22sm5654439edq.95.2023.01.29.12.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 12:04:07 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 21:04:04 +0100
Message-Id: <20230129200404.388126-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4oo2wr2vOjnSQj6+2rqY0EeOn6xyZ4ccXRJ0MzjF5EQ=;
 b=p7V3DD7a9lJNQP5zW1vPjDJ7sA/Ku37TSmgyqCAOUNYQhWSoidcl+kSrJ1RSmvwdwz
 dl0tJl+A+rUDYhXhbFCiDdw2Hu8avwd/SZ1uXThWnvQs7GwSv6ShwdPniKiELJlNKFFH
 yJuCBrbgYldss23cM5CGQfSg8KTs+ie6Y2MMc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=p7V3DD7a
Subject: [Buildroot] [PATCH] package/mono: bump to version 6.12.0.182
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mono/mono.hash | 2 +-
 package/mono/mono.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 8b72ae68ed..1010f6d0ab 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  29c277660fc5e7513107aee1cbf8c5057c9370a4cdfeda2fc781be6986d89d23  mono-6.12.0.122.tar.xz
+sha256  57366a6ab4f3b5ecf111d48548031615b3a100db87c679fc006e8c8a4efd9424  mono-6.12.0.182.tar.xz
 sha256  923c7053ad0d430cd9b0b69a0ccf3abb7170a1ce50ecbf01915b565a35823d10  LICENSE
 sha256  fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
 sha256  2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 219effc5d3..b88f2b379e 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONO_VERSION = 6.12.0.122
+MONO_VERSION = 6.12.0.182
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.xz
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
