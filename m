Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCE4C7EE43
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 17:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4384541B72;
	Thu,  2 Mar 2023 17:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4384541B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Rd3doYlj25D; Thu,  2 Mar 2023 17:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3307C41B53;
	Thu,  2 Mar 2023 17:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3307C41B53
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 413ED1BF387
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 17:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BF8A40395
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 17:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BF8A40395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCFyEfxRfVtM for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 17:53:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C130540393
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C130540393
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 17:53:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so2387012wms.2
 for <buildroot@buildroot.org>; Thu, 02 Mar 2023 09:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677779636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jn23n07sJBcW4/bwE5WZVeE/YuOV2rRzcVQWRaFDbeY=;
 b=iSe+YnxW8SFOU1KHMeU0SvMoJPYOMo4Wo8Xe06XSBwnRZaq19vmREarKPvdQonASg+
 yJTPlNPc1QWkJ4kMmkJLBr9c9rI6nsQZ8/oU7CE0NQzEx0f4XFf1HpcKVsbmcJmWth2u
 LU+bKwMERvqzR1dNxwNMMjE2drW9kwEd/LkrTb0gfcoy7sksvrGDL3xyzCTvUsFsAXD3
 s5M1lxTzaRzVhM+B3//xCZo0MwPBWCwuc57GPzaF74YPXIX1RJyH7c49lazFReTq6pcJ
 fOvtjiJHWIt1sHjl1lairjuHPjkw+xiQ3xqkHrH4kZiAu06Dq2mFJHcYJqoA4oyRmO7A
 WNrg==
X-Gm-Message-State: AO0yUKXCtFj/2H3h3S3enA49W7pfPfR+820SaCQ8iNjb1h/gHBFWAHH0
 IQX42HijJdGhcI7RoBOblGZf9Ti9s+E=
X-Google-Smtp-Source: AK7set99clwUbIdhFCMH7hp3B6f0mJOPlUPjvOEShCPYpSAIxCKvtF42xIwrkJS3cwFKjmirNaYJ1A==
X-Received: by 2002:a05:600c:a29d:b0:3dc:55d9:ec8 with SMTP id
 hu29-20020a05600ca29d00b003dc55d90ec8mr8124756wmb.41.1677779636340; 
 Thu, 02 Mar 2023 09:53:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g40-20020a05600c4ca800b003eb3933ef10sm162459wmp.46.2023.03.02.09.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:53:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 18:53:47 +0100
Message-Id: <20230302175350.183840-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677779636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jn23n07sJBcW4/bwE5WZVeE/YuOV2rRzcVQWRaFDbeY=;
 b=l8gZQ8qqzAjw4ld37d23WXPl1VNu5TLWiMJRJurQVTJ1XHe6b866FmywQ/IR6XCZwZ
 jdK1vIXwsYvGWhPfGzEyeYBxB2ZzVPOZ6JKnIuJ9yQOrm982s2ZqssD55Cj5DyEvMZYX
 nY+4VLMbJm/JaRYiNp2tbL64fMTZI2SSPnwQu7zVpwDIlWCCOsEGWvJiyXcpjP5Y8C6y
 KFKZuEFtVnrWmHtIUU6iY30AG7NdHjQfS7Jy2hzDUlu29pR9yeeSAgITTgw1WDoW6t3y
 FOrUx7hpp6T43m0UnUSpNS3u5xEuQTIGdanMpJ2HQ5dX0rasVUVXA7q5r4qrilK+B0J9
 /XQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l8gZQ8qq
Subject: [Buildroot] [PATCH 1/4] package/gensio: add libglib2 optional
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

libglib2 is an optional dependency which is enabled by default since
version 2.3.0 and
https://github.com/cminyard/gensio/commit/866924d69dabe8b8a981e19bd745d5c84e529881

Handle it properly to avoid the following build failure since bump to
version 2.5.2 in commit 5bb747f0b783a0d3f1712350ca3277263045b299:

sparc64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/glib-2.0'

Fixes:
 - http://autobuild.buildroot.org/results/3602c5cc2aff668211fd8e6eeab778b3fe287246

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 5538f97b19..dafc0bf5d5 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -14,6 +14,13 @@ GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+GENSIO_DEPENDENCIES += host-pkgconf libglib2
+GENSIO_CONF_OPTS += --with-glib
+else
+GENSIO_CONF_OPTS += --without-glib
+endif
+
 ifeq ($(BR2_PACKAGE_OPENIPMI),y)
 GENSIO_DEPENDENCIES += openipmi
 GENSIO_CONF_OPTS += --with-openipmi
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
