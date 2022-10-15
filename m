Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CFEC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 00:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97123404F4;
	Sat, 15 Oct 2022 00:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97123404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eogRUUfVN-4G; Sat, 15 Oct 2022 00:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6A0C4019B;
	Sat, 15 Oct 2022 00:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6A0C4019B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 858EA1C2744
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 00:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F373415ED
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 00:58:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F373415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TcB78O_lByPn for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 00:58:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FDA8415EA
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FDA8415EA
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 00:58:17 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id h18so3366391ilh.3
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 17:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0cr7FtSQ7QOr2B3ZZGG97tPoru/fRvehCAJBmpa9UR4=;
 b=5NFr8jQ3DoCWaxVxMZxN/IuIL8YQgjXdRap1oJOQ6J0kjXYT6cq6Z93UVTBtRPYnXT
 4BfeVq9hQsr9x+FC0F6bGLswdpzZTAzBNDqrBy+VEANaWEcKe9zirSqOgII018DOCkzF
 5QUodee+nsrf3yCHDof3iUMCKTI2F0NZI5j0sd+EXKSnPZ43BCCrhUgfINAPaSocaklc
 Pga2QxSJ9zsWOL+i0L71q4P+AHaMVvzy+e/fpasFyRZ2eypVLHOdQRLOfXqECsflENNM
 wopdl5AjrrCEiWuatAYfMYeh9zP18jiruAIlk5bmRNR5E90G00IXgkbxOxKROcWPPQIh
 8StQ==
X-Gm-Message-State: ACrzQf1urYVdocNbvPek5A7SuG917PnAuYlFh0VikbT7/xMM96bueY0/
 xnpoDeNM3m3xocTT9OCUAjAN8koKk7zqMQ==
X-Google-Smtp-Source: AMsMyM6juWzN6C9NDcIFb5IHY8aL5NrpgpjCWLUhvbSpHalQ0/IZKboT55ZWh0rEjs092KoumQksDw==
X-Received: by 2002:a92:c561:0:b0:2fa:3ca6:1672 with SMTP id
 b1-20020a92c561000000b002fa3ca61672mr180943ilj.23.1665795496621; 
 Fri, 14 Oct 2022 17:58:16 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p7-20020a92d687000000b002f86a153f42sm1373744iln.65.2022.10.14.17.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 17:58:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 18:58:13 -0600
Message-Id: <20221015005813.4055238-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0cr7FtSQ7QOr2B3ZZGG97tPoru/fRvehCAJBmpa9UR4=;
 b=LSVrlwHUSw5vk388N9dopnhM4ZjRMofKq9Hrt8CzmwYZynxY1emWypP6TdNxSEfbPU
 FRTSZ8z54l/PqaMNexdkRdGJRRHjbnWFhSjg+Nv5axoZqivQtYUpCukZzXmkSe0glafS
 QpyMzjVsAinwqiDaXBB/sy/mzKlUN/rSkTAgeIAtxkTJYwaSnAm0TFEbXVM8TstNvm7l
 EuXzL+2YTP3fFkQzUvFA5XXCj/xIwO1/jELjroA5xaWWw75YEmyROwACAAvh91xZxKdS
 RrHwNWrTi5FVmvjgyfqznI2Qu3TY1xXAPBcRFhqfgw9/zoqpe7so1OW/csCo9Q3lYLYy
 Ii+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LSVrlwHU
Subject: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The bearssl package is not compatible with parallel builds.

Fixes:
 - http://autobuild.buildroot.net/results/5e1/5e1b72db206b2d17fa5ce378a70fdc2f3f5bf773

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/bearssl/bearssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bearssl/bearssl.mk b/package/bearssl/bearssl.mk
index ff5f4e87b7..c2a5760af5 100644
--- a/package/bearssl/bearssl.mk
+++ b/package/bearssl/bearssl.mk
@@ -24,7 +24,7 @@ BEARSSL_TARGETS += lib
 endif
 
 define BEARSSL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(BEARSSL_MAKE_OPTS) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE1) $(BEARSSL_MAKE_OPTS) -C $(@D) \
 		$(BEARSSL_TARGETS)
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
