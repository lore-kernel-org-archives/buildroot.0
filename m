Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFDFC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:49:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D85C619E1
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 19:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D85C619E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D048360786;
	Mon,  8 Nov 2021 19:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtk1eUXu3UJE; Mon,  8 Nov 2021 19:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E056083F;
	Mon,  8 Nov 2021 19:49:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 645791BF311
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6195480CAF
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 19:49:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxJxCplGSpdA for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 19:49:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91AB480CA6
 for <buildroot@busybox.net>; Mon,  8 Nov 2021 19:49:43 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i5so28938980wrb.2
 for <buildroot@busybox.net>; Mon, 08 Nov 2021 11:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HJu6co79gts3RKMamB/jru9z6VPgUOEMcKNijMk1s0Q=;
 b=nxks6jueGdTHowbrOUYhy6N8Ya9mYcDkDzNQuwL2v5TSegWVhqSXxkfECGnv3YNEzC
 llpJlSwgsj5WgQBlTNK6+utF//ZVMlAf4kAdbqUEWuSVtg3anlFlNctEzKmI1fwV+lDN
 r6EOFJDs2twYb63+BpXczj46s7XEc3SGKVQ/2lwqpAQQQvGLD1TKcNkHk+GZmLFeT9fJ
 c8cj08Tg5isBft3QNA+pHud3JXJllYvwnlIcvveFYyivh0LIZKJdviNmA5Kdc7oZzt1g
 ir7w3hs0qA+TFXwLYGBsqYwmADNtr7cyU0QnhkJH4eq0Hf8/Z41I9v2LuPE2vZBprZ8M
 V3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HJu6co79gts3RKMamB/jru9z6VPgUOEMcKNijMk1s0Q=;
 b=mMF1uFyjrqOcT5n3TfVZFV8ISx0lbQOtmhyWKW5oEZwG4hrAybyFS0Bw2OJj63bvbJ
 26OXS6Rt7CayuX7JFmXqULc9FpFcw/yjERJ6DXqIH+RKVEFdkup7MOyAnXp2gknpJLRw
 KVDLuqxOlHNSY/gCK4ALGYDP0oclQQoMHL8la/N3gVDVGZaOpvW6NzS/zwERdj0/ZOvm
 Gmg5UvXlSvlqgbgs0UHi34NNBdmjYcrxq+uIIvGuh8zT/l5knTOMUSLjeJfjkqxDRQa9
 cxkGKSYfCkPkglc5Us9THicSTbUBN7Rkd6Hf2gRvggOT64CMYBEofnfG2CgKhMVq1Xe6
 UF9A==
X-Gm-Message-State: AOAM533bMhKFr4dJgKBYlTXFa+s877tExGdk8Pfk3bUTghJReidj0xX8
 ZW5m/ajjMhjKiwe8ge+emZJB1Ka1/Oo=
X-Google-Smtp-Source: ABdhPJxtjY3B0bY3+EnUEIQVH/GwphthI9LDLHiE3+PZindGUqXDzaPz4kFN+0IeXfnQhGUde3Zr9g==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr2049054wrt.41.1636400981861; 
 Mon, 08 Nov 2021 11:49:41 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id h27sm312023wmc.43.2021.11.08.11.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 11:49:41 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  8 Nov 2021 20:49:34 +0100
Message-Id: <20211108194934.221822-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.8.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 42e039214..d80e08a20 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9255d97fee95cec5b54fc6ac718b11bf5029e45bed7873e053314919cd448551  luarocks-3.7.0.tar.gz
+sha256  56ab9b90f5acbc42eb7a94cf482e6c058a63e8a1effdf572b8b2a6323a06d923  luarocks-3.8.0.tar.gz
 sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 28a421925..028e144e2 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.7.0
-LUAROCKS_SITE = http://luarocks.org/releases
+LUAROCKS_VERSION = 3.8.0
+LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
