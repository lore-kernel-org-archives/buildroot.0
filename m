Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D76C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 17:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F22860B0B;
	Mon, 15 Aug 2022 17:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F22860B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjHmN01k51ue; Mon, 15 Aug 2022 17:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D75AE607A4;
	Mon, 15 Aug 2022 17:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D75AE607A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF471BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 17:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51F17607A4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 17:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F17607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZFO8wYs2PAa for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 17:01:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B662605E8
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B662605E8
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 17:01:35 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l4so9710421wrm.13
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VT4NahGT6Hi5NrZfXeYxLH6zAhSYCbjkXo3hzQ8asFo=;
 b=gyv9km1aqFeulgTIQ2jQkyd1OjwwfFBqjySJzKCkGnCHJJExsJRkYX0KF19E0KhXYX
 CxNnC4dUYv4i2LnZPmi0Ofn3L4a8+Zbh8YrZqzKJvd/ZXXPWUIpu+KqHDvbtQ2xucGYw
 srPyUJ+DVhKI3qRPpR6EUehSnzmwIOQ8eJVczRdHi6LQDOHJVYXCrfvkQT9Z6HBe33MU
 gEAw9NZPzUEyhhPcReT8Nt03qOe6GFy8EejEWQmgaEGystz+17V/LlF4OGbJUkBybNpB
 U5hCw8HaG3qJKRG+zxXTCXY+IiXKLG0ocVLdbU/hIw4tg4R+GlC3Cai0aq0copCPMRFs
 3sDA==
X-Gm-Message-State: ACgBeo0UbrBHaFP5VvNhGy/QmyiNK6S16rhbR/CRsmxk4caaakxgbw5V
 7HpGbjO39xRV1Ol/VKONtmIp7Te5ehA=
X-Google-Smtp-Source: AA6agR5/NAD46e6ew8JZBRUocEpdPzr56MZZ8xSzY01iRKVxU0/T8f80elmQcBjHPKT6WhJlom++UA==
X-Received: by 2002:a5d:6082:0:b0:225:a4:d485 with SMTP id
 w2-20020a5d6082000000b0022500a4d485mr4091397wrt.135.1660582894099; 
 Mon, 15 Aug 2022 10:01:34 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0016e6c61061147635.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:16e6:c610:6114:7635])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a05600c224300b003a54109a6a0sm10001521wmm.3.2022.08.15.10.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 10:01:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 19:01:29 +0200
Message-Id: <20220815170129.98422-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=VT4NahGT6Hi5NrZfXeYxLH6zAhSYCbjkXo3hzQ8asFo=;
 b=dE3b6Kq7h6KdFfFbeQQHQumX5xleDs+6ZCgZwSXk1q+tAqBZiLCD9heBZNh+XQL5UJ
 2QOA+P/twhkICzdG+NNEVnmXwl0CyDML2xtUEVKwpdkfLQ5OTPdyjEXwBUK9R0wAfBDp
 Z4gKYRU+m09jMMXqeT4x3+dqJChSP9KM128eYCDU5j34ELogf3gtyYxz4OCiNA1f+26y
 i6Le3ByiBjqPC6bnywWCMs6HQ58hhjs4DM3eU2YebU0goCFxPrfCdNddeSm3TeT8Igs6
 7zjn49fq4+trX3gVC8wwq/e89sdxxWGfk2YzL6vZalqesynCUY2XJcpLRhUFBfeGSHPR
 l+SA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dE3b6Kq7
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add opensbi custom
 handling
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

Add custom cases to make sure that a random configuration with an empty
git, tarball location or version for opensbi doesn't fail. It reverts to
BR2_TARGET_OPENSBI_LATEST_VERSION in that case.

Fixes:
 - http://autobuild.buildroot.org/results/b31882b1a7119b2b590cc6dfed44fe515a63a6b8
 - http://autobuild.buildroot.org/results/61866e8941741c9746dcb2c60b6db3b0e5b9a47b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index b8ca628724..c6b3123feb 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -535,6 +535,27 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
+    if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_REPO_URL=""\n' in configlines:
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_GIT=y\n')
+        configlines.append('BR2_TARGET_OPENSBI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_REPO_URL=""\n')
+
+    if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_TARGET_OPENSBI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION=""\n')
+
+    if 'BR2_TARGET_OPENSBI=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_VERSION=y\n' in configlines and \
+       'BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE=""\n' in configlines:
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_VERSION=y\n')
+        configlines.append('BR2_TARGET_OPENSBI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE=""\n')
+
     if 'BR2_PACKAGE_REFPOLICY=y\n' in configlines and \
        'BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n' in configlines and \
        'BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n' in configlines:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
