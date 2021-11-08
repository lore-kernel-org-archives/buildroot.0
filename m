Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EFEC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 12:01:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B180361350
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 12:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B180361350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BFD6402A4;
	Mon,  8 Nov 2021 12:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xaje6c70aoR; Mon,  8 Nov 2021 12:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C7B340295;
	Mon,  8 Nov 2021 12:01:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EC751BF33B
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 12:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E8974023E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 12:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJgdy1OZdet9 for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 12:01:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F2944026C
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 12:01:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so11434743wmz.2
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 04:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zJ7wR1nP2TLIjra3Gynhn7NCQ/yQm+Ql8qPm9WMDczo=;
 b=FbdyJyfpvSjz5OZARFaz6XOetBAYiKSWjNSfrtlSJW0Udk7QAleeVBirJcE2s7Ixsa
 wkhRUWATy7iSlZwzdyvF6IEtQaRHffsk+FMy5nuiQzzuFiWHDBpJ8lc7F5A8KkDrU5dg
 ZhApjQFKZ+pQodxgikC45GkcBLgEkWdKl9BvvRjcaf/VcZEk/eWf7X5yT5XZ5KLDEkpM
 +GcVI7VWZJxYDkWZfdaof6uAZWXcrQycVTfg8YinQAZVElMjwYvNHOmJ2Yz5CfrY0qTr
 z9rXi0HO0LV7dkaVV7BjwuAlE2Q+vqQ0ExfEL4L7d5dQ4OSrawYJBHz6OmwBaNspYPoK
 xGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zJ7wR1nP2TLIjra3Gynhn7NCQ/yQm+Ql8qPm9WMDczo=;
 b=bZ1hlA2q0sUQH6n9BtCx6lmdrqi9lpXCXQ5YxMFCqKtY9H9SLzJx7XD1IrmBEEl8NA
 Ww/XvvOeIJlVsyfaY79U3pTg/GTCKNrdvj58WG7yenQehU+1juT1IouSp/KpGbS97TeF
 wT1H4+denas/g+Luuku4VaIwyVh5J3Tz9iWuyIbM7ldKxJ6if+aU9AbmRSTjegiGNx+Z
 o0yIyYTglKXrHaD0S6dAMmKgUaAz34XKZDhJ5HeUAQXLlWYkkUPokGKghcWr/4hKnxSP
 J8KWh5me27F6h1d8ENGCvcKfA4irW84DRQDhVoaDO6QyIm+qfLtznbAb27griDo4YrYO
 OFAQ==
X-Gm-Message-State: AOAM530cYxVB9tbfBwFVhkMZbf/qT5WOMr12BIqe9GSLjadxP1OQpox3
 9eaUcWr6QdbRgdgcw07eAXmLZ1FHc3VmQA==
X-Google-Smtp-Source: ABdhPJxudcRqi8DTuWT2uov9r7TlzKFgjvszBn6q3sJplmIO9h3Er50R6YiodyoaLV/MuuW0pcsU+Q==
X-Received: by 2002:a1c:208b:: with SMTP id
 g133mr52986548wmg.128.1636372866705; 
 Mon, 08 Nov 2021 04:01:06 -0800 (PST)
Received: from smartron.clients.t21.italo.it ([54.36.30.212])
 by smtp.gmail.com with ESMTPSA id x1sm15681301wmc.22.2021.11.08.04.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 04:01:06 -0800 (PST)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 13:01:58 +0100
Message-Id: <20211108120158.1471083-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: bump to v2.0.13
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mosquitto v2.0.13 is bugfix release, read the announcement on
https://mosquitto.org/blog/2021/10/version-2-0-13-released/

Also update the checksum of license files, which have been whitespace-trimmed

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/mosquitto/mosquitto.hash | 8 ++++----
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 2692aa1a9b..7b950208c8 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,8 +1,8 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.12.tar.gz.asc
-sha256  31cf0065cb431d6f4e57a5f4d56663e839c9d177362eff89582d7cfde191c933  mosquitto-2.0.12.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.13.tar.gz.asc
+sha256  9cf83a558f1588e8798edd8647b1632af88e88ef2cd45054e903c517df5bd2cd  mosquitto-2.0.13.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
-sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
-sha256  e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
+sha256  8c349f80764d0648e645f41ef23772a70c995a0924b5235f735f4a3d09df127c  epl-v20
+sha256  86fc4a3f97cb769c04e8da557036c1066eb8bb22b2d0a5dd31464990fe84047c  edl-v10
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 06b963a994..b02f0c2f43 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.12
+MOSQUITTO_VERSION = 2.0.13
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
