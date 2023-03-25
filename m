Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003A1C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 17:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BDE814B5;
	Sat, 25 Mar 2023 17:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BDE814B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p-AUu5E5H5Qb; Sat, 25 Mar 2023 17:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84440814BA;
	Sat, 25 Mar 2023 17:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84440814BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C8B181BF484
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 17:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A039D4174D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 17:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A039D4174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dn1rvKxhkumg for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 17:58:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EAEF4174C
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EAEF4174C
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 17:58:39 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id i5so20319275eda.0
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 10:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679767117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XvWzIrDqqMjWD+av38xYPXvBgYzGeEXVRohOhcH/ghc=;
 b=VYCxBVb60m3WOw8Wleq+EzZ5D5VF1xbVvIzPPihs5Q8HpHUBmlKcXPUkIXU8C7yJmk
 WfoafCgOtkTs70PLGw0vX7ctkicrcNjQgkQfrWlb5ZXw+BXxHocm3riVqoIrK3o9H643
 IWLFnbGw0ZDOZDghb23mIGmCO4xFGD5joFAcFOX8AvM5K5zfvy5RTUSF3vPXK/Btlkqj
 VlhbQ5FOA6R39xhH0ruABm8G9zKFy0lU12U1ul76ed/hFAGVepS4R7pzlb6XUCXPr2MP
 NR2yLgZj5/uMEKHL2jVUvl9IOCCguluGASirLeNaAyn6WjtZAE9lXxVBeWUO1+spwQkt
 lVDA==
X-Gm-Message-State: AAQBX9fZHg79hu06QkmtxTUZUV4ETh1ypJnfswNT+RX8kkEaHLhCrToN
 lti2x2vowr311bndlAfFKG4jvY9UH6OLSQ==
X-Google-Smtp-Source: AKy350bwBjYpawdvbW4mXYZT7fLNbUSYkPpQxwEkcIEgdevV2bYqfSwgjXVBpymwHzD8Y/TD2Ei56A==
X-Received: by 2002:a17:906:341a:b0:931:de76:c2e8 with SMTP id
 c26-20020a170906341a00b00931de76c2e8mr7667494ejb.9.1679767117465; 
 Sat, 25 Mar 2023 10:58:37 -0700 (PDT)
Received: from LinkTed.fritz.box ([2a02:8070:4182:37a0:64cb:8203:42ee:ef04])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a17090670ca00b0093b8c0952e4sm5604778ejk.219.2023.03.25.10.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 10:58:37 -0700 (PDT)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 18:58:15 +0100
Message-Id: <20230325175815.24876-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679767117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XvWzIrDqqMjWD+av38xYPXvBgYzGeEXVRohOhcH/ghc=;
 b=NOR9kYCu+GCQ6PgSphA1vYrRHwfRvaCanlGJqx8fcOkXMLUI6JBI/sORptyUWJuVs9
 bLyNtNRVRFXGKNsKZc2N+qviKu68hAJiY3IMjFMI+UX0Hp3Qjkk/BSGmyU5WNNWdyyKd
 PYlvXkdOYOb2rTOVzuAcz5pqKlq4VL5X42V+aXlWqbOhq9uzlwl9MSFqdC9Bb8YgjhOJ
 wpZdplO/qq5MwNfet61HSJ6P+dWZVJsfH8cS3NJy8q+MgbU8SczLB2AYxtbO/YMJkbKi
 8bn62DTIkKzALMPqzWyrj/a5xVV7yOWN7zTNZunn192/wf0oM8lnY9TOS8SQqVVXcJRE
 kwoA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NOR9kYCu
Subject: [Buildroot] [PATCH v1 1/1] package/shadow: only yescrypt build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch to fix the build if only yescrypt is enabled.

Fixes:
 - http://autobuild.buildroot.net/results/df6a16a55bf02cf2d7377f9636913f0b3bca574f
 - http://autobuild.buildroot.net/results/758d4fd297fbd77ef846d3a3d4c207021f866752
Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
---
 ...-sflg-for-USE_YESCRYPT-in-newusers.c.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/shadow/0001-Define-sflg-for-USE_YESCRYPT-in-newusers.c.patch

diff --git a/package/shadow/0001-Define-sflg-for-USE_YESCRYPT-in-newusers.c.patch b/package/shadow/0001-Define-sflg-for-USE_YESCRYPT-in-newusers.c.patch
new file mode 100644
index 0000000000..6c2a15d898
--- /dev/null
+++ b/package/shadow/0001-Define-sflg-for-USE_YESCRYPT-in-newusers.c.patch
@@ -0,0 +1,29 @@
+From 8f7d5e8adae3aa16c0e3a4cb5db34d6764aa0495 Mon Sep 17 00:00:00 2001
+From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
+Date: Thu, 23 Mar 2023 19:16:12 +0100
+Subject: [PATCH v1 1/1] Define sflg for USE_YESCRYPT in newusers.c
+
+If only yescrypt is used then the boolean sflg is not defined, but it is
+access. Therefore, it causes a build error.
+
+Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
+---
+ src/newusers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/newusers.c b/src/newusers.c
+index dd6b4421..9c2a626a 100644
+--- a/src/newusers.c
++++ b/src/newusers.c
+@@ -60,7 +60,7 @@ static bool rflg = false;	/* create a system account */
+ #ifndef USE_PAM
+ static /*@null@*//*@observer@*/char *crypt_method = NULL;
+ #define cflg (NULL != crypt_method)
+-#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT)
++#if defined(USE_SHA_CRYPT) || defined(USE_BCRYPT) || defined(USE_YESCRYPT)
+ static bool sflg = false;
+ #endif
+ #ifdef USE_SHA_CRYPT
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
