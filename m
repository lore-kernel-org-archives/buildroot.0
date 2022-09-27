Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2E7C6FA83
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 07:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68B2040635;
	Tue, 27 Sep 2022 07:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68B2040635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aaY1Py34N6KU; Tue, 27 Sep 2022 07:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B366405FA;
	Tue, 27 Sep 2022 07:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B366405FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 240B41BF2F9
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 07:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3BDB8132F
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 07:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3BDB8132F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y-t_8I0dqaQu for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 07:23:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CA478132E
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CA478132E
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 07:23:49 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n192so5913895iod.3
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 00:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=EPaJko305v8tIrNgZqBQy87cWysz67YGhTh0+6c2Ml8=;
 b=GUtoSecGEsWyZVKTVU/wPYmEJjbFPLTY2MDe/1BAutzvsENZ+H9j5pMZNYISHTeVxu
 0f5qw4cmw1bSoEkkXxJr+fSdlyJRjaUhF2L79W9V6SOi6Ed5BN2lOZ7s/6/iLdk15tBR
 dnBIQfTOxEl8rhlHkja8HAUEPk4W5K2JRA86lfKfUxY6H+ef1sgX5oW/MrCQ+ACdA42R
 oxtwQed9rrfSTpIv4T+Z0dBrU7x06b922pegtq5y5DNkHESvsqF0uJ+I/O/XX8LS1oZO
 rPZ2GxjW+jdxXLVqDub0b311YdyGKVCSZ/WFQq/VTBwwabMHbTwF+BtN+CNIBVj18LVL
 bMvw==
X-Gm-Message-State: ACrzQf2W0lv76vFRfjQztJKN8A8YiXV0l1Y57kVbcMyWEUaB9XRYqguL
 f/qL8xLZdXh17aZ8hfAKNxlW1Vf/od3P5g==
X-Google-Smtp-Source: AMsMyM7/3JZa1/uBW0KDq4c8I7oxR1BuWfbG0clQ3jonXNfyPqEXLc3RgFLd3aFUpBIFYtrIFT/oNg==
X-Received: by 2002:a6b:ba46:0:b0:6a1:e2b2:c320 with SMTP id
 k67-20020a6bba46000000b006a1e2b2c320mr11241836iof.15.1664263428611; 
 Tue, 27 Sep 2022 00:23:48 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 s13-20020a0566022bcd00b00688dd369c7esm433663iov.55.2022.09.27.00.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 00:23:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Sep 2022 01:23:46 -0600
Message-Id: <20220927072346.1050428-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=EPaJko305v8tIrNgZqBQy87cWysz67YGhTh0+6c2Ml8=;
 b=fZRO+5vBOC3Csl545Dpx3A2QPXA4z3KPJEEtRP7DgG9oNPZMNI6uaM7AXwT7fF/t3N
 LkorZSCxYrlpsqIZgxQyGZWvCqfVk4E7gJw/5X0evZ5XKn1ab/okki6aSCjE+ytQTbEn
 AA6bM61i6auWuOQDXRcm5mCjUXurIPkSCd4czoEX9MUBrN7hJbFz1tV6CZydTwdVkySc
 EiWg1q0ZN+kEr6T5jiBcakW1sQ4robZLQCPl4CnbRBka0rLEJLceYFg5p8q7aGSu5DMy
 2LgvNvTIRp6vs78f79d/UPT0KDPcSAog05vPKGAe0Z25zB73kUhocqtrUCgF50OyxsL0
 KFIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fZRO+5vB
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.13.4
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
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 7babd70111..4a3e0f5eb7 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  33f7cc8cd0a05bdd577afda1482e6bd5e33ad881366b1e9333625e063852cdd7  maturin-0.13.3.tar.gz
+sha256  9cdc0e1ba358d07406d938757eb9eb829c6f55a8d88fc1aa2a119a02bb955d4e  maturin-0.13.4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index b239f282ba..8f2f09b406 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.13.3
+PYTHON_MATURIN_VERSION = 0.13.4
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/f2/5c/af29a40fde2c8fea1e34e79a5d43e2a4278a685c1c9039c107444f9312d9
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/72/0f/482444ac14fd74286dcb6bf1407008eaef014c92da0b077b112ff96865e3
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
