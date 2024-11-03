Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE95E6781B
	for <buildroot@archiver.kernel.org>; Sun,  3 Nov 2024 10:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1A9060C18;
	Sun,  3 Nov 2024 10:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zXwXE9QEtMk; Sun,  3 Nov 2024 10:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5453607F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5453607F7;
	Sun,  3 Nov 2024 10:11:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59B361128
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 10:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46CAE40420
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 10:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9ggMn1VecbK for <buildroot@buildroot.org>;
 Sun,  3 Nov 2024 10:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9EA874018B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EA874018B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EA874018B
 for <buildroot@buildroot.org>; Sun,  3 Nov 2024 10:11:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0255.dip0.t-ipconnect.de [91.58.2.85])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF6CFA4C0F5E;
 Sun,  3 Nov 2024 11:11:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50844)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t7Xa9-000000000pg-0ZwV;
 Sun, 03 Nov 2024 10:11:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Date: Sun,  3 Nov 2024 11:11:41 +0100
Message-Id: <20241103101141.964221-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730628701;
 bh=7E4glQiPEzOn9GQ25O6WavNMNdg47ANO7rAwtb4HFEo=;
 h=From:To:Cc:Subject:Date:From;
 b=I6DVfyLh2C3nkiLTePLWB1Eg7S/OTzd2WYqwf/ttMamJD7JX8otkhPMtx1MQG+LYV
 EDG+amk7Qtwbl0FmYSy+uTYx7GN5c72Cl4chqYOcDZE9LzlFLHDa/jq0/22cHVkRwq
 3Zp+Koz9TAM9Lar4qSWsDJVcL46S6R5AOT/huj4HsIfaCih1rmIZtnKxJW3olfAnFg
 TdHzn5J9UdFpND0nOER3pNLm4iJQBFcJfD4v67wrFsiZjEiTffM0pYxi3IwfPr4uT7
 uJqS1KjtwfMYaCV3l3j+TZYghQ74l3oNTlG56GSrfVCYwv1OmhsbWNJISf84bPk2b+
 4TUFWUPvLKAEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=I6DVfyLh
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix build on riscv32
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

Ported patch from OpenEmbedded:
https://github.com/openembedded/openembedded-core/commit/010b068bcc126dbbc1e2032997e8d83360a7de35

"ffmpeg 6.0 has added assembly routines which uses rv64i ISA
unconditionally, ideally it should check for ISA before using those
instructions."

Fixes:
https://autobuild.buildroot.org/results/8a7082a0f24ebcf264aeac5e0fea704dc6a6bb1c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ffmpeg/ffmpeg.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a010c0168c..1e18b5e2da 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -529,6 +529,11 @@ else
 FFMPEG_CONF_OPTS += --disable-altivec
 endif
 
+# Fix build failure on several missing assembly instructions
+ifeq ($(BR2_RISCV_32),y)
+FFMPEG_CONF_OPTS += --disable-rvv --disable-asm
+endif
+
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 FFMPEG_CONF_OPTS += --extra-libs=-latomic
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
