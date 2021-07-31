Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6039C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:14:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EAF660F92
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 20:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EAF660F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E0E607A5;
	Sat, 31 Jul 2021 20:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykr8aYr-z8vz; Sat, 31 Jul 2021 20:14:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A596078D;
	Sat, 31 Jul 2021 20:14:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C2901BF34F
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49C034010B
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 20:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7YteVeP7lagO for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 20:14:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08C93400C3
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 20:14:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d8so16097917wrm.4
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 13:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pV2kuwhaXEzIiYwc4NLZAudoUJgqLczopyezF5ywzAQ=;
 b=fPhmTlZ/JxuB32jz6DW/1UOF0oMefRKXSd+2ETLRU8DVTWPHJdKdnKOJwMUAqszhNh
 PiBbVaQ6bGMzI2db926qDU9S7q6AL5fZsidOeq+WCn1oj9uQKaut7YWrgu0A4sIfz8G/
 D8ftlO6ENCwZcJZdUqkkbIBNp1X0R/aUVNE71IebJQMgq77qlp4YK1QA0p9v7JZ6OghB
 JSQMK55bo1tYZlA7zkjQOLNXkLkOPhjKACvfjITy0MGtUEzACyeFNllRZkKYqAy19I92
 lpZPAy7cxmgFoVUYc2yuaZAxdg1c4PhNbSBBEV4AhMTlQ//1Wejh1Yng4CIr42Wpbr6J
 uVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pV2kuwhaXEzIiYwc4NLZAudoUJgqLczopyezF5ywzAQ=;
 b=KzpSW8Vh4JG82ymSDtF/5bp+tXJ3W+NABqQSYKPNtnVTzv3XIVVZXzNwnvGfon67nA
 AxtkfyGs+0SiNUQI/oT9HzVyKSZEnJbrZxYTR95Iw0KxDG7ihLmoLRLPNsvB2o/R4HpT
 gFS4KEnOcsi2c1L41tpPTozWuL/pK013fbZbMsZSCm3cBZX7Jo7tMYGBiz34S9n6QfoA
 ldha96xSSS94z1yHpw7FlQaM8mF5io3kF19pxwS6TmJZLd58E3fox0PNKcf0QYNjhNux
 R7FQLzhjsl4VXgTz8HmxJzxLKx4nGxl13NHD+1zmh9l4doxXNDB+ogVa9+p9Fvm9b9Zj
 zivA==
X-Gm-Message-State: AOAM5335PWE4JiFx0R4trvsVbiGGhIpMlUh2IMDzbmPTWjEikhosL4ld
 Tzn4S4lfsCImxzWAtOmY/iR6tC1n8kh0EQ==
X-Google-Smtp-Source: ABdhPJxz3tHfJ/Gezp67P7WLhXPnb/1q9V/dm4w+KOQCooI2aJ+KgsQyay+8POFZt5HJJ4fZr7WApg==
X-Received: by 2002:adf:f351:: with SMTP id e17mr9590617wrp.360.1627762449860; 
 Sat, 31 Jul 2021 13:14:09 -0700 (PDT)
Received: from kali.home (pop.92-184-116-174.mobile.abo.orange.fr.
 [92.184.116.174])
 by smtp.gmail.com with ESMTPSA id e11sm7193886wrt.0.2021.07.31.13.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 13:14:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 22:14:02 +0200
Message-Id: <20210731201402.1237061-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/privoxy: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for privoxy is added by the services/privoxy module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/privoxy/privoxy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index adb5af28ac..c1859ed5f2 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -13,5 +13,6 @@ PRIVOXY_DEPENDENCIES = pcre zlib
 PRIVOXY_LICENSE = GPL-2.0+
 PRIVOXY_LICENSE_FILES = LICENSE
 PRIVOXY_CPE_ID_VENDOR = privoxy
+PRIVOXY_SELINUX_MODULES = privoxy
 
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
