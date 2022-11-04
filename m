Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02913C4332F
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 23:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 950C140CDB;
	Fri,  4 Nov 2022 23:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 950C140CDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IBvCdvvYV8i; Fri,  4 Nov 2022 23:58:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B254540101;
	Fri,  4 Nov 2022 23:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B254540101
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74B411BF31A
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 23:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D6E040101
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 23:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D6E040101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EXvhVTCEg9H for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 23:57:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 840EE400CE
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 840EE400CE
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 23:57:36 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id s206so6774019oie.3
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 16:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r6yKOSAXXhMUNY6vGZw2Izzgxzx+a64r/p/uFWF3vXo=;
 b=2V7fU4T4ZnLKtE6yw4Y3Yy6dcj5PWARum4Ca1TORoc+J/+gGqLVDE12duS/+Ilz2sb
 U7SMTn1WJCobSc1d+8hQFDLNhIndPgVgmCe3jdbX5n3p2dnlduAlpJ8R+9i4H52o5Rw2
 e4N85+lNGOlY0Rhe1WOjH3aqmzUniFr4ZooHCzkkarDV3LbRZCqHhhSZOFHlWIPntjGj
 TE1ChgrbUXDwZmICT3B78dxc1TL8377yS7Cpw+dr83S5L1o9x9wbU0deS414RERJq8z+
 U7FdPVMKZR3Tvmf1HnY1T0IPqNgZCZQCi47eJT1mijv4h8Yc4LSnermXvVatGH/oN1GL
 ndXw==
X-Gm-Message-State: ACrzQf2Mw1aSh636xwuoYgpS/lWcJc7OVEvSFJGN0IFWPa4DwfGjWJGY
 QgsGH2sLAsDOItfdKfov5oiiff+sPb4=
X-Google-Smtp-Source: AMsMyM49K8+6OqVKbaItf9lTpCqPDTgvkYkgzjaO/1oJk7ylCRXo+jDtTsU5QfA8lUlVDu2YYaAZ+A==
X-Received: by 2002:a05:6808:140d:b0:35a:697d:73f with SMTP id
 w13-20020a056808140d00b0035a697d073fmr1544040oiv.82.1667606255507; 
 Fri, 04 Nov 2022 16:57:35 -0700 (PDT)
Received: from casantos.remote.csb (177.204.173.152.dynamic.adsl.gvt.net.br.
 [177.204.173.152]) by smtp.gmail.com with ESMTPSA id
 k131-20020aca3d89000000b003549db40f38sm165638oia.46.2022.11.04.16.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 16:57:35 -0700 (PDT)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 20:57:26 -0300
Message-Id: <20221104235727.587650-3-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221104235727.587650-1-unixmania@gmail.com>
References: <20221104235727.587650-1-unixmania@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r6yKOSAXXhMUNY6vGZw2Izzgxzx+a64r/p/uFWF3vXo=;
 b=k5EqX/C80Ed+KOJWDyxtl6HEfe+YAwkezRkSqPxN6eCuhJgsh1YSgLUQZA0LVh5obU
 2bTiOVCFInjEHKT3IfgWB/9DqqJ4+jaaITBN5WjYDZcQdB6EOwQyqoQmwlwk+uvnoWaF
 Cb9x+FxMdQP9Q7izorH5LEhgXI16O+N7tiwzyMisOBOwvh4CsWLz/l727VNTqjiv3uqA
 382cP/veRasyQuMjfyOU0XZoas/2vjKd+jDaWl2aWFnKLvakB5EfZxFyi8ESMIZHhSNu
 RP2FTjHtwsveQAOj4xaS5w//2iQUUJcZpohNWQEUnKc8hUV8OScOD+yGa5jJwhjzefsE
 ppzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k5EqX/C8
Subject: [Buildroot] [PATCH 2/3] package/qemu: select FDT for custom targets
 too
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

Custom targets selects system and Linux user-land emulation, which in
their turn require FDT. Move the BR2_PACKAGE_QEMU_FDT selection to the
BR2_PACKAGE_QEMU_HAS_EMULS hidden boolean, to cover all cases.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/qemu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index 8b8a999885..9e0cbd4acf 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -95,7 +95,6 @@ comment "... or you can select emulator families to enable, below:"
 config BR2_PACKAGE_QEMU_SYSTEM
 	bool "Enable all systems emulation"
 	depends on !BR2_STATIC_LIBS # dtc
-	select BR2_PACKAGE_QEMU_FDT
 	help
 	  Say 'y' to build all system emulators/virtualisers that QEMU
 	  supports.
@@ -121,6 +120,7 @@ endif # BR2_PACKAGE_QEMU_CUSTOM_TARGETS == ""
 config BR2_PACKAGE_QEMU_HAS_EMULS
 	def_bool y
 	depends on BR2_PACKAGE_QEMU_SYSTEM || BR2_PACKAGE_QEMU_LINUX_USER || BR2_PACKAGE_QEMU_CUSTOM_TARGETS != ""
+	select BR2_PACKAGE_QEMU_FDT
 
 if BR2_PACKAGE_QEMU_HAS_EMULS
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
