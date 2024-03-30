Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5CAC47DD9
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 08:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41CA340C20;
	Sat, 30 Mar 2024 08:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48Trb0GfG2gj; Sat, 30 Mar 2024 08:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBDC340C7D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBDC340C7D;
	Sat, 30 Mar 2024 08:57:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 917801BF41B
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 08:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B57A417D0
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 08:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCVXVipymlIP for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 08:57:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B705417BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B705417BD
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B705417BD
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 08:57:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41553b105b8so5871595e9.3
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 01:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711789066; x=1712393866;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=//I2sd127CfbXX/kES48UjGB8GGByQsu/BjzrTPvMvU=;
 b=eX+R8wQB6ZQ5q30Zan/vV/58/RroTVD6giJ2/CrmKmbbKaT9Qfk/nqMO/3vlrG1k4T
 mBzQAzu9iaDDpctzSsVidbmjRsyzYMqxJkF04pzpov5o5kWO2r8G85yPEVCZpEpz3998
 nK2/CMzGIj+8if0q+vXFb6Km6Rdu6RVptDDtQElZgKOXnoxa5HWoVfVS5FsxOxUmNoUa
 TiCrVAFqhn2T7g7D8q4n2GHgkNX4RvZ7SbeA5AYPhC8QVRtIux7cFDg8h5owqDJh7AkN
 UB8DKP14mgBPhpwkMUFYsj9bIMfe4VrcbEuHOaoBqPysS/VcnrYf+DAcoZMN1/2RvulV
 +dbQ==
X-Gm-Message-State: AOJu0YzJqmUDe0IcoACv/L+4UcIev5gGyzvRXrMqImnn2c74tNqblUQF
 yX3kLBt3IAR3pmR42YAUtLOU1bNNM3mFAavo9LRBUPRIPzyfU3TKmPQmTlAh
X-Google-Smtp-Source: AGHT+IHFwz7kK5JvhAT65NfOmjQRhTurPeidwyWttCcCPW+DClCXtVyZgGJWtSx/fXtw7kPUcgri7A==
X-Received: by 2002:a05:600c:1504:b0:415:55d5:2faa with SMTP id
 b4-20020a05600c150400b0041555d52faamr1146091wmg.23.1711789066447; 
 Sat, 30 Mar 2024 01:57:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b00412e5f32591sm7847212wmb.28.2024.03.30.01.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 01:57:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 09:57:35 +0100
Message-ID: <20240330085735.564225-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330085735.564225-1-fontaine.fabrice@gmail.com>
References: <20240330085735.564225-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711789066; x=1712393866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=//I2sd127CfbXX/kES48UjGB8GGByQsu/BjzrTPvMvU=;
 b=W0Pf2CgRbjP6wORkvIVKYeOb4vybpXypMWXD4R6OS07Wkcd7BUPfMstW6E+A9lB7ae
 a8f5/plDdmepJVmNjcuXwdfo5KIbzvd46R+MYFuqkPEGjKZYtJF1/7kTyH5gyj7pOX6I
 7Pe4oOpoyBb4hTgo7u5E6Y7+kO7TbCMnL4Tl1nSaGHW1pggoUIyTJmLwAJ77d5TaAYhK
 gvSYY61Iuvh+IMNZRMgTC/ayC+K79SKTTIQxMdht8K/oOi+oTy0ZMQsbDWqMpQBwIqgL
 WcEEE52BFkHj4Sy1UTruU72sf72iX6pH6mmuNVH5GTFs9T+nG9H61fGGgPsnpBZwIUct
 nCJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W0Pf2CgR
Subject: [Buildroot] [PATCH 3/3] package/php-xdebug: bump to version 3.3.1
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

- Update hash of license file which was updated to match the PHP 3.01
  license:
  https://github.com/xdebug/xdebug/commit/5fc2d818067d05503226ee8c6442985cb2fe069d
- This bump will fix the following build failure raised since bump of
  php to version 8.3.4 in commit
  e50460f9f12a8c5f82f2166733afe9cca3c8cd19:

  checking Check for supported PHP versions... configure: error: not supported. Need a PHP version >= 8.0.0 and < 8.3.0 (found 8.3.4)

https://xdebug.org/updates#x_3_3_1

Fixes: e50460f9f12a8c5f82f2166733afe9cca3c8cd19
 - http://autobuild.buildroot.org/results/0209b522baec3c88a2060e79f805552db79b2c70

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/php-xdebug/php-xdebug.hash | 4 ++--
 package/php-xdebug/php-xdebug.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 2509e6e2ee..251b79ab77 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f48777371f90cbb315ea4ea082a1ede6765bcfb35d7d6356ab8f71fd6dfcc157  xdebug-3.2.2.tgz
-sha256  ef479ee1a3da3f933e0d046ca8cd0c14601f29b2c0c41cc60c9388546a4e0272  LICENSE
+sha256  4eb4ee270bbcc5f14195c38f6ee58580e007cf4886ce32e11430318ab5bc2315  xdebug-3.3.1.tgz
+sha256  bc2aee27f3f0806be39e329d284ddbbfb14602a49af261df305dd6122d988eb0  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 3bc197e556..7a3869cd0e 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.2.2
+PHP_XDEBUG_VERSION = 3.3.1
 PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
 PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
