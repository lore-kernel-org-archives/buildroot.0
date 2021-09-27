Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF1DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:43:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF574608FE
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF574608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 285E060067;
	Mon, 27 Sep 2021 16:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5IpAOpOj34TD; Mon, 27 Sep 2021 16:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84DA86084D;
	Mon, 27 Sep 2021 16:43:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 886071BF955
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77F6A402E5
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IUI-hUXoXedq for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 16:43:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7830340272
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 16:43:41 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g16so53077641wrb.3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FwNNt0y7LQEug+ADLXUM9K9eTIWyL+S5Y+2ExOvImBE=;
 b=goFr0QhrGFnvTK7YFvsSYjkyd2WO5ZHSVzC5e/Pq/6N2yxD2w0nZ1BIMScMkIrDw8n
 jwfQfc06QyVOTpPkdkR67B0bQfZ3hSfKwZ1FNH69CK1ItuSZoqZitZO1GKOhhguCeifw
 3LQUt95flBBdJrnyYl/7VrtL+FeVjyV7SM5CoIrh8eQW9kD5SLlaeWJLfHyUZIyIOWBL
 NbGTvW6o11ADys2Cx4OPmyiJGiOJNqmm+Gn1UXknEUlngLRysh/DbmlyU3yxsrYr9bTx
 A++sh5SIq0/HmSGct68xXpLNJyLG/Ak1wRUJlsyudm1uExI7NwccEhLWoiGTSLwLz3Ma
 ZROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FwNNt0y7LQEug+ADLXUM9K9eTIWyL+S5Y+2ExOvImBE=;
 b=Ya2NIR4OQajelIHqTG10hr068rKaTlT38grVz7RNghn8XlsG6ebcygNzvVynOQ/Fup
 YVOsNgYo6tP30f3I1W88LzGHvIuo0VpQQzXEOLNfKg6FPxIQjWFdyLuYdjGIo8hwzxIb
 Z5RwPxrVClBUmTIAJSfB6D7JBBE9kwpZyy9eOQtFRDJDcO5LA6WTdwuDlsBypYcevX4O
 mzbQ+X2wICcXN71OFmZC5HIH0v64vMpg6Ky6UqDK3LmQ9ONxKS0dw+sOLa5RGlsCv32/
 uRPn8uT+wJNlfN5P3BYVsxDqC/Q+iKEWacJGR6U1TcT9jVGJ9yf9T92ta1vpU5aoGlbi
 dlPw==
X-Gm-Message-State: AOAM531uoilMdh2Lo/iEToDK2otD4oaF5gZjDXnCsK4jPcbTg2lK0w80
 h1oDrCbLa1wZ6bSQKt5Rsmk1vlxIN6Y=
X-Google-Smtp-Source: ABdhPJwQn9VLk7Q2ge9VqkiRHvScokyrEJ5C5rmtwNPtLn38CXdYfRG5Rf6K7aeON65+4cmPfizmQw==
X-Received: by 2002:adf:f486:: with SMTP id l6mr886424wro.375.1632761019466;
 Mon, 27 Sep 2021 09:43:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id o1sm17296774wru.91.2021.09.27.09.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:43:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 18:43:04 +0200
Message-Id: <20210927164306.1488012-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/autoconf: bump to version 2.71
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

- Update hash of license files due to links being updated:
  http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=61024bf52ba8a58f8992490134280eb9575e2525
- Update indentation in hash file (two spaces)

https://git.savannah.gnu.org/cgit/autoconf.git/tree/NEWS?h=v2.71

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/autoconf/autoconf.hash | 6 +++---
 package/autoconf/autoconf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/autoconf/autoconf.hash b/package/autoconf/autoconf.hash
index f53e8979c0..de0840dd84 100644
--- a/package/autoconf/autoconf.hash
+++ b/package/autoconf/autoconf.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	64ebcec9f8ac5b2487125a86a7760d2591ac9e1d3dbd59489633f9de62a57684  autoconf-2.69.tar.xz
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYINGv3
-sha256	23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
+sha256  f14c83cfebcc9427f2c3cea7258bd90df972d92eb26752da4ddad81c87a0faa4  autoconf-2.71.tar.xz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYINGv3
+sha256  1f1cde9fb68b9b3cff18c420894bec5bd4defacd700b7d13df54a887301e5350  COPYING.EXCEPTION
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 336ac59b42..5742ea6c55 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_VERSION = 2.69
+AUTOCONF_VERSION = 2.71
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.xz
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
