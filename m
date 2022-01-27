Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61313C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 13:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11977610C4;
	Thu, 27 Jan 2022 13:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3x3vMpn2B1g; Thu, 27 Jan 2022 13:54:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EEA560EF1;
	Thu, 27 Jan 2022 13:54:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93F271BF29A
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 13:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8268341649
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 13:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=kalray.eu header.b="AwXst4kD";
 dkim=pass (1024-bit key) header.d=kalray.eu header.b="BGEFiaHa"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CT0YD2xZz4f8 for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 13:54:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fx403.security-mail.net (smtpout140.security-mail.net
 [85.31.212.143])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B515240347
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 13:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id CDE2D866EA0
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 14:54:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1643291679;
 bh=Zp0aWpBWUSwOi3WMT0v9CM5lwU2VH/BYfRwVniylO84=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AwXst4kDhBw6wJYdtDL/hRL/PewgR1csdy0RueTMENnFBK9hxxFwR90RsPTuLNrur
 VAH/S0SxOhCkXUYM7L54e33GA/yAqcPyxs9dl93KeMM4O/qsAQ7xF2LcwxNbFJjkNI
 XxxGg1sh6wFrVOb8mTdbzBfUCiPYHryTTRkApv0Y=
Received: from fx403 (localhost [127.0.0.1])
 by fx403.security-mail.net (Postfix) with ESMTP id 322DD866E75
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 14:54:39 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <bc7f.61f2a41e.c66bb.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx403.security-mail.net (Postfix) with ESMTPS id C7156866E5D
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 14:54:38 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id AC9EE27E03FF;
 Thu, 27 Jan 2022 14:54:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 9693727E03FE;
 Thu, 27 Jan 2022 14:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 9693727E03FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1643291678;
 bh=A/fP6t42sbQEnKy8nyqrR5NKSM3oIE7Xpm78s4XdvHY=;
 h=From:To:Date:Message-Id;
 b=BGEFiaHaENt1GPkFmKk2sAkvEFIgtP7kDgQJWerGoL076Az7gGC1Vkv4PyJgh57jT
 1vuP+Yuyy29AonFn3HIT7AITQ6pxQVkUxRDvlukOZy7pG6TElI8V47mGXga5J6HJLi
 hkBtBsVqxHeYsgAuENM7fx43qGKboMZPa/31+vkc=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SmhJDPs9sfsO; Thu, 27 Jan 2022 14:54:38 +0100 (CET)
Received: from ws2021071901.lin.mbt.kalray.eu (unknown [192.168.37.66])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 86EAD27E03ED;
 Thu, 27 Jan 2022 14:54:38 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 14:53:39 +0100
Message-Id: <20220127135339.25430-2-jborne@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220127135339.25430-1-jborne@kalray.eu>
References: <20220127135339.25430-1-jborne@kalray.eu>
X-Virus-Scanned: by Secumail
Subject: [Buildroot] [PATCH 1/1] package/binutils: remove libiberty from
 target install
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
From: Jonathan Borne via buildroot <buildroot@buildroot.org>
Reply-To: Jonathan Borne <jborne@kalray.eu>
Cc: ysionneau@kalray.eu, jmaselbas@kalray.eu, Jonathan Borne <jborne@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In BINUTILS_INSTALL_TARGET_CMDS, libiberty is installed
to STAGING_DIR

This is not necessary since libiberty is already
unconditionally installed to staging in
BINUTILS_INSTALL_STAGING_CMDS. Furthermore the presence
of STAGING_DIR path in TARGET_CMDS is confusing.

Moreover libiberty is static only. Static libraries
are only used at build time, not at run time so
we do not want to install libiberty on target.

This commit removes the unnecessary libiberty
install in TARGET_CMDS and add a comment to clarify
why we do not see libiberty installed on target.

Signed-off-by: Jonathan Borne <jborne@kalray.eu>
---
 package/binutils/binutils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 13f61be035..32ca70d325 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -95,6 +95,8 @@ BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
 
 # We just want libbfd, libiberty and libopcodes,
 # not the full-blown binutils in staging
+# Static-only libraries such as libiberty are used at buildtime in staging
+# but are not installed to target.
 define BINUTILS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
@@ -106,7 +108,6 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
 endef
 endif
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
