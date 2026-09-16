Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C93BC982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5886780BFF;
	Wed, 16 Sep 2026 21:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIhlagLiw9Mp; Wed, 16 Sep 2026 21:02:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 649E680A92
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789592550;
	b=MU7BbR/PjLgbzzLGWmgWmKo4VNjzGxLWKospFrCORRAG1eYHAP+ZREFztwg50aEr203J
	 hZHJ3Ol7vVPAIes8eaa6q9Yj5CDQLXGcK8BdlP4qsCJIP/80AjqQBp0Hj0wXOIj/hvfDR
	 arKtZUO3cofCpu1hcwXWNFZss/M44c8a3c+RipDAbce5+xHbr3TxIL5m++6K/KIGHQLRH
	 JkDJVqfs2QoJUxIIx2JwrJ9XaH3aQHNGKfVbrEM/fKCD2xEzXGE5SuvZYxS7C1Qf7ZFNz
	 DNybYzWd/jvEIlhwmUdZEZmPjui7benSq/8Uz+t+b46aS2YH0aCZtvZHxuxwuWU9bWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789592550;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZTUsLIIW5rIppWopo36KnIS0i/fTu62mDFXLlMKfM5A=;
	b=qPu+rF/dU+x7Z6bzYAJ3t+X7hthyH+TqFgx2mOpZJnx2YozidhzgztBs+31CaETNMZXE
	 n6lPZCBFtWjUUbz4q70KHLL/UZktsxYwmyp9SHmwuK297VcBhMnNkj3ANPK3lp078Si2n
	 QqupcHdNrP1ZcWuaAfBF5w4T1bhxi5RRA7kCge9K3lLLQ9W9LAQaCB6e9hAG9vB1j93nH
	 AkCs0q0sABJ9owQM1Xd9yKR5XKM1OmwTRhsO64hVmKR0SLFkGna+dYrKoMALnShbAdf+b
	 fJz2bAzvsucr7HWdSni4fyLDaL2AaSPNxumyInmoTWsAGJWtE1SYuug48CUoz2dPfWA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789592550;
	bh=ZTUsLIIW5rIppWopo36KnIS0i/fTu62mDFXLlMKfM5A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c5lSZGPSNAzNglRRRELRF0zl+j0SToPoPNA9clzgrxTudKN4LS/5Yiqu7lhK8bbRV
	 QYSAc/l8od79gWuyO6MfJHPhVXAm3AKP837+Oe7jYYL+XlAuFLidG3ow9ch43LBe/m
	 io2Y2KidCvusrmiMvGQiDJF4fBUCnU9ZA73b5aFRlaaVb3lm5Nw7GGrAwsXxC50fSX
	 mabEQTN97nhxNy/CPbcW0t28bdm3xIN8714SAYGfjh5/pU6v7yVYPCadQihXm8dXlC
	 M9ST43o7kBZVdAOVlMzNc91ipLoUjDfl1CeV+z/uNgF75soDEtk74Q90lvp3iY/6Ih
	 4FIAOcyB98rZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649E680A92;
	Wed, 16 Sep 2026 21:02:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDE7524D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B37CF80A92
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLwCkttdP4pI for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:02:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CFCB880A86
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789592548;
 b=Z/GAvi0BFA1buuntNol6F3qCMB+VdtlZ3yySn3It09ivai0/2eDzdsnmHAbo1BbwUkPz
 3wOaXQegn3BYKunc9G2q8F5RHAN5sCkd9L30wg/pCZI1iwnKTce5Fpo7gyp4CNHQbcgDB
 fKbXG2NoTYm9jeldA0FYmATZdIf2go6RW8QE6+S46wrvg9MUTsNoqc2sIy8q6I5peVRu1
 dBEL2V7CFw20lecwlWdoXJdOz3yiiHpyDoMGwvvwYIIBluYvl8ZhiEu55pAxh1CWS3lDJ
 VDjgkK8Bppzq7/SoctvnY+kXj5/4Ulr/s94iMTaHrFDxC2O7fmoB4YFj83165Wlh6+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789592548;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=glf0M2/3buweGaUxHR2nx0zBwaIIUKBEKlBd2nYkMp0=;
 b=a5xVgyNKzWTuoQPGoU7sG6viSDDR/qRzLmqfPS9IPru2kzDPOQoGxdzM2X9t4/jscVDm
 ebg/xJLE6e6cFAQuU/cCvRo8U85HO7xeASM/8rOfmGGHxaXzoeK2ULNbskpm6jTHjH3by
 6Ay0HTy3xrOGwADPWkfZ1BVqlxkiWspPXtet2m1JaVeMkQSqguojKdSeAPcgnvxrpavJY
 wK6BRWWAwyHAiMGvXB+wvPyRJpBec+hI8CvVJpiFzh0OlWd3GbOgWi+R2O1VR0a1fFDvR
 XPk1JIa/3EzJKdfGUcH5pAVxHlS4WsderVsXGgoTFvCQG/nGltbyVOUVCK8AWrXXNow==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFCB880A86
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A5D496B13; Wed, 16 Sep 2026 21:01:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 23:01:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bf452504516ab28233226ab531eaa2194d98558
X-Git-Newrev: 6c4abe552f34bbbaac9139a0f5ca57de10d1cbcc
X-Patchwork-Hint: ignore
Message-Id: <20260916210122.4A5D496B13@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: disable valgrind when
 building with thumb1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c4abe552f34bbbaac9139a0f5ca57de10d1cbcc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

src/valgrind.h contains inline asm not compatible with thumb1 so we
disable valgrind support for thumb1.

Fixes:
https://autobuild.buildroot.org/results/720bfa00ca926a398e901366e7ab20d08cfa9a81/

Inspired by buildroot commit 26013972ce568e55a121c21a55afce45bc0675e9.

The oldest build error of this kind dates back to 2022
https://autobuild.buildroot.net/results/85d/85d8e725a31bc1a3c41b2e388a17ff439274d437/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exim/exim.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 5e9746af4d..482c7ca2c1 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -104,6 +104,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 	$(call exim-config-add,EXTRALIBS,$(EXIM_EXTRALIBS))
 	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
+	$(EXIM_DISABLE_VALGRIND)
 endef
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE)),)
@@ -154,6 +155,13 @@ else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 EXIM_CFLAGS = -DNO_EXECINFO
 endif
 
+# src/valgrind.h contains inline asm not compatible with thumb1
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+define EXIM_DISABLE_VALGRIND
+	$(call exim-config-change,NVALGRIND,1)
+endef
+endif
+
 # We need the host version of macro_predef during the build, before
 # building it we need to prepare the makefile.
 define EXIM_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
