Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC39C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6889E8215A;
	Fri, 24 Jan 2025 19:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovcu1d7waFkH; Fri, 24 Jan 2025 19:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EB6F8215D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EB6F8215D;
	Fri, 24 Jan 2025 19:46:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFB72944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FD808215A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKjLmLkPoWun for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:46:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 611208215D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 611208215D
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 611208215D
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:46:24 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3cfc8a2415fso4113545ab.2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737747983; x=1738352783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mAZX7A2Xyevr/cyWDEYPXErH/uKpbbf0efE+81FDCBc=;
 b=aYBANPSF7BMEKjIOM6ASkmcUkKp/yahTGWbFGdGg0YSVnQa7/Xl+5hoh95AVzdICzu
 9UDN9RwiQ52ZRlZw0yFDwO01woPGzbh3cfimhk4mVjZBWKzI2AkU4PBO1JSIoEkExJ5k
 Dl/GZFYpz2CyrlFeJ/Gdbmpe6z5HpptgsDNdR3a9CPU8dsZwHO8d8pG41temgZJnxDFO
 XbgO2+DpTs8CfCzp8Z4bF1YSb0R7+CaTCpuT8IL7b6Ll34Iv/yXzIIKczq8w1zAn9agp
 I87LHnIlfZzogWXq7TDdQNCIxTAM/rByo7xjTispOKN7hsujhHHgS+SxX8wcpY00I1Nr
 skaw==
X-Gm-Message-State: AOJu0Yyu4eSZSXXUcQyxTR72m8JY16mS31Y8aMAkZSsET5XhvXaiVl0q
 JuQo/SnB7VoMx/XklOdDkz2tLSzG3wDz0zXMILduyfVMqrF12KB9encHOCOp
X-Gm-Gg: ASbGncvn7ChJ+BvWBr888Iq0EWUXSz1bmH9M+OAPfXdR5NdBFk3Nl34OEvcd5Xp4vuj
 7vh2SRNXI5G/H17uk3RsCRM/gNQjSg1syHwbWAH5i4q1bD1dYbz7H0l5oH3di5zpQLOs1P9Xe3h
 juTF7sjKK8HtZ5aUg+OwROV/6he8t8tTNDaitCN6OeGWrdTKGdwxFclNLVqv+VW+QAYTL9RxaJ8
 8/hdHHEE3Do40Pc9liAUUXIYEUF1yQI0eVnicqq4nEM3n+k4gLlFq2s5gqLWN0gxLlT4we4w0o8
 AH/uHic1FStDD46FstWGbswUtzYX8LduAMHPM6nXdsRtrPBVXmS5UB8=
X-Google-Smtp-Source: AGHT+IGJ8wmWg2ZOBq6eoYx+NTBvvaPZm5PCjUXMMGBnsglo3nygso7n3tQ9zyCgGMnzb1ZGbYKXbA==
X-Received: by 2002:a05:6e02:98a:b0:3cf:c26f:34d5 with SMTP id
 e9e14a558f8ab-3cfc26f37e2mr44603195ab.12.1737747983031; 
 Fri, 24 Jan 2025 11:46:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc75050b0sm8579985ab.63.2025.01.24.11.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 11:46:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 12:46:19 -0700
Message-Id: <20250124194619.3821672-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737747983; x=1738352783; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mAZX7A2Xyevr/cyWDEYPXErH/uKpbbf0efE+81FDCBc=;
 b=Ohwyao5gqs5WL/UThuc2x8gg09rUna83xuII1EQozX4ACA1M6LbQa3mpSZx95EjfFg
 Gjj6c+Zp+4h4RJdnEMrKrO42ZbDVlcyC0zTtpp3RaEhVe/Zc4QGAUZ5/agYLnjp7spZo
 oH8wbCN3/HS1mcieMAuubtXjSTgV7iSa3yP+QRxVZj2mR+uzElcWdQ9h1UNIZ3Be7VgU
 Wgl1i5aLRH+JiKjHFYJ+UiuHBUUqWU3+tflVpA8YlqbuRA8hFkazrPLY+xMLZXMID9GD
 pjgyfAYU2UhGEGh2BqI09aCVAdVWSsds5GxcAajtUaFnYQ05gk+LLfTAWE3x+6Lqoing
 tJlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ohwyao5g
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to version
 3.26.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index 9fbd379211..0f5db0e2ef 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  0714da7f00520766aeb55fedc384b7e2  marshmallow-3.25.1.tar.gz
-sha256  f4debda3bb11153d81ac34b0d582bf23053055ee11e791b54b4b35493468040a  marshmallow-3.25.1.tar.gz
+md5  3a8decf54fd2a6a10352b9de70b70136  marshmallow-3.26.0.tar.gz
+sha256  eb36762a1cc76d7abf831e18a3a1b26d3d481bbc74581b8e532a3d3a8115e1cb  marshmallow-3.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index d226ea66f6..6e84ca039e 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 3.25.1
+PYTHON_MARSHMALLOW_VERSION = 3.26.0
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/b8/85/43b8e95251312e8d0d3389263e87e368a5a015db475e140d5dd8cb8dcb47
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/ed/3a/b392ca6582ce5c2e515a8ca365f89b6e631d864a80ecdc72e0bc1bf3aec6
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
