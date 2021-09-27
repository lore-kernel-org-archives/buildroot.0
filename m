Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE900C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 21:19:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3948861052
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 21:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3948861052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E654F4040F;
	Mon, 27 Sep 2021 21:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1L4W5mwchVY; Mon, 27 Sep 2021 21:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55615402EF;
	Mon, 27 Sep 2021 21:19:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55DC61BF48B
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 21:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51DA860703
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 21:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id POkcmib0yKov for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 21:19:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E7216060E
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 21:19:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f78-20020a1c1f51000000b0030cdb3d6079so1028867wmf.3
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AZ5DmturvPJb5EGWfhuPj/JyWe11xOzl+FYzV8/hEIM=;
 b=HDaGVh0dWLFJkUh0nWV8RQyR08JQxSc1ylgof4BBZVgZTfHmujKSFRuC0KLZQQVB4T
 nAHq7yrmwlUMLLkJ6DUTKVJBhqcw7jLhvESuscT2ml0KeOWqitV5RkpuCkF5zb1qUEjd
 P2zOz6jXKJWT6Xdz5sABn7jIYQsnQZNK346A8Zgl902SV5/cTP57f3QxXYbMSlcxxcuF
 aVXXA7gCgkQcyQUfFlGDdQAUnvV4XHhpQEjzV65mfuKwCkpA93BdsLkp2eEcC8ZqLswC
 AjugLVYoJcxp4dVswBepw4LuYq6W8eyUNcwnDbG4qqGWSKFe5I+pO0yA0yGk4yrXY6C9
 DlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AZ5DmturvPJb5EGWfhuPj/JyWe11xOzl+FYzV8/hEIM=;
 b=VBcOYVPQFGWwOXdaDhdYegVrE+JRe0/1PTde7GWAFPBoC9EX4ZLW0825H/9/M1vqEo
 KwLWwBnMwuShNugoIx7QoD/+d6ualVTUsTjkmLY6pEnceZ3Drl/Vl2g5iOJVeOQKEJE9
 2XhWkmroyksid4HDUhJA6xQOPQFamV6plH0rHknMJHBpt916+AnXsQxLgz4ux/ckurIP
 k5ayM9bUCkQaGGk+RmFjkIYfFJ/0HQVJSY1/bW5Rlfyz7WR84LO9Qwmcap5AUDqxTQe0
 Ov0NXJB+8zZ8IJsC8SzEC8TGlMWmYAI/mzcZBVCrJMoMvSnBIFtKdfW+/oyLBWIuXJMs
 kj/w==
X-Gm-Message-State: AOAM532cGWHBFBEc0XxRaoG6Z5SUzCBoo6IfdOSQBIAylQANWzJs4JnL
 f3Iv3hSiZPYDVdvin4u/HoGGW001grA=
X-Google-Smtp-Source: ABdhPJwtJxHTuJkNXB1p/3gqQ3/G5yZXNm60JKCpisAsZ9l3rt/bDz2I3lUee2u/UKoWu9DpeU0sdA==
X-Received: by 2002:a1c:7d0f:: with SMTP id y15mr1206407wmc.41.1632777553281; 
 Mon, 27 Sep 2021 14:19:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id i67sm688988wmi.41.2021.09.27.14.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 14:19:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 23:18:37 +0200
Message-Id: <20210927211837.1499743-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/atftp: security bump to version
 0.7.5
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ryan Barnett <ryan.barnett@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2021-41054: tftpd_file.c in atftp through 0.7.4 has a buffer
  overflow because buffer-size handling does not properly consider the
  combination of data, OACK, and other options.
- Update hash of license file (license replaced with current version:
  https://sourceforge.net/p/atftp/code/ci/bf22ccaef34f5dcdbd48de8b0bea3ef97b9d3545)

https://sourceforge.net/p/atftp/code/ci/v0.7.5/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atftp/atftp.hash | 4 ++--
 package/atftp/atftp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atftp/atftp.hash b/package/atftp/atftp.hash
index 158e9e3b33..6b0d9a5879 100644
--- a/package/atftp/atftp.hash
+++ b/package/atftp/atftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d3c9cd0d971dfc786d7a5f4055c35d4e66aafc8102ac03473ef225bdf7edb26a  atftp-0.7.4.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  LICENSE
+sha256  93c87a4fb18218414e008e01c995dadd231ba4c752d0f894b34416d1e6d3038a  atftp-0.7.5.tar.gz
+sha256  86dc744860e6dfacfeba2f33fea908db03fe67c7e37a878285b7aae8e4596735  LICENSE
diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index 3db966c169..70ef4c0fae 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATFTP_VERSION = 0.7.4
+ATFTP_VERSION = 0.7.5
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
