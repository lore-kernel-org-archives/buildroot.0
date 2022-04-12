Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E99C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39F1610C2;
	Tue, 12 Apr 2022 18:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aINbaDbQPTIy; Tue, 12 Apr 2022 18:02:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14177610BA;
	Tue, 12 Apr 2022 18:02:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 707A41BF3C6
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6015483F97
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkWAF5R7oncW for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:02:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A50783F68
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 18:02:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u3so28898599wrg.3
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 11:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4M93WmuNLsNB+mVXf6Lm8gfzm7pAVmOL9SxxdFseMI=;
 b=qA9uh0OzpIen2GUEKMy6AAs5tDuuV84LAjig71Sw5p34VvxUMQAGoMmcy0LuupIUhU
 w5T7/2blWE5UrKTYlR68ZQZeH8NBq3o5IhPS5y2RnohGrZmiqfJy+Wt51a/dZ9rQ61Ln
 vX513H3GdX2jTKbJkG9C4tuUSF7nBYxc8TgO67dJ6zcIz5SIpkrb3QMTuxC+jYBPUNL+
 fz1nYmBv9RO5AzktDKvm/CA4Zlm7N4aoA6mW4GLPrFfuS8TuurvWXUSdpmAZRRacxlC4
 QN/iK+Lxy3uavkQJ/kgGBVSPJ6OBPqrJWmXr41EKu7WxLU46FVJMseRuwtbbrlUq99+7
 sTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F4M93WmuNLsNB+mVXf6Lm8gfzm7pAVmOL9SxxdFseMI=;
 b=mlHymmu5qclZ4pIdiECFzCvEXvr7cxjalH9ARX84Zh4M6mvvmy3NI/nKwwdZukqaph
 PolDNH3KNW3l+Y8TAev0ltMlV7R3BDBSMxOdT5GOtHz+inY/L4O+4ae2FlOlmh9F77X5
 LVGceVjn06gg1LBdxQbrk6TvAAi/CfzTxa5X7qnL3rPPJI+7P+/17COMWZQLlF9SljYq
 fpyM68cdAMJ2vRgkn6bi46H7L/bMysGtYl9m+v49PL/lXhyf5iDe1zpoWc8rOHPyeipZ
 E8K3muKUvEEbGTTY76d2kbdjhCQLJxkO+y0m9txkKwML13mxKqfdN5qCoeZqG9zfiUAU
 VUcw==
X-Gm-Message-State: AOAM532g1CZfVocT6McnDgyfzpUgolNHg/8QS1iFx7io0xq+6ocRaVrM
 MbkFCbaP+/mah/v6CMY2nh7D5uXIDxA=
X-Google-Smtp-Source: ABdhPJxcr4ZybO4O1rORZ796qGPOUvCXXzfzzE3SyUOxycgcLltRortphSGgchFYGbUWhfnNYPJBdw==
X-Received: by 2002:adf:dd10:0:b0:207:a8ce:c152 with SMTP id
 a16-20020adfdd10000000b00207a8cec152mr7461141wrm.714.1649786527526; 
 Tue, 12 Apr 2022 11:02:07 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a7bc852000000b0038ebf5f191esm170345wml.45.2022.04.12.11.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:02:07 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Apr 2022 20:01:57 +0200
Message-Id: <20220412180157.2709680-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libevdev: bump  to version 1.12.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libevdev/libevdev.hash | 6 +++---
 package/libevdev/libevdev.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 68a5ebdcb..dd76e158e 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/input-tools/2021-November/001573.html
-sha256  2f729e3480695791f9482e8388bd723402b89f0eaf118057bbdea3cecee9b237  libevdev-1.12.0.tar.xz
-sha512  6c1c1362d5112cdf3816d1f735c27e625f5463ebf10a83d675cd9364c3fb291ebcb91c051da442f1a36ed28ba7dd99af74546707f61274f7d5715c544a0ed04c  libevdev-1.12.0.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2022-March/001574.html
+sha256  1dbba41bc516d3ca7abc0da5b862efe3ea8a7018fa6e9b97ce9d39401b22426c  libevdev-1.12.1.tar.xz
+sha512  eefce287a665e4f89eb2e0437dfefd45ecf8925c7dac35a1bdd46158541f77f2032c6146900a30a01321751d55a9b537bd1d61777cca9cfa02c39a6e31c97be4  libevdev-1.12.1.tar.xz
 
 # Hash for license files:
 sha256  6f13de7ce28e4948ba95170e0723ee1254c1978ce1f127af82aeca597b567cb9  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index cd80154be..726a5afce 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.12.0
+LIBEVDEV_VERSION = 1.12.1
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = MIT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
