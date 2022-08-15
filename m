Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D06DC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2D0A40517;
	Mon, 15 Aug 2022 16:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2D0A40517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ta40ABYnczkI; Mon, 15 Aug 2022 16:48:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D651400FD;
	Mon, 15 Aug 2022 16:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D651400FD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57C931BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32D2C606FF
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32D2C606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n1VSTlIbCgim for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:48:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB0B36003C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB0B36003C
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:48:21 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 h204-20020a1c21d5000000b003a5b467c3abso7497242wmh.5
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vqpm8VP/n0jioXhoNz0KmZsQ8zvixAVULYfbvBoGx9o=;
 b=j+KhTreFzwfKbJLFXVo2uxINRdzQekR39dFkD9647WG0EyOVv+5gadtOEAZTVc/sZJ
 voER0z+omh0n2U9Jm7ED2cfRTiod+SZ4G1DyienJyan+pW3g1Z4pAGI9BnMqN2W7IaNU
 PTRibZmlL34SgTpDg+pDI4NjYBhWAKni4hD4nPyto8sAxHfOVk7oXq+bxMHvTf9uJms7
 ah4J6HrWzp1EVl/gsOg7luckHYhVFjG+0ZUanR1euVVYMxbrL3jeE1iqKCwKqjBYIRKz
 5UalykpUNcTKHYOTeKotnlMal6CwAHXZyWgosXTI/xMkVWEViIOngDOJCkpJIpcXWzR1
 1rmA==
X-Gm-Message-State: ACgBeo1XlW8UEMSbYtvHt6idLk0MLbfXnNUExjmOK+6qf7Nlh+lIGJ+8
 ij512O7Dsq2KNRL4ignQER0Mo1T8MIQ=
X-Google-Smtp-Source: AA6agR5AJRllNSqvS0OXsXqah+gDxP8ZAj4YR1sdAv4/BsBnPYbmqePZfRhiqcSFesUvaCHTr4Eo2g==
X-Received: by 2002:a7b:ce10:0:b0:3a5:3f91:e2fb with SMTP id
 m16-20020a7bce10000000b003a53f91e2fbmr17279973wmc.138.1660582099823; 
 Mon, 15 Aug 2022 09:48:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0016e6c61061147635.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:16e6:c610:6114:7635])
 by smtp.gmail.com with ESMTPSA id
 w5-20020adfee45000000b0020e6ce4dabdsm7563497wro.103.2022.08.15.09.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 09:48:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 18:48:11 +0200
Message-Id: <20220815164811.93697-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220815164811.93697-1-fontaine.fabrice@gmail.com>
References: <20220815164811.93697-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vqpm8VP/n0jioXhoNz0KmZsQ8zvixAVULYfbvBoGx9o=;
 b=go7Re4moq9sunpBKipEqU+LCNDwJiXfUVlN6Yb/yMV92RIZ4XmKyaD6P5X6BlDHKgj
 sxq1wdhR5VRQCyYh/yCakphzXbj1Y/F8bWOWjVj5MiEAkdVwVtxFBhXeSdE4gqLlEbni
 aQw/azRlBRc3wkNJt6wmGxOFOBJxTguNHkSdj7aiXcxI2CkaJice2e2bfGJg7CiY4y9s
 4jT3EP8ketkpByOCQ5Yq4YUaPnc1p1ykp9xBkD5dQhKTSaaAAJbntkICff+ZapHxCt7h
 u2sgrNaXzrK7+RivZD+BCIP9fXvOMPA1GoiPRt10jS6PMOvDda4Ei1UwEN2QfA44JrXg
 V4cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=go7Re4mo
Subject: [Buildroot] [PATCH/next 2/2] package/lshw: add zlib optional
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lshw/lshw.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 46fd654afd..3c1e2b96a9 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -35,6 +35,13 @@ else
 LSHW_MAKE_OPTS += SQLITE=0
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LSHW_DEPENDENCIES += host-pkgconf zlib
+LSHW_MAKE_OPTS += ZLIB=1
+else
+LSHW_MAKE_OPTS += ZLIB=0
+endif
+
 define LSHW_BUILD_CMDS
 	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src \
 		$(LSHW_MAKE_OPTS) \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
