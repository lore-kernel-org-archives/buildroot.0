Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA316C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A1C60A6A;
	Fri, 24 Jan 2025 19:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ptY87JgdU_V; Fri, 24 Jan 2025 19:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A548D60A7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A548D60A7D;
	Fri, 24 Jan 2025 19:30:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DE5A941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B2304042D
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:30:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDAEIVQr69GB for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:30:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3EF340399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3EF340399
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3EF340399
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:30:19 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-844e161a957so178206039f.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737747019; x=1738351819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vofsERXlDE6u66+VcqtHpnua0OJWOFwMujfAkaAn7k=;
 b=I/Ubsa0kEa5MIYImggb/J/j8lQAhojoepnl0lBaZpE8NYTQJRaXOzrONq+X4YUmQbH
 U/MLYQAvDk/ItZAXt+VnZMZA+Wzmj/vepOY5d3AI4lZZBCJWonqZraBwFjNNXb7efGuU
 iOaJztAjroxKO0QLsaqVwHxKJ6KTr73gBuBh85O9gIFA+e5hG1BotWrHvd0EBDlmhnXP
 9Mubxs0unbM/cwbX4RFS+STg/eSwuIrUQ+ZS4bbhth+GK/qJhMb00jWy4yPsZ1ljOkkK
 +m99aWD5/aW79DqqYCT9ghGbwmT/ySS9oTxyaxdJ0NvZcnBHgWScvLbGCai+2cTrmrLa
 AmNQ==
X-Gm-Message-State: AOJu0YzwNrgXsEI15LO5sbFWH2/2z5QfTyy2BUkVDD9nQhBfOzsPtu2V
 Zcy8rGR3g6PHx0rxpVzgmsSUwqbVvlHp4qtq1klSbqOtU8n8JKz8aADtIs3I
X-Gm-Gg: ASbGncun6FBwiSxcx6dKEhzuO+dLNkp3qv+1VaWeRVPIY3sSXL7yeBd2/597UJp0cyD
 Fi0gGCA1J6fVg+ZBcJmGOdK2vVAYNsXXwT7jiNQQQEV4NZu4+pRoKD1HH2diRz3cbb2Sq12edbd
 iQT9d6J36uparY2Tg/DeohW8h0+IG3iEDL8jUDLC8YUubS0gFIcLf4Ryd5u1Q/vvbYVYnBL8btz
 cA04uhVyXwm+14ZIBRvGJCvQI+79fTiSk0QFasE9V0NOgGbLWZr3c/e0s1s4rtPqz+8LsN9N2Gs
 /oTyqqZdpLhMah/Ue1ekx/Vi16LLCSK83EXIQEjnqNuk8hSN6OrgG6c=
X-Google-Smtp-Source: AGHT+IFId6+w3GLLupWYfNfm76MyXYR1SnJe86fOQkeLmIXk+33TvXWOWSsBp+Ce4pWghWUwU0yq1A==
X-Received: by 2002:a05:6e02:339c:b0:3ce:394a:ad4c with SMTP id
 e9e14a558f8ab-3cf74495f65mr255681735ab.14.1737747018656; 
 Fri, 24 Jan 2025 11:30:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc7433c97sm8619105ab.27.2025.01.24.11.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 11:30:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 12:30:12 -0700
Message-Id: <20250124193012.3814905-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737747019; x=1738351819; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8vofsERXlDE6u66+VcqtHpnua0OJWOFwMujfAkaAn7k=;
 b=RPCM8H07FtF2XyGr6b8ZtnblFMZc4YNqsAEf8GMWaDVBwOYaQ722xrQm74p8Z7xkje
 +3lXcHeUEMDVnuifj7PV2BI1kDBoqIvh1epatjtzhqXf9syE0p5OndHcSsyySVxI+Mho
 BwJhvQjFT7132ceZusPvO3VgK8Q9cO5q+Ni5bHkUMAKzuIts43js2QFkEAC2xNsf8w30
 DG1EgDAUzWlCTCCsfVy8NYm8U5mRmyEb+lAau2J2TBnjSvdISArHL05C5KG+/mYBkB04
 IIH573bERwYpdwfBlPPPxTHrjis2UD43i92Re/21ghnliD5csoVf2FtMVIHZUVIZn7Yg
 GzLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RPCM8H07
Subject: [Buildroot] [PATCH 1/1] package/python-hpack: bump to version 4.1.0
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
 package/python-hpack/python-hpack.hash | 4 ++--
 package/python-hpack/python-hpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hpack/python-hpack.hash b/package/python-hpack/python-hpack.hash
index 988cbaae0b..aaaa3bcbbb 100644
--- a/package/python-hpack/python-hpack.hash
+++ b/package/python-hpack/python-hpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hpack/json
-md5  27e01514ef06dc9fa0798d3dcb7de47c  hpack-4.0.0.tar.gz
-sha256  fc41de0c63e687ebffde81187a948221294896f6bdc0ae2312708df339430095  hpack-4.0.0.tar.gz
+md5  16e7423c5b5078c1997fa3eedd2e5935  hpack-4.1.0.tar.gz
+sha256  ec5eca154f7056aa06f196a557655c5b009b382873ac8d1e66e79e87535f1dca  hpack-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
index 4b581c1001..2655a6b4ad 100644
--- a/package/python-hpack/python-hpack.mk
+++ b/package/python-hpack/python-hpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HPACK_VERSION = 4.0.0
+PYTHON_HPACK_VERSION = 4.1.0
 PYTHON_HPACK_SOURCE = hpack-$(PYTHON_HPACK_VERSION).tar.gz
-PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/3e/9b/fda93fb4d957db19b0f6b370e79d586b3e8528b20252c729c476a2c02954
+PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/2c/48/71de9ed269fdae9c8057e5a4c0aa7402e8bb16f2c6e90b3aa53327b113f8
 PYTHON_HPACK_SETUP_TYPE = setuptools
 PYTHON_HPACK_LICENSE = MIT
 PYTHON_HPACK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
