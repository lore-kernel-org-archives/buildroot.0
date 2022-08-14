Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53FAC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E8EB83F0D;
	Sun, 14 Aug 2022 23:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E8EB83F0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gdgrHLHuIR3p; Sun, 14 Aug 2022 23:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0AF683F0E;
	Sun, 14 Aug 2022 23:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0AF683F0E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BFD71BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0672560C09
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0672560C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SblvklrLXaUn for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A193605AE
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A193605AE
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:24 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id 66so5849322vse.4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6QqsaAq718DaNV0dQeckP+Zti2UggbbOyc+Mc2Y+e68=;
 b=w2/2j473hTwXjS7uIiJfCRt3v/p9RSVaftttA/Pwypis5BRGtNJX1n5kEOzn1uBIjU
 T+HsibYzL3xNoi3eJ4mIFiCsnYThDP3CjkUjlJsWYERwUALlvhHfbTfIGyswdUU4gHjC
 L/RJHQJXHr9FLXpNHhin1MKEeGKxUfcDk8lhMkF+p4ocxODNvTKLk0Eg5gdc8yJu/MHJ
 k5vp/JQB2TLsZUgiAzxgWeEq1WkuVf9g3S5BlPMAsO7+OCM2sjjGF+/MQ7juBlJIbgv1
 Jxq4yj8/n0mnQPei4ZK6iBxdSfXlobwodRZKJJ0CzjSoQj+DI4s1koBRX3I0aNHYtLUA
 yDhg==
X-Gm-Message-State: ACgBeo2eGx5zpVeKP0SujROvtyBG3Z3tnQKSWIfQp3Zhvvh1GnfVKOgm
 ysDU4VeKiNojSKLeJRDlGKUh9oEaODI=
X-Google-Smtp-Source: AA6agR6zMhnoZk0rZ3UlFerkvVARU1W64I08e83dqvshNKsdi1UQarbrWu4eVu2N4imGOR7bD8MQpw==
X-Received: by 2002:a67:dd04:0:b0:388:5a2d:3c5c with SMTP id
 y4-20020a67dd04000000b003885a2d3c5cmr5034910vsj.26.1660520423285; 
 Sun, 14 Aug 2022 16:40:23 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:22 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:38 -0300
Message-Id: <20220814233845.2247022-27-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6QqsaAq718DaNV0dQeckP+Zti2UggbbOyc+Mc2Y+e68=;
 b=DfIuerfDywzOWLKBSH/CJEkJt/SpOiIxl0nwq60gU7GOaMThfYtNskC641Ji6gv/0O
 bAR/onagoCQNPyiWjW/xb7ceLVOSHy2Q4SO2LAHfmDEHzIgYs0zVaTDyvPNc4RZbCR+3
 kFThMj6OtEC5C2bB9N/vyfgBIhgQwrb9+2NY5odl6lc75fUF+ri+cF3sImcc8yglKmVu
 cHM66lVpTe4cAW9CQ7uRwI1zk0ls+tupUVD0sOAH0fJa9GbXqHOif8rd+QVbbIEZ/+pf
 AJ2bomca8IaT5sJwe5kfrsqu+DzCfD2pfP2xCIbRwDywVFgfDO3hG1LpCGY7XpFRLFnV
 UscQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DfIuerfD
Subject: [Buildroot] [PATCH 26/33] package/ranger: drop bogus
 BR2_PACKAGE_PYTHON_PYC_ONLY
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
Cc: Thijs Vermeir <thijsvermeir@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The symbol was removed in commit:
'306839586b package/python: drop target package'

Cc: Thijs Vermeir <thijsvermeir@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/ranger/ranger.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ranger/ranger.mk b/package/ranger/ranger.mk
index aaca43862c..91b30f216e 100644
--- a/package/ranger/ranger.mk
+++ b/package/ranger/ranger.mk
@@ -19,7 +19,7 @@ define RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
 	$(SED) 's%/usr/bin/python -O%/usr/bin/python%g' $(@D)/scripts/ranger
 endef
 
-ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
+ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 RANGER_POST_PATCH_HOOKS += RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
