Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70A3C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 06:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 347E140849;
	Fri, 28 Aug 2026 06:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccoCfg81jphF; Fri, 28 Aug 2026 06:05:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787897120;
	bh=oNLl8dDjBKerEE53hJXY8rjffSuj/Te9mMHfJNV0U2g=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cwBrAp4ymy1Gd7Z3QotIwNBZendIxB1tP4qpzKqj/51tolJP/PXxTU0pIVJYuV5Ji
	 4vLnEGYvenjCOow4kLPdnOhh4OaCcQyG9Wg2JLI8S8RYVHWWM7aVMSnWVFcNdEo4nC
	 mdc0+44LLfnuksODqv4mFRVsnXus3/6fxu6DK9ql/E2pDEwJmoYyavF6wIwr53xf8J
	 lXy1zvUg3oJGAqrklvNK7hWn/zuthPMPL7EGTDx9GPJruVLakdVgGUj3URTlLCCwvR
	 nkRO2Ob3q3FvTxuzlA2lzUxhOep6rebmNKAOLBGH3i+aWeHGnU3FM5G4wpQZ9fdNx1
	 LCVz9vIWeTL0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400E64083C;
	Fri, 28 Aug 2026 06:05:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01E3E78B
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 06:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7F80606CB
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 06:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9jgyCWEzsUi for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 06:05:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=a2cfpgeW
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE703606B9
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 06:05:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so3971165e9.1
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 23:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787897114; x=1788501914; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=x4EDulFrez1ioANyy2epG7/Bz+b/6W9WkzKVNUVw1LM=;
 b=a2cfpgeWXlX9owA0TaPDOpD2PqR7WbPGZxGt2C4KqR7Gd+QtAw4JJwiD3dw+rN3BLa
 07mACj3zf7iCbuodbqght2FToc8G57/bYWrk81C4E9A7kZ/uUq2hK40qDmb0Br7fb3fY
 6kUxUT5nIsS1mm5EhMrmpcgleELh3dol9QUw7SXc1y51BJtFwmMU8+HBxqHhv4CqWYm/
 RRyyCQHCx3iNKh0kzYRAtKtiSNlYPCXS3e0H0GxGTyzlFXt+aUFljLhABh+9kaLyDQ0h
 205ML+dUBTvUtB49FI/FzDqCDts60/iFb8L2b3M7bB5XAyWN97+vnlzUhVJsJ/kZWMaI
 4ujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787897114; x=1788501914;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=x4EDulFrez1ioANyy2epG7/Bz+b/6W9WkzKVNUVw1LM=;
 b=Ape2nztRUev39VNt8GFG7pOlSeW4JLJU3q9xDLDvTO0uIRbGERQyFIrc2ZFa9D2dSZ
 JOnwwraOkZMp5ZpRn2/VWlM6dK7XwhhDioY3lvEsQ0dOgdQ6tyIXadwKiU3Abp1oltth
 vIrJ3wWm7yMbp/Cp8N/6vQr8kLeRTWBdqoWJ10UdTuZ5AAPyZK2Jaiah3srTGVmHjdze
 gTU3l4EE3BT7ZoXADtchqv3q5vZYfxhBYQyeeCpH76S51KGZHt4NNetb4QOb4g3pQZeX
 pEKz+jQt+mALAwqJeXAVcz1xn/bV1M5S4owEkOTkzhqagI9ZIy0PHlLXmrtb7WZy3/qx
 uI0w==
X-Gm-Message-State: AFuF++ly3EXj0uYoUURq5a+iaYT38psU8psWXDE9qKFeTSdS6/LtJ/B6
 WIbeESSK2gTFJCn78QjMKXYkLbhE31TSo75nLHaNU76UacdVK9BWUyNj2GJFqag=
X-Gm-Gg: AR+sD1186Tsi4jG7HRaTRBAuNI0ALiAgnWUL+siCly28/DxDjNJIgDRQhf8npJcrJio
 SZ0Y6x9C2Zd1tHPdU2+R0w164RWK4HhMWUXoBJL5Ij2bjmCFk36ptSXu92tJH/gy0Pp5TOuljqF
 Aq3+6EzkAMJuZlb3fxAn6XlUrnFm9XHPYvtJ/UiNuSnaeYeZQM2u0daKS/sFfBF+AaKTzhQXJ7s
 PyBDWQikxnDd9LAXc7p0CsC7avZEH0F/af693MebNaVDK34meokifXYAhwcdBwbW5bHXoVOFwDz
 SFrYB9LfcO0vqTU/WSCcZNEfEmf9FXuycpshqzq5DoRP+2VGXNnsS3j8kSuO+nak+FJ+3fpW3Db
 yVj8JLtXQ9Zfn2AwIcxvalvzrfiK3fUhKdyvHtHxooy/nxAyTfpQGh9l+H+PTQdYPTgulNQO3KC
 6YXF7vJEor13gWzVFL0vd90kbX5fXj7uJwrSIctw4qZNVX+YKTJQRDP52l9HEX8mhhg78yqjplD
 g==
X-Received: by 2002:a05:600c:1f91:b0:499:bf8c:cfd1 with SMTP id
 5b1f17b1804b1-49b91c1c784mr55276135e9.2.1787897114134; 
 Thu, 27 Aug 2026 23:05:14 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b94dd2517sm23859615e9.7.2026.08.27.23.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 23:05:13 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Fri, 28 Aug 2026 08:04:52 +0200
Message-ID: <20260828060500.58909-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.59.0
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

Changelog: https://github.com/Canop/broot/blob/v1.59.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 176c663d62..a6d767c769 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  cad8fb5e23b422aef80ea14797de7c709c97a5d2bb8019cddaea87811b17a652  broot-1.58.0-cargo6.tar.gz
+sha256  5a0ac9419b66b7a7763c4ec0e53394b38e87b2cc11958aa6d352e6b4c74020a0  broot-1.59.0-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 91b35abd6b..2f1648fb6f 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.58.0
+BROOT_VERSION = 1.59.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
