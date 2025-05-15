Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EC2C2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 338D84160A;
	Thu, 15 May 2025 12:10:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMV6AOXyeq88; Thu, 15 May 2025 12:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E9D0415BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E9D0415BB;
	Thu, 15 May 2025 12:10:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B308413D
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B3136117B
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PU0S8OQ36sPz for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 758E461166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 758E461166
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 758E461166
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:42 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5f8e07cb4c4so159234a12.3
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311040; x=1747915840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I1EBbcSlRaBhZGO2lC3WSQDEG9bnd8lXDfARMj3M+Uc=;
 b=Z+jWOXdgmUJur+UGRCdGajN2bF3HF/PGjK2jvLGb13SIv6HIP8UywG8d4hHfYOn8YU
 CbTFnilEpr0kLVK+SzsAXtQuKKsr1Utx6q1EIwkkQVPQiwtk1+kRzcUmHnnKysK6kIoJ
 lGV3NJIzbtZW1tXahVx6FM70NPfCmvZGXkGzEtN3qS0A/cx4wtVVdciOOTa/e/tX5Mom
 whWaHF1tESpSBuBWkqfpmaGzbLwnz8xxncrF4yks5yFRAY3wCIiuNdZWHfdQgqy2M4iS
 I+huZJBVrxSzbwXfIDXDmirPp9Fp579Ttn2A4JYd3KwgOXLMdykgZvVLQhw5ClMKNZDQ
 ZFdA==
X-Gm-Message-State: AOJu0YzimAHFwz/XTOki9p7X7dWY7NTZ1LY9M7ut6EuArqlAlOVq4qli
 UAB/RrlSmalWu5MbNpSk2xuzX9PcJtCYFKe+9hlqUyAyqsSuXXOGOeIqO0LLHQmPr/gQE8ytM4D
 t
X-Gm-Gg: ASbGncu2da7rfCvWKtvVqSWQjpFpDlWy6449PiQxqrK0bZUDiCqHqZCpjN8u3n62itM
 oS7+3S9lvD7Eg4UERzt3dJSFKV+YY6FxBmiOaVJqi8zMNSUiMtzazAdf8so3TXdh3M8poPXl/iV
 0HL/mgJYPGaFP4jek5e/onZcQnm0iwiH4BGAUHBI2G0U/wAtFilu9CPLATxZZKtECfaxHAil2Xd
 Pn/ijjR++WahQg4tnBP8OUG+gMlxqAQXIfgvWdPtVFFfuipNpyHmH1eROho8lxXkkdU6utVRMBE
 Wa+1piPDaXYM5qsRz18iw00sLSBUpOMEHMUE+hArUh2fP7TbxBuHh6gLNgZJQuZRpmCBGMLIclv
 Sc3p4Qd1s8myFgnCTyrUJ7Ex0rpcc3jkJAJI2saqBgM6YGD+5rsROi95y8k/B5If+HugTOgww0E
 H2/kolpvhhECTKq3GYyez1
X-Google-Smtp-Source: AGHT+IGMImC/yzpiSr2l6+kGyywo5Jms/O8oq2ZiAhWj8haQf7TmHCrZiTGmTIlEaGZ0JjN3fB+N+A==
X-Received: by 2002:a05:6402:3588:b0:5ed:c6aa:8c6d with SMTP id
 4fb4d7f45d1cf-5ff988dcc83mr2499013a12.9.1747311040230; 
 Thu, 15 May 2025 05:10:40 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:39 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:25 +0200
Message-ID: <20250515121027.561571-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311040; x=1747915840;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1EBbcSlRaBhZGO2lC3WSQDEG9bnd8lXDfARMj3M+Uc=;
 b=MNbf6PLPjHQzv+X6tbpnULR6cslN8qGNftZjSZOBSeLCLA1fOqSI4yx4MQ8TTbWq8Q
 wesFF2Zb0liQQk6CM5++3N9EKm4NvWIGy+GG+o8OSDN8GziLs3OanzpPLQNFfnr5s3oR
 lI1QO3NvhrI9LoHjRngTsQNpW18eHVJTQ694o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MNbf6PLP
Subject: [Buildroot] [PATCH 08/10] package/semodule-utils: bump to version
 3.8.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/semodule-utils/semodule-utils.hash | 2 +-
 package/semodule-utils/semodule-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/semodule-utils/semodule-utils.hash b/package/semodule-utils/semodule-utils.hash
index 296f7fe137..011833027c 100644
--- a/package/semodule-utils/semodule-utils.hash
+++ b/package/semodule-utils/semodule-utils.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  db0641aeafefec46612c7c2ddd33ef1060bb721ce64842d2a96c33dddb5eb176  semodule-utils-3.7.tar.gz
+sha256  7705b0db059c53a21d6a77c0b50f6c467d91a0ea92ff875f1c93527cd2762395  semodule-utils-3.8.1.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/semodule-utils/semodule-utils.mk b/package/semodule-utils/semodule-utils.mk
index c9d3af4509..ae32e6cd80 100644
--- a/package/semodule-utils/semodule-utils.mk
+++ b/package/semodule-utils/semodule-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEMODULE_UTILS_VERSION = 3.7
+SEMODULE_UTILS_VERSION = 3.8.1
 SEMODULE_UTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SEMODULE_UTILS_VERSION)
 SEMODULE_UTILS_LICENSE = GPL-2.0
 SEMODULE_UTILS_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
