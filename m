Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FC3CD8C88
	for <buildroot@archiver.kernel.org>; Sun,  7 Jun 2026 13:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAA2E429B2;
	Sun,  7 Jun 2026 13:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tv2IZCtJlHf9; Sun,  7 Jun 2026 13:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF89A429B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780837352;
	bh=eCUU3Wp5XRkc2KIDWkKhJ21JfaJBQnmzS8h5jwAO8yo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NlmueFJ96ZbLaioxUZMqc72TxHqE9GVp6dQEa8dY91Bfa5IanBrkUHzlgE0LwbQAV
	 nFEiahoBqovfZKO4uE+ePp8vRvMeBbXk6vzzuw1JDxTSj2sHkIHUpMfgC7cgpJn8tG
	 af7kg4Glq3epLReCcQ4xdbrRBuztoaWEeFUlujuxcd2kqQnQj1YK3wmowHSdvdY9Om
	 AGZNBjLTP7kGVv+SY9VYuBG3Y7zG8ApH2FeIcY44aVveRgfk1m+XdzJQK8qYtiBlfK
	 0sdz0/a4SuE39h6FkX6s6ASpA/Yb9rbp+eNFUTILmXVxK5zwmIm6VCA3Zj/pvPjOyX
	 eACQ8noFE7CSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF89A429B3;
	Sun,  7 Jun 2026 13:02:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FB7B2C1
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6606240566
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kDrjHRUK-gBx for <buildroot@buildroot.org>;
 Sun,  7 Jun 2026 13:02:29 +0000 (UTC)
X-Greylist: delayed 14620 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 07 Jun 2026 13:02:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8436440343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8436440343
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8436440343
 for <buildroot@buildroot.org>; Sun,  7 Jun 2026 13:02:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85B183EC5A;
 Sun,  7 Jun 2026 13:02:25 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Sun,  7 Jun 2026 15:02:14 +0200
Message-Id: <20260607130219.1350128-4-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTGn+mw0LfFA4bhUQ4EskgRPUuaLcpe6+4d/jdjluPflSBP7psL+yUx4xtcn5Te3TN0b/eAEH+4RbHXcs5UNaobMfVgDTl/3pzNKAhhM6c3KFoH0aEmGRrDRxQv+QdA02uebtmnuBGYHqmyPJ3vmEVMkGvpyISfCmkcIZYXm9Pwn3/N/qwaPJYzhQx0igedrsoeqjFuuRgZ+RDY12QgACCSIHyCr0KtRw0iUaUsoO+DHvuQsMSGPAAssAzUkWAmXkNWOoITHlSWGUcUba/twXwJOSWtNULan5bSnwE/XVZwiQteutsKV/t6GRzziKHEGwoUzT05gUcAKdJSBQk1H+f8Jtb0Mnf1ZQKVkJXzC/Q9Mr0m2HtADg28t5wwkwJ9Q2ofpj6WE3s40DjH6I3T/5IB68r8X7wzS9rov38LimUiXZew3jVyQWcSBo7ejUrpkJmk7eA2qJVVx5N+aMmo8PafxBD0eXQrqMAgtnO33yMQGdIQvUqYYVZmSHBOUCcf/ybAW22rqe9UVbEy4tBh51B4rsOacSe399pRb4ZZHx9B6064PFhqcG2/BZzwXDGoUIai/ls0SpNXYL29KBGN6BWTJSlfeBPSFYJ7Dtq+hp6X2ZxtfoecPufw6gaUtZa/jPEGXBBEv80uVMOFRW48Coa5o97bmBOele8fuoRNOEXy/eg
X-GND-State: clean
X-GND-Score: -100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1780837346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5JKRYRV2Rc8rvLtrj9ml95nXDkFSXrEsjFudCkIdtk=;
 b=kFfGYvzjAq8YHYwtI1Wgz9PJPp1wMJKWauumRNoG+uDa69O4/0DHXHj/eSrBSfAcyjI2lw
 MtioViL7OvzbtziKtUT4eAU8byJL0+CrLu7ITalL97ZKLYI3rqvmvpa4aXPhXiv4dx9Fan
 5qfeGEvlYMpA/tDXdTNr8lygrxnWgnURnv1++RH33F53y/CQNu6xoyvxk8JynxPKBEWNXq
 UQnnNVvEMOzw/F76jiYdWVLOsOKHAyKzB5SZBV/agzzD9r41tqzFahj6DFJurlKlk7ciHf
 zaPKv5fJRGcWyl/esCO3d7i5PoWJ9mPldX5uKLEoO5EvOxAQUzSsSSdXacmxMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=kFfGYvzj
Subject: [Buildroot] [PATCH v2 3/8] package/gcc: force --with-arch=cf on
 m68k MCF5441x
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The MCF5441x is a ColdFire V4e core, and BR2_m68k_cf5441x selects an
MMU target, so the toolchain tuple is m68k-buildroot-linux-uclibc.
For m68k-*-linux* targets, gcc/config.gcc defaults --with-arch to
"m68k" (the 680x0 family) when none is given. That default selects
config/m68k/t-m68k, which restricts the multilib CPU set to
non-ColdFire devices.

Buildroot passes --with-cpu=54418 (a ColdFire core) via
BR2_GCC_TARGET_CPU, so the t-mlibs default-cpu sanity check then fails
because the default CPU is not in the (680x0-only) multilib set, which
aborts the host-gcc build. Passing --with-arch=cf overrides the
default, selects config/m68k/t-cf and puts the ColdFire CPU back into
the multilib set.

The existing no-MMU 5208 ColdFire (m68k-*-uclinux*) does not need this:
that target case in config.gcc does not default --with-arch to m68k,
so its multilib set already spans ColdFire devices.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes since v1:
 - Reword the commit message to the real root cause; no code
   change since v1.

 package/gcc/gcc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ea96286c32..270a0638d9 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -220,6 +220,10 @@ endif
 ifneq ($(GCC_TARGET_ARCH),)
 HOST_GCC_COMMON_CONF_OPTS += --with-arch="$(GCC_TARGET_ARCH)"
 endif
+
+ifeq ($(BR2_m68k_cf5441x),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-arch=cf
+endif
 ifneq ($(GCC_TARGET_ABI),)
 HOST_GCC_COMMON_CONF_OPTS += --with-abi="$(GCC_TARGET_ABI)"
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
