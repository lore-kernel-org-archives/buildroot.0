Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63C2C4167B
	for <buildroot@archiver.kernel.org>; Wed, 30 Nov 2022 01:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3464D4015F;
	Wed, 30 Nov 2022 01:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3464D4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8Dyyo8jbaUX; Wed, 30 Nov 2022 01:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6E2A4151D;
	Wed, 30 Nov 2022 01:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6E2A4151D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 042CE1BF95F
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 01:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0DD281E82
 for <buildroot@lists.busybox.net>; Wed, 30 Nov 2022 01:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0DD281E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GB95XsKM_IIg for <buildroot@lists.busybox.net>;
 Wed, 30 Nov 2022 01:03:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D341881E6F
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D341881E6F
 for <buildroot@buildroot.org>; Wed, 30 Nov 2022 01:03:09 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id r81so11399074iod.2
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 17:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EwmuSyre1za5mtVmOMIStwjwWLNeYDPaAA0cvdiRkOQ=;
 b=PUv0DWujsky+0D7ibJaIbNQywJPmo5dnpkmjhz8jdJvPWQQQs5Dk/Ymo/PGKMvBLcB
 S6kxyUbyixlvzNh3CaCkz4vcxpjEJtcj05GYBtOeTJVEux2qUvf+LsUaF/dRJxWITwk8
 2aeRQMXK7YZaXnNeM6gbU/gzJrtzMTsZ1+Mgn4kCrjzhy87aNX4Uhr64mLb0clnhPo3y
 jDI7VsJe1Z0+1iZtyWBZkyJvmf77zEpj6SSwWHrS3N2yx8vXNULfmofoYx7JP6Nr1zvj
 yWDoEGES9nKqnFyDJ6vLiV8lVggKPZzcvcJo5d1oku1YDlA2d4VOXE8qPjsPG15NxNok
 5NJw==
X-Gm-Message-State: ANoB5pk/n9qfP3LVTMlT8LL8H8SKiGn0+zAAYLbFZ+4V9YQWHRBxi4td
 ocWnpqg/mtXfu4VByUzKiuTVhBFX2Dtm/w==
X-Google-Smtp-Source: AA0mqf5mkc7uSay0wxGZ+dW7bMTFZ+r47FHOzn+f6MQvCd77dKEZN1cp1/l8yAOPyn5qcN5Ox2AE4Q==
X-Received: by 2002:a05:6638:20f:b0:389:d777:119c with SMTP id
 e15-20020a056638020f00b00389d777119cmr7989245jaq.16.1669770188491; 
 Tue, 29 Nov 2022 17:03:08 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 p1-20020a056638216100b0038a0182e0casm100292jak.11.2022.11.29.17.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 17:03:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 18:03:06 -0700
Message-Id: <20221130010306.3797360-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EwmuSyre1za5mtVmOMIStwjwWLNeYDPaAA0cvdiRkOQ=;
 b=BexzKFcbkLygmyBZmMCdG4RJCHHOMYk7TLORDPUAbXP2HlTTN2C26PGKZ/HsgJYzRD
 DPHV6srjbPhbRPFO95UuCket3e7uQo6VEX44LZZGyWA4r+kuJKn8kQLLrff3g/10oVVJ
 y17D3RdbX1N7MC3SD+mJtD/L14MopcHiey0cJLBlESzngP8K8x/MZst4Y2Uziz4eoDXr
 +gGDBy5MkjPZpVnln/k4S+EJsM4/1udZi3WCrFR9OZ66rNtAMVRWalUdPJ4htliuly6e
 tpl3ZlJcG/kfQgbH1Fh5/tBvXwtqD/9m4C/+gMtp2+M5ExvuxR9UFoxv/zJSyJOxInFL
 8wmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BexzKFcb
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix Formatting of non-void
 pointers is disallowed
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch from upstream.

Fixes:
/home/buildroot/buildroot/output/per-package/kodi/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/fmt/core.h:1751:17: error: static assertion failed: Formatting of non-void pointers is disallowed.
 1751 |   static_assert(formattable_pointer,
      |                 ^~~~~~~~~~~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...char-as-formatting-of-non-void-point.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch

diff --git a/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch b/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
new file mode 100644
index 0000000000..1ce106f03a
--- /dev/null
+++ b/package/kodi/0005-GLUtils-cast-as-char-as-formatting-of-non-void-point.patch
@@ -0,0 +1,53 @@
+From 44b30c116682968bacf8aec566fc9c193026ecc9 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 6 Jul 2022 22:48:35 +1000
+Subject: [PATCH] GLUtils: cast as char as formatting of non-void pointers is
+ disallowed
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+44b30c116682968bacf8aec566fc9c193026ecc9]
+---
+ xbmc/utils/GLUtils.cpp | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/xbmc/utils/GLUtils.cpp b/xbmc/utils/GLUtils.cpp
+index 1ef804709f..c36dcf6a20 100644
+--- a/xbmc/utils/GLUtils.cpp
++++ b/xbmc/utils/GLUtils.cpp
+@@ -148,27 +148,27 @@ void _VerifyGLState(const char* szfile, const char* szfunction, int lineno)
+ void LogGraphicsInfo()
+ {
+ #if defined(HAS_GL) || defined(HAS_GLES)
+-  const GLubyte *s;
++  const char* s;
+ 
+-  s = glGetString(GL_VENDOR);
++  s = reinterpret_cast<const char*>(glGetString(GL_VENDOR));
+   if (s)
+     CLog::Log(LOGINFO, "GL_VENDOR = %s", s);
+   else
+     CLog::Log(LOGINFO, "GL_VENDOR = NULL");
+ 
+-  s = glGetString(GL_RENDERER);
++  s = reinterpret_cast<const char*>(glGetString(GL_RENDERER));
+   if (s)
+     CLog::Log(LOGINFO, "GL_RENDERER = %s", s);
+   else
+     CLog::Log(LOGINFO, "GL_RENDERER = NULL");
+ 
+-  s = glGetString(GL_VERSION);
++  s = reinterpret_cast<const char*>(glGetString(GL_VERSION));
+   if (s)
+     CLog::Log(LOGINFO, "GL_VERSION = %s", s);
+   else
+     CLog::Log(LOGINFO, "GL_VERSION = NULL");
+ 
+-  s = glGetString(GL_SHADING_LANGUAGE_VERSION);
++  s = reinterpret_cast<const char*>(glGetString(GL_SHADING_LANGUAGE_VERSION));
+   if (s)
+     CLog::Log(LOGINFO, "GL_SHADING_LANGUAGE_VERSION = %s", s);
+   else
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
