Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B14C07E9D
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 18:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF4260B8E;
	Sat, 24 Sep 2022 18:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF4260B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ilpzxd4-aVSy; Sat, 24 Sep 2022 18:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19D7960A4F;
	Sat, 24 Sep 2022 18:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19D7960A4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87C911BF215
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 18:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7065F4012F
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 18:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7065F4012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XoIFtOqOvUy9 for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 18:02:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A035400CC
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A035400CC
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 18:02:53 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id p202so2257601iod.6
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 11:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=yFq/FptGpl6cFGtqRUeDopPb/9d8dkP1qqE6vlEZ/aU=;
 b=bCRHj/Zh/xooFwJr/C6IOHVe2by8SzeBLN3pyTlr9lNq8O4rA8yuKEY4BnBud98x0N
 62DHCF5UbWJ8rYXLm4iLFZKVywnvL3vH2PRk1Cy/50UBhDYiQUdkVvRXIFMuqtRBWwgU
 tlo8Omkg/CXqS7ILrg2Qw0FwWO9Pb6pOWD1Bt+VOh6xtMQBwQiZajx5kWttd+RuHfRa7
 1u/u4OGnTG+q6snY7sAxiz3SoohvTlWqDtS9CR9cAtcW2IUC7kk/36Yhzc1H6KydgmeX
 YR83F8WJdp1buU1GEhOr/pdOGkNvpgGy63ouhCTixoiMdwwNwmyqNGADTvTWgkWnFupY
 tGyQ==
X-Gm-Message-State: ACrzQf3U6R61/oy5jfWCGCRmAta5/L249lNbJ3qi6XNnc3gAHuR4yI+1
 GNJSQTffTNEN8uQ3VqRL8kg/WKnQTGogsA==
X-Google-Smtp-Source: AMsMyM6u5m2oErkel0muTw4bz7RnRI42mAoO+Ozdy1YQay5oHA0EL2GtGd2Pf7ypHn4sq8xxPPG1Iw==
X-Received: by 2002:a05:6638:3a1a:b0:35a:26bc:8856 with SMTP id
 cn26-20020a0566383a1a00b0035a26bc8856mr7595404jab.47.1664042571837; 
 Sat, 24 Sep 2022 11:02:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 l5-20020a023905000000b00342cb39de68sm4727938jaa.130.2022.09.24.11.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 11:02:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 12:02:48 -0600
Message-Id: <20220924180248.61154-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=yFq/FptGpl6cFGtqRUeDopPb/9d8dkP1qqE6vlEZ/aU=;
 b=d/seaLFNILt6iNUPOAVq/GnExPjhb57kemKbZhPsg5PgVkrG109kSHWltP0giZ6mnP
 9KvBvtsNlBtiITY8SQ/IMOyjtmB6aN7QMTVF6vqCQuCGqP6MWh/QgYqLCvBNfBC874lG
 crhxN0YxLiBuTzgiyNjOQ3oBM4/abQ4LQpyPUxyySqiEfH2/Nld8gprmWGqGkvpuV1yZ
 WzVIk9KjG+VRS4cZ18+8nqLIPs+DXHogbgSyDyoWpksE3kmaHyhnOvTN9IHKEzak5fiN
 EVoNgBdknC7zIfFl/qhUp77cJXbkpOOs7a0Mm/C1Mgp9e1f6cQL+feMchak0W0yk7qze
 tfFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=d/seaLFN
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.5.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index e503e7ef18..ff1b9a127f 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  deb0db6178d296876564d0bcbda8d212  setuptools-rust-1.5.1.tar.gz
-sha256  0e05e456645d59429cb1021370aede73c0760e9360bbfdaaefb5bced530eb9d7  setuptools-rust-1.5.1.tar.gz
+md5  fd3412ca77ffd6e06e2e83d0e9636084  setuptools-rust-1.5.2.tar.gz
+sha256  d8daccb14dc0eae1b6b6eb3ecef79675bd37b4065369f79c35393dd5c55652c7  setuptools-rust-1.5.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 44fce8f843..7f19ece1a3 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.5.1
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.5.2
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/dc/20/0b16eb0dd28c3ec6fccef77230b11e4b9ec94aa7ade1c99b1ab66d237fbe
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/99/db/e4ecb483ffa194d632ed44bda32cb740e564789fed7e56c2be8e2a0e2aa6
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
