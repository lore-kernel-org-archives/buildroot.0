Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F11C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 00:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11F360685;
	Sun,  5 Dec 2021 00:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K1aiD6cO5Cba; Sun,  5 Dec 2021 00:54:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E96605C4;
	Sun,  5 Dec 2021 00:54:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 864C41BF966
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 746634038A
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 00:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Ddt35i6aSiC for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 00:54:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C2AA40261
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 00:54:22 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id a11so6611455ilj.6
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 16:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TYimJ3eNxwSDfDr893n7aQz6BdgJxWG8Y9wVTFy8fZQ=;
 b=iDIXcaal3EIXi8dheVYN8sDmoJVWoAkPe8A5ui27/upugxJpuaQ9y/gfXJf82XpzNV
 8eEyE4SM89VbfP1mYxyJ3umoZVUnbPJNlgQ0ZFnrEIkgzWQIUy8tIERbKKJ1mMWAQPtA
 9Dwp5HAvni7BpnDHVZjC0RsaVpyIXx7O0YZ5Pqq4Ah4Z04nEZA5g2vzvKVK/Flb8TEUx
 yWaPmtcCrBZcpPh3L5SXWBv2aFUmfkF73jAFMVqC7YUXhk4t1WzdPmHglA+C4S+/PxzH
 /PJplBUaQ1yWb6ul68UsFHA/OKPYLycdAezqZaAL9rD135fDxWdeEoDQSUAU5szMy/67
 F4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TYimJ3eNxwSDfDr893n7aQz6BdgJxWG8Y9wVTFy8fZQ=;
 b=nAS88bZU8XCHl8XtnyoVGjfxAV2WB4KySwhIj6EnXb3Mac8loWbY+OcmUkzfZxawIK
 lrILsNwfe03e+7JeTe+wcJifXqq+xe+8KtqHOfaAdHAiYSLQ1EiyN3x1k69l84rFfmAe
 0mLOq9DefdjXXPuzW/Ium0/GKcgIAiekvX4V8tdVJ0Na4VqcPkKS5KkCx7BO6hDLOOSG
 bEPKKY8Y8uLK8WrWIVaIPxWW3tuoENA5wwR3VWbbLYM1OmdWZr6PDD8yu0tq4udfB7GB
 /HCxSZXJ9w8yFdnpdjdbUNcbYNEmg3UWG/ZfqT/InLHw6KWqvu9B+McMZfcBYNun3SaZ
 IG4w==
X-Gm-Message-State: AOAM531r3+6JYwTxeV8KCtsngZ0dsK92/hQWJj8JaClr+znPzARM/4MK
 2Zi6bTFTrp8Y+zR9srk2la2uFhPOKMU=
X-Google-Smtp-Source: ABdhPJxgsQQCIJqLyT23d+iagYHUa0fGT+vtjckP1y/nkSubxl9CZK5BK/t2E+77nhOVnrOQCT0i8A==
X-Received: by 2002:a05:6e02:18ca:: with SMTP id
 s10mr25308146ilu.166.1638665661261; 
 Sat, 04 Dec 2021 16:54:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id g7sm3903914iln.67.2021.12.04.16.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 16:54:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 17:54:11 -0700
Message-Id: <20211205005412.2888068-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205005412.2888068-1-james.hilliard1@gmail.com>
References: <20211205005412.2888068-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 6/7] package/network-manager: add optional
 polkit support
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 4ed66c2f9d..14bf0d4dd1 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -105,6 +105,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
 endif
 
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+NETWORK_MANAGER_DEPENDENCIES += polkit
+NETWORK_MANAGER_CONF_OPTS += --enable-polkit=yes
+else
+NETWORK_MANAGER_CONF_OPTS += --enable-polkit=no
+endif
+
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
