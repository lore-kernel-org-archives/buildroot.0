Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1DFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 20:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43BEB8129E;
	Sun, 11 Dec 2022 20:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43BEB8129E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Mu0J7oIno_r; Sun, 11 Dec 2022 20:35:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88BE381290;
	Sun, 11 Dec 2022 20:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88BE381290
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDA531BF2B1
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4B5B40890
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 20:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4B5B40890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 523_pSKJIRyH for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 20:35:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A27544088B
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A27544088B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 20:35:44 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id m15so2508578ilq.2
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 12:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hrBtoNpQJeerywuMnMlKbTBVTU9vlJjSW9KaN5uR/Oc=;
 b=2B4DynYdRw96NSwXtRCSr3OE8hQ6bCmFDYOr1X25tKad3cwWeM9x8FIVLNud7JUAlf
 TDhOI9BadGDKXm1ZlsFqxR+CQfPWt7KsHVQtkD5pyS0JmUlxnKiWn3SCKykVv6BIsK6M
 hVJ/N0UfMrf+ZvCHBdCI+3R74IQ5i/OWzjPY4exT4qgGBIB1SjNw5bj/9kG3AtT1Znxk
 5Fv89+pzELIRHqYCgGYoHdquxNuVP5y3T6Y4iwHFf8/RNYt+XHEnGYsvUydJ4TgPI58m
 WqQxTD3uPGyzWw0/cPBDZFUN0ETRpj/LsMdkpuWCZhl4aZy0wbcbdTMYbEgZX5sPnRA6
 q96g==
X-Gm-Message-State: ANoB5pk81BJzt5TeroZlZyOkt7rttV56wNWF12BgJEUutQuC0rXSoORv
 1e/4dzsYEQEFK03KskxbZFPyN3oRxHjh4g==
X-Google-Smtp-Source: AA0mqf6boemE0ojIkuRJqdbw+71URHTGPEYygYqGV11P5p8pR7duK1negjBVyD0OZFqupPrzv7BiCw==
X-Received: by 2002:a92:c5d0:0:b0:302:c541:624b with SMTP id
 s16-20020a92c5d0000000b00302c541624bmr7572122ilt.15.1670790943226; 
 Sun, 11 Dec 2022 12:35:43 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 o10-20020a02a1ca000000b00375664a365esm2499780jah.1.2022.12.11.12.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 12:35:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 13:35:41 -0700
Message-Id: <20221211203541.249923-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hrBtoNpQJeerywuMnMlKbTBVTU9vlJjSW9KaN5uR/Oc=;
 b=TPZ8eNpr9iQP8NCBq/+ZBC6Xx4Ae44HcxLUxPP0m6dU5yn7yoVvL9eLBOjHX4Qykci
 aIKduwwBaath+mLZm7xf0fkAqfLuPfJVnXfclh5JUgVdr3PYWeBbC4iASWaejqp9Z44M
 6py5kp3DCMLKdB+P/VPvRDMEpnsZWKR0alVMLrcHXWXHOJ2r5vSHIG4oU6ShlBADBGDU
 CyY4rBX13Evs0g5ItW1eHvzNZZmb2ktGCNCe5P5OrRjk2+0CU7tWjVCb4UjZ4gSmUamT
 HzI+PssgNG5KMEnoUTifeuieG+Zmz76yEBqaCcdWiwnRDm2r/l2BYFeBI3MHMRmd0w5d
 Mxvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TPZ8eNpr
Subject: [Buildroot] [PATCH 1/1] package/swig: depend on host-pcre2 instead
 of host-pcre
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Swig now requires host-pcre2 instead of host-pcre.

Fixes:
 - http://autobuild.buildroot.net/results/3a7/3a70042aad7376bcccf56d639ced93f504f47963

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swig/swig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index d432cab53d..ad585c3f97 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -7,7 +7,7 @@
 SWIG_VERSION_MAJOR = 4.1
 SWIG_VERSION = $(SWIG_VERSION_MAJOR).1
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
-HOST_SWIG_DEPENDENCIES = host-bison host-pcre
+HOST_SWIG_DEPENDENCIES = host-bison host-pcre2
 HOST_SWIG_CONF_OPTS = \
 	--with-pcre \
 	--disable-ccache \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
