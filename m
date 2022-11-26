Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD8AC43217
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 13:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E29F780BC1;
	Sat, 26 Nov 2022 13:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E29F780BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHKqHnoTLJAT; Sat, 26 Nov 2022 13:13:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16EFA81F4C;
	Sat, 26 Nov 2022 13:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16EFA81F4C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E70AA1BF2B9
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C22CE60DE5
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 13:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C22CE60DE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41pXJGBXT-no for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 13:13:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55F696063B
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55F696063B
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 13:13:18 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bs21so10330489wrb.4
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 05:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ENtkU/RM/i7q5yg0QAm2sGoen+qkwEvyIp8ZOMBEr+Q=;
 b=2fPh3FFi73jcZE4jJtDyoXdP3CiMtjjBTNrpjEgZbYfsCiDFRPvZSO7ySI8HpaSeCx
 ZrwwmgrjIqLWKWkZdBDPkvnN48DL41NA0ycw+ZdFhhMS8op69UFiO7hPnPxae1Ot+LVr
 fMgpyBS+YnQbc3jCdqBZTTLixUhQf3TwmkX8B99qVcbFZWQKpO3xEC9nYs3hy05N4V7v
 hEDN0vhkk6hpLVGnSmzhNDLURF3bjhaz3wmU0SHpPEesWeREqQ+Ck/HP/Qn5m1ETKhul
 TLPPA+vuLVZWQgWxZuO3B0lKuihNhJwllZ6VP37XkYoA0s/hkbSIEowb54xyR/Et2qp5
 aDvw==
X-Gm-Message-State: ANoB5plpWIhWYRsVLFe4waAyn6tvy2/zK1tbUERJRppbrirNs1wFxb6J
 ldYjXV17QL8do7GLxtm27jxYUd0Uj3s=
X-Google-Smtp-Source: AA0mqf6Y5BI2eq5rGquFJkFU/xCT2jdVq3pEZYuzCVBxqKqjHa6XuVrECTt9q8HquN+HUanrdHNhIQ==
X-Received: by 2002:adf:e3d2:0:b0:241:d676:a787 with SMTP id
 k18-20020adfe3d2000000b00241d676a787mr18595494wrm.694.1669468395910; 
 Sat, 26 Nov 2022 05:13:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m24-20020a05600c3b1800b003cf47556f21sm14462708wms.2.2022.11.26.05.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Nov 2022 05:13:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 14:13:10 +0100
Message-Id: <20221126131310.51007-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ENtkU/RM/i7q5yg0QAm2sGoen+qkwEvyIp8ZOMBEr+Q=;
 b=lZ9PUGrC3EIYBsCM228AeElaOyp6S4c+nGd/qH7bE3uhH1lPU1PPDIGQ49F89qU/AB
 JMs+llYr/RK4qHQT14++sFdCfeAqUaN9JTGnSPUdNHz1UeDNcyrjgQyHDOXj2BwYEdhX
 i+hPmglDtCONzeqF7t207DVILBWqhissKBCiYjOsNS2CKWPIrZKImCxKrhLlMQq1wfl2
 bQ0Ix46pfUqFlN9riKdvq8bYDeFoDyclWFKgWd9Uir/yb9Rdyyn5AWYRJoA6507DcOMN
 H8XDZWzvp91K5SZE+n0RWGvDJgkZPNvE8L0SlRR6sRSWyISOvuweWrlnGWz3zfvfuv2u
 Czzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lZ9PUGrC
Subject: [Buildroot] [PATCH 1/1] package/git: security bump to version 2.31.5
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 * CVE-2022-39253:
   When relying on the `--local` clone optimization, Git dereferences
   symbolic links in the source repository before creating hardlinks
   (or copies) of the dereferenced link in the destination repository.
   This can lead to surprising behavior where arbitrary files are
   present in a repository's `$GIT_DIR` when cloning from a malicious
   repository.

   Git will no longer dereference symbolic links via the `--local`
   clone mechanism, and will instead refuse to clone repositories that
   have symbolic links present in the `$GIT_DIR/objects` directory.

   Additionally, the value of `protocol.file.allow` is changed to be
   "user" by default.

 * CVE-2022-39260:
   An overly-long command string given to `git shell` can result in
   overflow in `split_cmdline()`, leading to arbitrary heap writes and
   remote code execution when `git shell` is exposed and the directory
   `$HOME/git-shell-commands` exists.

   `git shell` is taught to refuse interactive commands that are
   longer than 4MiB in size. `split_cmdline()` is hardened to reject
   inputs larger than 2GiB.

https://github.com/git/git/blob/v2.31.5/Documentation/RelNotes/2.31.5.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 41afa83f86..af09ea817b 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  84fc20acf8fbea5cad7d5d7be0dfeb32494f1dac8e6c61675c904d1fd3d8c016  git-2.31.4.tar.xz
+sha256  dbc80f88d36fcde2c7acaaa9343cfab0f56effe9aee60e5eb00f3f36b8a619b4  git-2.31.5.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index dc587170e8..653b4f46ad 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.31.4
+GIT_VERSION = 2.31.5
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
