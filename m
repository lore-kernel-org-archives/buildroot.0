Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EDFC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 18:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB8360FD3;
	Wed, 14 Dec 2022 18:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB8360FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKOselWxsYW3; Wed, 14 Dec 2022 18:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB1E60E8F;
	Wed, 14 Dec 2022 18:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AB1E60E8F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FAEA1BF312
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B86581318
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 18:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B86581318
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_x4QsOY7h27 for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 18:50:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3331B81312
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3331B81312
 for <buildroot@busybox.net>; Wed, 14 Dec 2022 18:50:53 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h16so711720wrz.12
 for <buildroot@busybox.net>; Wed, 14 Dec 2022 10:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oobc7K9mBbJRztfrJhnjog3UoiXuoFbnrcDXdGWNsdA=;
 b=bNWJ19z4RBsAlfQWcLWrE9T5ZMjvjcDJyYDeqQI/vn4Oke7/mliXqumiWwkFT4gIUV
 CMVKIJpt2Fn9n8f1SDcu2xnYJ8LOmrczWVtaYG/x3PPR+wsK7blssGTXl8gQITl/7cmQ
 PE/g4YeREkSb3uzvniFNTYy0Zn3E+iY/KKpAsLb9LA8r/SZ+BIxUDljZG0Uf1gYT58Xa
 DXSdKJowp0se8bQJx53G/nA8D12a87Xw5feQbntn3n37gtHPWVrzxtdQFLBeCOh3uIUF
 AJS8BFCujvkDh+TA8o18Sk6W7bKlgvfZKjIUCGWVGAs9iUq6xvYDh47aPp6lWI5/fZS/
 4dBQ==
X-Gm-Message-State: ANoB5pl0g/H8DBOKL39TkayX6BaPK0LK7voNf2IuGNq8+0IC3LpYhHTr
 YfgvpwkD2QFDuoEF00L3iS6EgUset00=
X-Google-Smtp-Source: AA0mqf51da1ZGPCBbe+QmBLJ33ETNUbtpuDMYARbdBnYI+492xohalKpI0ngduy4RVdRZFO15rnDFw==
X-Received: by 2002:adf:a4d0:0:b0:242:3be9:71c5 with SMTP id
 h16-20020adfa4d0000000b002423be971c5mr15207914wrb.54.1671043851459; 
 Wed, 14 Dec 2022 10:50:51 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 b13-20020adfe64d000000b0022ae0965a8asm3644783wrn.24.2022.12.14.10.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 10:50:50 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 14 Dec 2022 19:50:48 +0100
Message-Id: <20221214185048.3340173-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oobc7K9mBbJRztfrJhnjog3UoiXuoFbnrcDXdGWNsdA=;
 b=XnHhk95sgvvyfEfQb+33rA0aw08AqV3amAc+WQ9XmQLQW5nXMVKbVMKBB/HpckpjVW
 3KJmUCEvMC401iKJPi1KBxdq5pAjjtG5NA7mKUl94jbIQZYWwG9M9slGihQM/6Qwc20+
 daonY+wF9FsU3VET5pGtV9zBApxQIRLvTougMKYF9lijiJs1rL3hB5kJw7tNxlccLZkc
 P/iUhE7yGgkJgp9WQlTNk55duGrYFnNn7ZbBG7OMMPI5+TsaJgFgwlnbQus0zJpkgQhM
 Ungq2wkk5iS16Ps4Zzi9nkUrDpGq+BBmxa4bJ2X/JLzMiZFtXDbRd7r7Wm4ZtW1H0Z/a
 7b1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XnHhk95s
Subject: [Buildroot] [PATCH] package/xz: bump to version 5.2.10
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
 package/xz/xz.hash | 3 ++-
 package/xz/xz.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index 3aa68791f..1153e02b4 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature
-sha256  b65f1d0c2708e57716f4dd2216989a73847ac6fdb4168ffceb155767e22b834b  xz-5.2.7.tar.bz2
+# https://tukaani.org/xz/xz-5.2.10.tar.bz2.sig
+sha256  01b71df61521d9da698ce3c33148bff06a131628ff037398c09482f3a26e5408  xz-5.2.10.tar.bz2
 
 # Hash for license files
 sha256  bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c  COPYING
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 004eea94b..0120d23b8 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.2.7
+XZ_VERSION = 5.2.10
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://tukaani.org/xz
 XZ_INSTALL_STAGING = YES
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
