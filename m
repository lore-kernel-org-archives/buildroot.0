Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A4DC43458
	for <buildroot@archiver.kernel.org>; Tue, 30 Jun 2026 03:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAEE581311;
	Tue, 30 Jun 2026 03:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTMmwF0kIu7i; Tue, 30 Jun 2026 03:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBE958131B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782788716;
	bh=u7ljRDPZF0mJw+EM8zfwvzspWXOpm8d9kc5eomfipZ4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=gQkIM7XZuxtAG6VS1RwX7rBuzl2b4SRWC5yi5RGrWtCP0TuqZ5G+siXyJ9oUYKFki
	 vjzlBSLcF8OAI+j0LSP0yMnnzGiuvKBstxw3PWg5DbCPKbGxeWqqn+ODeluiapuDv8
	 lJJxWWDhN0kNApn8jQ5bbr54EtMcPbnMHFAg5lA7aHTLqz9TVWlEQd6AO2oBZ+x9Bs
	 vGk0zag/QqO+F38tGOQpsAKJyvrkTq+Xjd0rm+6VPJf2EOUZYTjXNfyHWwM9+oIE/T
	 EOnjuDRPjA8q3k17wQSEHJse+hz/aL07JSp2JezXNTTUhDtbV5BOk3pJ75wK/cQ0CZ
	 kzDPZFYCqSEyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBE958131B;
	Tue, 30 Jun 2026 03:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F19F4149
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6EDB60891
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfzpucFgnGpB for <buildroot@buildroot.org>;
 Tue, 30 Jun 2026 03:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=jms@tenstorrent.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 950AD605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 950AD605CA
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 950AD605CA
 for <buildroot@buildroot.org>; Tue, 30 Jun 2026 03:05:07 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-847a483e344so108554b3a.0
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782788707; x=1783393507;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMEEIqVy9gtA+rfOd73nXPIDEMbjqskA3LJ/Ev3lraM=;
 b=QKiuuJpXZDbdduHo6n9CgE+xbuD3MiF2Cvs9BFAQCrDhcb3ngUU9wdok/5hB3Tsd1Z
 CIGluaybgJ3GLPntU/vODTOqZkjhC/2L4Nofpyve0dv2TSYFOurXFvzkoBJwvaf1Uofb
 nTE+us1rJCyzMB9mbw/vcaNPQQYq4iQNA7Cz72HxN7mx2LJc7VP+wDc2xD23d9nS3Ed0
 FhTc6tbwOygn3AvQ8bRJ2LqWq4Qc2MHDRgHFeQIBUQxvdQIgxzbQCFX0uoXmC2nesE2D
 DFXisckEiHNSAOPLeG04QKZFFPGZMU8/8Rf2TwsIbFdnXZrlFLWYB3kkiRjkyRkBLeXJ
 tSXA==
X-Gm-Message-State: AOJu0YxYn82vEF3a6rqpgPyc+A4EE9rEiiyI0O2HhFifPzTaF5ExnDcp
 2IfJpr3ypyMJjr14Cz0MnoXqDeYEGUXCM/c2ibiEPuWsH0JwiE6JfVdBCdPXQc68oyl/yfzUdMk
 CQiVHRII=
X-Gm-Gg: AfdE7clQEl+0lLOWT+PW8khY70B6k0sfUii/zIauJiKDi8tc4djUJNbKnzS0ceJS6UD
 7SvadFH2QqJDFu1qerQ2air5negIJ4CttdqU00wrU21cmomVuYpwnu1l5Qg34aHi9ZUDvg+uXh7
 Um/kKlpxvwafIhLs0LMhwyP95vStvKYU36TsCHxOvluxmJCSnegIhUipeHb9b4NH6ULzmhrXfJY
 K6GZm+GwOvHwQFg5bXkmLw2c3q14FgROwU7UuBx6Wf79tb4/cuG89+i1LnrT5VMydp8wDdhQjbf
 93UG4kyawHfsoJHY/2PccfC8LqQUTpVgt/678NFjb84ryqp/3FEJQcLHpVnhEnBxni9PHuXgonU
 kIRTItinGrLAhn50sl2Hl4y5Bj5p2Q8N0bB0H2rtNFV1+O3f94zjwhlLu8Cp5Vf6htRKnZBoeuJ
 /P3spKbj2qExm5XqxdyPKaezYwf6zzeSbyuQyEjkK6J7ED
X-Received: by 2002:a05:6a00:8c8:b0:847:9570:d408 with SMTP id
 d2e1a72fcca58-847a81827a0mr52323b3a.2.1782788707136; 
 Mon, 29 Jun 2026 20:05:07 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8479ff89f93sm823368b3a.4.2026.06.29.20.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 20:05:06 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>
Date: Tue, 30 Jun 2026 12:34:41 +0930
Message-ID: <20260630030441.1520601-1-jms@oss.tenstorrent.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1782788707; x=1783393507; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yMEEIqVy9gtA+rfOd73nXPIDEMbjqskA3LJ/Ev3lraM=;
 b=BXAGAPs5GFxVI879+po63Ltrp/gTlkDK1wesfg647Y+Psw23PXuXL11Cs88gtgvZVd
 uizpGIaFMaiQJQIv9KOLNOl4TUHOtdpgRmlEVUYnoXxROfc6FwbpAYJBU/QHCyxh9Wyx
 vd0aXvEIC68U7ObjNBeyzMMUMbtBvuhEjSrQbZQD/tK5ZrjGP3aYk+ZemqeMsqL8CKsq
 147s9P8mFMKRtAjII1Y4Q2wyz+tcSdjNLHc4ozbqrvrftTo/fTX12Du0c9m5Zl/ozOlg
 sCnIF0/GSFJjIfqWpVAQP3M0RKnJxFz/YgIwzew5AzmUHcU/dl3GAqVc5kCElnNYzwFb
 2uTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.tenstorrent.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com
 header.a=rsa-sha256 header.s=google header.b=BXAGAPs5
Subject: [Buildroot] [PATCH] boot/opensbi: Bump to v1.8.1
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
From: Joel Stanley via buildroot <buildroot@buildroot.org>
Reply-To: Joel Stanley <jms@oss.tenstorrent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v1.8 release notes:

  https://github.com/riscv-software-src/opensbi/releases/tag/v1.8
  https://github.com/riscv-software-src/opensbi/releases/tag/v1.8.1

Signed-off-by: Joel Stanley <jms@oss.tenstorrent.com>
---
 boot/opensbi/Config.in    | 4 ++--
 boot/opensbi/opensbi.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 986e380b48dd..6e26da63449e 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -19,7 +19,7 @@ choice
 	  Select the specific OpenSBI version you want to use
 
 config BR2_TARGET_OPENSBI_LATEST_VERSION
-	bool "1.7"
+	bool "Latest version (1.8.1)"
 
 config BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	bool "Custom version"
@@ -57,7 +57,7 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "1.7" if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.8.1" if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
 	default "custom" if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index c82d2de236e7..661f08189ea2 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2cf856a4e5e2e052948ddb54ba48232b1f698b7f52e0374fc7d17d51e8c8f7ce  opensbi-1.7.tar.gz
+sha256  fb1ae61a85e966322101acb1c982f84d9eaafc4de7dd474a7d7546d9bb321c6f  opensbi-1.8.1.tar.gz
 sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
