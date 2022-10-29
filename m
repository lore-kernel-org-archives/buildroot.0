Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (unknown [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C6EC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 00:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B2714017E;
	Sat, 29 Oct 2022 00:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B2714017E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUWtN1GFKPdP; Sat, 29 Oct 2022 00:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D395400F8;
	Sat, 29 Oct 2022 00:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D395400F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5663C1BF239
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 00:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C76940104
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 00:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C76940104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gELd1FlrCujj for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 00:19:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6287640017
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6287640017
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 00:19:27 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id z3so5923571iof.3
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 17:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bM7i/p8zW1G6ifkJDXSZNz2eKdlIqlHCB9IvaG5xCyU=;
 b=onL5JPTAfEPi2YgG5u6PbMwMQ6kI2IdSesYBH1d6EikfgfkMNS/tdlyudmME7l4Ox8
 3DIohNWcfMVBHTqRWvWFQi6cEEOW71ROI4vVCg2owOOHUNd2JvqHXInRpP8yVCU25k2N
 Ye+ekeI7ApTWZoL7jQD+uZOgyRLREs7o0ZKf5+uq5+38UBOPGS++j6snxR4H2LUuqqyG
 D7Ov/8OkrK/Gcw5WitQk4JSL2dPT1+fZT4f2uQWlZmO3lDwIKW2hPmF0Hu7bq6mXtejy
 plg9mmzcCwy38zfxZtp1H3YYMug/m4W4zbY+WLqVSPOVsvwZ9L8MUuuEtKh8XXysmF6n
 FF9w==
X-Gm-Message-State: ACrzQf0LAaH8020mW//esyANDfjYyYa7JLUJ5RBFa86S8be4RQBqf7WI
 S7CLnWX4+4J5yN0DI4hZ2aWLuyRmHqrRqA==
X-Google-Smtp-Source: AMsMyM7bs2X3jwh+kGSmvmIOXN0tiY0jqsmqVvJcwUen966oLoFsnL15iBP7ozhSzF1ymmcfbZK0Gw==
X-Received: by 2002:a05:6602:26d5:b0:68a:db5d:2923 with SMTP id
 g21-20020a05660226d500b0068adb5d2923mr1024248ioo.175.1667002764463; 
 Fri, 28 Oct 2022 17:19:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m17-20020a6bf311000000b006bbf0466587sm35894ioh.49.2022.10.28.17.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 17:19:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 18:19:17 -0600
Message-Id: <20221029001917.1312839-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bM7i/p8zW1G6ifkJDXSZNz2eKdlIqlHCB9IvaG5xCyU=;
 b=iQx6sIDyXYNhaVvxFZjxdpCLzwl5vBFAf5SHcSMPTTw4D58LDqFanveDExTcgM0wPK
 qdFmjOZK22S4Q8g05Ucs73TGek76BmxWoxZoy7IU7ZzpR8JIYPnUx/33foDiK4wfIAqe
 BFau7Ln5E8zxKauaQaoNQK8tHJPegSt0aTwvIDFZFSaPF9E+CKipjpCPizWQkf7de7ei
 +RHQmE+Ep35rclTJjfSgOgYIOz6MeP3fxjXzyBI0vgfHK0cEKvf3+0hd8OZt6gK4i1zp
 Bmihm1PxPeKa4+PQDGwq9ne83AaQKOvv/w9lyPU5gGaM7UtpTjeeuWF3QgC0VCBafSMn
 /9qQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iQx6sIDy
Subject: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump to
 version 4.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date/formatting updates:
https://github.com/python/typing_extensions/commit/fb77519b198f9d610ee8f674e27b8ce1da00f61f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-typing-extensions/python-typing-extensions.hash  | 6 +++---
 .../python-typing-extensions/python-typing-extensions.mk    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index 2512ed042d..249bb63a42 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing_extensions/json
-md5  30ff8c89459dd93970a92a90b0386aba  typing_extensions-4.3.0.tar.gz
-sha256  e6d2677a32f47fc7eb2795db1dd15c1f34eff616bcaf2cfb5e997f854fa1c4a6  typing_extensions-4.3.0.tar.gz
+md5  5cfcb56ea6fc4972c3600c0030f4d136  typing_extensions-4.4.0.tar.gz
+sha256  1511434bb92bf8dd198c12b1cc812e800d4181cfcb867674e0f8279cc93087aa  typing_extensions-4.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
+sha256  c7afb65e755707b9fb90487389a176d3ed3d0031d5131afde45c23715ff5e891  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index 2b8c23f354..fd7d0bd93a 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.3.0
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.4.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/9e/1d/d128169ff58c501059330f1ad96ed62b79114a2eb30b8238af63a2e27f70
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/e3/a7/8f4e456ef0adac43f452efc2d0e4b242ab831297f1bac60ac815d37eb9cf
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
