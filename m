Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB459C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 18:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 909FD419E2;
	Mon, 25 Jul 2022 18:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 909FD419E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpYkSDL23VQt; Mon, 25 Jul 2022 18:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67653419E1;
	Mon, 25 Jul 2022 18:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67653419E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B57D91BF380
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 18:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A0DC612B2
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 18:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A0DC612B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kT7f1n5Sxzpx for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 18:50:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AA73612A2
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AA73612A2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 18:50:06 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id m9so14148351ljp.9
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 11:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQ9m8UBHrMjSnkyJn4/hjDVM841FaW+FKxjgVsZWJJo=;
 b=w5diweB2ZCl8VCMp5y46mnibWvWZtpaLmI+VMVKJ0ZQH5K1sQSpFvDFuYVqsKi4dkG
 BK1hkR83C+0xgxuPCZU6Xdfjza/yohGSGrQvbB7w8V2zgMc7h86OhuobIVYJVga1mB2Z
 z7SLG+d1rV2ecyha7Dgbro2NxjrNgqMv0s5yzYqlvd93S9A7YajQ495v3K2UVdC3TzN+
 RVEH3swaeDBMV7IVCd0Cjsvq94wxkGl0QxHz5OZMFZn3OQ4iCiHob4YjNnO9VE34QQOR
 k6YBlUYK28UAZopxo4VdQ3qJ5L8BqRiV9gVuE/Apom4iwvH3gWMLrrxZTWg5GbNyErAh
 jN3A==
X-Gm-Message-State: AJIora+sSadqY2imwV7jVbS/4g/ksB6bfW+Yd2WL1r6llcr9VBnsUIPV
 ToV4WQsIoZEKElHNCTzNEPnFGupVYS0=
X-Google-Smtp-Source: AGRyM1tSFz+Sht8dJ52zKL042tcG3aIsv3tG7vuR32ND5uG7DyWeTRw5R85K1fyV5daG63hWayGBfw==
X-Received: by 2002:a2e:84c8:0:b0:24b:50bb:de7d with SMTP id
 q8-20020a2e84c8000000b0024b50bbde7dmr4811628ljh.40.1658775004007; 
 Mon, 25 Jul 2022 11:50:04 -0700 (PDT)
Received: from localhost.localdomain (82-209-154-112.cust.bredband2.com.
 [82.209.154.112]) by smtp.gmail.com with ESMTPSA id
 x22-20020a2e7c16000000b0025de9bf5ea4sm2574979ljc.38.2022.07.25.11.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:50:03 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 20:53:49 +0200
Message-Id: <20220725185349.473792-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQ9m8UBHrMjSnkyJn4/hjDVM841FaW+FKxjgVsZWJJo=;
 b=NBj/2qZKEDVZoUpWTPqtGLKixe1CHo5yXqksCJG+obVQzSuyHIZxu5EOJtagQtycIe
 kegjmfR3YY/p/w6zwEbx7544pBGGRKxHp22fvojoPvwN/8HiJ3z5QeDYLP3oEXul6QO+
 iynrFBFv09qKzFi8Y7EpV5YysLBujU6iDpshWpCrPN4E50bUIeHBYHRq1lT9b47o1MeM
 NUwCTJL4M5uAcw48FN+6+H9oBKX2LZxN3PKxgmnpfHf5NtEVQ/zTkOqokxYyyPoy0gUJ
 6PW/BsGxDU284FI/n4cRNbsd65uc2YW4K4a9RK+YmFgpljXuLI0dlMujC8y1W0GSaprr
 A/vQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NBj/2qZK
Subject: [Buildroot] [PATCH] package/libostree: bump to version 2022.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.hash | 2 +-
 package/libostree/libostree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.hash b/package/libostree/libostree.hash
index d85b82f35c..6839d5439c 100644
--- a/package/libostree/libostree.hash
+++ b/package/libostree/libostree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  14bbd351a95066f68c3b283e0bd0ddd03562e862af66f6f6d894c6c328d7eb81  libostree-2022.4.tar.xz
+sha256  914c4d993bc111d7dd30ae9721b6ffe8ab56eb1fd6e81b097b09f400cc1b053f  libostree-2022.5.tar.xz
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 3210ed3707..e0c955bc9a 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOSTREE_VERSION = 2022.4
+LIBOSTREE_VERSION = 2022.5
 LIBOSTREE_SOURCE = libostree-$(LIBOSTREE_VERSION).tar.xz
 LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOSTREE_VERSION)
 
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
