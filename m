Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED243C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8585940297;
	Thu,  3 Nov 2022 13:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8585940297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLZQf4g2oCba; Thu,  3 Nov 2022 13:59:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8D934049A;
	Thu,  3 Nov 2022 13:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8D934049A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 130A61BF294
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2D324049A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2D324049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyvNpjA1NqNY for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:59:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8582040297
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8582040297
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:59:54 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id r2so1064289ilg.8
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hyhI4jdnKAjUdS56S4h14XVptVrMCv1ImA8bYO4ftFY=;
 b=QVpXJ3aIp49v4jBEGaIG5c2FfHwRI312xSwecD1s7ty2ft25OP6bAKPCTMidn9NKzo
 csLEHvj6yWH41YAQ94L6bFN/GKbJ0mixdSSyPjfZ1+070vdZzX5M3jLOnLEY8hK4Sozz
 J6Wpeljik0bU4ag+Vj8D6GrJdu3PitfxMnVNKhrgf2F1G8j1eyj/yliX0/j4U/lFzbCE
 aK675XV5zHaNPdpVjuP6Tg0yvOP5OZvEYecU7/+vcPu52pQo+CYUwv1bXSCoVsPkunRe
 4dIItPvNiBaZJSbMgCN0gaT+/iwlS8AzykY8dBgwNaYSeCFgajQHrh5R5lJHN5aq4BdR
 AimQ==
X-Gm-Message-State: ACrzQf0aBG3YOJVExYOgwVHyxGx6PliOoVLpYvdoW+IRCWB/yFzXzQdZ
 bIS7WqQG4p/40x7dDCmYM9IPLSdPAxzjTJk0
X-Google-Smtp-Source: AMsMyM4na1rfYGgPafqeNQGpNxzVjNFEdAtbP3Z8y8LY+TUtmTJ3UIEyJ6iFAdPcKkUNuYbb6QyB3Q==
X-Received: by 2002:a92:a806:0:b0:300:d514:6b55 with SMTP id
 o6-20020a92a806000000b00300d5146b55mr2893728ilh.235.1667483993198; 
 Thu, 03 Nov 2022 06:59:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 t17-20020a02c491000000b0037494035324sm246349jam.48.2022.11.03.06.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:59:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:59:51 -0600
Message-Id: <20221103135951.3723634-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hyhI4jdnKAjUdS56S4h14XVptVrMCv1ImA8bYO4ftFY=;
 b=AWxZkORp9+rbqkldSLjKghzPBU/2SbOR4XikOTQ8i2tpMdUJ3SOlC2zZalwKB8ykop
 znIZIL6Rybc5mEbrvcva7/NDTiMUYWHv2nryC11b2PEqhZU93bmntltRZt9DxGghhXqm
 2CsrO3eyX3ZKH6UM+F2C4znbjG1plicDTr5FFXuCrr0CHYXoAikA4eobelzQWbIBFWIE
 fClnBA00bO2CVrDoZfU0Ubjkpn0WLXmXECocR7Sf5roI87W6iCdjvGwm9pX8Ppk5tHKY
 pm4+ksdV5jgn+fLYY8elyYvEM4MLNaaJl9U1KlGQcD22hDchF+KWHxgyGrBNjMVqtv0b
 yteA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AWxZkORp
Subject: [Buildroot] [PATCH 1/1] package/python-py: bump to version 1.11.0
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
 package/python-py/python-py.hash | 4 ++--
 package/python-py/python-py.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-py/python-py.hash b/package/python-py/python-py.hash
index 2d9928f376..537fe31773 100644
--- a/package/python-py/python-py.hash
+++ b/package/python-py/python-py.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/py/json
-md5  5f108bfe00d5468cbdb8071051f86a55  py-1.10.0.tar.gz
-sha256  21b81bda15b66ef5e1a777a21c4dcd9c20ad3efd0b3f817e7a809035269e1bd3  py-1.10.0.tar.gz
+md5  bde7dcc1cb452a1e10206ef2f811ba88  py-1.11.0.tar.gz
+sha256  51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719  py-1.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  LICENSE
 sha256  2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866  py/_vendored_packages/iniconfig-1.1.1.dist-info/LICENSE
diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
index d8cb6fa544..cec02dcfa9 100644
--- a/package/python-py/python-py.mk
+++ b/package/python-py/python-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PY_VERSION = 1.10.0
+PYTHON_PY_VERSION = 1.11.0
 PYTHON_PY_SOURCE = py-$(PYTHON_PY_VERSION).tar.gz
-PYTHON_PY_SITE = https://files.pythonhosted.org/packages/0d/8c/50e9f3999419bb7d9639c37e83fa9cdcf0f601a9d407162d6c37ad60be71
+PYTHON_PY_SITE = https://files.pythonhosted.org/packages/98/ff/fec109ceb715d2a6b4c4a85a61af3b40c723a961e8828319fbcb15b868dc
 PYTHON_PY_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_PY_SETUP_TYPE = setuptools
 PYTHON_PY_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
