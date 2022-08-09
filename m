Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED1EC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 997F84056B;
	Tue,  9 Aug 2022 07:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 997F84056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjHt0V1sBk3p; Tue,  9 Aug 2022 07:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B163D40549;
	Tue,  9 Aug 2022 07:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B163D40549
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2634E1BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3663408B7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3663408B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IsgQ-1NwRvgT for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 013104085F
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 013104085F
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:31 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id i14so20816316ejg.6
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ho9eVMbc9U6687UZtklZIjoZuwrpAgkY+2FV7wOust4=;
 b=yLnyv5UWw+vuVBIQAHQ45DYLfB5jMi2epNKA9XPQDK9vmRlEGDUK7spUUrFe90TNEL
 Sd0wDr/xA2N81ZJRNZQNM7SRnm7aSpZw6GSpv30D1TO8+T1OD8zUpRm3rXVO4SSwj0mW
 AETzmOYg23yjfqACFAWV+AHckJ7LBEiXjzioBhrQrfQSxBWL0ccLFF/gh/VgqS3Tnuil
 2q+ZERYKWL5q2T4jvmNLPhI82tqKno0d08WGpxEOT5Adq2Qy1AyFaNFXFMENEFzHEQ12
 kn9KgYCqIKY8PXTc6aEdA930WaHFup4NIpFBR8LvXEG+q4vcQ8LknC9M/PUW0gnRBtNy
 nvkA==
X-Gm-Message-State: ACgBeo1ykfW5GblV/RF3UylGc6ILbNZbIxGMjei8ghQCZf/1XMd/giqX
 IRUCFiQLiJguZp8PlPj6sdzAfhuePdk=
X-Google-Smtp-Source: AA6agR7mxx19tV8oeIS428zuG9os1gXcFlcOMKCEeO4mFWJxAdvTcOaZCpT5wYZloU45a/nsUEMe6g==
X-Received: by 2002:a17:907:980d:b0:732:f9ca:891c with SMTP id
 ji13-20020a170907980d00b00732f9ca891cmr717785ejc.298.1660031849834; 
 Tue, 09 Aug 2022 00:57:29 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:29 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:56:59 +0300
Message-Id: <20220809075704.86472-9-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ho9eVMbc9U6687UZtklZIjoZuwrpAgkY+2FV7wOust4=;
 b=eXf4rOB6+nZ3hd9XPNDY26Yuq2HJPZBrWe/v5dGXPFJ5XLuaFxR17iPQc5OYl0YCyS
 gpgBIy4VLEc5DmU6ytxyclT/LY22O9FilupJ8eNgaMR1/RW7lEKOut0IdsH//7lthwik
 Ljn/KERKvsWt849zj16E+3v06AcXa0AERiwfrI9a33S0HHTlPDQkfX9hbTe0Yk0g95Si
 H/Vxacmhq6tE7upiDBZJYwTqqgNyjytpEdR32KsLxd6DaqvgCHqCdq8zYKmJsrP0WH/I
 9W/UmpvHXObRWHZJvR2KkXE2hWgVxkjBME9yQhjujCi8GTkZPD3HuEcCA5CAriEzCmVv
 fF5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eXf4rOB6
Subject: [Buildroot] [PATCH 08/13] package/nodejs: rename LDFLAGS.host ->
 LDFLAGS opt
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a host-build, so we should pass LDFLAGS.
And the correct opt would be LDFLAGS_host, so this is incorrect.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/nodejs/nodejs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e07e958407..7ffbdcf790 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -57,7 +57,7 @@ NODEJS_CROSS_BUILD_ENV_VARS = \
 HOST_NODEJS_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \
 	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
-	LDFLAGS.host="$(HOST_LDFLAGS)" \
+	LDFLAGS="$(HOST_LDFLAGS)" \
 	NO_LOAD=cctest.target.mk \
 	PATH=$(@D)/bin:$(BR_PATH)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
