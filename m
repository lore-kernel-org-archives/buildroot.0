Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F03CC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 18 Jul 2025 04:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50BCB84106;
	Fri, 18 Jul 2025 04:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P7M5DXbt4l1e; Fri, 18 Jul 2025 04:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5425E8410A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5425E8410A;
	Fri, 18 Jul 2025 04:56:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 204DF1A6
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 04:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11F944015F
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 04:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jaM2GaWetYL9 for <buildroot@buildroot.org>;
 Fri, 18 Jul 2025 04:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=fede.evol@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C565840078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C565840078
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C565840078
 for <buildroot@buildroot.org>; Fri, 18 Jul 2025 04:56:19 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-60c01b983b6so3776842a12.0
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 21:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752814578; x=1753419378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yirmm0QOJEiwn3evRlpcxKKUwpO/IY01bg3oIwG4Et4=;
 b=dkSNX6UHsPVueJixp0rUgKu9+CeW06W1G5jXX2GoIRUYeon6ru3tSRK9z4RBmUePhB
 mQcia3ik1nXISzq+cPmdkqyXzhd25BINs4nqaL/D+EpY5PXOi73jzT/Kf4ezOjt2OQ2d
 TQchwmtlH78+T9A7E4kcNns+jB5mKYuK4yUQZqomzwfVLoiQfMguwXWDNxwUY0C34gDe
 ByYvhvzmKR0c4BJoIuDKrDyIO98SX5fprjcSrCxyXaCVRHuTIGglz7TltKdsJynQameR
 Oa/BE++zdzmQxj96gx0YRBLvqZOd48Vzjashz9/BHFUF5wisUYiwIORyJIVQN2tGnAjD
 5ZMg==
X-Gm-Message-State: AOJu0YzqBxh+iw2C5NDx46N3Du0muJVD9/X5jRC8AhEAhDn46/6GpWYi
 nfS7DWbRVWm5rHzbMF/UVaPYQpW6xHLvS3xWB2lhJNG75xVfnnHf6gPy0wmPuQ==
X-Gm-Gg: ASbGnctNZ+CyNul/l8xna51+KY95c765nxG0ZO56zmqEJwat95y1rqlq5pou5NO2WPA
 Zlw2hnKdFWm568AYofTx1DahRGZKxQoXYnMqoflvXjv9OWF9HANqkoUbQyOf6LmgWXAZj35ggCF
 bF17HEp5TtLu/OWOTXxkWsvPFcsRbYOKuGjQC8ku/ohtGn+Cop2OxXs1ngtyWY/HtvX6P2hK5YV
 HiW02JKPJHMv6RQ6q9CLTX91fQ9hjvBNYxlj68sEamxpug0s8zo90dd3TGKnS++AwNv5zkwQaX+
 zt/cNsAXP8scSVfRH2wUKBsJwjvXdlSfi71rtDxvkSppu9lGXb9PTE2x9botnxy/SvNI2whAI+b
 RT//NZ4vQGJLKPudpNaB90WTld/tcdd+Lp2ptkNn7TjTstsJ658/FxbBbh6sGzzt6ufDeQ5PWER
 GRPXHbsYFllR0NQey/yqoAloqkraTh7PNjfGCN7zRiXX+DdIKjfy5V
X-Google-Smtp-Source: AGHT+IHDdreN12VUDJRE6PICWvLFAhOyL5ToqtR+comSH/TT6jmyP7Oe71n4YHOiZkvw6e+WVRUUYw==
X-Received: by 2002:a05:6402:42d6:b0:60e:3f7c:deb2 with SMTP id
 4fb4d7f45d1cf-612a33968cemr4685447a12.12.1752814577600; 
 Thu, 17 Jul 2025 21:56:17 -0700 (PDT)
Received: from rawyouth.fritz.box
 (dynamic-2a02-3102-6875-9900-19b4-7432-1ff2-cb8d.310.pool.telefonica.de.
 [2a02:3102:6875:9900:19b4:7432:1ff2:cb8d])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-612c90a9098sm394212a12.65.2025.07.17.21.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 21:56:17 -0700 (PDT)
From: Federico Pellegrin <fede@evolware.org>
To: buildroot@buildroot.org,
	james.hilliard1@gmail.com
Cc: Federico Pellegrin <fede@evolware.org>
Date: Fri, 18 Jul 2025 06:56:14 +0200
Message-ID: <20250718045614.17100-1-fede@evolware.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752814578; x=1753419378; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=yirmm0QOJEiwn3evRlpcxKKUwpO/IY01bg3oIwG4Et4=;
 b=i1NFRW8LDVTDEn5nk8omOgxe0nXKF/qEoZtHjOlfljEP/F86FokJNaW2g5SDtHci6u
 MBbbL6TZhSDqVOGBjYCo4hYbD1ajNvr5hKTVN8I58kHRkAHhngPyXUFSxJvko49YbYgA
 JOu6vi1aT/Uk9DlrfKg/33bXbxhJ8mSkolUzKUll8e6upVGeXGi//+GK4GEnVPzwMwzv
 FNf9OuUVmBxyQrrK3Wm63Qx/K5ntkmNZDDf0RFijcj6KVk/o6tgsXSLwIYfz+isY4b4C
 To6cn/kZEM7XCtHeNf3by0m3JIhYbtzOz+JphdDhs4JwPRkqfmD3k5DD8TC8mqpnbYB+
 ZLdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=evolware.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i1NFRW8L
Subject: [Buildroot] [PATCH 1/1] package/bpftool: bump to version 7.5.0
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

Changes: https://github.com/libbpf/bpftool/releases

This upgrade fixes as well linking problems to LLVM libraries in
the previous version on Buildroot 2025.05 and master.

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 package/bpftool/bpftool.hash | 2 +-
 package/bpftool/bpftool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index 4f83e71a76..5112bb997e 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  89d3ce783d5c9e40b9060b380869911ee9d5ab6732a4b1dd19a90103c5e41e6c  bpftool-v7.1.0-git4.tar.gz
+sha256  ff95bc8a057c84e61863fcf95e354199041ac524f5b9f5d487cf0b2c6e9198fb  bpftool-v7.5.0-git4.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index cd68d89799..1b765ba38f 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTOOL_VERSION = v7.1.0
+BPFTOOL_VERSION = v7.5.0
 BPFTOOL_SITE = https://github.com/libbpf/bpftool
 BPFTOOL_SITE_METHOD = git
 BPFTOOL_GIT_SUBMODULES = YES
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
