Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0E1C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 12:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D809D61153;
	Thu, 15 May 2025 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziFZMwjE-jhL; Thu, 15 May 2025 12:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B8261177
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B8261177;
	Thu, 15 May 2025 12:10:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9186119
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF31E61185
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuEO-ymHry1K for <buildroot@buildroot.org>;
 Thu, 15 May 2025 12:10:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 986216117A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 986216117A
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 986216117A
 for <buildroot@buildroot.org>; Thu, 15 May 2025 12:10:43 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5fca00812dbso188292a12.1
 for <buildroot@buildroot.org>; Thu, 15 May 2025 05:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747311041; x=1747915841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQxs8vr376IYv7nWrIeEpb1ARXe9NXvgQ9qWnSir694=;
 b=uORjd73ivpAilfa9Z5rswnWn+XE1Utmr9+EJYcn5jfo5aKi+WzANpVaPTGa/osM7Xe
 7tT7jiytsLEWg+7WwIioEdgIHy/G+gqjsBU6R46hHgMhPLKOfF5/yi+yxDBw9HSuAfUh
 26Rfi0GI0d134IJ03IN//jPkTa+lzU+H5XVbxEaoxNlQZpF67zaCZi8m6U2fOpiz2Q94
 t8979VknmmDxKJL869B7te4U+4Re8As3fcgIzQGFekQfHCFd1Job8qpFmQp/igxACQZx
 vL/jgKnDsBILOfGOLLcWSvP2JdbSNdxCoNOYSzJINMMo5JjH+HK7ZgNAWZCr2vTrr7ZK
 EWoQ==
X-Gm-Message-State: AOJu0YyJxYTD3eh/t6g+qH9H9vojZ7gD3frXr1wE3kHiCCRkwxWBs/w7
 kOTYIvwLfK1aXQuIaWjKocMidC73AqMUsd6xs5VFb7ghmq9MLjHJ3Z1QXdKmZ70Q/pTxM46sh14
 l
X-Gm-Gg: ASbGncvgA+6VXOdmUUVdhpzJ4/vFhTUfQKwqp8vl+lSQWwNNi8m7ib82nei7cjpJppJ
 ExMeNtH2gND3NVfCxSg8bZWfoba1dAkmpMG+Hrdh26uTVniadI7KXCR4XLXJgmPsR3Mz1/f4hDs
 zRu6sME50L5iKwlg1X9o+9ALaivdqo0nPFByTs4UEawZy+8o0G2DOUjDvor2QWYfr1W3+e703uf
 Oxdw30YcW4NINxUDXyVVRtnGWTLIgkz9lpjqtgdWAYbilAOg4A5s5xrWHlJ/X4SKb2TLAfl7RDc
 AD/W3VfQqeQIRkGQJGvIFFWNWs6HLee7arNeXCI1ltiNdSNV9EndnebZLZ7lkiHal8g6WAjL5Ct
 +KKLy60QmUu33ImI8+vWKlNgXJcZO6hW2fWqKrJgpJgMAHnvHyQY22vkQM+z21T1WnLnOBA5/uc
 IKEGdoTysQ8f261rlqC2s2
X-Google-Smtp-Source: AGHT+IG2MXF+GsvulxkcNMhbuErxS00sJf18d2gWi8Jg2XQDAj95lK4hOFoECyfjFFIJPL8XU0k2lQ==
X-Received: by 2002:a05:6402:26d4:b0:5fa:7a36:f9db with SMTP id
 4fb4d7f45d1cf-5ff9889442fmr2490239a12.1.1747311041235; 
 Thu, 15 May 2025 05:10:41 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cbe523bsm10218214a12.12.2025.05.15.05.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 05:10:40 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 15 May 2025 14:10:26 +0200
Message-ID: <20250515121027.561571-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747311041; x=1747915841;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQxs8vr376IYv7nWrIeEpb1ARXe9NXvgQ9qWnSir694=;
 b=j8Bu4hZqLS8boz2Nbw5tJKE0mMV+hHeUUFWw1jjUZ8zFDPxnI/AbakhzOl5DF0Jp+E
 RaM1OFgUGDLOJDeIPJv8Gmz3sXHOZ/9i446mjF4nPmJZYo7eAZI4vATjGWljI7tMFBU4
 Yfeb3kR7Eg+VKBFeunS1HaFfOE7wuPUbPYnDQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=j8Bu4hZq
Subject: [Buildroot] [PATCH 09/10] package/selinux-python: bump to verson
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
 package/selinux-python/selinux-python.hash | 2 +-
 package/selinux-python/selinux-python.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 9cf1fee97e..54173dc7ff 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  630b2ad50e017a06a81d4f94312bee85465a93cb050a7536c728055de9a41a2b  selinux-python-3.7.tar.gz
+sha256  749025bfa4aa0e009bf3ffc455d565a18d4db71cfe796be4405821717206c25a  selinux-python-3.8.1.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 3ea461b37e..ccac245fd8 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.7
+SELINUX_PYTHON_VERSION = 3.8.1
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = LICENSE
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
