Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D515DCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB38407C3;
	Sun, 11 Oct 2026 13:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDaA03wtKx8m; Sun, 11 Oct 2026 13:46:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C68FE40782
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791726399;
	b=eo/MXoosRdl2nRF3IDwD+1iN2eKOm/+2P3Aknk5kC5LouipiEgwyhehpr8jSRCgC0WUE
	 I7Bsu8kFet6LFAOwO9iYLPfMnwCm/XYHksr+2fk/mnVkbbW5Ftuow610Zy+94CHUndmpX
	 IkZcYXkNvTQjEtBifLbJrb3p9ruEWyqFdvMBQXDHPHYvwSekel4XjkXxHhXKoVXA0B2EI
	 MyChINHR1bt9Gv+tILdEMbRuSRs613IR7RncOPfdqcT+OivceUksJHG1bxtoJ7r0Sh1YG
	 +m9dGkCHSZj42OBuP0Mig495c0LJcCSMZXU4ocfhgIAiTWIWM3/J0S9Rru9ThDpQ5Cg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791726399;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=v4atatlA/CG26Ur6k5IEueLVhr97VN45u5Fe+8BIfkg=;
	b=faXfVx2poioi38rhKwZKFTaHztM053E3SLdsSmCq8rB5lk2maIGLGyFF+43SoSM6fpui
	 vZ+pghoS2uHh6bzMlC6hTs5KEl7MfjnN74ym+S5uaHKjthUlitOWz/9jzfvJHHcxcKla9
	 s6IzlNC93Rof/ldEa+Y6kwNxlBr/HY8xBDvqeosTvSC9pJKLl064rMoF2354WUZX+wnHk
	 j5TgQkiHvkKAagSqa0B6lRcN3gxonAGI5VNgYRiKx7Aw590X2cxmjDkAtP/VDmPftZR/r
	 IMm5GYBU63UUHygtVOxyiGe3+xw+VZwdL/XZ9X3Uxk/T6GERalEW3giKaFSUAAh0Mlw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791726399;
	bh=v4atatlA/CG26Ur6k5IEueLVhr97VN45u5Fe+8BIfkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nd2SnoOjBCS3pz6sUl/a1DoAAXw2PtoXWWDUw+S93KfGGg0be095y4qHU7y/wpVwW
	 B05Hvv8BLAQXYUwoyjwNhf0QW4eWi2UO1DwmeaUUL028ECXuQkxrW7Wh+1/tXWr+Xh
	 vRcrB0mpF7qfRZL8zPW+Y3OAwF+bf28pyntLm5DwI4QL9uKQdogfckcz0BKldbXQes
	 upKx7zUx3Kiy2+gfMlBZgL6rCqe9CjaHOZpa69nh3Rgpdj65i2E1Djm8AJ2V4Sb2Nd
	 5aEDCFvcgQ4NzgA50RoJp56HVUJdpdHmtWaOsXFCCZaDbll/SOZzS38t3z4NTFdqTW
	 Zp6Ms1ugxYtQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68FE40782;
	Sun, 11 Oct 2026 13:46:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8710575
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C40180E0C
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WxzOZ6QGVgIA for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:46:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C082F80DE8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791726397;
 b=TRNlZJmphjPcf9TIqpg5Tmb9ynljpnn8f6eHWWaMHShncryk/gK6FVC2l7T/moCmLUpH
 v5zfufSeFeY2jMrO+37Ijm/ftvosOgTkvMrC9L6snBOdn8/RxbMM7rHzOVS9WNPIIt6HW
 FsBVKh/L2MpwigJ++geFRMHmusk41cdPF6PPBzX2zZNoVECnchHbOn0hHpITifeeQ3vIB
 QdZW6ehr4K/62bhak2HwC01obAPEzEDAxf8hZr4VJG2vG3T2zzZ//IO8nxZv+azH1zao1
 8h0Qqs7D13EJn075113eyoC7i7bhQVb3Q/F3IriTjvcFMcS5DET+EVKf1+zj0rDoPqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791726397;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NSEQZcjp+W9qSfoouxyfOhyxTmTvu8eanLuDr0Zof6U=;
 b=Tm+Cbvbt5hxGcPfayw9XMpg6X3B3EeCaEe9KzLL/0lay5Lys/YM7MUKCDizcvPKjKUQP
 o06sdAFvk4Fa2xiQS0L5AJMHcvb+CwJtgemlQ7mjzRUEb607c+QLZIT4RI/GfVMHX+AO2
 wYBYBf5G/RP6xmTa3q0f8Qu2l2sdbf0IqzBGvEQngSzJak0DReV0qN2B6/w4SP+8Hzko7
 sZ0dKyD4+ZVB9BsNP18Yxuu0cff9Q2GiIcNMCFeeILV+ff6kWv+Hv9VZAQJsMvZNUntPJ
 FYfuh81Bl0VzpLDOP/ljDKi2gV+OOy7wHg6tv/alp6v48SoeP4AbUOk7XWzUM8MigcA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C082F80DE8
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:46:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C94394C83; Sun, 11 Oct 2026 13:45:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:46:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a72cf3fa83ca85d1aeb17dba6a8986d864906de
X-Git-Newrev: 213e01ae9cdff5937d7022d53212aa9c9dd720e1
X-Patchwork-Hint: ignore
Message-Id: <20261011134519.0C94394C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: install libsframe to
 target
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/213e01ae9cdff5937d7022d53212aa9c9dd720e1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Starting from v2.40, binutils provides libsframe, a library for
manipulating the SFRAME debug format. Buildroot installs libsframe
to the target image only if BR2_PACKAGE_BINUTILS_TARGET option is
enabled. However other dynamic libraries from binutils are linked
against libsframe, including libbfd and libopcodes. Any binary
linked dynamically against libbfd, e.g. perf, will need libsframe
as well. So libsframe should always be installed the target together
with other binutils libraries such as libbfd and libopcodes.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 5c5c8fc466..c6a6380be9 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -126,6 +126,7 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(TARGET_DIR) install
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
