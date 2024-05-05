Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E7DC25B4F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 08:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCDB340678;
	Sun,  5 May 2024 08:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_KVdBoRDViv; Sun,  5 May 2024 08:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F56A40680
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F56A40680;
	Sun,  5 May 2024 08:48:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2161BF82F
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 08:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2405B404B5
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 08:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9yPn5-6n7Zl for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 08:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA68040173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA68040173
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA68040173
 for <buildroot@buildroot.org>; Sun,  5 May 2024 08:48:11 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2df9af57b5eso12616841fa.2
 for <buildroot@buildroot.org>; Sun, 05 May 2024 01:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714898889; x=1715503689;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PeTN55xIXpFky25vAM2OEBCp632PDHeX8ki4Q9VBsyU=;
 b=N5WNtZQTYCMAbDgCR01u0jneFzsHWTl08xN4OgyoMitOJeBodUMG6xKWB1JS1j1nIh
 gDaD2XmyVMpX7bDihXcS8AefIhw7HgXBqmK/NDnG+fwnPyNRfQO+jF7/a8Rjkgsh4AiC
 wcPe6aosnnKIASBu/Z/hdHqon2RwF5ZkgwYEAOSJJ3ADiVrK2KKqNEfqmhdHXKsLNon9
 LHT7mzBldY+k6vWgmcPjYQ+zmo2PiSmA6yvaxlNd8r+NLW2chuCpONBHLQUmisyvwawm
 yebt1fHT7lrVYGnZ3cYiDgF8vEnzdZnhWblT5tA1fx7Mb5yXPMRnjjwilM3U3YOda73+
 S3BQ==
X-Gm-Message-State: AOJu0YxPYCYTFKgZLOTF7X11ccDM62o9ZzEfZVXdtS/qekPa6WDIj8HY
 M55EyQmDDjIQKvcD05S3yiO9eAjHK6bdPIbvn5O1eZH9vXZTOIzW/9o/xg==
X-Google-Smtp-Source: AGHT+IFo2Xrzr6ijA72VbHpCOBuhQXC7thzHnr3yq8OcoNcYSkkJ5yjbR6bmRD6Ng7F9BAniaYgfYg==
X-Received: by 2002:a05:651c:49b:b0:2df:1746:a338 with SMTP id
 s27-20020a05651c049b00b002df1746a338mr5852286ljc.11.1714898888883; 
 Sun, 05 May 2024 01:48:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c384700b0041b6f63f42esm11695692wmr.48.2024.05.05.01.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 01:48:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 May 2024 10:47:53 +0200
Message-ID: <20240505084753.38281-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714898889; x=1715503689; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PeTN55xIXpFky25vAM2OEBCp632PDHeX8ki4Q9VBsyU=;
 b=K7Kv06w1UcyPlwYRKLjVW3NQ3gHF5NlGzgvZqp3IPwBqO+ST6zkafEpIOfSkpRQgUA
 B/GX7xXYxEFVBS33UkY6UugckBDJInJZHtPEhsoQhZoUZv1u4gdS9e7htMiCdi6URCU5
 ltDvU+Muc7yFjFX/bc9PvdTd32qsGr2dkMv0uJcO5AZJgMYgSeAbojREt8K8P9lrXF91
 qInUjY5ttWtuKzM4NbhWek1WfQt96KUQcLu4U1tEMAF7FDER57+cs/OonqM729a6yOMe
 cHYd6ci8GXw3W0j6AARX8J/p3Ud6OYMLnHjSYUNuHJUuKpl9W8RWgUrda2brsfMc+Oxx
 kcIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=K7Kv06w1
Subject: [Buildroot] [PATCH 1/1] package/highway: fix build with powerpc7
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VSX support added by
https://github.com/google/highway/commit/d1768d160bf031f869b18ab456501f2b1b4951da
only supports powerpc8 and above resulting in the following build
failure with powerpc7 since bump to version 1.0.7 in commit
0db3c08daf335571a2b2d18a16d8980ddf4567ab:

In file included from /home/buildroot/instance-0/output-1/build/highway-1.1.0/hwy/highway.h:430,
                 from /home/buildroot/instance-0/output-1/build/highway-1.1.0/hwy/per_target.cc:28,
                 from /home/buildroot/instance-0/output-1/build/highway-1.1.0/hwy/foreach_target.h:244,
                 from /home/buildroot/instance-0/output-1/build/highway-1.1.0/hwy/per_target.cc:27:
/home/buildroot/instance-0/output-1/build/highway-1.1.0/hwy/ops/ppc_vsx-inl.h: In function 'hwy::N_PPC8::Vec128<unsigned char> hwy::N_PPC8::AESRound(hwy::N_PPC8::Vec128<unsigned char>, hwy::N_PPC8::Vec128<unsigned char>)':
/home/buildroot/instance-0/output-1/build/highway-1.1.0/hwy/ops/ppc_vsx-inl.h:4651:41: error: 'vec_cipher_be' was not declared in this scope
 4651 |   return BitCast(du8, detail::CipherVec{vec_cipher_be(
      |                                         ^~~~~~~~~~~~~

Fixes: 0db3c08daf335571a2b2d18a16d8980ddf4567ab
 - http://autobuild.buildroot.org/results/98224f8972f3f84304f81c266d33e118f0e2c900

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/highway/highway.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/highway/highway.mk b/package/highway/highway.mk
index 3eb0d7a4aa..d1ddcc6221 100644
--- a/package/highway/highway.mk
+++ b/package/highway/highway.mk
@@ -45,6 +45,10 @@ ifeq ($(BR2_RISCV_32),y)
 HIGHWAY_CONF_OPTS += -DHWY_CMAKE_RVV=OFF
 endif
 
+ifeq ($(BR2_powerpc_power7),y)
+HIGHWAY_CXXFLAGS += -DHWY_DISABLE_PPC8_CRYPTO
+endif
+
 # Workaround for gcc bug 104028 on m68k.
 # See: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104028
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_104028),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
