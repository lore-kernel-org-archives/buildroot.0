Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6528C02199
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 23:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6861D429A3;
	Fri,  7 Feb 2025 23:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32pS7Tm-W0Sp; Fri,  7 Feb 2025 23:12:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E84429C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45E84429C2;
	Fri,  7 Feb 2025 23:12:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 729C11B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 23:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57486429D5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 23:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_UjAgVXi8sN for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 23:12:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57E7B429C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57E7B429C2
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57E7B429C2
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 23:12:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso17909935e9.0
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 15:12:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738969930; x=1739574730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dLryetmn0kobyr6Kg19ZKfuNbRk5z1+NRCCuhcCjShI=;
 b=AxbE9fnWShMmSmZBkOpoGv1dcS6RjPHO0LIkYh9IriMJJDJU0lAn0DVLmv1QkOttJj
 wkGQhIavewx+IWj6RUZb4XN5kEoPmuod0X+2yfnzF+YyaYV4ltxxVMYgNj+DY2NHKiId
 QPXCUDMkPvnkQiA3vNPocHQylj5EQOxP2cqJ1LCGNIedo+4SXKvEtJ7U+pVcMAIUsujW
 6cfXSrX6QD4Th/uYfTnClonf4itEKhKb10siDx/V8l/VdxV1PHciggNveLGahWSodnuj
 lS00N41BM50XlBW7i+n4t5GmaveXSW6IqqROAwg8hOAwwdSfhQFcX3XBThFrK+6a2QOK
 MEuw==
X-Gm-Message-State: AOJu0YxhmY3ruv3owpXPWFtlnRJrVJoGUkVxFD4pO3/7BHXpnLjHNteT
 pZTq/R/LSpS5uBEx3D2kGejlrP31zTGhADfaRSFmkbZNK//0U/fJBcOvlJtfD0CCWNv8Uzoy/so
 m
X-Gm-Gg: ASbGnctTAo7+oT3jWDsyYy/2vM6Djwhup1jvV0eh8t/CrsMzq+IapsLc4ugqOQBWH52
 uHjSlSOQCFlQJuc8hsKEpAcgNKzxzCBBBexM+rZUbnpYxsPF8skynzUF4aKZr91G5rh/15ieDzI
 tvvcXDgTBOfuBdMBvKySHqbfXN4poyXFBan3xiaudmlVf3+VhvbRU3/PvS3V8JzwpxnzEAASVZ7
 0fwYzXGlk8/4ikzw5uAxiCCLaRgK7jxPrETYvUEPfpddbS6+1wpMFcDL3Vm7y8A3+cxnffI0RaU
 gRoI2jioZ5QB5nq/20EmiLIydOH2ZAwVA4o0qOnpXIVBU2n04B11ZLPdSBpVQ1mBjPEonXZfsvC
 VE7E=
X-Google-Smtp-Source: AGHT+IHyNeYLugBPzafIYiTAfaiNpMKDMwjjivv4qr2t1tEyBE0RZmu4nRLy3TwPZSu9C8/OUWrIvw==
X-Received: by 2002:a5d:6d0b:0:b0:38b:ed88:f045 with SMTP id
 ffacd0b85a97d-38dc90f0daemr3750334f8f.33.1738969930087; 
 Fri, 07 Feb 2025 15:12:10 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390db1150csm105175775e9.39.2025.02.07.15.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 15:12:09 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat,  8 Feb 2025 00:12:03 +0100
Message-ID: <20250207231203.3952765-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1738969930; x=1739574730;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dLryetmn0kobyr6Kg19ZKfuNbRk5z1+NRCCuhcCjShI=;
 b=nStuenzj2OnhLANtT+TM4AeD8mHr+fSQX2uWcOubUJXOM2/nWtApRDVt+Zw7q8VYZw
 MYZfDME92O4TYflDcOKRe58NXjjb/GTpiI7NBNxIqfRezFbkEaPcqAcKDkoh1HnzSSbO
 OCreq6XG03R3gwe9p25y6V+lT2luH7sliqMZo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nStuenzj
Subject: [Buildroot] [PATCH 1/1] boot/uboot: fix binman failure
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

The commit 4bce3270d680 ("Config.in: timeout earlier when connecting to
download servers"), among other things, adds the connection timeout
parameter to the default scp command:

config BR2_SCP
       string "Secure copy (scp) command"
       default "scp -o ConnectTimeout=10"

Since the package/pkg-download.mk file exports this command using the
SCP variable:

export SCP := $(call qstrip,$(BR2_SCP))

and the U-Boot Makefile uses this variable as the path for the scp
command (rather than the command itself):

cmd_binman = $(srctree)/tools/binman/binman $(if $(BINMAN_DEBUG),-D) \
		$(foreach f,$(BINMAN_TOOLPATHS),--toolpath $(f)) \
                --toolpath $(objtree)/tools \
		$(if $(BINMAN_VERBOSE),-v$(BINMAN_VERBOSE)) \
		build -u -d $(binman_dtb) -O . -m \
		--allow-missing --fake-ext-blobs \
		$(if $(BINMAN_ALLOW_MISSING),--ignore-missing) \
		-I . -I $(srctree) -I $(srctree)/board/$(BOARDDIR) \
		$(foreach f,$(of_list_dirs),-I $(f)) -a of-list=$(of_list) \
		$(foreach f,$(BINMAN_INDIRS),-I $(f)) \
		-a atf-bl31-path=${BL31} \
		-a tee-os-path=${TEE} \
		-a ti-dm-path=${TI_DM} \
		-a opensbi-path=${OPENSBI} \
		-a default-dt=$(default_dt) \
		-a scp-path=$(SCP) \

the following error occurs:

  BINMAN  .binman_stamp
usage: binman [-h] [-B BUILD_DIR] [-D] [-H] [--tooldir TOOLDIR] [--toolpath TOOLPATH] [-T THREADS] [--test-section-timeout] [-v VERBOSITY] [-V]
              {build,bintool-docs,entry-docs,ls,extract,replace,sign,test,tool} ...
binman: error: unrecognized arguments: -o ConnectTimeout=10
make[2]: *** [Makefile:1126: .binman_stamp] Error 2

The patch fixes the SCP setting passed to U-Boot to ensure that its
parameters are not included.

Fixes: 4bce3270d680 ("Config.in: timeout earlier when connecting to download servers")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/uboot/uboot.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a31010..6bbdc4151fac 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -176,7 +176,8 @@ UBOOT_MAKE_OPTS += \
 	ARCH=$(UBOOT_ARCH) \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
-	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
+	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS)) \
+	SCP=$(word 1, $(SCP))
 
 # Disable FDPIC if enabled by default in toolchain
 ifeq ($(BR2_BINFMT_FDPIC),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
