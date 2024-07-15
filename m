Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9106DC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 11:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C1560785;
	Mon, 15 Jul 2024 11:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMrtzKgPbHi6; Mon, 15 Jul 2024 11:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A926079F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A926079F;
	Mon, 15 Jul 2024 11:10:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97E9C1BF3D9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 11:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B701081146
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 11:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rwNdJh2Bg8qV for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 11:10:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB52180DBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB52180DBF
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB52180DBF
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 11:10:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-58b0beaf703so5171807a12.2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 04:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721041813; x=1721646613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4jwNnaAY1gOAXheLSrzjTWVhgflAcp+Wln6uaGEy7o=;
 b=b1tKer06LJEzxzostxMhQlGQ1TMhepX7F2I/1unXMoo+eGRBZMuai8ZKZmcdiuWpMB
 qwILidFX3kwLcnRDoT7F7658JKDGhDtKPn/xtYG4b7i4e3VbdIZrjQ6cLPBtfMb3pWNX
 zema/v/omOXJ3+YrD3djvqUC6LEBlGArf6L0LVr/Yw1XNLDjz8xplxD+stTDaL0oo8Vj
 pgot1E46prF1IzgrTrUfuMcZNfCe3XkXYw+o1YHU8rMYif74oipmnKP774uBIpbL9Wcj
 5VgT7GUnLS2/Cll63ie19jqiFFaoEzi1/hroW10zNcfvGpiATKBkoRhGBXzvPTsbJbNp
 yvpg==
X-Gm-Message-State: AOJu0Yw4hkIwxBFDirurqTohq0RIhaST7BhXv8tLp/E8KkhUswvMsQgU
 GOb7Lr14mOZ0GhmtxgBj8JtaeLxWPgxtP9dcuoSlWjGqhnvUPw+savPerQ==
X-Google-Smtp-Source: AGHT+IFuHXJfl2G+XKJ+sVXZu1/xXcpmH2sWrF6BdFrrTP6qiQRkoea5kFOPy7rbhleC3J9wN4KQlA==
X-Received: by 2002:a05:6402:13d4:b0:58f:ebaa:6485 with SMTP id
 4fb4d7f45d1cf-594baf879c9mr14039237a12.12.1721041812954; 
 Mon, 15 Jul 2024 04:10:12 -0700 (PDT)
Received: from hw-dev-vm01.evs.tv ([212.222.125.68])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b24a77201sm3278704a12.8.2024.07.15.04.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 04:10:12 -0700 (PDT)
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
X-Google-Original-From: Fred Lefranc <fred.lefranc+evs@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 13:10:02 +0200
Message-Id: <20240715111003.1296141-1-fred.lefranc+evs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240715101607.1288233-1-fred.lefranc+evs@gmail.com>
References: <20240715101607.1288233-1-fred.lefranc+evs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721041813; x=1721646613; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4jwNnaAY1gOAXheLSrzjTWVhgflAcp+Wln6uaGEy7o=;
 b=Fusy/rHu/ULOitG+wS8wRIGLLHWJNN+uAv9MVIWOvMt/vPoJgX08W/xd6o3F35gG79
 yj6ZHiUm/xKnj7uG0hGpggMRnPkGlgjWBseDHmN/zBGQeOzUPc/XM+o/7PwnmXB7zF93
 BHtNR4/C5UGzMLyPVSyyxZe/Y5JN1ZLyDz5FICIwFJ13HGfsHkd8NYaCOyTmWixh3LqW
 p1LiABXoofFGUOi2n13NIkXkJ5TvOI8X28WBfPwgah4LOcLPdg92tipoTkoiCiAKUA+H
 dkB7WlKwyW5mdQRXhzaryjfoQ+GFgtmv49Rnb5NszMMvJTq5HN/bREUXga8pxa1AQkKT
 UOEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Fusy/rHu
Subject: [Buildroot] [PATCH v2] package/busybox: fix build with glibc 2.39
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
Changes v1 -> v2
  - busybox.mk: fix BUSYBOX_DEPENDENCIES ident & remove the check
for BR2_TOOLCHAIN_USES_GLIBC (req by Thomas)
  - Config.in: remove libxcrypt mandatory dependency
(req by Thomas)
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eb5e7ad922..d25e5bf468 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -164,6 +164,10 @@ define BUSYBOX_SET_MDEV
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+BUSYBOX_DEPENDENCIES += libxcrypt
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
