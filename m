Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63183C678D4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 09:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C058E605AC;
	Fri,  3 Mar 2023 09:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C058E605AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqVEJPhoyMh2; Fri,  3 Mar 2023 09:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F18006059A;
	Fri,  3 Mar 2023 09:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F18006059A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4691BF354
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 09:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7448F6059A
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 09:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7448F6059A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lm7YLYPUdCUQ for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 09:37:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75CB360593
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75CB360593
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 09:37:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso898120wmo.0
 for <buildroot@buildroot.org>; Fri, 03 Mar 2023 01:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8zCzdBYfNqThDcPbIXqBvHti3N3lzm6dTaHzBBl4vkI=;
 b=X2xJrjUgUny9EMQApAZbtloWX8dAzdzpj3kz2tAzspMScIPShE9ev1PgCe5d0/dc0N
 KqbbakpoZdUlQr4os3SJzjFzZGfpgDLh/R74frXD5ONRbpDju/Pokoa6MKm5VaSLq8P8
 mpmvu/YN3ODNDmyUw7IQk+tIp+0oUQVdqvP2IiHBgN3o0UMyxgn6xcMqyh9EvD8mtKyl
 NnjKdPT0sN2xmAKqbjjBGJaHoz+j7ih8cbenrjLhkr0U9dfYlMm/1LVkhIA0xv6B9/fG
 qsZPphFBmOYa9glaV5VZvlFczC0dmfob5kMnk7eHRIop77hffxz5UN+IhqpSDnas/vqp
 7zTw==
X-Gm-Message-State: AO0yUKUyQjgobbFVigG/J5i2FlFSK4DWEdaFP/pTM+kaepkpdrxz1q4O
 30z1wSeYSg4Z8QgD0z4DZvCXc8qu0XZrJGzh
X-Google-Smtp-Source: AK7set/0rMggO4gcboWpuoxqglYQBO2KFR0Mtn5D+GmSMfI9SQglqwGUtKV/hdA2EjzoljJ479WEnw==
X-Received: by 2002:a05:600c:46d1:b0:3e1:f8af:8772 with SMTP id
 q17-20020a05600c46d100b003e1f8af8772mr1041951wmo.9.1677836276481; 
 Fri, 03 Mar 2023 01:37:56 -0800 (PST)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:98b4:4a16:150e:c276])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a5d4cd2000000b002c551f7d452sm1679615wrt.98.2023.03.03.01.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 01:37:56 -0800 (PST)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 10:37:53 +0100
Message-Id: <20230303093754.2180686-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8zCzdBYfNqThDcPbIXqBvHti3N3lzm6dTaHzBBl4vkI=;
 b=UiApzKCvwepJCxfzFhm/IxmmdH1i3FntLrkJAjTj7oagGPTcY0x5F2RY0rv1wGt7h1
 3RPmYW4TNEtN/mr5tllXaC/drVcBWzkjGZshWkqohulICILIzhFzbFvigwkc7FCozcnu
 ks5Yc9H8o+KXiXIhkQjk4sNbyjhH8B3I1sIm9ImZkqRgdNdCRi/xgS27bb348lQ+mQO6
 BhD8fetQwbRfsyPX62cU//ugowb9dyrOXZg7gk/LDiXM3LVU7gZhwWSlBIB3N3eufhyD
 muwQ1UqzVmkll5bWq51PVV/2teMGncqt9S/UmbZgJetoqHfytr2P0txy5nI/w9SRAB3S
 IsDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=UiApzKCv
Subject: [Buildroot] [PATCH 1/1] package/bash: fix naming of
 target-finalize-hook
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When the target-finalize-hook for bash was added in commit
311c9eebc4dcfb764e3a7082706daf68e0603188 in order to write bash into
/etc/shells, it was done at the same time as for package/mksh and it was
incorrectly copied and MKSH still appeared in the name of the hook.

The hook is now correctly named BASH_ADD_BASH_TO_SHELLS

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 package/bash/bash.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index ec5e2d722f..9a73ed8c36 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -62,10 +62,10 @@ endif
 
 # Add /bin/bash to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
-define BASH_ADD_MKSH_TO_SHELLS
+define BASH_ADD_BASH_TO_SHELLS
 	grep -qsE '^/bin/bash$$' $(TARGET_DIR)/etc/shells \
 		|| echo "/bin/bash" >> $(TARGET_DIR)/etc/shells
 endef
-BASH_TARGET_FINALIZE_HOOKS += BASH_ADD_MKSH_TO_SHELLS
+BASH_TARGET_FINALIZE_HOOKS += BASH_ADD_BASH_TO_SHELLS
 
 $(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
