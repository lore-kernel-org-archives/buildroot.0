Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9858C282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 21:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94088820A8;
	Mon, 17 Mar 2025 21:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hx0EiyVVKlUX; Mon, 17 Mar 2025 21:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91582820AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91582820AA;
	Mon, 17 Mar 2025 21:46:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5F8C12E
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0BE3820A0
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-49khFm8NwJ for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 21:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BC68820AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BC68820AC
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BC68820AC
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:46:05 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3d2b6ed8128so19046765ab.0
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 14:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742247964; x=1742852764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Jg2CBN0ly3vj60xHXuexMnK/Xwy2fdUZY1CLoEvmLM=;
 b=BzXGI9zexPxaceE2sGEJS5pIzZvcFhsZXQVQ5Kol0xHcOdf4+/uL+xurUoSfzHOrJ7
 C1jvZMD0n4epOoqZQGDOM4YthoPETbxf0zeABePM2AaXabqZnPTZ8dwN3lkuDTGPgAAY
 rmMjm6upSnNzl+RFBZKeRgCB/D1dvLncM8dexKaLSUeAUi1PXMU7IhsiwnOTXclZpUCb
 lYh4tws1HA0qGlNdPVHHyNgmVM6EtatIPGbxk7SUJY7lulf+xMgzKZhOZ8Sc3wrHfyge
 UneMXeGmASZMGw2VNopVKAjApByo8lrmsYYgN8vOp949eI2qo2VDzAsJ5UJYJ6/RqBdW
 sZBA==
X-Gm-Message-State: AOJu0YyKkmzyw4MjlusYux+/IhMP0XtZDt4IWSEDp98DGCWksEZcYFuJ
 vKOPeKOyG4cd8oeeSJV7MDPCYjX/Y+s706ompGALc0qqPnAeKHGXD43r1Q==
X-Gm-Gg: ASbGncthmPmOCdxhbTal0Ra8kXhg5R69+mh1Qo3XWEtAVyZGq6WV3ktj5sdXDbOQviC
 ql5a8dP0eAU86amWo8/htqUHxWycUQ6s8RHVICUxeIkBo25ruyr0PpArWaMPIFe4qIO4QlWD7O1
 RgSda8LHAJdqY8oT1le+A8k3Eet3p9u2zenxcolhxWj19OnD6eiPMrsjR6biFu5PVt7uDCLxDZT
 0NvQPZ7/IO4M3WhQdWT4CQbeUfWDBCX00yZY0aqvn+zxhq3tYbjfbMtGZqP4lEAnjrLdYal2lfr
 yGaZd1Ki5+d5PSXGEasKMMBiHuqovqe0vcHqVWl+xia9aqXggZFNCWdn8/+KqWPEAz5K1Bo875+
 oH6W9ihrM37Ouj6hAH7sF9qY1UF2o//s=
X-Google-Smtp-Source: AGHT+IGBq83KYFvwgTUNK0FnXmgOa5IOSvBvg/bimcT2nrF/YI4Hzyslae7v+jOzAw4ugBAAhvQ7dQ==
X-Received: by 2002:a05:6e02:16c6:b0:3d4:6e3a:4659 with SMTP id
 e9e14a558f8ab-3d57c1c066fmr12919055ab.1.1742247964173; 
 Mon, 17 Mar 2025 14:46:04 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d47a667eb0sm29386845ab.23.2025.03.17.14.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 14:46:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 15:46:02 -0600
Message-Id: <20250317214602.3050196-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742247964; x=1742852764; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Jg2CBN0ly3vj60xHXuexMnK/Xwy2fdUZY1CLoEvmLM=;
 b=LCv1OcG3RPBGconhJPP521HnQOQ4dEwKp5g2UYgxZd5HwpvYw55jngh+vDY5HY8+LT
 6cOkhQvUbbQgV8GjyFqVH9hWiMDrlbhx892J3Tr5yPHLwRfULH2TyWGdehOOk2T11CfM
 7QqlPHHpSvdyvZytudnNGvBfamV/AMSyVkzyZe05cqqEe1KOryphBbTfvRiC3UTN/AaH
 UA9E39zt+DYnjFDWVWnclHVQymB9LY9iR1mF0brxj8njyE9ITQ9t7F3jzf0ElJOiAjzF
 cHcn7tfRSBnxbfLT5VX4UhiIXKyFZ7wkpCxpEES7Wf1nD8O8a9ofVbFQjBUtKWMCRdXp
 RIPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LCv1OcG3
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.11.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 0aa22e9fa3..ac12cafeea 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  17f04b60068122e998a60a3010679501  aiohttp-3.11.11.tar.gz
-sha256  bb49c7f1e6ebf3821a42d81d494f538107610c3a705987f53068546b0e90303e  aiohttp-3.11.11.tar.gz
+md5  7835f28e41adf6f09467533e8de0c199  aiohttp-3.11.14.tar.gz
+sha256  d6edc538c7480fa0a3b2bdd705f8010062d74700198da55d16498e1b49549b9c  aiohttp-3.11.14.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 19e62745e0..d3e7d12eb6 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.11.11
+PYTHON_AIOHTTP_VERSION = 3.11.14
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/fe/ed/f26db39d29cd3cb2f5a3374304c713fe5ab5a0e4c8ee25a0c45cc6adf844
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/6c/96/91e93ae5fd04d428c101cdbabce6c820d284d61d2614d00518f4fa52ea24
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
