Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93633C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BDA1414B6;
	Mon,  4 Mar 2024 15:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5rybInFxA0z; Mon,  4 Mar 2024 15:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C873414CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C873414CA;
	Mon,  4 Mar 2024 15:35:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68F8F1BF3B0
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 630EC80F73
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9o65wwWEUH49 for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:35:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BD8A80E43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD8A80E43
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BD8A80E43
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:35:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33d7b8f563eso3127013f8f.0
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566545; x=1710171345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K+VOzN6ldfSndLqWgFbKCQW0ZyhVme+wRahhuNzKCOE=;
 b=cD9kgvRwz2u0Lw/FsNLqa+XWrdlbP2HWZ/GnKrLDogrrUKmOJRamNYHhVogA6MhcsG
 66NHfge+qhNL/LSQtlcLSP5QlG3hZJRn7+o7YJNxEsczb+6kawMmPE9HnEpphIx8VbKx
 Onf1Dc/1Ce65NKLtZP1MWI3+guCc9/q9YDVYsH4nSRN9WrzrjcoR14V5GNcqlInWkSCi
 vqQL9CRN3RBEH+h6pXzawo1DH6LMR5dhVTVxpzR2I7SvyM0b79peeWlZ5NV+ZARGdkja
 KqsyW1S5M0dwlG6krlAtqmu3ihVStAT3Pkjp5j0yYPvwxmVYCP0wPCB5+Rq97/WylTNp
 tRgg==
X-Gm-Message-State: AOJu0Yz+tH9id+V+wWCwzK9qVFO/l5DXnYnpVIkd1pBRnoGMPx7isoBx
 RP5KH9sVRhOLSQQAA51N1S9Vxq5igJYDqElfLi/Qb7DTSQX3ZThi0d5pUOaA
X-Google-Smtp-Source: AGHT+IHc5gynfRwEGnkajKfIv4lWXX/9+8TxHw4BDKXBB5XlIne2Eo9Dvbd7Nqo5a8I1kqiR6wZ+SA==
X-Received: by 2002:a05:6000:1e85:b0:33e:a6d:fca5 with SMTP id
 dd5-20020a0560001e8500b0033e0a6dfca5mr6026502wrb.29.1709566544802; 
 Mon, 04 Mar 2024 07:35:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n3-20020adfe783000000b0033b79d385f6sm12366359wrm.47.2024.03.04.07.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:35:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:35:39 +0100
Message-ID: <20240304153539.3372042-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709566545; x=1710171345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K+VOzN6ldfSndLqWgFbKCQW0ZyhVme+wRahhuNzKCOE=;
 b=QJebxMKLTdr55GJgg9V1lS/dj/K7a4VZ8n86lNj/oJHOELP1nUX6d9WhQJUyW66Rpm
 ceQhhVTii0WFst/QXeF+JisM2tF2ISi9lxcATXCdlgtoJI1mJdgDaCJNYjuhExSIT+uf
 o/2Z5QRDEbKriseGy65FxvO32YYTiruqHSv28osDIh6NZUfuSTvxGnGtyysoqRNVrhkL
 NbmgU1w8IH6EWmQheNBsaM40IpoRI2BuJ7Mgw7zDeF7pUGqcEnsplxc78jBkPy0Re8tV
 14dEUFBsZ1Q9BXD80Pw/doAY6gDbZHdMrNDAmxy47EBOtukFETvX8uKU5KeCSXRQQHir
 sbkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QJebxMKL
Subject: [Buildroot] [PATCH v2,
 1/1] package/fluent-bit: fix build with BR2_TIME_BITS_64
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Do not remove _FILE_OFFSET_BITS=64 from CFLAGS to avoid the following
build failure with BR2_TIME_BITS_64 raised since commit
3c427c64726560ea1743282a3fdb78f5b28692eb:

In file included from /home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                 from /home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                 from /home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/stdio.h:27,
                 from /home/thomas/autobuild/instance-1/output-1/build/fluent-bit-2.1.7/tools/xxd-c/xxd-c.c:27:
/home/thomas/autobuild/instance-1/output-1/host/microblaze-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
   26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
      |     ^~~~~

Indeed, this LFS workaround was present since the addition of the
package in commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483 and is
only needed to fix a build failure with the old codesourcery-arm
toolchain from 2014 which uses glibc < 2.23. as glibc 2.23 was released
in February 2016: https://sourceware.org/glibc/wiki/Release/2.23, drop
this workaround as already done for libselinux in commit
c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
drop codesourcery-arm toolchain.

Fixes: 3c427c64726560ea1743282a3fdb78f5b28692eb
 - http://autobuild.buildroot.org/results/ff5c60cd038550453ce138fe2a9383af2f5d6f2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update commit message

 package/fluent-bit/fluent-bit.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index e51322aad6..00a8904c55 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -12,8 +12,6 @@ FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
 FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml openssl
 
-FLUENT_BIT_CFLAGS = $(TARGET_CFLAGS)
-
 FLUENT_BIT_CONF_OPTS += \
 	-DFLB_DEBUG=No \
 	-DFLB_RELEASE=Yes \
@@ -55,11 +53,6 @@ FLUENT_BIT_CONF_OPTS += \
 FLUENT_BIT_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR="/etc/"
 
-# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-# large file support.
-# https://bugzilla.redhat.com/show_bug.cgi?id=574992
-FLUENT_BIT_CFLAGS += -U_FILE_OFFSET_BITS
-
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 FLUENT_BIT_DEPENDENCIES += libexecinfo
 FLUENT_BIT_LDFLAGS += -lexecinfo
@@ -76,8 +69,7 @@ FLUENT_BIT_LDFLAGS += -latomic
 endif
 
 FLUENT_BIT_CONF_OPTS += \
-	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)" \
-	-DCMAKE_C_FLAGS="$(FLUENT_BIT_CFLAGS)"
+	-DCMAKE_EXE_LINKER_FLAGS="$(FLUENT_BIT_LDFLAGS)"
 
 define FLUENT_BIT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
