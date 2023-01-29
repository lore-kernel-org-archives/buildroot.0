Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E60C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18A1241570;
	Sun, 29 Jan 2023 16:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18A1241570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EdRuNsRsqPOB; Sun, 29 Jan 2023 16:40:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A4814155E;
	Sun, 29 Jan 2023 16:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A4814155E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5147F1BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38CDF40108
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38CDF40108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0yFRTzGYsYQO for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:40:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20ADA400D9
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20ADA400D9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:40:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q5so9080993wrv.0
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 08:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nmmpvvFc8A7UubUSlkcNZS/EZaBJ8EsWY/O8kAzB0AY=;
 b=H4uGZs+ohU1RBIkMIdV+zgzRWC7t6LmFYprKiuB+3CNzcTFDPujgPTEPtPKtHHSzV6
 p7fcPO/9y1JAjVsUEPsk1M63q/GzCWJ3tcTXKSPWWYrZxYwQTJ21ah7dEof4uQvkTYmM
 atQlAr8zX+TJVJw4fRIgg50Zv6fvYX+nUF/VASBeTSjf8Fx7EiYhfyiFxZSV2Vk+sK/i
 ar9guYlLlyzTq5WuL2HrjtL7dZNSayYIQ7KLtW+FYMbZx48XDgKbdJu0Y4oeeO44ZwTh
 ha+7G5fJI/dLznQooJQog4bBO1A7005eH+jcNeCA5RwjjSqQU8cTWtKWv4sFAaUrdHfn
 4hwQ==
X-Gm-Message-State: AO0yUKXTWCfh3CXwmwwByNFEB6RWA6kYhkzD1YdvqnGmUHKIIFBarwV3
 srxgI/AQRNNVSZZk6Qu3+muZIX25XkE=
X-Google-Smtp-Source: AK7set8knUke2ZonZI00eYNPklA9QcwGseffOA7fEqheFVznHAwpNCZX2CgnK+Vum5emJyTc4eSMvw==
X-Received: by 2002:a5d:4cd0:0:b0:2bf:cfb4:817c with SMTP id
 c16-20020a5d4cd0000000b002bfcfb4817cmr8954484wrt.35.1675010399882; 
 Sun, 29 Jan 2023 08:39:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 x3-20020adfec03000000b002bfbf7679absm9609619wrn.107.2023.01.29.08.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 08:39:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:39:53 +0100
Message-Id: <20230129163953.56236-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nmmpvvFc8A7UubUSlkcNZS/EZaBJ8EsWY/O8kAzB0AY=;
 b=Ne4aFIIIlj3K2n8fbCfH8hXZbrEVV+kfRVfXjY9dsrp6UiMoDV2ir3pYbqbKUCZvtV
 k2d9RNWIjdV1fD9Y8I1ROUpShVa+cduNDq8tXKzI964j28Odo0uQxdMcaNdZBdFyC11F
 vbw0Ti5WVrYVXjThjBMXf6irMZrXMip5jBNNspN9AUiC8yITE6/HjGRgTP6iY0/JGc1K
 d2YE/E0NpBXoLH2R3XiaL6pv37ujAaTD81S9t+OWRrEryYe5/cDMZVOAekCNgKtaq+ss
 tHbTrZsQEB9JMZuYw2d952ivNfwfy2V5g2EkOPtG0iWU7HstrMjuZhc5BzV4zxRnRNda
 27ZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ne4aFIII
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 9.0.1260
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

- Fix CVE-2023-0049, CVE-2023-0051, CVE-2023-0054 and CVE-2023-0288
- Update hash of README.txt: typo fixed by
  https://github.com/vim/vim/commit/f1dcd14fc5d4370476cd82895a4479ca2d252e54

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 4 ++--
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 03ee908db4..4000beedc1 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  c95c9abcf024bd6293ad199e4efa1c09452a9c6456c9cbaf53d896cf7b9f4d08  vim-9.0.0951.tar.gz
+sha256  bcaf9b21ab00ab49de4f3bdfda1bcda82533ec16c412824226544a3fce6506ff  vim-9.0.1260.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
-sha256  de04910387a62ad4f9b36b91457c8d5ef32733ac5d768a128071b93f4821fcd1  README.txt
+sha256  d187aff219161f37138479257f82d687ea10b2cdd17d58b53a3ec9b79d6dc870  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index d814c68630..e3648bfab9 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.0.0951
+VIM_VERSION = 9.0.1260
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
