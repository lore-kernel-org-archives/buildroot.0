Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5306BE7FDE4
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0369F409E9;
	Mon,  2 Feb 2026 21:28:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LtLPK4RCh6N; Mon,  2 Feb 2026 21:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152FA409EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770067715;
	bh=8s/9NcZ8lJ59YOXBgRt4iuyUN1sCFgJKkprqw1m2XQU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Epg6t3uSTwgEGVkEFRkibT8EG7PG1xBk/rE3puUFZynyZwaPPzll7FscOI4S5alvL
	 WIis4tZM6Mged9NaCti2hdG4ZsPWXZtUtOiHzu+ML7hmc2Vc/xKpFHlhNb9zUUcf0+
	 EP0B/oNBhz60AnX0suKtoYzl4x9Qnh5/PeZJ7hrnkQbVh7nXQXtOSemWr0Z8N0xOab
	 vAvchvVrFaXHtkk0va8RDgT6sqN/im5MYHP2auHx/xSKzVmAC0QLy4MYouNTrVOvNB
	 jSE8MQPKzg0Cqc7POf77yTgVbjaQxe7MRyeaMv85pd13x4E55fAigqan46uTirl179
	 Y1DMU3QXjdExg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152FA409EF;
	Mon,  2 Feb 2026 21:28:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D30CC149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0A96409E9
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJmhlLkYiuxO for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:28:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 80C2A40968
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80C2A40968
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80C2A40968
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4D540C237F6
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 61D5160767;
 Mon,  2 Feb 2026 21:28:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CCD95119A8891; Mon,  2 Feb 2026 22:28:25 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Feb 2026 22:28:10 +0100
Message-ID: <20260202212814.2607588-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
References: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770067706; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=KAOHjmyujcNcmQyFXeXUBJ/c5PqtFbauBgW7Yo1ycik=;
 b=U9z+gVrZ+P8rD4S+2+RQlFIqBUAnRV9IFRbepZ9CPqZH2JQwIKxgtf7hhmpA+illccqY94
 tTwN03b39oRGFNY4gVwhYDN/4hKvkqG7UkOpf9xSeqJhlNOd6+nLiy9DCv1ZRi2JdKdJfu
 idszfzHhfq37i7a+qQ8T5XRmUeF5DuuUAkLf8cQBbVyru4kBti/NlnNq+Jv/BtL1jSL8Dv
 7qEQsv2gqvJRYKZZFlblPoAD0/7XTlK9G8qcwbN0f2HFwltYc6S3g42Z1QDoWhNn9wuuZA
 5A0d1EK3rMdfvox/1zTOAbqnLrXbx9ScMjFcSCAHS7MV9lHR9TcWUa7xzLRX/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=U9z+gVrZ
Subject: [Buildroot] [PATCH 4/5] support/config-fragments/autobuild: replace
 MIPS64 toolchains
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The prebuilt MIPS64 toolchains are very old, causing build issues (for
example recently with the systemd v258 update). Replace them both a
single toolchain configuration that uses one of the mips64el Bootlin
toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../autobuild/bootlin-mips64el-glibc.config          |  4 ++++
 .../autobuild/br-mips64-n64-full.config              | 10 ----------
 .../autobuild/br-mips64r6-el-hf-glibc.config         | 12 ------------
 .../config-fragments/autobuild/toolchain-configs.csv |  3 +--
 4 files changed, 5 insertions(+), 24 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-mips64el-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-mips64-n64-full.config
 delete mode 100644 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config

diff --git a/support/config-fragments/autobuild/bootlin-mips64el-glibc.config b/support/config-fragments/autobuild/bootlin-mips64el-glibc.config
new file mode 100644
index 0000000000..d8bebd5d70
--- /dev/null
+++ b/support/config-fragments/autobuild/bootlin-mips64el-glibc.config
@@ -0,0 +1,4 @@
+BR2_mips64el=y
+# BR2_MIPS_SOFT_FLOAT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_MIPS64EL_N32_GLIBC_STABLE=y
diff --git a/support/config-fragments/autobuild/br-mips64-n64-full.config b/support/config-fragments/autobuild/br-mips64-n64-full.config
deleted file mode 100644
index b89b74e76f..0000000000
--- a/support/config-fragments/autobuild/br-mips64-n64-full.config
+++ /dev/null
@@ -1,10 +0,0 @@
-BR2_mips64el=y
-BR2_MIPS_NABI64=y
-# BR2_MIPS_SOFT_FLOAT is not set
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64-n64-full-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
-BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config b/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
deleted file mode 100644
index edf04c356f..0000000000
--- a/support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
+++ /dev/null
@@ -1,12 +0,0 @@
-BR2_mips64el=y
-BR2_mips_64r6=y
-BR2_MIPS_NABI64=y
-# BR2_MIPS_SOFT_FLOAT is not set
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mips64r6-n64-el-hf-2020.11.2.tar.bz2"
-BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
-BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index ff8927eb37..3ea05775f8 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -28,6 +28,7 @@ support/config-fragments/autobuild/bootlin-m68k-5208-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-microblazeel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-mipsel32r6-glibc.config,x86_64
+support/config-fragments/autobuild/bootlin-mips64el-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-openrisc-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc64le-power8-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-powerpc-e500mc-uclibc.config,x86_64
@@ -47,5 +48,3 @@ support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
 support/config-fragments/autobuild/br-loongarch64-full-internal.config,any
 support/config-fragments/autobuild/br-loongarch64-internal-glibc.config,any
-support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
-support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config,x86_64
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
