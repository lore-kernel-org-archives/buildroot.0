Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07032C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 22:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 715D161076
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 22:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 715D161076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28AB1401E6;
	Fri, 17 Sep 2021 22:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2e6Eec3uhZSI; Fri, 17 Sep 2021 22:20:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E80B4028C;
	Fri, 17 Sep 2021 22:20:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0694A1BF4E2
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 22:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 020E942528
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 22:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1AJ-X13X-EL for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 22:20:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CE92421F2
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 22:20:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id y132so8424772wmc.1
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFds1vnZCmOnj8F+d4qEG80QGGnoUYf8uSTM1JGmgcU=;
 b=JevlEqj/PsW1RZ7anpO1DELIXtQcB7jpLizoKRQy/Hr8CnoJgxf/r2KeCggwn/XrCv
 9C68MydtkHz2f7b5qXAZ9SesVIifVA/zrDRGXK8LIsH7kKQoqc0qxpYJ5LXspHw6biXt
 sOSHVlLJp5Jk/FRi9DuiGpBXik2OhYiqqZm0VQfRCWU/B3uvmhCG2qyClhAWQnlfMYWV
 vTphPU6coXzNY2XbVwvImED33Wpz72AfKBQEl/f2sP6rUkTTDjCP1hVXACW0CrjqLUgj
 22/9TY0nFFo7b+GQ2p+yH1RRvN8/1JClImNtxHF6HY6nI/l0NlXz1XNwlrGC67uglYbK
 uixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uFds1vnZCmOnj8F+d4qEG80QGGnoUYf8uSTM1JGmgcU=;
 b=YQ48XfubufO1OFRvpBpRKtqhW9g9n+W4nnFeGdmSBLlyIsXFciQUKuhzbXVPf7Fkn8
 Fh2/Av5snRcuZleVeIq4C9RBYgX8qDaRAjEpUbI5EpzHYRGuxB/f1UfCNUj8bRVOSnMM
 CKmg2j/+WZHUsMMI8qp1ZQb/op3hmlQMBEB3cd94aeAHw25OobaMvNDLlkNsgDNSs1td
 cWerBZGg7v8OL0TMORLuirZBwin+P+PoLF0dK8Cke7JzcoZWZ1/cvwaEVmKVELF8Br4Q
 PnxPQVZIKyDVtdx3PCmgn/nr9yOASz4MTErZYXSGfFi0AHVpBNM0eLoqDHXxMe9RYQ5K
 9+wA==
X-Gm-Message-State: AOAM532GeTX5RXhLJFcKRJAv71+uTmdBkieU/locLe6bcAEZIqYEBqDS
 M9t/R+vi6S4qc+QJGLP1EJqw+5IdOc0=
X-Google-Smtp-Source: ABdhPJzWEOX3IIm0rj1KtBvyXBcF3Y7fi2r6NBQyqb2pRXpSqNcXkLI+usJx8jW6M+6iVh6bPnuGVA==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr4938501wmi.59.1631917218864; 
 Fri, 17 Sep 2021 15:20:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id 129sm7615246wmz.26.2021.09.17.15.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 15:20:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 00:19:34 +0200
Message-Id: <20210917221934.631955-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump to version
 2.4.49
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix CVE-2021-33193: A crafted method sent through HTTP/2 will bypass
validation and be forwarded by mod_proxy, which can lead to request
splitting or cache poisoning. This issue affects Apache HTTP Server
2.4.17 to 2.4.48.

https://github.com/apache/httpd/blob/2.4.49/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index c03934b40a..49efefebb9 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From http://archive.apache.org/dist/httpd/httpd-2.4.46.tar.bz2.{sha256,sha512}
-sha256  1bc826e7b2e88108c7e4bf43c026636f77a41d849cfb667aa7b5c0b86dbf966c  httpd-2.4.48.tar.bz2
-sha512  6c250626f1e7d10428a92d984fd48ff841effcc8705f7816ab71b681bbd51d0012ad158dcd13763fe7d630311f2de258b27574603140d648be42796ab8326724  httpd-2.4.48.tar.bz2
+# From http://archive.apache.org/dist/httpd/httpd-2.4.49.tar.bz2.{sha256,sha512}
+sha256  65b965d6890ea90d9706595e4b7b9365b5060bec8ea723449480b4769974133b  httpd-2.4.49.tar.bz2
+sha512  418e277232cf30a81d02b8554e31aaae6433bbea842bdb81e47a609469395cc4891183fb6ee02bd669edb2392c2007869b19da29f5998b8fd5c7d3142db310dd  httpd-2.4.49.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 365dc9a72e..ae2fb70535 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.48
+APACHE_VERSION = 2.4.49
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = http://archive.apache.org/dist/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
