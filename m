Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E56AECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4B9C829B1;
	Fri, 26 Aug 2022 12:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4B9C829B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Cx_SSUr7Ttl; Fri, 26 Aug 2022 12:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B6DA827FA;
	Fri, 26 Aug 2022 12:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B6DA827FA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D5F51BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EB45419A1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EB45419A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0P4Nmr1l-FT7 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AB8E419FC
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AB8E419FC
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:03 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id kk26so2950028ejc.11
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=t+VgvIKVX6WJLeXrohUbPy9OzLwFDWGM8kmn+2Egxx8=;
 b=p2rjh++Qc/w9p0zW+p4+mhfYmOoIumucGiOWH0AQCkSxfxneo4ZP593g7WLnXiyePq
 XJt4KLaFlCIbhImUQ5+PAiU9/Ndu86GC3IgrUxZCbGjtmZ1l/t88FY3utHaCKTqvYGKj
 K3Ghfn+9YK36uBeNQ4GybG610c4pcXHq8QqeQGLjOeAYLWNOzfYf28eu3ZHhb+aP7KmK
 AT5sMXEofsyOtAqZU3ZBLrOk8dIK94iPHsfmGZYq3RWqlz8hxoniA0lz+ELjv+bzg+34
 g4d8jxIQpCex4XpN3RN/kcXN05XdReFxzkaxhJtM7c0gJ5mEMMJUAEo+fQq2/El7NZVG
 Qahw==
X-Gm-Message-State: ACgBeo0D0Wj2BD3YThs18n5L243zr/6ZYXvnHMF3RN5/tkdvBu0xbHDU
 PuXB0aJnUx4ztY4CQP2716Zdexe50tWQeRvF
X-Google-Smtp-Source: AA6agR7hfyvKUNcOrYbL1kJgesJuolokyiJ2XzoHPf8FBlSVQZ2LjNyNg+98DKvCj40mwo3Pvll7Fg==
X-Received: by 2002:a17:906:c154:b0:733:197:a8c with SMTP id
 dp20-20020a170906c15400b0073301970a8cmr5546948ejc.483.1661518381267; 
 Fri, 26 Aug 2022 05:53:01 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:00 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:28 +0200
Message-Id: <20220826125252.16782-6-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=t+VgvIKVX6WJLeXrohUbPy9OzLwFDWGM8kmn+2Egxx8=;
 b=MQ1C6+aoAqZtOxPd+0uwaVs+l5WxFMLXiW308CIwO0RxBWtjN0M28y4sB8UnBzrIpq
 YBBidRJ6PodFvOZBqpJYIW9eC3fNk8w87uxDvEvrDN3nCLOlEKvFMQSJX52Z6e3zq9Xn
 uU987ZxImPwPQGSTOG/+hc1XUIOIkP6mXSHFNLHLJNhM6AXcU80vwSyDx3R/TpWaZ+fH
 Wlr99TI03fFlqtLXgzeb8kogjcGGgxaxq2Ri0LJpHBgwwkbWRkhPlAKfb3yFSPpka8H1
 facylbbYJ7PZbyo39hChqp987+AkrWYHs21UNusyA2C34vGZmYdTp+WOiBKs00HjyGIF
 V+wA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MQ1C6+ao
Subject: [Buildroot] [PATCH v3 05/29] package/qt6/qt6base: add support for
 xml module
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/Config.in  | 5 +++++
 package/qt6/qt6base/qt6base.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index fe488f1cc9..41c04fc5f6 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -27,4 +27,9 @@ config BR2_PACKAGE_QT6BASE_NETWORK
 	help
 	  This options enables the Qt6Network library.
 
+config BR2_PACKAGE_QT6BASE_XML
+	bool "XML module"
+	help
+	  This options enables the Qt6Xml library.
+
 endif
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 302aecab31..1af24334a9 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -89,5 +89,11 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_XML),y)
+QT6BASE_CONF_OPTS += -DFEATURE_xml=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
