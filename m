Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46825CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 21:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD3FF41730;
	Mon, 16 Oct 2023 21:14:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD3FF41730
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsK316b5ddXN; Mon, 16 Oct 2023 21:14:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2693341798;
	Mon, 16 Oct 2023 21:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2693341798
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B432B1BF341
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D78760A62
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 21:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D78760A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zai7f4zSrkWI for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 21:14:20 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3931960A5E
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 21:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3931960A5E
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4054f790190so53654575e9.2
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 14:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697490858; x=1698095658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aG9n9uDD71wgOrAq1fhndqe4lu9rHITzwzpYsl9M7Jk=;
 b=eyNrn3jBUob3fjOuQ+4qNAP4EgHpZ6ICtBXuoxI4UBlW4T+D8+zmfKTUckMvd9+Tnz
 66Br0TceOgY4bFHXlGxIUQh+3rUeqbqg088P51xNfRo0Z6jaavJy3dzMJRMfAbblmzM3
 BhEahO0rVfqY+Cp/9KyfXGdjJEQb6d927/yow7qX4iUvg6e5uijTSbEwCK5rivggdHOG
 ZT6//zUXcekvrEj7x2H1w9fuNi0w5qYrebq+zNrN8xGooj9Ngi54TSnFjwkv9CrHlpsy
 zfrZKR+1cB3QUjzbnCbebqGJDPMeWuR9o1XYRcY5VWzuRT01XhCeGx8og6QJqrOCPUKh
 0AdQ==
X-Gm-Message-State: AOJu0YyKZNBBj5CstCBpOv3r2ncdlD5l6iOa+GL/yueNCBEoIiBqCf10
 rNvjA9sOa5DDorkB7VjByICYhMhtyW4=
X-Google-Smtp-Source: AGHT+IEtM+9ikch2Curwx/RV035ITEEq3NdYsIamXSvAAOon8NqLKBBjhZCqysrYgOj6jfHUUZNBFA==
X-Received: by 2002:a05:600c:5252:b0:405:40ab:7693 with SMTP id
 fc18-20020a05600c525200b0040540ab7693mr223593wmb.31.1697490857576; 
 Mon, 16 Oct 2023 14:14:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t6-20020a5d49c6000000b0032d72f48555sm161313wrs.36.2023.10.16.14.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 14:14:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 23:14:14 +0200
Message-ID: <20231016211414.28406-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697490858; x=1698095658; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aG9n9uDD71wgOrAq1fhndqe4lu9rHITzwzpYsl9M7Jk=;
 b=gbuK2ltMf3xB5B3C242A5cEaK6jjhx8jsWNEoluLJEk4s89nbURpZvY/UJwNi3kWfG
 aAe9j0mzj5hHjO0dTgr7r766If95kerg2dV8HoKa3LWk+XSK0RAcj1z81LIrbcoNCp/K
 a1QMVNHtQQeT2v5kKvcAyL4FDn6QykEp43bfGg1gfZszoTFstCVvjsJu9OxCy8BBA84G
 oXOJuj4BNxkC1J4GatZWtNOd6R4XWNQ5O/jBD+TEJnvC30FoYDwUNH0sFP60EsluCmEe
 8kRAdcYnFA0TfgvOQLJog4Mey4zemNcLYtAbdsxZhLLJfpO75Wzx9FaXryjZhOyqcfYr
 qbNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gbuK2ltM
Subject: [Buildroot] [PATCH 1/1] package/samba4: fix configure
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 4.19.1 in
commit a8ff60cff9402dcd04fffb67af15dfe2caab0995 and
https://gitlab.com/samba-team/samba/-/commit/fb4bb188acfc3e88887b500a05e9e4db8b08aed3:

Cross answers file /home/buildroot/autobuild/instance-1/output-1/build/samba4-4.19.1/cache.txt is incomplete

Fixes:
 - http://autobuild.buildroot.org/results/c1fbfdab11c0521b8199f6a661987eb6076c84d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 124ce564d2..3b1c0b555d 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -118,7 +118,7 @@ SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_REMOVE_CTDB_TESTS
 
 define SAMBA4_CONFIGURE_CMDS
 	$(INSTALL) -m 0644 package/samba4/samba4-cache.txt $(@D)/cache.txt;
-	echo 'Checking whether fcntl supports setting/geting hints: $(if $(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13),OK,NO)' >>$(@D)/cache.txt;
+	echo 'Checking whether fcntl supports setting/getting hints: $(if $(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13),OK,NO)' >>$(@D)/cache.txt;
 	echo 'Checking uname machine type: $(BR2_ARCH)' >>$(@D)/cache.txt;
 	(cd $(@D); \
 		$(SAMBA4_PYTHON) \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
