Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C41C197A0
	for <buildroot@archiver.kernel.org>; Fri, 17 Nov 2023 16:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A287841C20;
	Fri, 17 Nov 2023 16:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A287841C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDysIsgUhauV; Fri, 17 Nov 2023 16:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF7F941C0F;
	Fri, 17 Nov 2023 16:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF7F941C0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50F3D1BF31D
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 16:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A619611CF
 for <buildroot@lists.busybox.net>; Fri, 17 Nov 2023 16:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A619611CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBiWwD5i0877 for <buildroot@lists.busybox.net>;
 Fri, 17 Nov 2023 16:17:20 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA99B60864
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 16:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA99B60864
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1cc58219376so18752055ad.1
 for <buildroot@buildroot.org>; Fri, 17 Nov 2023 08:17:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700237840; x=1700842640;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LN6zW86m7jOysQhuRyPlye2NKwxI1CVqmQ8t+/w3XiI=;
 b=hjKMcui2JqL+VTcJ5rD5AAFYBTqtsg1LT08pHiBgNg0zYuYVsxtxn9hdrltEOA57B3
 vFsCsSx122QXhWKN6I6lSS1PU6ptre651VxzfWUFSBArX4YrrZwE0O2QwKohaDwjdCCl
 Tt+TpZzh7ASUNpv8nPKCQowuw+tbMKoZIlTLt7mHzEMpY0Duy43dDd+xmbi8ks9du84/
 WjmD+w8hMPRtzyiuAHpEdaxK7LoSQheJXw/SoS1tEgT3X07jddXUjtd55vnh+RMLVxHf
 iAnSUKdOx/2U4Fr0Z7fuFo3G7Rzz6oAd6PKWj4chn/A6olqemynutTWQ5z/8K7SEtw9K
 AdWA==
X-Gm-Message-State: AOJu0YyC2tQjKkU7iRw6iEoL8o7251znpuLOmXz0AGVH2pWDKmtKxEhE
 8m6FsgdZ7HYo+czQRDhrcMfBh9hwnRpn2SLQ/7QOQw==
X-Google-Smtp-Source: AGHT+IF8KOEb6nUtH0eEW16xcn5le0knEBt8+amQWPjOUXV7EfatuzpuLhNfyUvLZG/cTRWko6jGOw==
X-Received: by 2002:a17:902:8b85:b0:1cc:7f53:c190 with SMTP id
 ay5-20020a1709028b8500b001cc7f53c190mr12380116plb.51.1700237839741; 
 Fri, 17 Nov 2023 08:17:19 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902d38400b001ca2484e87asm1542315pld.262.2023.11.17.08.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 08:17:18 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 17 Nov 2023 09:17:16 -0700
Message-ID: <20231117161716.1602741-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700237840; x=1700842640;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LN6zW86m7jOysQhuRyPlye2NKwxI1CVqmQ8t+/w3XiI=;
 b=aXnbGHJg3alfvOXJi3/amSlNn6b4SsqClqRDj4x6+nW1S78U6dIry8Ebti0hamA4qA
 sqP6dGD1gatkeO3FKIuWc+839l/NOCtlKSXuRWgvV2uscuKMlQBD+cjrqk8sdn4SbKHF
 EEW1yh3uYQzxbVCSJNv/yJHNCmDnLzpOVz0ic=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=aXnbGHJg
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 254.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All tests passed in Debian 11 with the following command:
./support/testing/run-tests tests.init.test_systemd

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index f0c3db60e7..c0f4638803 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  41873783aa1c680e10d2f2626797a1c2fef8018d69b68c8c77639e140ee7846d  systemd-254.5.tar.gz
+sha256  1e1e42c597b4f992679aa964a0c5c23d970c58fed47aed65c11878b332dc5b23  systemd-254.6.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index ccc0e14874..4746bda904 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 254.5
+SYSTEMD_VERSION = 254.6
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
