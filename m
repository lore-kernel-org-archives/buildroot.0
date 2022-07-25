Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51961C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE81A41703;
	Mon, 25 Jul 2022 15:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE81A41703
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivcgiDpeeW4l; Mon, 25 Jul 2022 15:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4AD140C4D;
	Mon, 25 Jul 2022 15:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4AD140C4D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0B401BF2BD
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4C66419F5
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4C66419F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_v5AP4A59Pz for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:22:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A685F419F8
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A685F419F8
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:22:35 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bn9so5585119wrb.9
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwSR0bcybN6pvgBxmrRz0ubl152zLyjwrhhZK9wG5B0=;
 b=rXoRVfsGgr1Hk3pa4535Cci9jPTLPXiwWQDwwsrfXYwKhgx7S2lwwAGFf7z6WkBvEH
 qGA3mWqrfWFSVT4OsvmdLv1SqR9c7ie1s7chWJju8EKnd31EIe/1JEXJz/ypMw9xHM6v
 Ze9ak9JC/pKYlORyuYmit3I6VCltnSxfN6a3cN5vVAoIIIyNZgbbxwPcP+V+KcgY9OC7
 lZz/asPLLeSn3bGiB6kkoPkQYGWctgsW2sPlO/qdydBEu8LmyDdkaBXQOFN6ycw8FtzD
 41MxcEP/ZRab6kvwqTRMY0QlK3aIZ85y8GoF+1S49LrFoBKvSSTxJeI4ZNcNLx5Oqds7
 kQlA==
X-Gm-Message-State: AJIora8wNuyWFS87zl3QnRxK+BGOOyt9xMIeGntmgP6PqBrrPHR1LGtY
 vHuUCzroV4wwUluzE5NRhUBRWhOORXSw4g==
X-Google-Smtp-Source: AGRyM1vZfOuF2pLTmwD+JHvz+OTgVDDPgauypA8SdTLrS65CWALkxa3E5PCv0DoAcu61MBrBRePBJg==
X-Received: by 2002:adf:f746:0:b0:21e:55e7:b8c3 with SMTP id
 z6-20020adff746000000b0021e55e7b8c3mr7905077wrp.251.1658762553812; 
 Mon, 25 Jul 2022 08:22:33 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm14244983wmr.42.2022.07.25.08.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 08:22:33 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 17:22:29 +0200
Message-Id: <20220725152229.3370033-5-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220725152229.3370033-1-arnout@mind.be>
References: <20220725152229.3370033-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwSR0bcybN6pvgBxmrRz0ubl152zLyjwrhhZK9wG5B0=;
 b=ZyppaR8ruc85ZoACnzYTWHpukup4GavZKt1b5lZMm75zTorTbeACysPNrbcDymOrna
 fwrIIz8vbT7OW1QRiTyH/0zFu9ouZvnxXfuR7PsTW/xxk9byQfLXeMtBYOKOC8NleM91
 JPtT1RIftl2s4Db9isncKV0H6qEOyy1qAm24wUNeWT5H/OKiy58IngUkMjJODFAxYKqf
 O7FZ5mfrHDgT3yencXP0EruukofGE2VX4CFWsMEaqA8tGOg6L5grLTbbeeqMFlDeUNjF
 OEH5hhI7Ek1nQnRyxxbRWmN0U1YWsJNi042pm+iIHaqb4bgpRj3xxevtZbLHxvWl3bgH
 VgQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZyppaR8r
Subject: [Buildroot] [PATCH 5/5] package/gcc: remove BR2_GCC_ENABLE_LTO
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
Cc: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>,
 Douglas RAILLARD <public.douglas.raillard@gmail.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, this option doesn't do anything. It only adds
--enable-plugins --enable-lto to the configure flags, but doesn't
disable them if it is not set. Since both of these default to enabled,
plugins and lto are effectively always enabled.

There really is no need to make this configurable: it adds a bit of size
and build time to host-gcc, but we don't care about that for host tools.
It's still up to individual builds to enable the LTO options.

Therefore, remove the option entirely. For clarity, explicitly pass
--enable-plugins --enable-lto to configure.

No legacy handling is added for the removed option. Since the behaviour
hasn't actually changed (independently of whether the option was enabled
or not), there's no point bothering the user with a legacy option.

elf2flt was linking with libdl depending on this option. Since the
option doesn't do anything, this is probably not needed. Still, to avoid
breaking things, and because linking with libdl doesn't cost us anything
anyway, always link with libdl.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/elf2flt/elf2flt.mk | 6 +-----
 package/gcc/Config.in.host | 6 ------
 package/gcc/gcc.mk         | 6 ++----
 3 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 9230e3ce1a..6cd0786c3d 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -24,11 +24,7 @@ HOST_ELF2FLT_CONF_OPTS = \
 	--target=$(GNU_TARGET_NAME) \
 	--disable-werror
 
-HOST_ELF2FLT_LIBS = -lz
-
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
-HOST_ELF2FLT_LIBS += -ldl
-endif
+HOST_ELF2FLT_LIBS = -lz -ldl
 
 HOST_ELF2FLT_CONF_ENV = LIBS="$(HOST_ELF2FLT_LIBS)"
 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 20187db6fd..9833ae1336 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -130,12 +130,6 @@ config BR2_TOOLCHAIN_BUILDROOT_DLANG
 	  D language and you want D libraries to be installed on your
 	  target system.
 
-config BR2_GCC_ENABLE_LTO
-	bool "Enable compiler link-time-optimization support"
-	help
-	  This option enables link-time optimization (LTO) support in
-	  gcc.
-
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
 	depends on !BR2_PTHREADS_NONE && !BR2_arc && !BR2_microblaze
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 114e774503..ec6f3b550a 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -75,6 +75,8 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--disable-libssp \
 	--disable-multilib \
 	--disable-decimal-float \
+	--enable-plugins \
+	--enable-lto \
 	--with-gmp=$(HOST_DIR) \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
@@ -165,10 +167,6 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --enable-tls
 endif
 
-ifeq ($(BR2_GCC_ENABLE_LTO),y)
-HOST_GCC_COMMON_CONF_OPTS += --enable-plugins --enable-lto
-endif
-
 ifeq ($(BR2_PTHREADS_NONE),y)
 HOST_GCC_COMMON_CONF_OPTS += \
 	--disable-threads \
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
