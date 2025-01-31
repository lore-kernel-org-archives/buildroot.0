Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107A9C0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 16:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C79418392B;
	Fri, 31 Jan 2025 16:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLcn1jOW8uFr; Fri, 31 Jan 2025 16:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B4F8392C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96B4F8392C;
	Fri, 31 Jan 2025 16:53:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E77312C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C8D240DB3
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOuEB5J2-lZe for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 16:53:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=kazemi.ms@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03B7D40913
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03B7D40913
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03B7D40913
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 16:53:34 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so363254366b.2
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 08:53:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738342413; x=1738947213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wSkDhgSJUjirHT+hnD1bQBVNo5VklBe9ea5y/CWtDco=;
 b=Ovo/FO3iB2EFBJGgdabqsAB+JjqC+VLh9Xq3YbEg7FOa+D3ryA6NArIhVP5ZSEjVVk
 blJGx00Hnn83xJlfZPqR9cFKu1OFikXCOSZDHAHoGplWa5VwFwUzcVXVThdJsT4tXTW8
 2UyCDcZ5RfMC9PQeD5tJ9GuVhBT8WHD49FklXnmae6/3MSlJd3JcKL52+VC8Bqhi2zsw
 LwfoZkN/AAzXQgkvS7lTWhn0lopa4wPjcyxNRHWz3XLrAKRGdzmOPmzOnXdqzrHmXxqi
 Mw6eCJ+ds+9/YZj6MupLHwZ1+8MfHOE8Mk49KevNPndgEMRUIDQws57x5YfCUPwUUceV
 I4Fg==
X-Gm-Message-State: AOJu0YzOX1+nBGt0hQArGP0HyGj1GBIihFeILpyhOFzfS3kW11YudqQn
 CJiv7bYOVwDac25LKh6YeFJrCTzvx9ekUGfXeHGemFc0BqtBJh/5Q6YJX+sM
X-Gm-Gg: ASbGncsq8ypZ56TH22QrTxDublDc1iZt3llWNxI/f08LXw1xgX1Iyv3CXrP6OQmGjzD
 s9MIFi01gE/z6iYPlPQm9KYpMeFJv9fTMeQvQEeEmKjoXcAtMimvO7H3nzuUpHBUa/KyfZx9tPV
 +N+FiYNpi/j1UjQ+26UP/Gow3LubrXMttRlLQTJQ4IYHIR+GW5N2p8kQgQamJX6Xrnv9WQwtCjQ
 flm7Yi1xtoNLGtt3fDR4/ihQdi9GbkgIy/2g0GdeT0h1kHmFij+cknN0xmUH+JwEOryluRbetjr
 GrYXCQ2W6A8p4Miivk9VZRwe8FEaXqrEXYXHzXy5cckfgsNnm0WTeyP4qzn0yLEsR5ATJRT636z
 Ndy0OgHmhGnkIuAJY7xnduTmM6/ufunnECevHQSYm1e/ZLfCTSpJUW5c=
X-Google-Smtp-Source: AGHT+IFhjJvcGSD0W5JS11ad8HWQ1rSk+zDxD4c8JfAdUyNAO2QZDoXl1phr+Scb5fKCQ74L7ITB4g==
X-Received: by 2002:a17:906:f58c:b0:aaf:86a2:651f with SMTP id
 a640c23a62f3a-ab6cfdbd07emr1148533766b.38.1738342412459; 
 Fri, 31 Jan 2025 08:53:32 -0800 (PST)
Received: from saeedkazemi-ThinkPad.dynamic.ziggo.nl
 (2001-1c00-0b8e-2100-a983-d10d-b482-34c3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:b8e:2100:a983:d10d:b482:34c3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc72404acdsm3130835a12.39.2025.01.31.08.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:53:32 -0800 (PST)
From: Saeed Kazemi <kazemi.ms@gmail.com>
To: buildroot@buildroot.org
Cc: Saeed Kazemi <kazemi.ms@gmail.com>
Date: Fri, 31 Jan 2025 17:53:29 +0100
Message-ID: <20250131165329.2362130-1-kazemi.ms@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738342413; x=1738947213; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wSkDhgSJUjirHT+hnD1bQBVNo5VklBe9ea5y/CWtDco=;
 b=YLte83ws+/vyx/8wlDL5+fReHx0DqHWC01EV+kLmLGPymCeWKLG7p/2BEZ0T2IJXKA
 SPOPPnFMtoR20mWcWhCvwkL+Z0HU20ipS9Vb05YbOios8hzyvkqnGvejEBmXxu91SxmI
 yUSXLJLSoQnbnesRe+hQiI6yzU6LXEYmzm7TtwZJK0swN08bmwetPvvC/m8kJG49kyRO
 aqfKb6XJrlcLE1qc8uQPZYq2zsttRxNGlA+heB1oCzN7+UW081myXynYUZIfG5ouUWox
 xapQBeZN8XqpYOjc6w/6Tgw6OTwbayfTy1ovPsdFiYSBAUXlNXfQTxO+J/rkEc04r7pE
 KT8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YLte83ws
Subject: [Buildroot] [PATCH 1/1] package/fd: bump to version 10.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/sharkdp/fd/releases/tag/v10.2.0

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
---
 package/fd/fd.hash | 2 +-
 package/fd/fd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 90d2c38694..04345b8884 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  91da5cc2b99d4754fa5096cda1eeac98f312f712bfca6a41f9972b2287a4c4f9  fd-9.0.0-cargo2.tar.gz
+sha256  6d177b06123419edf2abe2daa82b29fec667a4e775cf877094ca5f6ae759dc34  fd-10.2.0-cargo2.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/fd/fd.mk b/package/fd/fd.mk
index 316da418ea..9b6b305e77 100644
--- a/package/fd/fd.mk
+++ b/package/fd/fd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FD_VERSION = 9.0.0
+FD_VERSION = 10.2.0
 FD_SITE = $(call github,sharkdp,fd,v$(FD_VERSION))
 FD_LICENSE = Apache-2.0 or MIT
 FD_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
