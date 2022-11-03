Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BD4C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE31280A9E;
	Thu,  3 Nov 2022 13:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE31280A9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GcXt-1-nTicu; Thu,  3 Nov 2022 13:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9C9B81EB5;
	Thu,  3 Nov 2022 13:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C9B81EB5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BECA11BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 989C86072A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 989C86072A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dniB6cYC0MGA for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:49:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ACD5606E7
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ACD5606E7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:49:26 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id m15so1062580ilq.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SZUWtpCzoH5epoukTA3pKGEhQIv2CnuX17IRFgnFRIU=;
 b=e3cCbroXCzR5HoJhWyMC+HC88MaRGHdgKW6QCwDMQVlhtyiOwxNL9/6UXt34iPTa3S
 4M5jdykjWnbW1/Ok53jFXk5xKMhRNfpvFAIdWZgq3myEjlLSXNRdRG2SpgN6/gkqcoWT
 Va6mklq8a8gWc0mAdyKxHb/9gRZXfU6UolI4ITRr2iXYKVjfqeZufMebPkyWkMFRt6RO
 hWtdakt+WlJY4NDG5d0XyhZPYHBKro/eWRPmdG4vlv7BgArnwtCUNNY1x9ixp/w4GHH1
 nfbPbZBZZ0w3Myqip2G4IHogVMiRYMEmAPYEPdoafxLoS/IYyioUchAXYVmU+buzU4Wk
 cDYw==
X-Gm-Message-State: ACrzQf2wHCU0xGCd969qJqQVOyKhrMWVP5r2dxRekaDrzMW7nYFfhHQ4
 xe2h/Jp8BbW/CAJEZQl5RC+Ef/9X1cdOCdxL
X-Google-Smtp-Source: AMsMyM6dtkSxuk9Wkns12CE+DFnPW/bPbXHLVpevRLW4KLFpws2lj1qBM+gxQFclKECfM7LRCkeRcg==
X-Received: by 2002:a05:6e02:1287:b0:2ff:dd33:8483 with SMTP id
 y7-20020a056e02128700b002ffdd338483mr17549345ilq.21.1667483365479; 
 Thu, 03 Nov 2022 06:49:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p23-20020a056638191700b003729e5f8d86sm238147jal.62.2022.11.03.06.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:49:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:49:23 -0600
Message-Id: <20221103134923.2744481-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SZUWtpCzoH5epoukTA3pKGEhQIv2CnuX17IRFgnFRIU=;
 b=aOC81mAf6TkmKo9xhhfnVGJLGvt/g+e8GuIs4JKK7g3/u21TXJfiayvoKwRXAO0IcG
 DEfC3M1loN/Sz5/sJGqVcbV5bJ0P/iJ0yFjTzQEeWL7HCu1R+VnL02/PkPpv4VEKR0Fx
 bi/cXGT8zUdkgVLysWkDxgJeUg1LN7raRYVXMxyslByPSafv0VEI6H+W3gDjp+ZioQeQ
 SH99tS7hRCZL4WjgZxA/tHC0qZjjglcT/G9SnYA5qgFMg46vsYJC9uq3mlS36SfBTOZO
 6K1nIZntbQsY/DPaZTLAohlRbDIoKDUXNhEsIW2QpOhStvl7BPi0QhpvvV/EhivhDpj0
 ZwlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aOC81mAf
Subject: [Buildroot] [PATCH 1/1] package/python-prompt-toolkit: bump to
 version 3.0.31
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
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index 5a24634a56..8b91ee767f 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  ba9e63c3e7e5a4f4ce4e4770a4daba96  prompt_toolkit-3.0.20.tar.gz
-sha256  eb71d5a6b72ce6db177af4a7d4d7085b99756bf656d98ffcc4fecd36850eea6c  prompt_toolkit-3.0.20.tar.gz
+md5  0cc5e752cb2759e99658e2391644e767  prompt_toolkit-3.0.31.tar.gz
+sha256  9ada952c9d1787f52ff6d5f3484d0b4df8952787c087edf6a1f7c2cb1ea88148  prompt_toolkit-3.0.31.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index b575783f96..bef761e20f 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.20
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.31
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/b4/56/9ab5868f34ab2657fba7e2192f41316252ab04edbbeb2a8583759960a1a7
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/80/76/c94cf323ca362dd7baca8d8ddf3b5fe1576848bc0156522ad581c04f8446
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
