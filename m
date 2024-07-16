Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F31C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 07:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D576D6062B;
	Tue, 16 Jul 2024 07:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2gFuByf3JdU; Tue, 16 Jul 2024 07:59:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD5E16066B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD5E16066B;
	Tue, 16 Jul 2024 07:59:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C7E91BF20D
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 07:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AC5A6066B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 07:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kn2grWvZSTMK for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 07:59:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=fred.lefranc.evs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D6916062B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D6916062B
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D6916062B
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 07:59:54 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-59f7fc89201so141790a12.3
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 00:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721116792; x=1721721592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7UISRTN6KW/COP/b/KH/tRDWz7Ou2W+7EeaI/hfrm+c=;
 b=VG6g0dcW2zyb5ak2V9RiM86Z/4sLVgqNogEM4GGGfwpI+ZmDU2BUiREXDBRUoEI2jo
 Rrq4ajieIQRRyB1VYR2WM81x3aMnHYSD0yC9/3Df1hfBLTxFq7klIXjJUI23KUnR6A/f
 GY9AKD+ta4U9wmdJf0RA4yDn4zjZjk8/IjvYHVSP33W8DDNN2vgvmvpdiYRALXKTWRHA
 9av7XeZeKa62GaIRJd80hYkhrvdmlvuWu0NbXb39CjZ7bcBuNfYMSps30fJY1iEa+vNw
 jZB8C6QdC0FBzD07jenqXTOBbBU/rpO6pvwS3qZZuicjAZw7j37a0IboRsVQ/Tv9GXtW
 GdeA==
X-Gm-Message-State: AOJu0YyCvuWuBlXjKKwQPBcj/IlZYuHgxBZXo/FIYfWAGSTZzqGb/5Sa
 c0cPLeEohUuRMApcG5kBK1DnXsu+fufwnU9EhYMQWqEz4FOcPXtSxFyw2A==
X-Google-Smtp-Source: AGHT+IHA+u9WbuFCb865eJ+ehMcJFF5VY4vws5a+Joj7ZjjLmxVg+1Uvj5hjGaIs2/dytTiDsFdnww==
X-Received: by 2002:a17:906:d213:b0:a77:d85c:86fa with SMTP id
 a640c23a62f3a-a79ea3da816mr102173466b.13.1721116791862; 
 Tue, 16 Jul 2024 00:59:51 -0700 (PDT)
Received: from hw-dev-vm01.evs.tv ([212.222.125.68])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5b7f00sm278926666b.63.2024.07.16.00.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 00:59:51 -0700 (PDT)
From: Fred Lefranc <fred.lefranc.evs@gmail.com>
X-Google-Original-From: Fred Lefranc <fred.lefranc+evs@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 09:59:34 +0200
Message-Id: <20240716075933.1315047-1-fred.lefranc+evs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240715111003.1296141-1-fred.lefranc+evs@gmail.com>
References: <20240715111003.1296141-1-fred.lefranc+evs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721116792; x=1721721592; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UISRTN6KW/COP/b/KH/tRDWz7Ou2W+7EeaI/hfrm+c=;
 b=iUxnzRnAsMK/fCTJADjRfBFtqnczXWIbwfw254wE+twbsd7BEoZFeSNRs0yRSrSE6Y
 YhAKUO6YTqJAm/xXZ62UC/KXFGJBad7Cd3NAQmgOhuJtajECwMdT6d1AO7ptaRWkz6x+
 8RsKPToIBP01r/Z0JP/lp8n68Al6eZWvT+ratfRsKpCn2zOUyXlpK55Xav08e/dCh3JI
 yEZhD+fA/v7ppzbSG1RtgNZmsLCw58bikos+gmhxGnkmLkAeFqgVSW3ASf5IHeJQz4qX
 678r10DsFA04qK4c6N4Txpxp2mJ/dZMMKlqolF+xnkK/gaXNYgMM6OybL8tQDAAmw6Wu
 DYkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iUxnzRnA
Subject: [Buildroot] [PATCH v3] package/busybox: fix build with glibc 2.39
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

As glibc's libcrypt was providing busybox's libcrypt dependency this
broke any busybox build using glibc version 2.39.

To fix this, add the libxcrypt dependency to busybox when
BR2_PACKAGE_LIBXCRYPT is selected. The user still has to select the
libxcrypt package for this patch to work properly.

Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>
---
Changes v2 -> v3
  - fix commit message
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
