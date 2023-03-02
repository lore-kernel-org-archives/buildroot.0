Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5FCC678D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 17:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C24E41B53;
	Thu,  2 Mar 2023 17:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C24E41B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9TkSKHWZuWpm; Thu,  2 Mar 2023 17:54:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95C2941B8A;
	Thu,  2 Mar 2023 17:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95C2941B8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46DF01BF387
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 17:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2185740395
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 17:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2185740395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1_i3iOcMEkE for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 17:54:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 158FC40393
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 158FC40393
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 17:54:01 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so2387151wms.2
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 09:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677779640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DblzL2Bhbzg0TO2S6BDKDjN8fXjLyQXZ8DvIqwNFK8c=;
 b=q2FW7y51yVUUwtpKhejZkfAm2rhwSvpSt7GfSxtmWuQ2PMARwHsj/RRQfd1bYWKFtZ
 xwS7d42ssMzN/mp8XbuhQuk2UfHwC5ELsf/eVdiJsNWDUSRV/2G4t0a4wtkuThasTAL1
 CcH0u4gxS3z4q/Jtdcxwj3nK1wbaofRJdPavz+IYq88vjIHfJ2xh8XruEtFHoK7oly98
 v7+/4PVzBg4pOByhZSXP9QnLe6RtSbTDf+gg3/p7OJAlv5jslqQpon2OpI748WNtT6sj
 yuOA/1V4uzE3GeuGLMIyRWA1xG2Eo0hBZ7goHnPTWhXnGKNjweMdQ8kOAnKHyxg5gNrA
 wzyw==
X-Gm-Message-State: AO0yUKUbOntHULq3kUArChwx3qKW2K7PZpxizZ1CYoSPlIrWvq0gc0bO
 oui0bFWcuuf76mh0SBQy72IXmhnwFGM=
X-Google-Smtp-Source: AK7set+QX/OJFRjJmdLEnPiCb3cgMcofzedXiMcKZoMwwdqqK8sNOH/XTMs8ZhQs5PhL6vWXfru22w==
X-Received: by 2002:a05:600c:1f0a:b0:3ea:edd7:1f1f with SMTP id
 bd10-20020a05600c1f0a00b003eaedd71f1fmr8277280wmb.40.1677779640115; 
 Thu, 02 Mar 2023 09:54:00 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g40-20020a05600c4ca800b003eb3933ef10sm162459wmp.46.2023.03.02.09.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:53:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 18:53:48 +0100
Message-Id: <20230302175350.183840-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302175350.183840-1-fontaine.fabrice@gmail.com>
References: <20230302175350.183840-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677779640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DblzL2Bhbzg0TO2S6BDKDjN8fXjLyQXZ8DvIqwNFK8c=;
 b=Os+zq7VfcGfj+Bz2Nsl56i42Ul8nRWssofWM9DzGy9CwldryUVmB+MG22Xw5USgF44
 0xQO6JLgUpwcy2cOzxTVWvI9IdYh/IOr1NOT7+xOzBw2YCatSX8gZ8kN+7a0wz08m+84
 qInd5elAj/Ac5pf79pWxu2eKNQUbpULpZAi+RYSM7rXBZQHfb7JAOxozuWV+rVhXzA8p
 oXIo8NEpVwSKRmXPSpLC+eoMxNEJHz1O4c6gvo1g8Io9ot63pD9Ycska8wSuSGdhrkwi
 aP5TIAkp1hKcIwQ1xF21SOJDnvT+7RDStuUht2gul9NiC+vKBbjD27s5pNx6XRDXriXC
 71YQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Os+zq7Vf
Subject: [Buildroot] [PATCH 2/4] package/gensio: add alsa-lib optional
 dependency
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

alsa-lib is an optional dependency which is enabled by default since
version 2.5.3 and
https://github.com/cminyard/gensio/commit/dc9bad87d47588dcdd92ce118fcc4f41d10b671c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index dafc0bf5d5..89c734eec0 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -14,6 +14,13 @@ GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB_PCM),y)
+GENSIO_DEPENDENCIES += alsa-lib
+GENSIO_CONF_OPTS += --with-alsa
+else
+GENSIO_CONF_OPTS += --without-alsa
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GENSIO_DEPENDENCIES += host-pkgconf libglib2
 GENSIO_CONF_OPTS += --with-glib
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
