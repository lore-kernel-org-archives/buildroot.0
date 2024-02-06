Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6781EC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3811682AED;
	Tue,  6 Feb 2024 17:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzHKHX4x0WeL; Tue,  6 Feb 2024 17:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 615A9831C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 615A9831C1;
	Tue,  6 Feb 2024 17:53:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E08FE1BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAEBF831C1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5_-StuknQX5 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:53:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15C8682AED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15C8682AED
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15C8682AED
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:53:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55fe4534e9bso5893922a12.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707242012; x=1707846812;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fHSYML5/5h/wGQAB+O4FST+EVhCXVIgAmsJuEfNkhB0=;
 b=b+YcfFSI1mjeTzGGAiBAgjQ87tguoIgyN8IYS9PzFoTHjcEspim0SXazPeQZexVRL/
 G0U2THoIFe+jfkyIv13mT617unQLqC1GzHeHAFmtMB43vdWoXrIe2U+iIDKOTyQKONUL
 IhY7WpuLASn0vxtvxomoyB/8+pLE4pILHVm/MM7KLJEWJ8RDMbqt3MJv3R918s/6ilzg
 0HeobXpTxINHoCS74GNx7ZF2vdRTOjP6qb7FsXmymLi9ijGkXwePgKslki7j69e0DqVD
 lvbxRBwZLJpkNJ2+9hI0IJiQQlkLww+LdKpXvNslVIXAs4zNoalh0u/R21H0BsHfC6YO
 7vZw==
X-Gm-Message-State: AOJu0YyzT4C404zjg7RRWFAhKln6BQgpouY3A+4sDEoX9DDPYOC0kpoo
 zEjb20g/fFYb8yY2CfRBWLOVuH+d+qny1LYQSqEOfmDeDNsHhMQ2yVxKI2PkWdmBuaXejPVd+/M
 0dK8=
X-Google-Smtp-Source: AGHT+IFRfTkn0yoUVZasfNKOLdFwizqbIhYmkdXx0cje03QJb8PNnspo7iyU2ioGkpNtiogvpMJMBg==
X-Received: by 2002:aa7:c6d4:0:b0:55f:fe4e:1f17 with SMTP id
 b20-20020aa7c6d4000000b0055ffe4e1f17mr2440917eds.7.1707242012639; 
 Tue, 06 Feb 2024 09:53:32 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVECD5wPkbmvLjSoM7fEpDoZfrYRe+YuoKe/LgjPvP2y5NEVnl3Lce1ydkYSZVvvr1jqmLt47Qf9pIFFaHw/l4lMtulSk01UW4gDlasgLvS1O34Ks6HoKb1atcjHSZdjb4dCyFr
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-17-101-122.retail.telecomitalia.it. [79.17.101.122])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05640206c100b0055fd90b0556sm1238961edy.90.2024.02.06.09.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 09:53:32 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 18:53:28 +0100
Message-ID: <20240206175330.570115-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707242012; x=1707846812;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fHSYML5/5h/wGQAB+O4FST+EVhCXVIgAmsJuEfNkhB0=;
 b=BgAdHA2ndDbYVQ7Exk3rS276ZWj0Rr3zNJDxdkG/yfiahuliy4N1NE48JlYqroC6vS
 zYmbnlAu+rqMfXDJi/xt2KdcMPY/ABPwiiomtzzFpaVbfit12SsJwuEqBv0aN24OtG5O
 vbes65OkIqqaMc7S/Uja+EYuIIBgXWEf8lJ4Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BgAdHA2n
Subject: [Buildroot] [PATCH 1/2] package/tinyxml2: add host variant
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
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It is required by package uuu starting from version 1.5.165.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/tinyxml2/tinyxml2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 5ea9e13a4b0b..f53e8d6b9926 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -16,3 +16,4 @@ TINYXML2_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
 endif
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
