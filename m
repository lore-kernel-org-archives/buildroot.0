Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49399CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14571812F6;
	Sat,  3 Oct 2026 16:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AXGTV85ERoT; Sat,  3 Oct 2026 16:31:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1E0D8812FE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791045064;
	b=Ney9daDD9ivw9tR/5EUy/tjNoFWXGSO7lKQne9ja8L9KECLTgCxLEoHbmKhmkRYsao1L
	 VT/gYdwMsqXuxAoIooZJvm69SQ4v+lLkiIB04dcyQXCZP0CqdwcL6qwasZauatBeoK6cI
	 DC84Pll2pHAOv/ooj1hFumdAcFv5s3kGeLg5t4D5f95Rqit72ilMeTpDTtwBRypbIOWch
	 mKwFf16cQBiIgAIdU4EyVBwFeKpr/cyf3fbjTJjY0kE6b62DOL/ZUjxvT6NuGoP/fu/Np
	 QOUNj5oPH+oGYFDK8UUP8icYwfvPDIf1jlMgCklSxsrmqrfnWok70RhEOm+UXhVUAIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791045064;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d93rURALIgDILH/qyhCH5IlbPhWoN2fgbd1w58f/ngw=;
	b=cn5eridDYcwXBdIC62IGRavmpzSlPnr5QRiMCpz0tM3HJIFHAnvtObs9N7hwA9eciso7
	 +zaecSLbQTkgnfWrf4JSIAodMojaGLLZGGT4LGBBXkvUTud1WX6bW5yhXUlHr0efsFPVU
	 bCQPhLCv8i5HD0EaALKSKV9tX/4yOs2MJ55iqT+8A2p7Q73XZMjZAnd/lfeCpkOfo+oVS
	 H/07n5NXAaCTpEzkrcBlowLmoYgTn78Q8jjn90913gCxu22eXuC+AWzfK47ygad0Ay0h0
	 SeUt9/cNDIgEfIhTgOGxafQG01Fzv+tcLtj1PUzm3a0VxPbhFN4CJAiYmLGXAFDTq3w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791045064;
	bh=d93rURALIgDILH/qyhCH5IlbPhWoN2fgbd1w58f/ngw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Chw7stDNrLAtTsRWx6lvT6ZW7kWs3ykm5nn6sDal2v4B8KZdOwnuY6hMvYD+mnYRq
	 2Ox9YX5O0Veuzibb0i3BaT+yMLZZCkKfKIwTT6urmlU2U0O5wTDfwnnXOBbGt5zxtx
	 hcN22DThE8KlJoP8usVLevuSDkJKWDkfPNgvU5neF4fbDjnO/Dobz/JsmlEbocCqo3
	 fxQVaTFJH1tUNUzDwAQlTiGk6NPaHQS24sBgZ/IS2FGy9uCMm8GUDEtqaBesCwho4w
	 4Sx3css3XisxyJRcpJrL0UskvVA+/+ezuNh8NQlIjOz2BemPefsrTgfu/B8keQv3ho
	 1Sk8qHiBQ2/lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E0D8812FE;
	Sat,  3 Oct 2026 16:31:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C696D335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B869E40048
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeEgeNsGkdXq for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:31:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 07FDC40024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791045061;
 b=bPsVbigokYM/Xn4l76fZec7OYWPGIctkRKtFTxYIownh2j4G+ov6kFGIRc0lQpQFANL3
 8ePLcv+GzxWXtfXSrer/dWcnYeP7uFPsEuMzZUqV3h0yJXfcnYvdQwAGBD07ErL7YkF+y
 /3a+6jzyGAVSz9LzRs19NzAEsBTdchJ/xBhaUdktCutJ8rJfzPrPDaTjxX1ljCgk9Oy9i
 1EJAIlzY3Dl6DTT+HYrJWJdmcjGMXFFPwbwAh3tJgFwdxJsO+yAmgKtZrEgPulEfSa0NY
 /6bqlaOxJVER0aRPi0oEprnJqthBfUGrJdgBapxh1tJuCI/wPX+aEP+xbgsZxOa2pHQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791045061;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NZ6aq0620AAZi7EEbLt7SOlRjkrqZqApqcQbZ2eyIDk=;
 b=bw2WwstCCoBSS2oJdsZwxtgvRX3MYnRaJ/pW+V94cq0i7uRZ2IzgRyN1gIU7EDFdIK30
 d1qgWwyr/GhLvSPnIbMZtgey5urGE7/6qcWyGdW8TODS6kQBW2M+v8cfpHgF5q8eCWQzs
 Z6fiHvGR5wb+F/zNqAIzOB46AG1+AvUpS9lpdIWuhwHcHs5VIQCtT0E0fLvHdOFOAQShv
 k5qgVs18zXtt+P0Cs64kdHz5yrY4SBzQb5DB464SsVjQDzCBOG899CAOC2qEYK00iPCxl
 AHfaTtT8nTl2XjXLdJVIS7Zxal43iQ48YssUTK7CS8hfrnnLJJPemYfua5I/k8tsJ9Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07FDC40024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:31:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45553886F7; Sat,  3 Oct 2026 16:29:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 18:30:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1990243cad222ec438fe14ac26976b85981e08a
X-Git-Newrev: 6c9c2b71e6db0bc9c16747b341439e8bb21bb7d8
X-Patchwork-Hint: ignore
Message-Id: <20261003162946.45553886F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: fix pahole discovery when
 BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c9c2b71e6db0bc9c16747b341439e8bb21bb7d8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Around Linux 5.11, upstream started introducing checks that execute
"pahole --version" for feature discovery (e.g. [1]).

However, when building with BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE Buildroot
only lists host-pahole in LINUX_DEPENDENCIES, so it isn't available for
the configure step when using BR2_PER_PACKAGE_DIRECTORIES. This results
in the host pahole being used (resulting in host-dependent behavior), or
no pahole being detected at all when the build host doesn't have it
(which will then disable Kconfig options that require it).

Fix this by adding host-pahole to LINUX_KCONFIG_DEPENDENCIES.

A similar issue occurs when running "make linux-menuconfig" and friends
because PATH deliberately gets stripped when pkg-kconfig.mk builds
x_CONFIGURATOR_MAKE_ENV. Explicitly pass the pahole path to fix this.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=5f9ae91f7c0dbbc4195e2a6c8eedcaeb5b9e4cbb

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3599a10b50..cd80904113 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -125,6 +125,7 @@ endif
 
 ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
 LINUX_DEPENDENCIES += host-pahole
+LINUX_KCONFIG_DEPENDENCIES += host-pahole
 else
 define LINUX_FIXUP_CONFIG_PAHOLE_CHECK
 	$(Q)if grep -q "^CONFIG_DEBUG_INFO_BTF=y" $(KCONFIG_DOT_CONFIG); then \
@@ -387,6 +388,9 @@ LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 # therefore host-ccache would be ready, we use HOSTCC_NOCCACHE for
 # consistency with other kconfig packages.
 LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC_NOCCACHE)"
+ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_PAHOLE),y)
+LINUX_KCONFIG_OPTS += PAHOLE="$(HOST_DIR)/bin/pahole"
+endif
 
 # If no package has yet set it, set it from the Kconfig option
 LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
