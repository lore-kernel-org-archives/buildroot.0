Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC5DC7EE30
	for <buildroot@archiver.kernel.org>; Mon, 30 Jun 2025 02:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B260846A4;
	Mon, 30 Jun 2025 02:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 91q1oXY7cg9e; Mon, 30 Jun 2025 02:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 463AB843CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463AB843CB;
	Mon, 30 Jun 2025 02:38:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 630261C9
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 02:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 492084100D
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 02:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8fbTjtjHqBQ for <buildroot@buildroot.org>;
 Mon, 30 Jun 2025 02:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::161; helo=mail-il1-x161.google.com;
 envelope-from=git@jdknight.me; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 24DEB41006
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24DEB41006
Received: from mail-il1-x161.google.com (mail-il1-x161.google.com
 [IPv6:2607:f8b0:4864:20::161])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24DEB41006
 for <buildroot@buildroot.org>; Mon, 30 Jun 2025 02:38:43 +0000 (UTC)
Received: by mail-il1-x161.google.com with SMTP id
 e9e14a558f8ab-3ddd2710d14so18484635ab.2
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 19:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751251123; x=1751855923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CKxOlooSuQfht1MmwXaHfXy8qfIgRp2TYy8YvaqvNv4=;
 b=aXAqx2nYJ4iK/VJq1iU1lwaKAUSSaZG6DsKMBna/+5/Bx3OBD/hNzmJHQmR0LpLBbu
 LLKR0FIkiW8NTqDLyw6vjdyaTe9wrXlKSlbobJ0uxD7Fh/qafkfFFE20DykFgMPNB1G7
 BM/oulRjPkt94yuiOhbG1xtRlOsceUhRaUl/QojL2+TjyvER9LPwMMDY/XieQU4+AfWu
 2JUq/0pMV8wq01voCVog5aX/l3sX/gFZzIUGHhcVE8C2CGg/PB0cnM3geQ59t9IvdhsN
 9n8HMGPE7nwB1DUIY/l78En8qLqjp9Ox61GMSm5/eAsbbN3RAqIuLwKtiDoLIegKgJHx
 FDdg==
X-Gm-Message-State: AOJu0Yx9dpWKmGjE2OlkVPCNiUqIBv7ziVwhXbGOrNYxNBZbHKTjgmpz
 B5HjMmyC0kjHU0B0nvOW94d9zXqRpZ+w2dY16BxqpwOKmzO+8rWrxZd6bsZxlTkorC05ToA59mG
 959/lMjov5YY1Duy87BC2bRKty98L7YwxA7wPwG4YHROZd9Q=
X-Gm-Gg: ASbGnctBUvkT1UxcYh9p2ftUHvfLNP1vQ6vCk1/jQIEFTru1bSpzBDR/j+GEIzJzHvp
 UnLTQArgIPYD5xhVAL2lG8oQ6nUFSYiQPH3op2C+cz+8EPWzPu0yKYjloyLnxfaJdAEu6p89h5p
 lzVeFGuzsEIdiX8EWJsEPTLIYW1VEKKkwnhHSfLk34F6zc2C9HJHkKuT/SpbrmlFbSbWTY7ktxa
 nNrho3Y+88iyNHDlgZ9rYSK+1npRXwnhUQqqV9K+hK+EzhVWjHDwO5rqAK2JZWbRaMWsyYrAc9t
 PsehiK5CZCmY/Cg5/H+yB+DKVn1/HizXJ35EehsCktGZNZzsYkb6vbSGL+Ni2ufy4JUNdjqQ7BA
 BRHQNrkcv2THiagprlZ0hzgim0dQBWsY=
X-Google-Smtp-Source: AGHT+IHz90zaJbm17+kYTeY3Ll5dq608GKhmBQgymdKVwW6AKAk/AyksavWDumje5lunIrGVpi0Bmh1RVuq6
X-Received: by 2002:a05:6e02:3090:b0:3dc:88ca:5ebd with SMTP id
 e9e14a558f8ab-3df4abb854dmr140247125ab.20.1751251123067; 
 Sun, 29 Jun 2025 19:38:43 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-jkvlon0513w-grc-49-184-144-89-37.dsl.bell.ca. [184.144.89.37])
 by smtp-relay.gmail.com with ESMTPS id
 8926c6da1cb9f-50204a3fe9fsm265173173.46.2025.06.29.19.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 19:38:43 -0700 (PDT)
X-Relaying-Domain: jdknight.me
From: James Knight <git@jdknight.me>
To: buildroot@buildroot.org
Cc: James Knight <git@jdknight.me>
Date: Sun, 29 Jun 2025 22:38:26 -0400
Message-ID: <20250630023826.1163-1-git@jdknight.me>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jdknight-me.20230601.gappssmtp.com; s=20230601; t=1751251123; x=1751855923;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CKxOlooSuQfht1MmwXaHfXy8qfIgRp2TYy8YvaqvNv4=;
 b=MzqFPL8XYgoRd0V0HdROe6iZBzCzYAUnv5oF2EXWntg0xarSk+l4AdmWZfSpiScM+7
 AsiKqo0FE1B9Yi3Mxi3cyK1Lsega5guWl7YVQuHgIRMVKguTLb4WBZAl1XsPDjOCF0U9
 75yj7BtKiLMEkIknkSBFGopzv5bSmRUt0Niyhd09spnJ9MUjZEQwpD8sFmBKHrdrVahq
 dVq1MQEm/ccjgDBNBeSdLQQy5u5ihAQCsNEftg54uZrdwT3wfCzT9bCxJfLNaJaDBeVX
 4I9NhvfqcL0EiqZ131Q74C0JrwkG1eNYtSpRRdQZv5/zcrzZh0DaEGpY6aUGmGjJwmF3
 q3xA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jdknight.me
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jdknight-me.20230601.gappssmtp.com
 header.i=@jdknight-me.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=MzqFPL8X
Subject: [Buildroot] [PATCH 1/1] Makefile: ignore configs/ prefix on
 configuration events
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

Allows accepting board configuration events that are prefixed with a
`configs/` path. This provides a convenience for users where it can be
slightly easier/quicker to utilize shell completion to prepare a build.
For example:

    make configs/qemu_sparc64_sun4u_defconfig

Would be equivalent to:

    make qemu_sparc64_sun4u_defconfig

Signed-off-by: James Knight <git@jdknight.me>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c581067320..46b246245b 100644
--- a/Makefile
+++ b/Makefile
@@ -1026,7 +1026,7 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 		$(firstword \
 			$(foreach d, \
 				$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)), \
-				$(wildcard $(d)/configs/$@) \
+				$(wildcard $(d)/configs/$(@:configs/%=%)) \
 			) \
 		), \
 		$(error "Can't find $@") \
-- 
2.49.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
