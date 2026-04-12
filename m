Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F619E937EE
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 18:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1904B616F2;
	Sun, 12 Apr 2026 18:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqVkm_f9DTTc; Sun, 12 Apr 2026 18:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFC2C616E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776018041;
	bh=vCZcGn4GV95vONuKjjqg+K1k/Lzt37QFsLIUT8i12Js=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wnu3obRM7x42RtyJjgcXGhlloXeUpr5V8Z3IAWK4Um8x5iG/B6WFiVk+xEzHKj79Q
	 LkWidZBYxrJTW1YZKhU33z/WQ4ZjxhnKeoP9eexOFXJlt01nnPpsFD2cSGDN1NUWHH
	 /1DNo7SSw04/8kxk9/SCvOsqkhA+ZUIVG+JcOx+PJqL9f2UFkMrxw7lxHL/j5AFxBa
	 3OHdGDui42aclFsScWNEUuyC1KTGOS1QInGzF/k4nrIYqHziSAZeeWULzMW7OEqWFx
	 7UurTj39R2ENxmpJe2YppuwimTdmwmFCgmddJ7zYK+6gQwhRbn383Tnwyhvqs70cAg
	 xgqI1N7/9FErA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC2C616E7;
	Sun, 12 Apr 2026 18:20:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AAFD237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 18:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F30A0406AF
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 18:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HHpsH8K5VKPW for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 18:20:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AD0D401D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AD0D401D0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AD0D401D0
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 18:20:38 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-35d90833cacso2257801a91.2
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 11:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776018037; x=1776622837;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0YLiZhWRjjeb/RRmhlhbX1/hLOSWEZJZFSSiKj4asoE=;
 b=SQIUKKaQx5CMAh9STImjikYlxN5hLmCCesi3OzLJ2FRygM+ihlofwXfxBAw0YmqrXc
 1psJ95UB1jWY5NBh6MOrX/GiCS8Cc0HvCs4BcxoKmCfXZD1dhtUgjJxqT5j6hpV3EmUW
 CUrF38+cSKb12ljyDF7FS9ul8oY4U0P0omzkmiMAUwFhkvCkkVmlLGzUFzKAA88NLl78
 bAa64bpmvI8GwRa2vjM+8ItQLYCRuc/5MNfE9NYsuX+ZLCQw/CrpKrQM97ks9J2RDEiU
 1e5f76n9Zaosfur0wMTMjObEIuVBWGQO1hK+PfD9vBn3yiURGGbAOQD8VIUUA+UrbF3f
 BDog==
X-Gm-Message-State: AOJu0YyoXKCI0g4skLvrn9KtMchM+3cFhr3pbcn/OaE+bWI/csO6e56C
 9OSqZJ1vH20IMBtpCDW+pdw46/92vyJHVCYJwAxcfKgsSjutNfyC4RPlBRjJAqft
X-Gm-Gg: AeBDieuJuI0adLKYNyNvdtS+nTBsE+CNOjBEY8YzhIG/0RbukqDpSIBImXhKiJIQngR
 XM/QBb6aK5LkbS0zJ7nNpfWHcaJRQ8VOnUhZfbUA5IV3U2JmUsW1OjJ4Lo/6PiOt9NGpAtp6rug
 QzOKfRV7bIu7lMSWHVgLpOjKixXgj/OF7cyHEO7wRWBvRsnfCA6yfJvskUJd5QkFTKtZje5JSlH
 2n2enMdsdJF4ZdDqfU2wjy3iEyS7AJScEZjCw7Ux9Q8tP9fQXM33ibOn83epZhg8DE9Xuyf6a4I
 ud0Xu2LCEKZqu5mlKxbOfeva/VrR/bS61eYrQA+0bk42bRkQ/gSinfRcjj6mPgzmlfggkfDp9GL
 AyYdunPzsYmeoLuZ86MgRemE/HcvzAx9m+UVsQsVAjZih9CgxfGu5EFB/k4GWHDePodXJHStxB4
 9dYt/KMTSyfQno2DoSLvgRInwqpOv12l8HBg==
X-Received: by 2002:a17:90b:4ccf:b0:35b:e51a:ec77 with SMTP id
 98e67ed59e1d1-35e4281d853mr9665284a91.16.1776018036727; 
 Sun, 12 Apr 2026 11:20:36 -0700 (PDT)
Received: from fedora ([2409:40e1:502:1849:68c1:d0f0:6b7f:ab95])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35fb38eb48bsm1717343a91.2.2026.04.12.11.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2026 11:20:36 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 12 Apr 2026 23:50:22 +0530
Message-ID: <20260412182023.96383-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776018037; x=1776622837; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0YLiZhWRjjeb/RRmhlhbX1/hLOSWEZJZFSSiKj4asoE=;
 b=HJ/B8Hgav+Zg+gy8FDgeOBq9JiWeadASvPhvmDwVZiDUm5ryH585Ffs6ULz6MirYrd
 c8jOop23uPz/jIX34+Yrsa6Z/TKqIgPcF1nM/PH0a2vKnOs4L0UKtEtEPpHMq+Ynf22e
 IV9as0AzRUbVpBVmSWoTaCEvTAfDvAMNy0wMyJr4D5Uk0d0CqwWgq6oYDrgQleNLIbyR
 dbqY6HRtwFmBdixTMKf1fvgabES2k6SG3qH5gLPMWbaKoETtCI1yB5URJtawUrSmhvv8
 v2EeJ2JyjJWcuD6CgyBiPRgqHF1pNfMl8P1CY3if53lEgipPIy9utRqtqMtYIK5CuHZI
 CeLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HJ/B8Hga
Subject: [Buildroot] [PATCH] package/bash-completion: bump to version 2.17.0
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

- Enhanced smartctl completion support
- Added recursive directory handling improvements
- Fixed rsync/scp/ssh file type handling
- Improved BSD compatibility for rsync
- Fixed chgrp completion typo

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                                   | 1 +
 package/bash-completion/bash-completion.hash | 4 ++--
 package/bash-completion/bash-completion.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e9c8a5a0f..9b123af415 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3062,6 +3062,7 @@ F:	package/wolfssl/
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/hyperfine/
+F:	package/bash-completion/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/package/bash-completion/bash-completion.hash b/package/bash-completion/bash-completion.hash
index 7e952e5b02..294ab65a2b 100644
--- a/package/bash-completion/bash-completion.hash
+++ b/package/bash-completion/bash-completion.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac  bash-completion-2.11.tar.xz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c570b9e58  bash-completion-2.17.0.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/bash-completion/bash-completion.mk b/package/bash-completion/bash-completion.mk
index 8b0e949416..fd046de8ae 100644
--- a/package/bash-completion/bash-completion.mk
+++ b/package/bash-completion/bash-completion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BASH_COMPLETION_VERSION = 2.11
+BASH_COMPLETION_VERSION = 2.17.0
 BASH_COMPLETION_SITE = https://github.com/scop/bash-completion/releases/download/$(BASH_COMPLETION_VERSION)
 BASH_COMPLETION_SOURCE = bash-completion-$(BASH_COMPLETION_VERSION).tar.xz
 BASH_COMPLETION_LICENSE = GPL-2.0
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
