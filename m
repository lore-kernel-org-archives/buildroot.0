Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A58C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 00:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E897E61199;
	Thu,  7 Apr 2022 00:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYYq0sOpGDY3; Thu,  7 Apr 2022 00:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0194F60F41;
	Thu,  7 Apr 2022 00:56:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 987761C1135
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8652C40570
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UVtJno_QPrRj for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 00:56:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD43040500
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 00:56:30 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id f10so3494603plr.6
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 17:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kzSJafxD/867Fw06E6oFy+AMGGGNnOmjzEQZHlW9dj0=;
 b=dNo8+gRu4A1c0AQWRB5EjIXzr9ArYREc2vUZk7bgp89LQxDjDv+wUl2vMAlrmyDr0E
 5UzCH+vmApMPs4/Kjaf5D6AE3/dD48o7xFJRHVM3Xp4Z0tJjUEVczvO4qi15VFtKa+vV
 78Y4kc6VKku90zcrLPojxqUajEq5xI8TcpHTmmdRfL9eQ65fd/cjGxTG0hOX6KVTcR0b
 /O6eQX8h+44z4KgkeFkoYCkkhSh93NrzHAvMYujhpmmSER0H/bJh+bp6P+UYCQ/edf6D
 0gvxucLTIZpuMLKPvcdFURvDna78REk2haQTsnuunjIYLzvjBGYu+A9jWJnLEVhg18fM
 fiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kzSJafxD/867Fw06E6oFy+AMGGGNnOmjzEQZHlW9dj0=;
 b=FoLcPSS766cyyCV6ESKFxZu3d3iEfRv0yLAXEwLGhgSzCtkfgN5Q/bF+m/+mvztBuY
 kjNPDxMKc85LQgorXO8NXmS0AnfoubXQYk69hqf5dJicWiNvKq3qS64uQ9loGbknPQPt
 Z0Hs0llqnlwEa3MpFsAo0npHR/uVgPzSx7oJHFEjEJe/QPCOp7ZhhhmBRfGXB6GHdaEx
 DHIJ8u9jVbJKEIkzDUxsK2cGtrZdszSLkIlEcWAG+BBXOHaInTeI6yP3pJAEMzHgXPmQ
 1RZhGajW3KVHPkHPIXTahRPukhKjj+4WTukA40WZlMZnukXVcUh3moVQuEO4J0x1lhsl
 SLRg==
X-Gm-Message-State: AOAM532yCz6Rk0ZkrS8ZR8GliRugv9x4mTnCboeyYYr4Sv1y/Gm3rup7
 7+yg9H9XLjMKx8e5BBIViBlJoQywPVs=
X-Google-Smtp-Source: ABdhPJyyGK+xiYR0wWqobAxiDa5XENN7wamcfqjXVKJVAnZul4V0f1lfILVK+xQ35rDqmxqCfOPfFQ==
X-Received: by 2002:a17:902:ce82:b0:156:bb3c:3297 with SMTP id
 f2-20020a170902ce8200b00156bb3c3297mr11009595plg.159.1649292989624; 
 Wed, 06 Apr 2022 17:56:29 -0700 (PDT)
Received: from voyager.ibm.com (cpe-172-197-129-163.sa.foxtel.net.au.
 [172.197.129.163]) by smtp.gmail.com with ESMTPSA id
 x12-20020aa7956c000000b004fdf7a4d49dsm13067804pfq.158.2022.04.06.17.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 17:56:28 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	fontaine.fabrice@gmail.com
Date: Thu,  7 Apr 2022 10:26:07 +0930
Message-Id: <20220407005608.203359-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407005608.203359-1-joel@jms.id.au>
References: <20220407005608.203359-1-joel@jms.id.au>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/libnss: fix build on powerpc
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Cyril Bur <cyrilbur@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Set NSS_DISABLE_CRYPTO_VSX which is available since version 3.64 and
https://github.com/nss-dev/nss/commit/9dab43371d4d924419523e18ba84f02804880533
to avoid the following build failure on powerpc:

cc1: warning: '-mvsx' requires hardware floating point
cc1: error: '-mno-vsx' turns off '-mcrypto'

Fixes:
 - http://autobuild.buildroot.org/results/6bedb5b658f6c9c16c26c73a524a995e5e84fcc8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: rework to use BR2_POWERPC_CPU_HAS_VSX
---
 package/libnss/libnss.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 2f7a2651363e..318b6e305724 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -64,6 +64,11 @@ ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
 LIBNSS_BUILD_VARS += NSS_DISABLE_ALTIVEC=1
 endif
 
+ifeq ($(BR2_POWERPC_CPU_HAS_VSX),)
+# Disable VSX if not supported
+LIBNSS_BUILD_VARS += NSS_DISABLE_CRYPTO_VSX=1
+endif
+
 ifeq ($(BR2_ARM_CPU_HAS_NEON),)
 # Disable arm32-neon if neon is not supported
 LIBNSS_BUILD_VARS += NSS_DISABLE_ARM32_NEON=1
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
