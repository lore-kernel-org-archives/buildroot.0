Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EABAC61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 16:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E3B74086F;
	Sun, 19 Feb 2023 16:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E3B74086F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id owuKeYSJ2yry; Sun, 19 Feb 2023 16:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 893B6415E4;
	Sun, 19 Feb 2023 16:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 893B6415E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D4AF1BF287
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6197404F0
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 16:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6197404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDklZQuI1eCx for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 16:14:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F258401AE
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F258401AE
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 16:14:58 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t6so765141wrz.7
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 08:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VDLpYBqEuQHU2Mq+Fa0Pr8Johv4Pb/Ho9snthMQz0Jw=;
 b=h56kR5lYwpEZOpl4JNz3VS+xvXe8O06nEz2GYZ3Y6Mx4ONMlCka53la+qeNiMpdjgA
 coHSDJaOv3796u5crIdrP/HKj7TDuKyK8O7TATXtFb6wbxlDqCX0638NYtwpbEGKtJFt
 wCEZRmAjSn0gI6ZbCaxxOGJQcFcsNg59dupyXjzrUl73T2ueRdRH1Y8xwsHSaUBmu0Zz
 68u3PYpO7GUHrQQKg3j3UuplWMOyt+5xjyLlIUiaCngVg+M3xc/yaXPR2QMQbV7OyAVB
 5LewxMZXsNvDBwwXEQ1bGEw6B4VKzgh1a/QhvXpu3a8AICSsGdTDb/LClYVkgeCmH6EY
 bIfg==
X-Gm-Message-State: AO0yUKVMrlyM+WDobO8m7ioif0tcbU+zfxs2k0hQqAHRt91Zur4lfuML
 tn9O8/romTQywdKetPLaiO1acI7PBdI=
X-Google-Smtp-Source: AK7set8TxRjuEl5Tx8bntkW5zE8qsUX3XnnxFMthfhq9X703O3vzmKl3TOyrgGLK3UqmS99Mx5dVuA==
X-Received: by 2002:adf:f182:0:b0:2c5:4bd4:b3a8 with SMTP id
 h2-20020adff182000000b002c54bd4b3a8mr1639982wro.4.1676823296306; 
 Sun, 19 Feb 2023 08:14:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 e17-20020adfe391000000b002c6e81a7e5esm3862291wrm.107.2023.02.19.08.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 08:14:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 17:14:53 +0100
Message-Id: <20230219161453.87903-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VDLpYBqEuQHU2Mq+Fa0Pr8Johv4Pb/Ho9snthMQz0Jw=;
 b=PmFbnMDzSa4sfxMvwwOjw08D/xLAPu6iEkG0BHviPXs1xcrG7RqIPNO9Q+KIz2IFbf
 ZTHTwVxJV0jOe3TW0UxJIIOmpkW6pSa+loyZz0ZL7yK/mi9m7sXfwmGV06UPeXN/RkyX
 p4Bq+q6InnrWJF8+C/4fZMXH7o2FeqyughHMEv6EvOByHx+PvMsvwLpI7dcW/o+DVINj
 zt71vkt7KzeCZ6oCMyqH5U/ruLcUG8WXZ3cPY/p7myLRgL6wCz3P9ZQ2vvCr4BBwJSzh
 VYLCAZntg7fRUFMXSHZjQA75VevfzRN/ccUiohaiMqmKjhSqV/b4LNQu29YvzziBxCLC
 2J0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PmFbnMDz
Subject: [Buildroot] [PATCH 1/1] package/ipmiutil: fix uclibc build without
 wchar
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For an unknown reason, wchar_t is incorrectly detected with uclibc
resulting in the following build failure:

In file included from igetevent.c:136:
imb_api.h:150:5: error: unknown type name 'wchar_t'
  150 |     wchar_t *Buffer;
      |     ^~~~~~~

The build failure can be reproduced even when reverting bump to version
3.1.8.

Fixes:
 - http://autobuild.buildroot.org/results/e9ff3bd08e106dc834968bf5e4296ce8299027f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ipmiutil/ipmiutil.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
index ad9fbfc24c..b48eaa7cb2 100644
--- a/package/ipmiutil/ipmiutil.mk
+++ b/package/ipmiutil/ipmiutil.mk
@@ -10,6 +10,7 @@ IPMIUTIL_LICENSE = BSD-3-Clause
 IPMIUTIL_LICENSE_FILES = COPYING
 
 IPMIUTIL_MAKE = $(MAKE1)
+IPMIUTIL_CONF_ENV = ac_cv_type_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 # tests against distro libcrypto so it might get a false positive when
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
