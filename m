Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EA3C25B5F
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 06:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3751E40158;
	Tue,  7 May 2024 06:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVQoowqz0a_c; Tue,  7 May 2024 06:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EEFE402F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EEFE402F7;
	Tue,  7 May 2024 06:45:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A9691BF34F
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 06:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9526F402F7
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 06:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXIot58DXExs for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 06:45:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 438CD40158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 438CD40158
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 438CD40158
 for <buildroot@buildroot.org>; Tue,  7 May 2024 06:45:26 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51f29e80800so3002084e87.2
 for <buildroot@buildroot.org>; Mon, 06 May 2024 23:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715064323; x=1715669123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9H0o5J9W7WwEkt831fNi+jwR4hlUR+jzbgEfNq8TFfc=;
 b=SNgn/SJ+52JEBN0EuaB/fPN5+AmsQaz9AzEIHKyQ3GYO41oNNacKeBgBtwdrNYqI0P
 gUUHLxrq4RBk3JHAqGhNk/dabTl/Bd332xFDAtDz8Fg6mnaqzIU2nbHPxkRDqz5DFgHs
 ZrhtcGD4vnMn7B4OfyThyb9V5PFncBX5FdMLzxjDLJzECown6/s8JFQrTDnnHDZLaSyU
 VOKQ2bdSgJ0UMnf2q/SkIXpzoCIami072aOodNr8FT3uaty1fniEhlO5GjtHM+1piG7A
 L2jwYunROfS0Dt1OrDZwkH1AeR4K46zts4AxtSDHc6fczaNe0VMiK+tVBEBq0/I13Btz
 toFw==
X-Gm-Message-State: AOJu0YwD7sja/y6AGOxohwAc52TQLtzrsHbMBNTY1Y6kiEofVYNa03y/
 0KbUJBOyzaoK0pth31twQmnyj7PdzuDXdTvv6b7HduwPJX2Ms2vSg538/A==
X-Google-Smtp-Source: AGHT+IGtq+JVfNQm0jIB2Nb99atceKlrXwSyyemttlQWhf5KDHmPNvQ5pPUZYiqa5JE2PXaE3glc8g==
X-Received: by 2002:ac2:4a78:0:b0:521:4717:46e3 with SMTP id
 q24-20020ac24a78000000b00521471746e3mr207273lfp.60.1715064322642; 
 Mon, 06 May 2024 23:45:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 n12-20020adfe34c000000b00343d6c7240fsm12176737wrj.35.2024.05.06.23.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 23:45:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 May 2024 08:45:20 +0200
Message-ID: <20240507064520.25653-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715064323; x=1715669123; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9H0o5J9W7WwEkt831fNi+jwR4hlUR+jzbgEfNq8TFfc=;
 b=m7U+STJPBX7jQAYmNfBjyo7v0VimZ2lWiKGeEKre+qvdzELtSmPHmPTJl8Bol1m3Qu
 +AHEXDzMhrDYij/4VnL//bHaUe1zszBLMt8vkuMR4RqfINP104NObe61lGTP83M/ivPD
 ubqFcFw6rQHOUX8HNqRnfQsSv05eYmWkYeoOqU5i3hsTxQjsDV9PIe6n0FiIsogUqptq
 Yh+5zYMhKjlsZCZj38Eke/IFb5273KYfFRF3nwEUkacg5VY/fw9R9BtPoE34Dd6/J391
 WewysLTgdvKfSqG6MFyARNUoNtMC9tSu+N+DFPeFWURG9oNAhQrHKqYOy6fIy2PNd4kp
 X3Qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m7U+STJP
Subject: [Buildroot] [PATCH 1/1] package/libgpiod2: drop
 host-autoconf-archive dependency
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
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-autoconf-archive was added to libgpiod in commit
8df6ae3127ccdc0873df2246b32918e846b074c3 because of a patch to
configure.ac.

It is not needed by libgpiod2 as there is no patch since the addition
of the package in commit 57391fad2e619395340b81957ddceab1b1df2e20

Fixes: 57391fad2e619395340b81957ddceab1b1df2e20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgpiod2/libgpiod2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index 9c478f1ffb..856eb9bd14 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -12,7 +12,7 @@ LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
 LIBGPIOD2_LICENSE_FILES = COPYING
 LIBGPIOD2_INSTALL_STAGING = YES
-LIBGPIOD2_DEPENDENCIES = host-pkgconf host-autoconf-archive
+LIBGPIOD2_DEPENDENCIES = host-pkgconf
 LIBGPIOD2_CONF_OPTS = \
 	--disable-bindings-python \
 	--disable-examples \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
