Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA181C04A68
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 00:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9702083E3D;
	Fri, 29 Jul 2022 00:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9702083E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrlQ5wskqlAv; Fri, 29 Jul 2022 00:10:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A416982B8C;
	Fri, 29 Jul 2022 00:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A416982B8C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A01E1BF397
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5170082456
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 00:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5170082456
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DA-Q_j0Sp9QI for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 00:09:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5CDF823C0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5CDF823C0
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 00:09:46 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d3so3167781pls.4
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 17:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nr3YPCtDMn+ohID6Lt60pWrbG+BUNTlvWWoldalLUs4=;
 b=wwKWcB72TBrRUoB4qYkETbfWCFUA3zmVnE7mnJVX+V+wSYMGcdYqNApGNmaV+mKsm6
 pa5TyuGxxw2kAgMAUfML8Rj8UgCwk5I4d+4U86c9cIG8+bqhR/RhBeYkAXGz7RS8IsaI
 PonybLmY1ca2zjDUK1xkf8xWRiPnA3BgcJA8GG60vcflbjPbR+8KQ3cAdNGKmVxOEl46
 odzUhVFRv5sDo7ly1PA6ExUOJDUszdu5E7yfm2Z4iC/CR7cR5RdfWqBKUAAKG0N+FnNp
 HfGhJXTNtJUmh9B13wbNpLEgBhvmcCI4He2Vrfu8/z6VMRCEvzT9BvzVFiGkHBY3Eg/a
 X1ow==
X-Gm-Message-State: ACgBeo2BpReQLYiuhlPAwT/CB752G36rQ+Z6pbtY5o/oBu3yKO6FPI1E
 rx7wCYM1pbvmFj7fP5wmvVxlkdqa6Y4=
X-Google-Smtp-Source: AA6agR6zx0rgPbJy2zuIvpHFqStKr+F0yKCJ06LMqYWFXxVw+iNyAFwO1FyREWI5lH/A8vhoQVAXMA==
X-Received: by 2002:a17:902:ee53:b0:16d:b41f:b7c3 with SMTP id
 19-20020a170902ee5300b0016db41fb7c3mr1310786plo.36.1659053385513; 
 Thu, 28 Jul 2022 17:09:45 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa79f99000000b005292729cc5csm1332275pfr.160.2022.07.28.17.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 17:09:44 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Jul 2022 09:39:02 +0930
Message-Id: <20220729000904.1295295-8-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729000904.1295295-1-joel@jms.id.au>
References: <20220729000904.1295295-1-joel@jms.id.au>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nr3YPCtDMn+ohID6Lt60pWrbG+BUNTlvWWoldalLUs4=;
 b=JxbzRocgw0fASXX6wuncxFlgveBg0s/I7YIUIHmwgkoO3T1mP39JoNr1mN7MOZlzTs
 GorCL7Vz1fOb5J9/oUAjsGNheCXNbNMlf9nQ5UKcNXxv6yvYyUBYSQuavG6VCl6ABcQy
 vYIrZLRjClRpEbx9DB4OiK3wmGkiq3FZaPbKlYnJodIeV0KP5hRCVqbePeV1q1SRE/lS
 rElELivaIgIS5G9WZJ+pprGqPmNC2Z3KYQr0+RIqh5u9lm4flziMoxBrXhU0rFQSxOBr
 e/hIoQK/kI+FRmltnysulwNk95NuVqUaxVBtCk2JnpxZjkGWOt9hOyM3xm8uLW8vTixo
 PKnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JxbzRocg
Subject: [Buildroot] [PATCH 7/9] package/mesa3d: Remove force disable of
 power8
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With "arch/powerpc: Enable powerpc64le only on CPUs that support it"
buildroot will no longer build a toolchain that has broken VMX support.

Remove the special casing so the build system can do feature detection.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/mesa3d/mesa3d.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 96520e2efd23..955402dbb7dd 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -26,8 +26,7 @@ MESA3D_DEPENDENCIES = \
 	zlib
 
 MESA3D_CONF_OPTS = \
-	-Dgallium-omx=disabled \
-	-Dpower8=disabled
+	-Dgallium-omx=disabled
 
 # Codesourcery ARM 2014.05 fail to link libmesa_dri_drivers.so with --as-needed linker
 # flag due to a linker bug between binutils 2.24 and 2.25 (2.24.51.20140217).
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
