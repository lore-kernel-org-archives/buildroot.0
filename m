Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A226C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 083C74054E;
	Mon, 15 Jul 2024 10:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwRBq4dsxdnk; Mon, 15 Jul 2024 10:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B59F4405D1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59F4405D1;
	Mon, 15 Jul 2024 10:16:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5DB91BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFCDC80F26
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1iWQ8fDeqW80 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2269580F0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2269580F0E
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2269580F0E
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:16:12 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58b966b41fbso5033210a12.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 03:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721038571; x=1721643371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KfqDGastLDmH1FwhWvYoUMpDBsRsg4jt/DoFBVPpzlQ=;
 b=IcQbZ1fmnLjQyYXvlBN7yJ7Zj97+k505n+v0om711F8eq842QzmhESblYSZn7cmYk3
 AmXhPZ/EJzy7Ny/2y8XlLBItdk0YgTkpAEbXhv9oy1XYAmCcHt6V4TXIPReweZg7daAY
 YdnELh/cLHv0H7bKUmoMAZT2qaPQ9dZS0R3IY1uo5xVjmgjXKbcECrQtsNSvUtL7Vu+S
 wG3lu6lXYNdeU+Z/PtJlYPBySe9Mn1aDHOzkDt6T1PJRtmmzsu3N7pXIgkMRZ4Mdar1c
 PnWFY+Tm0vw5mjUngDRBCs8bJYN72hwYHioQ6SHk7VWpl8cPNr5MGJV5N0Z88F2kmsAm
 pQiA==
X-Gm-Message-State: AOJu0YwvhDWJUuM0PjIB6OvBUui/umpUdg4jXwkexGAnKUgwOL0iauwA
 OFkfQshSQ+waNS+QKzomdW+jmosC0fEp+C1a7gAPco9m+48VKOd4Kb5iSw==
X-Google-Smtp-Source: AGHT+IGEq2gPrHk0ovpU/Bc3z+w7rQkutAur7S/dNMzBI7xqV1jUCjziB0q/e+qq8hu+rJdk5k3ZFg==
X-Received: by 2002:a05:6402:1909:b0:57a:2eff:8ae with SMTP id
 4fb4d7f45d1cf-594ba9974edmr14857754a12.1.1721038570575; 
 Mon, 15 Jul 2024 03:16:10 -0700 (PDT)
Received: from hw-dev-vm01.evs.tv ([212.222.125.68])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b25528069sm3218267a12.50.2024.07.15.03.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 03:16:10 -0700 (PDT)
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
X-Google-Original-From: Fred Lefranc <fred.lefranc+evs@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:16:06 +0200
Message-Id: <20240715101607.1288233-1-fred.lefranc+evs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721038571; x=1721643371; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KfqDGastLDmH1FwhWvYoUMpDBsRsg4jt/DoFBVPpzlQ=;
 b=F5dKiHHrSaIP9Xyw//VB3/6cHu7KEm3vjurffmDVVJGX1ZKbwKCG4YoA6Sol7BsM9i
 pNH3FEwfMugsanHfxE6ZOoeGSIwXBFZipnt7UJy1fIfPIm7R2HJiLXpD/7IH21igsuXb
 QiteXyzwpYF78yrwzv+eE/oZLjgF3oXEdzZ3+kGzQ1sTEKbM9IUMj4A+EX4sY4VdoYuf
 FnUvMyTlZt3ja2MU2GoBY8Zs62KQfWHENbJOMvpY2Q6ODPgLYCekJV5Zbf5kAsAGPYZ+
 s1YA5egut5nOKg8IJhHqBKHsJzPKw775DncY/Ywh5txn6Va59+zvS+kSj92rkFXjJKAl
 Drhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=F5dKiHHr
Subject: [Buildroot] [PATCH] package/busybox: fix build with glibc 2.39
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
Cc: Fred Lefranc <fred.lefranc+evs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When glibc was bumped to version 2.39 in commit
b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
libcrypt support.

As glibc's libcrypt was providing systemd's libcrypt dependency this
broke any systemd build using glibc version 2.39.

To fix this add the libxcrypt dependency to busybox which is the
preferred way of providing libcrypt support in busybox as the glibc
variant is only used as a fallback due to being deprecated.

Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
---
 package/busybox/Config.in  | 1 +
 package/busybox/busybox.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 3c2aa515f8..85fa0c7f9a 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BUSYBOX
 	bool "BusyBox"
 	default y
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  The Swiss Army Knife of embedded Linux. It slices, it dices,
 	  it makes Julian Fries.
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb5e7ad922..d014b3d275 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -164,6 +164,10 @@ define BUSYBOX_SET_MDEV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT)$(BR2_TOOLCHAIN_USES_GLIBC),yy)
+	BUSYBOX_DEPENDENCIES += libxcrypt
+endif
+
 # sha passwords need USE_BB_CRYPT_SHA
 ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256)$(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
 define BUSYBOX_SET_CRYPT_SHA
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
