Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5ECFA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01F3A4088A;
	Fri,  2 Jan 2026 22:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeUtTogEZIQW; Fri,  2 Jan 2026 22:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36F3F40851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393591;
	bh=i8XGFlhQKTbYSK3K22FQMxaCXS0IzW288SjEdKzCu5g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MhzWE/Ysg8pThw7MNstu5gCHzkcxR0NfFOdldQc+lyxnFqA5iyINIS/t3b3U5BWwP
	 8lntH69/ls3fFc2lMx5/zbngWQ2eTDosGafD+eAf6SXiKPA23N6th9HFNhqapYPdnF
	 ppI6krzOUSh1W/1faq0aSV7LAsvczbyBXeCaBdsirOOXEk6nkzZ8IOp7OiyJO1ASx5
	 b4jCCUIYegtLJqXArrwcoxb8nullbWiBZ3k0DQm+xQhyVopIh9QLOwtCZ3Xk/ETRiw
	 B2f/c8glrIYPQTDAxghfq9IdlS8IHfWQQvFikwpp6HWpsYGcmXs1tqhPup+ZEXbhz/
	 ZULgRiewO+QcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F3F40851;
	Fri,  2 Jan 2026 22:39:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07181249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E214440545
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uo6RzFswc1KS for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D522040072
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D522040072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:39:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C47168805E; Fri,  2 Jan 2026 22:39:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 23:39:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df13b0f38f40ea5ee1ff297b24f76399e5138b40
X-Git-Newrev: 088bec09fb4d24086004cad6259d43aebd511cd5
X-Patchwork-Hint: ignore
Message-Id: <20260102223948.C47168805E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: fix externally provided env
 file not used on 2025.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=088bec09fb4d24086004cad6259d43aebd511cd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fb5235239aad ("env: Rename DEFAULT_ENV_FILE to
ENV_DEFAULT_ENV_TEXT_FILE") renamed the Kconfig symbols and thus we need
to adapt the U-Boot package in Buildroot to support it.

Fixes: 128c26f2875d ("boot/uboot: bump to version 2025.10")
Reported-by: Ozan Durgut <ozandurgut.2001@hotmail.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/uboot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index b5c04215a4..936b8fd266 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -414,8 +414,12 @@ UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=
 ifeq ($(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE_ENABLED),y)
 UBOOT_DEFAULT_ENV_FILE = $(call qstrip,$(BR2_TARGET_UBOOT_DEFAULT_ENV_FILE))
 define UBOOT_KCONFIG_DEFAULT_ENV_FILE
+	# Pre-2025.10
 	$(call KCONFIG_SET_OPT,CONFIG_USE_DEFAULT_ENV_FILE,y)
 	$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENV_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")
+	# 2025.10 and later
+	$(call KCONFIG_SET_OPT,CONFIG_ENV_USE_DEFAULT_ENV_TEXT_FILE,y)
+	$(call KCONFIG_SET_OPT,CONFIG_ENV_DEFAULT_ENV_TEXT_FILE,"$(shell readlink -f $(UBOOT_DEFAULT_ENV_FILE))")
 endef
 endif
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
