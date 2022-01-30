Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB5AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 22:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF91D83F99;
	Sun, 30 Jan 2022 22:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tg2Hvwg81Nwv; Sun, 30 Jan 2022 22:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4599683F96;
	Sun, 30 Jan 2022 22:23:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCD371BF4DA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1D5A4012B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 22:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DCI8VddKVB3c for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 22:23:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7D4540004
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 22:23:19 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id c188so14487183iof.6
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AhMaWJ0BKEtmGEVYYdwOW3H5/A4gUJADDeAic9YhZH8=;
 b=KrB2nPrv32+Y0RtyclrMLlovoHdsWOL23HTBOglV8nConbb0UfJ88wxu4t2zESbMkU
 dbJ88amHTsfi8tZLOGHrdTmqrCMjmlbaxYuKZ1kpjBqYd7cDr5X50ItDIU6eqh5hX2Qe
 Yd5en7r7/aeG+PR2V8z9uyqWUf26CTNhMnY8t6lG5SaUgA5r3w/cydhk4BUPFPdHUDfn
 v7FqJCm0qKNy+W1gIHjxlY+3VNtTYfNBMyRmNe3Nbt1N9BYpIzah6Pnab933kv3gHzkL
 D68a8JOP4lHqdqFvLR0NS4fSfccB9LGZYVWIwPxbmCkOMf3jtTnc2v9AA+1ZnIEbB1sw
 6n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AhMaWJ0BKEtmGEVYYdwOW3H5/A4gUJADDeAic9YhZH8=;
 b=p1f1k+0q/yISHzkGKj3gUnUFgCIiURjPgG1dn1rdTZy2QpiOxfLcT11zCnNFFgvz4R
 O0jeEEiaz/K/EgO4LRJCrSMKNKVjPgE5rsidmqNY1jDS9/eHQM2ktM4VFbbWr9bShm46
 XRpzljIbAYAN+ziBWx2C9x9bNN/S+DuZWZdpk5AN6S7ga5e54hwARKcIpVafOiWYRBVn
 rY6SPqS1/4chbxoCdKmqClXLR7MvJwD9caGo3YzrwV1pEt/GuCYLqJRyTN0I8lO0LbhL
 hXwbEXjdmRvbz4BipbWt5d9Y7zVGzDRRknUqWO7hZfconemY2IGCBR1wQJPmNJf59MtG
 Vw8A==
X-Gm-Message-State: AOAM532RELJZfgGxAN94Gk2oijvYTWTaM7zBlLpFlnjKLa62c2Hc0otY
 B/DAUIASuG/FiJdnlb+wiK0Pjw4Bs1k=
X-Google-Smtp-Source: ABdhPJypuW8l3QT0I8v7EufVd89ICsl/uIqgfFmfrADSD8NiHBAECyHyeJW1WhTm2+Xeoo5L9Sv5XQ==
X-Received: by 2002:a6b:7316:: with SMTP id e22mr9933895ioh.125.1643581398832; 
 Sun, 30 Jan 2022 14:23:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id r15sm17036896ilo.25.2022.01.30.14.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 14:23:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 15:23:17 -0700
Message-Id: <20220130222317.2830755-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/connman: bump to version 1.41
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/connman/connman.hash | 2 +-
 package/connman/connman.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/connman/connman.hash b/package/connman/connman.hash
index 797448337c..6fc5edf29a 100644
--- a/package/connman/connman.hash
+++ b/package/connman/connman.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/connman/sha256sums.asc
-sha256  1a57ae7ce234aa3a1744aac3be5c2121d98dce999440ef8ab9cc4edfd5edcb12  connman-1.40.tar.xz
+sha256  79fb40f4fdd5530c45aa8e592fb16ba23d3674f3a98cf10b89a6576f198de589  connman-1.41.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 8c66a69882..61851bd2dc 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONNMAN_VERSION = 1.40
+CONNMAN_VERSION = 1.41
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
 CONNMAN_DEPENDENCIES = libglib2 dbus
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
