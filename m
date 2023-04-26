Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F30AC77B78
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 16:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C5F83C13;
	Wed, 26 Apr 2023 16:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25C5F83C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpbZOwazyAI9; Wed, 26 Apr 2023 16:39:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56C8883BE2;
	Wed, 26 Apr 2023 16:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56C8883BE2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED7F11BF30D
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 16:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C56B841D8C
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 16:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C56B841D8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FUrAMHF4c8gv for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 16:39:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B051041E28
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B051041E28
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 16:39:20 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-5ef673a49e2so70573956d6.3
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 09:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682527159; x=1685119159;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FWTfJmpJmdzUKIs095b8JOqe7XErqmkrr0GtEqdQ9r4=;
 b=LkweFEDWEacbs3HwWNGpG8wlDrbbYY7Qy90h2K077zTTKrNpjQ+ikSsFHkMs7yuoaU
 6NR927SJWNxrUH76DTDG9+/7YAF9TcPSTy7jsuiJow2SX2uInUWBtM1j46lJ691tmr8L
 GsZ/r20rY6ozrMlrLBZ+7LMPTC2+D9Y/dJ5O53HcfYSov+WHaZXJtDBZTVZC9CjHg9Cn
 tV5wmsbgfgFBevqMXNNCgNpTZBijtmj/33E/63TUz+QttZiepuVj6/81ET+lbAqdqAqs
 SW+RMH9gVii3+OixIbhyRTFrMfGMzD30CYC0wQMNSmzCccRlqkPjX9sX74oYq5Nn51M3
 v9qw==
X-Gm-Message-State: AAQBX9fnt+5p64Qo9jnOeREXxcG8Hc36gJLfRC4+gV/CFCir+gYyJpTQ
 bEZ7tVVUBfQ5WIfyJH7kwTaBZGAO/FU=
X-Google-Smtp-Source: AKy350YSwRuQXUWWxEkfc7r3MMm/KRnx9/VojsaQ5U/DhipdoYs70NcbBDqqGDg/n7UXfKn7RzgsGQ==
X-Received: by 2002:ad4:5b85:0:b0:60e:98be:8694 with SMTP id
 5-20020ad45b85000000b0060e98be8694mr23598030qvp.46.1682527158410; 
 Wed, 26 Apr 2023 09:39:18 -0700 (PDT)
Received: from localhost ([2601:4c:0:dd::d04d])
 by smtp.gmail.com with UTF8SMTPSA id
 r7-20020a0ce287000000b00606750abaf9sm4159482qvl.136.2023.04.26.09.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 09:39:17 -0700 (PDT)
From: Tom Wambold <tom5760@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Apr 2023 12:39:10 -0400
Message-Id: <20230426163910.28943-1-tom5760@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682527159; x=1685119159;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FWTfJmpJmdzUKIs095b8JOqe7XErqmkrr0GtEqdQ9r4=;
 b=Rl9ubgvyfwcOnjreo/M6a43FUx/QS99vrrEXMWXErSPYM30X/twMpqh45IFBzYAo9k
 WRSvSVTkrjIcdGvUXq8hZKCQpPPfT8visPV7wjKqBz6RmAVOI20XvLiSfiAor9GlTdhk
 xC/hGxmj0xMGe+pEFgN7pDx5J3XPmNwMLICqyND0Jah6i+z4JzZW+c1HwN1hTGLt1TXx
 EnlVsB3BoWJioLDUCa0DzxhS08wJHlw+LXzRXhM3SrTQkeMIHquem/hMsctZYIfyhxck
 UK+rP5vPFNY6Jz/rbAq46ii8Kc4LvlgJmN1e8JtvBTn7TZ/CqMDInoS90SFb+BXc411N
 Pmhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Rl9ubgvy
Subject: [Buildroot] [PATCH] package/libcurl: remove OpenSSL LD_LIBRARY_PATH
 override
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
Cc: Tom Wambold <tom5760@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I believe this is no longer necessary since commit 2d4c215 [0] in curl
(released in curl 7.60.0). This appears to cause problems when building
on Arch Linux at least, as noted in bug 15181 [1].  Just removing this
entirely resolves this.

This effectively reverts a51ce319492 and 71b1d397266.

[0]: https://github.com/curl/curl/commit/2d4c2152c9eb3dbdf943de46ed8fc11285f1b90b
[1]: https://bugs.buildroot.org/show_bug.cgi?id=15181

Signed-off-by: Tom Wambold <tom5760@gmail.com>
---
 package/libcurl/libcurl.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 1a1594a45e..dd715c1bb6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -56,11 +56,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBCURL_OPENSSL),y)
 LIBCURL_DEPENDENCIES += openssl
-# configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
-# native stuff during the rest of configure when target == host.
-# Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
-# are found first.
-LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if $(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
 LIBCURL_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr \
 	--with-ca-path=/etc/ssl/certs
 else
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
