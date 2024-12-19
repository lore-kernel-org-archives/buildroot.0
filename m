Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA2EE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38316424CE;
	Thu, 19 Dec 2024 02:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-wOSud2fmjY; Thu, 19 Dec 2024 02:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9796424D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9796424D7;
	Thu, 19 Dec 2024 02:01:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3F33CE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 731C2614C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qOAR48Lbcrw9 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:01:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7312960662
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7312960662
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7312960662
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:01:24 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-844e394395aso10158639f.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734573683; x=1735178483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EWTkCTeWroUI6fUdOFfwXz4rQg2iT+0MQZ6+Ax7jSyw=;
 b=bLR1zd2/fTsDvosVGVm2dMN5ljeBQv640wvhk3JvIOx/cHT2wAYOSrTuJbTacm1WW0
 a/yutvLy0Z1lVhbf/HqGcEQk6DB7kZ4PxbOqlcFM6i3PLpp8IqtCr1jpfaVRZdUH1wZh
 INdqAEKfhhz5bp1Nzlb3378mBxwC2zA/YWZkWQVLOvi7J3K0zE84xcaBNro3DzRh6BFH
 TR8jLoX/5whJELcHJFSFWryfXHk3joIz6go2j3kp9m3UfpJqjXakmMNLxTDHGdb+hASD
 3mggj9KK9K7A/tV5E36580X7189Te/pCN5fzqmGw/iwUPz0DBMg2ZbsY2fp3Ap/G7peb
 KbpA==
X-Gm-Message-State: AOJu0YwrLQdp07qBbBBdlM4y8+5vJKOtfXP3xFR3IApzODkWYNMtZPWv
 hCnPaghzDojW5XHomGvG48H/Fx3IfROBKYnoMLgfXzGdbUnvm+1BtMBnwlzrRb8=
X-Gm-Gg: ASbGncug/UhEEd3KaPDjZ02QuPFmjDcpormha7KS+sseCH6Bf2uMOSL6DnaAGGVLyW/
 ip+BVqDZBF00E0IOG/RLWpvTxqnU0BspdfiYQ2AHh7PWk326E5gtQS+kC7gh/ffXxEWlnedCGdg
 J+dN4TIC8nZK3xVFHzDBvqX5NgonOaCCK4yn+ZHI+KzbddkIW5zPAlZJMI/nC+f2+KufuBSK8Qf
 D6lKLAU5HmP/RwIgwfDfUqxyBm/5lMEgrzDNcL8ffM0VTTzKYhJUgKWA9f5srY1QDSU6QryI/aE
 wn0WqZRN1sZoRrDkcEGhjtZlFU2D+nAJvA==
X-Google-Smtp-Source: AGHT+IEr1iBCVwHg9vKKhznjM4uyWHUnDAxH90+50QvhDfIxJcdKW7jLAjICUO5YIj5ovrWUJS5gFQ==
X-Received: by 2002:a05:6602:6b89:b0:841:a678:de3f with SMTP id
 ca18e2360f4ac-84987ac59f8mr149781239f.0.1734573683150; 
 Wed, 18 Dec 2024 18:01:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68c21a587sm44907173.147.2024.12.18.18.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:01:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:01:21 -0700
Message-Id: <20241219020121.268522-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734573683; x=1735178483; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EWTkCTeWroUI6fUdOFfwXz4rQg2iT+0MQZ6+Ax7jSyw=;
 b=gCEhZ8RZwWsLDZtcMxzHK3LdXiIkB7lQr5uiWbrm6CGgO08X32V/5HtcunZ3NWte/9
 w3ITVuBwcigc372rN7NDZLnGVdZAv4yjXMsoWl0d88a9k6wtBpbHyL/Hlj1w6GisiSgq
 l46qpCap9rjTIuThh+p+sRuECH5xz2MLiLHv6GG7ifg+y6xRTW1urj5Rkl0STtyZwP9W
 Tv9u7F+nnF8CVSbuIaZuPr+LkQH4j8fUiXzkRM80Fy3Wkh0HAP4/LhkHo6BRpCmYn0Z2
 LSLeFByfx8U4JjgbATRNvctfnyC3DPR2PJx3hB2IPqo7zie4hRZiaK/why2hyAfAl6fH
 co7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gCEhZ8RZ
Subject: [Buildroot] [PATCH 1/1] package/python-httpx: bump to version 0.28.1
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

Drop no longer required python-sniffio runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-httpx/Config.in         | 1 -
 package/python-httpx/python-httpx.hash | 4 ++--
 package/python-httpx/python-httpx.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-httpx/Config.in b/package/python-httpx/Config.in
index 592cd559cd..0d20e6ca06 100644
--- a/package/python-httpx/Config.in
+++ b/package/python-httpx/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PYTHON_HTTPX
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
 	select BR2_PACKAGE_PYTHON_HTTPCORE # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
-	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
 	help
 	  The next generation HTTP client.
 
diff --git a/package/python-httpx/python-httpx.hash b/package/python-httpx/python-httpx.hash
index 3ffd491c9e..b2609c9b5c 100644
--- a/package/python-httpx/python-httpx.hash
+++ b/package/python-httpx/python-httpx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httpx/json
-md5  f29763f29da610b185d2ca33937c572f  httpx-0.27.2.tar.gz
-sha256  f7c2be1d2f3c3c3160d441802406b206c2b76f5947b11115e6df10c6c65e66c2  httpx-0.27.2.tar.gz
+md5  774cf32b9cd94a44189fbe5871026664  httpx-0.28.1.tar.gz
+sha256  75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc  httpx-0.28.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec59d544f12b5f539a3a716fd321ac58ccd8030b465221f2c880200cdf28d8d  LICENSE.md
diff --git a/package/python-httpx/python-httpx.mk b/package/python-httpx/python-httpx.mk
index 21bbd48a58..aef46a33bf 100644
--- a/package/python-httpx/python-httpx.mk
+++ b/package/python-httpx/python-httpx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPX_VERSION = 0.27.2
+PYTHON_HTTPX_VERSION = 0.28.1
 PYTHON_HTTPX_SOURCE = httpx-$(PYTHON_HTTPX_VERSION).tar.gz
-PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/78/82/08f8c936781f67d9e6b9eeb8a0c8b4e406136ea4c3d1f89a5db71d42e0e6
+PYTHON_HTTPX_SITE = https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956
 PYTHON_HTTPX_SETUP_TYPE = hatch
 PYTHON_HTTPX_LICENSE = BSD-3-Clause
 PYTHON_HTTPX_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
