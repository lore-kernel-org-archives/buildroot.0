Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28C8CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB8FB4068F;
	Sun, 22 Sep 2024 09:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBmuQBNNvKS9; Sun, 22 Sep 2024 09:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A4F3406AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A4F3406AD;
	Sun, 22 Sep 2024 09:23:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5A31BF4D6
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DC41813F3
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znDV38fbHTV8 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C372813F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C372813F2
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C372813F2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:23:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42cb6f3a5bcso42887985e9.2
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726997021; x=1727601821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CeJG81OZ8OQSShGXUwhwpIU/MBCtwAE+7QfGzGqhkyA=;
 b=XVlYH4caoqoUeitHSXLcSSAffujvwr2aCnbU7xXZzbyC676lBFLtWERgylS3Wo/0ap
 J+BELTNXlfEBEKQA8JwtAjUt2vt8O52qvI2ElyBDlcTzacNYsP2ea1mWhb77GHM17L69
 cJOinP6teyUjvsDBQ//57yzuvlCXhbeHKk0rDx7exTTc0YY8OBgL6TUV4MMXYcT2tE/n
 bd6JCJZTAWmQNy3HjbaVtD6oNrCQUROL1qbMTWCpAnXHvkRyiDKJ/46D8KzZBg19Obh+
 GOber9MKKRwbYbCZEDQGyEUSJTqKGECGQ+8bXe9Km11UXCb+L+Dg91nN1GzQj/LVYXm+
 bHmg==
X-Gm-Message-State: AOJu0Yx4rOH5sAE/6SEW2F2oe81ghyyz34jEQx8HQ5Ge+83UCgPyU92w
 n9AcCbGv+D64SVSSp0dp5CqOyPdwE7XAdYzzRNCmXo+PR5g9MtT2ADkbcsCr70gCtEQ35x9JMgV
 zHhQ=
X-Google-Smtp-Source: AGHT+IHiNn09ac9eYkVt7rITwmGwCjrHpd+ty9Y8YJwpzvE6tsd0yGH+mkkeSpjnvP80ifX543vxDQ==
X-Received: by 2002:a05:6000:1544:b0:374:b30b:9ae7 with SMTP id
 ffacd0b85a97d-37a42386ed4mr8762845f8f.49.1726997021002; 
 Sun, 22 Sep 2024 02:23:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-102-52.retail.telecomitalia.it. [79.20.102.52])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b33fasm1065235866b.139.2024.09.22.02.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:23:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:23:09 +0200
Message-ID: <20240922092312.2061358-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
References: <20240922092312.2061358-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726997021; x=1727601821;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CeJG81OZ8OQSShGXUwhwpIU/MBCtwAE+7QfGzGqhkyA=;
 b=h5pVBD58hHVd/4OwEfzaonfqkBqNT9/Ihm558n/p2jSj3Wrg3r70qKoYimBMr161BR
 z5seD9Rt/dxcaVtwsbF24Lf4gsIGCUBbe1sJVXHKxPmc1Q7Au3RX/LHS0oFVwCEwtBGO
 xic7kZeFq3rmtU9RaOsqnNqZ4fl5fEDmzxYRw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=h5pVBD58
Subject: [Buildroot] [PATCH v2 6/9] linux: pass -mno-fdpic if FDPIC is
 enabled
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
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>, yann.morin.1998@free.fr,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

If the FDPIC ABI is enabled by default in the toolchain, it must be
explicitly disabled when building the kernel.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 linux/linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 0a213d17b518..126e92e84c11 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -163,6 +163,7 @@ endif
 LINUX_MAKE_FLAGS = \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS))) $(HOST_LDFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
+	KCFLAGS="$(LINUX_CFLAGS)" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	WERROR=0 \
@@ -184,7 +185,12 @@ endif
 # sanitize the arguments passed from user space in registers.
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82435
 ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
-LINUX_MAKE_ENV += KCFLAGS=-Wno-attribute-alias
+LINUX_CFLAGS += -Wno-attribute-alias
+endif
+
+# Disable FDPIC if enabled by default in toolchain
+ifeq ($(BR2_BINFMT_FDPIC),y)
+LINUX_CFLAGS += -mno-fdpic
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
