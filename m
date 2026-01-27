Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C13D340AE
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 16:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ABB061069;
	Tue, 27 Jan 2026 16:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSDoQuyg9_jD; Tue, 27 Jan 2026 16:35:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8651F60FBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769531737;
	bh=EKYnE9im67h30jnETQDxP1l87x1wmxvtrmSkThfWjMU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fHSFs0rfShrDQVoL3g8wYBml0YciqzLPv2yC5etMpfbU9AetVnvoulLkcmOHwhE97
	 kX8dPeUSwzJrLzFSlHah8V6OEUP/CyLoD7K+CvqEieo4sbc1mTL98A9hHfdFISAg3C
	 1qFavPJ1nXFhxiGFrforU/HLgb9xVTQUX7no+19/Agl5MHrawwi42E5KYojJ5bMjhd
	 N8HS+W6GYY2a4q/YS2iLWI73zWT+slkJndZoG1LwTN1H5KWxkqMRTEwAny7kKJBLXt
	 4YQw5/ENSKm8zrRUX2Dil2ZaiOUtArzLnT9uBeYneuo3as45PdP2s61Rr/cjpKJOcI
	 RmCRNCuaNWTzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8651F60FBC;
	Tue, 27 Jan 2026 16:35:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A08CF2F4
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 16:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90395813C9
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 16:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XPk4QiojZCa for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 16:35:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 474B681397
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 474B681397
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 474B681397
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 16:35:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1326479561; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 27 Jan 2026 16:35:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vkm2M-00000001Bjd-0pOP;
 Tue, 27 Jan 2026 17:35:30 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jan 2026 17:35:26 +0100
Message-ID: <20260127163528.283380-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127163528.283380-1-peter@korsgaard.com>
References: <20260127163528.283380-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Q2JunbPWItrCDgpYdxyMCmR6feAZTnoIVcTutR1QaN3gw+z6aH7FxH3eCLSVUQa75PsPwAWqkpS4YmCFHSX38IYsid0dfcfC8rjlKdflxe0C4XSHW3rMtlfWSrJ7+mYuLFEZVQs303X0pyOOzpEDpUzcMvcvMajQ3yy3Xun8aTZ0ydA86XxoT3eoBFzUHolOqKxbLnihxpbpRoiPUnoApbsXVTjmpy3B+kZ2bEwhaYj7i3xQjG0UZ3wiS3HZvRK+w6TAWvkk4MBiY2mzcr93wmtG7whTh1E89YkHNgJbX2KfWCAIZ1A7PK03FwhCB5YoLY6p5oL93soI1u5RF0gD1Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=h7/JyE4vTGSjlVoPtLC5RRlM75UkCbbheFn3MhYci+8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Q2JunbPW
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 2/2] package/busybox: default to
 BR2_TARGET_GENERIC_PASSWD_* algo
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

Make busybox follow the BR2_TARGET_GENERIC_PASSWD_* system configuration
option, E.G.

cat defconfig
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_CORE2_MUSL_BLEEDING_EDGE=y
BR2_STATIC_LIBS=y
BR2_TARGET_GENERIC_PASSWD_SHA512=y

./target/usr/bin/mkpasswd --help
BusyBox v1.37.0 (2026-01-27 17:31:51 CET) multi-call binary.

Usage: mkpasswd [-P FD] [-m TYPE] [-S SALT] [PASSWORD] [SALT]

Print crypt(3) hashed PASSWORD

        -P N    Read password from fd N
        -m TYPE des,md5,sha256/512 (default sha512)
        -S SALT

./target/usr/bin/mkpasswd test
$6$VQ6lDdGRJOgs8Exs$gEWp1nN/FHCAgmoB6lD.fN13EKA40yV7WQmZJcFp114VrL/st74zP5iPsLHi5NFX/A6GAa1gD.yqzp5Lz3DKl/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d7eda71db6..446f93c36c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -176,6 +176,18 @@ define BUSYBOX_SET_CRYPT_SHA
 endef
 endif
 
+ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA256),y)
+define BUSYBOX_SET_DEFAULT_PASSWD_ALGO
+	$(call KCONFIG_SET_OPT,CONFIG_FEATURE_DEFAULT_PASSWD_ALGO,"sha256")
+endef
+endif
+
+ifeq ($(BR2_TARGET_GENERIC_PASSWD_SHA512),y)
+define BUSYBOX_SET_DEFAULT_PASSWD_ALGO
+	$(call KCONFIG_SET_OPT,CONFIG_FEATURE_DEFAULT_PASSWD_ALGO,"sha512")
+endef
+endif
+
 ifeq ($(BR2_USE_MMU),y)
 define BUSYBOX_SET_MMU
 	$(call KCONFIG_DISABLE_OPT,CONFIG_NOMMU)
@@ -427,6 +439,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_SET_CRYPT_SHA)
 	$(BUSYBOX_LINUX_PAM)
+	$(BUSYBOX_SET_DEFAULT_PASSWD_ALGO)
 	$(BUSYBOX_SET_INIT)
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
