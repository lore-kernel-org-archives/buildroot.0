Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD3CC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 15:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64BFD4013E;
	Sun,  6 Nov 2022 15:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64BFD4013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gk6FVaOlOBNI; Sun,  6 Nov 2022 15:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88074400FF;
	Sun,  6 Nov 2022 15:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88074400FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D51E1BF287
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 545D981A47
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 15:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 545D981A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lbl-Cnd_xN5u for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 15:23:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E56481A46
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E56481A46
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 15:23:29 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id y6so7094702iof.9
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 07:23:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j9IoGT+uVx/W5H+K21zofxSKPLlIv+Thymi6THJkhJ4=;
 b=GsgjSiT34FTnTZQh0nsdK/0+d/XaFPth25Byf4Bxhf7pkmbJUReVcjiFmgUGg6kUTM
 AX/3RY0jRaGN+PWxqnp2oHm4eD15eRADFeNIf5oPjI7YyOl++qPF1bMoHX9DJtNz9J9y
 yFlyz8CpOWo1OR7oQ8/MEIAcCLQs0FxW+6qr1H22/PzL37XYdjXAPbw35yoasxTj9VIQ
 YnYfhx5JmSKprJl0OZIb77ELTHFz55aVnL0LmhsMPuoqarLPTONB0BM9jzuVAyuCx+bc
 E5JowxP6xS0YLFqbWHZjUtc3KyP23+N6wwrpeYTD7Ry5OV/MYPKaVrDCLaqE60dRzUm3
 7AGA==
X-Gm-Message-State: ACrzQf1zPHoZg98SJdn17VuCjwplCTqzmh5naiRNOxuSW2P+k/4tPu5f
 bkKOnQMCQh3+WQG7ITFaBvmCqz9XjRO1xw==
X-Google-Smtp-Source: AMsMyM5LDItN2jRNPU2DLejXdaude5A1DrFchKS87NJoS4lG7jc9EA1pCfG617eEeMrYsAmC4gULcA==
X-Received: by 2002:a02:6f54:0:b0:375:76da:1c95 with SMTP id
 b20-20020a026f54000000b0037576da1c95mr15571583jae.42.1667748208086; 
 Sun, 06 Nov 2022 07:23:28 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x10-20020a02340a000000b00349d2d52f6asm1728624jae.37.2022.11.06.07.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 07:23:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 08:23:25 -0700
Message-Id: <20221106152325.4047133-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j9IoGT+uVx/W5H+K21zofxSKPLlIv+Thymi6THJkhJ4=;
 b=MaonTJHcgyIxuRL6a//svZlq5/oDMjUwgkvotGzsy2qxaCiTYW/cYG82RbAtZmpaZ3
 k1rkw+XhqdmwxE0MY1yTTFo3rYvVC7+0aJf+qNvEZ6lzkwaqv0kxQgu//h72Lx/4J0+Q
 GVlBeSvwT63bRhyU/vJZRJ56GMsEMDgLc+xgalIEAqheySWWlgHk7NyOw3XXSfYIxiPI
 4MzR/8T+q9+AcXhwqJ+1zFgQf2jebTMbX+QY+L6GcggHspDU33kifwC+/6Ta5RuZd/5h
 zRstcn1MmTaGupJDhP/4GchM6qQImRC4efOpb+7SB/NsP0vbdQT6z0lp7N0QTjem6JC/
 Ve9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MaonTJHc
Subject: [Buildroot] [PATCH 1/1] package/python-jsonschema: bump to version
 4.17.0
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
 package/python-jsonschema/python-jsonschema.hash | 4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index d4c2759811..19b9659d08 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  3bc1f63a74fc61bf2847f22cadb0dfff  jsonschema-4.16.0.tar.gz
-sha256  165059f076eff6971bae5b742fc029a7b4ef3f9bcf04c14e4776a7605de14b23  jsonschema-4.16.0.tar.gz
+md5  e569b6114d575bdb05cb8ce4676fe458  jsonschema-4.17.0.tar.gz
+sha256  5bfcf2bca16a087ade17e02b282d34af7ccd749ef76241e7f9bd7c0cb8a9424d  jsonschema-4.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 68a25aed58..8cc624886c 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.16.0
+PYTHON_JSONSCHEMA_VERSION = 4.17.0
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/cf/54/8923ba38b5145f2359d57e5516715392491d674c83f446cd4cd133eeb4d6
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/3a/3d/0653047b9b2ed03d3e96012bc90cfc96227221193fbedd4dc0cbf5a0e342
 PYTHON_JSONSCHEMA_SETUP_TYPE = pep517
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
