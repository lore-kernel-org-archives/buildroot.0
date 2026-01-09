Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D315D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F13A83F15;
	Tue, 13 Jan 2026 19:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAbqedRX0hl6; Tue, 13 Jan 2026 19:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06C2083EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333290;
	bh=5erTg7e7RMORVdhwmakyvC4sD7TPBjl8j9OCJ6YunoM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LT1K4aTYgDUCXsX5HZIAdAc6J7tLK4A4hVAtsJ++mefPeOhHpe1FjaVYsezaSABXC
	 E1Vk4/+8COv8bixT0Pg6quctb/Kj8O2l3WFtpAdxzK2h2exHLppgtwJIvKZXkrUiFI
	 yAoLLZ5C2UK+GxLLl5b8BQDsEG0JbLGbVM+2jB2WO1Sq1Sahr7RCNAhF2m5SF3etKw
	 ap8dvUHNbu6vCC1UapCxC++ourjTuk9lQpY77OPPAxZwij1IAxjUOIkCqgzaVeHK8W
	 rqK/mZPJ1ZrWp/I5WAK7JlyHnzDfKHfLbLW94qyJsZNcINxPTtwNGzJq6VVAdt+PaL
	 kk8O7ahaTyobg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C2083EF0;
	Tue, 13 Jan 2026 19:41:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57981231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 588FC406E7
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HJZio4suTxr for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DE79406F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DE79406F1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CB5F80840; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:22:17 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6f1f23e55c429dab0ed2c779bd0d4a68ab30e25e
X-Git-Newrev: 9f7467c84cd2385207de863f8ee50c8a31f95e3d
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.9CB5F80840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] boot/uboot: fix
 externally provided env file not used on 2025.10
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9f7467c84cd2385207de863f8ee50c8a31f95e3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

fb5235239aad ("env: Rename DEFAULT_ENV_FILE to
ENV_DEFAULT_ENV_TEXT_FILE") renamed the Kconfig symbols and thus we need
to adapt the U-Boot package in Buildroot to support it.

Fixes: 128c26f2875d ("boot/uboot: bump to version 2025.10")
Reported-by: Ozan Durgut <ozandurgut.2001@hotmail.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 088bec09fb4d24086004cad6259d43aebd511cd5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/uboot/uboot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7bd0937df2..8dad710bf3 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -409,8 +409,12 @@ UBOOT_KCONFIG_OPTS = $(UBOOT_MAKE_OPTS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTLDFLAGS=
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
