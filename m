Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04255C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B03D5418A3;
	Mon, 18 Dec 2023 18:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B03D5418A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEb_FCd3Y-VQ; Mon, 18 Dec 2023 18:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A031416E7;
	Mon, 18 Dec 2023 18:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A031416E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE6161BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92EEB4056F
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92EEB4056F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4N4zX7Cu3kV for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:47 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA61040527
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA61040527
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5c66b093b86so3271775a12.0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925686; x=1703530486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gogUl8FrUsML6pp7BoWFQ+ZqZf/aAUl+cYIbaoXvmwI=;
 b=TgkMoBOSLQcoEtyJEMaSyjEZTqJ2MphbfNsgD1fubJr4rw+XX8k195W2zS50Vs7W4b
 D6DBfiQ/rHD3mjlj+NMfjMxRMZN9S6iWQb6SeteiIsq/w3u7SXJaq5LWTeLZ2SRT1zD5
 qCPVIbvFYZNsDqKCc1iy/vmPzcIvaSI117osv8YgrnlRvksSi7wmJ+9MHEvxiGtXHYr0
 lSrCQch034tY8Dc9Hsqpr/ykqngUlgXaFD+KuiTPteOkmWWsDZb93BDBOgKzEiHGV7Hp
 gRCMS2Fmb/kMsiw6mxth3QO63bgetMSMKd52kIh/OuRL/6ZSc67HVbQvWxeB9PPJXZVJ
 D9Rw==
X-Gm-Message-State: AOJu0Ywxmz/p3LgCwD8HnT00gdVNwY0kAlK0L2DgrfMWK4wQ5LfnmjQs
 t1LJGxE8g1BJJjI4uM+U84vAplrnYcHZp3eDDx4=
X-Google-Smtp-Source: AGHT+IHtC5FLL6qQozbDkDtx8bErk8cAQNtJz1yIrhjE6bNL9i+YhkXrNf5HX61xxcHv74jLGmnAug==
X-Received: by 2002:a17:90a:6bc1:b0:28b:664a:807d with SMTP id
 w59-20020a17090a6bc100b0028b664a807dmr4320088pjj.25.1702925686617; 
 Mon, 18 Dec 2023 10:54:46 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:45 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:30 -0700
Message-ID: <20231218185440.506995-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925686; x=1703530486;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gogUl8FrUsML6pp7BoWFQ+ZqZf/aAUl+cYIbaoXvmwI=;
 b=NalKHDcVeAZtwDcd7s56aG2dfoiUV+lRxKHDan4k80w1zzL5EnXLXLEEaotkDuLUqw
 qaFn16S4S9ae/QvokbYToS/pThaPwimfQcLicL9Sh6hPozKhI40O+cz7o27rnjKZff8m
 O1vHeDKHXx0APlsppDdVYd6oGXQUEfJ+ZC28A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NalKHDcV
Subject: [Buildroot] [PATCH v2 04/13] package/flutter-engine: bump version
 to 3.16.4
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Bump to 3.16.4

 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index d31d435d79..345f6bf25e 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.13.9
+FLUTTER_ENGINE_VERSION = 3.16.4
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
