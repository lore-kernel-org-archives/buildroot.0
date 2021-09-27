Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA0CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:44:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF7361074
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0EF7361074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFFED6084D;
	Mon, 27 Sep 2021 16:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wbnow9URf4Xl; Mon, 27 Sep 2021 16:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B6D360A3B;
	Mon, 27 Sep 2021 16:44:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BEF21BF955
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 842D1608A5
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNirCM7K-cgB for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 16:43:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B3716066B
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 16:43:44 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id v127so1051321wme.5
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tgf6euyIA3m1MqakaXgGhtS5QPMZYJXo3QBU7xRtyGU=;
 b=W1yvpGOlAEiiei81KZ9hNR50JljziS+5DOQxwNc2FHWnE6tRDkCSg3cOEqn+AKhLYN
 GRHXR/RWQFZ9FtZvLzecam8barwpcjUYjQCETAWdgV4KjGzDFIPPHj67e61eQUVAAEvS
 9qC80t8rjB0soFu0JgI9dODBUGMILGUROQbjMqMuggP5EySWUUYIWHMrcUeXTdjxNyBi
 HOm9YQ+F2wequ2TGvEBJCiA/x/pgfQQGHEyW2b8/uiQEYtyww3GJZgj+6R5UOhl4thMv
 22Q6qh8QUGu6msByOnpPUcLWUcHg2ZEY/+2zLFTiSXJ+mT64UzsjgxFl1vOgnHAFWgSg
 1Xqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tgf6euyIA3m1MqakaXgGhtS5QPMZYJXo3QBU7xRtyGU=;
 b=poK7IaHjfhJg4H3PVM0RcXA2qNcrqOiKHcosw5cSV/0Ki+Ak9vltLFDVMlVmOViZim
 h5+RRdSi0aAjiPYePVDlCEIAv2HT+4A8Z304RjT9v+HWZ5dOxJIe8BP+PtBBVd8KUdXD
 sDWPyH32mX3qu34jfYQY/DWSjosKB50GizebYXoHpCD+C+XpTo3R7z9ELsWYuBGOjni7
 IFBEuJ2MQ/+t61sGnNJ9C9mnQlCVrwtDiHBozpwZO3JUfwEsvoWeUbqQtG/+8PB9yOt8
 mmnaJHyDF84iSTdzpqYx8wy0yz4g2balNr4YP0C58ezKZor7AzBz7SerbtIPFx4bp5zU
 iaeg==
X-Gm-Message-State: AOAM530PQVAEe9IqHxvUcv1Jnc5hnXf/8+OWVNaLzyHJSwWFzNH+SelY
 ajXGnS1Q79zuEzZS0dWiQeyGn86k5VU=
X-Google-Smtp-Source: ABdhPJy7tjcuyZpzWy4ghlMjxihbPJ8vk7yycwdE3w8SYfwYhxKnXQ0HxotyMC2jX72OTXdR0ZQhsQ==
X-Received: by 2002:a05:600c:3506:: with SMTP id h6mr58700wmq.62.1632761022521; 
 Mon, 27 Sep 2021 09:43:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id o1sm17296774wru.91.2021.09.27.09.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:43:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 18:43:06 +0200
Message-Id: <20210927164306.1488012-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927164306.1488012-1-fontaine.fabrice@gmail.com>
References: <20210927164306.1488012-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/autoconf-archive: bump to version
 2021.02.19
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://git.savannah.gnu.org/cgit/autoconf-archive.git/tree/NEWS?h=v2021.02.19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/autoconf-archive/autoconf-archive.hash | 6 +++---
 package/autoconf-archive/autoconf-archive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index 3ef98f2f14..79ee5ff68a 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,4 +1,4 @@
 # Computed locally
-sha256 17195c833098da79de5778ee90948f4c5d90ed1a0cf8391b4ab348e2ec511e3f  autoconf-archive-2019.01.06.tar.xz
-sha256 e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
-sha256 23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
+sha256  e8a6eb9d28ddcba8ffef3fa211653239e9bf239aba6a01a6b7cfc7ceaec69cbd  autoconf-archive-2021.02.19.tar.xz
+sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
+sha256  23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 3f1f0a5b3c..bd4a09d96d 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2019.01.06
+AUTOCONF_ARCHIVE_VERSION = 2021.02.19
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
