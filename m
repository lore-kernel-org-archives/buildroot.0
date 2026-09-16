Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CE9C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 057B8406E3;
	Wed, 16 Sep 2026 20:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFA-Vp3qBvaa; Wed, 16 Sep 2026 20:41:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3060140543
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789591300;
	b=FK3Ve7tOSuCxvEY5Vm2jJyP92+5Pgk48mcdTWksZ7JLe9kOZE2JkCrmLExU8kldv6oZO
	 aPC6hv4tz1UL/0r22xZGXuN8hVOMhTPxyWZbvceNgAoa2yU/pGZ5Euon7TG/DOLh3AXFT
	 UsncrKXugUhztswS3L8nM0r8CmVZy/qe8TE91ueHnPuYOJnY4xVdg35xb4GbwCMguJHDF
	 2IcF/Tic//MntFK2w+lpU0LyjtBW+a1VYxARMQA90vrnWhN6ue54huJgHad/IHxrD5K6O
	 WUVqWSCdLZNoQsvyEDPUu7lsBOsd38ksl3WSxO7rJrt/BoNxtTcfYPrX4vw73gTgXmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789591300;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tVdbZwA2IM6cZYHmRALsjvgkFaGFgrApVjxfBz30hYk=;
	b=o4SIpfp4EgeTTCsBaFXGWHHlL+Lh98HE7RMJjzIObIZ7+zfhl2eAjO7d5UASrNIocIVw
	 5wd/OTMnMnBGbEDugU+lnDLDiV9lWBuZKL4acV8asJxLfOvUz/ByE+MFTLsnK8KjO/B9P
	 NKn0T0BS2omQn9MKAV2aIzK4m00E9cTfUAeGNeP6yXKWn01peVIKqCqS2G30oVNKipzMO
	 DzTKYyf0mX14VrwaJ9AaUh5Y80XOySPmdesRZlvzBpBhKCaYwpdbtyNhUDmzMwIJmIE9X
	 gQD8l8C/wQcpH7anZlb/Sc/G+8cdWYVnKJoIpXcx9ipHpogIg7Io+NKr4hXHwRuGgKA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789591300;
	bh=tVdbZwA2IM6cZYHmRALsjvgkFaGFgrApVjxfBz30hYk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZNO1u2+ykFJQS6C/MGl+Zo8n7PHffYox29lK+6W3EdUNSAR/nyvG+jQ9yr+OHpz/E
	 gLnczDv/ftKfxY7NYotdRcsHIKRzAHBJsX7RXESSNatJBIzysYdPFGjNXpX13XzSeU
	 +z/HLj81bUgcRtrcnqfTta1b674slEJT6a6vC011C4sJtqBC+MrklzeIZuTry8UISt
	 3RhuncSZxpf7vBP2ZQPKtbLj9uicSZa9gf5klgjxVVDk7LL2MFeODMqmyimL4KIxxq
	 f3rOQWOZyZ1n39HQ3WfMacx7XbsCMzz3NfworiKqHcR4WToYjnYUE3d17dq/Z0IxT/
	 RLVSEMtUD0HRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3060140543;
	Wed, 16 Sep 2026 20:41:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C92C113D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4ECF400F9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XqvCQtTV_OHj for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:41:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 02B88400B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789591298;
 b=f8GKOe6Xzn/pQ7ELkEBQhI8x78hAuFgEIbmzLxVlueHTz496jyUMUcG6EAVhHawOVp5Q
 kZ21pYkKdJIfY2sJGVMKT3NmlkXMc2zw84h+NSTu+3JcZmKaHRjUL3m7H5qzYgQCIsXEB
 fvTBHo1DxPP2p5ZdL2G4GsDCC+LqgMiKZq9aYAipMcW/tJ3GMYtE+r/3iXCbHk3zFdIwS
 tMYlE7CbInwWMS3e7XIN3HqIgF7wmAaC7SL1+ddEVsuelsQgUtC7r8YqjaAeO+AS/FCI8
 hc6FYXtWZZ0kWX3euGPMHVN0e5kaW9FaTwKCen55A1H5b/whn67RO8XHjEhvXdXnaYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789591298;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ott4oxii7563fN1Y8z3+J6uckp9rDGQD2kfhb3QmmyU=;
 b=q9zZcQ5vEMxLhn+Qx+nVQbc/XM1fFgGLywpq/u9f2oupurZj7C6KlP4+/4DdxL59QB6J
 E2F/c9ubBGE/8kW9PBYupICINOGGCeQuvTQFmOsiMQ40a0x9t4X3KVuzeBsooe+NonnWQ
 dFFC/8eEDFoD6sbykJe2n/xpVLN87uoZec42ptUHCCnp7SUCkRaQXqGdGI7WiF6tZYoB2
 y9FbIDSdlIzr62H9fYM2qW2OTDfFfN0ERaBBHbB5MwghOlkP43ds+ooFUVm0Tq51ZlLsp
 QeZDsoOP/RTjqgFOoXzhyLYKzK4rYB9i882CXimQAuqm6b55m0BaKFBK3PX4QGe+7uw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02B88400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:41:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6212996AE2; Wed, 16 Sep 2026 20:40:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 22:38:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ab14b940a499ef08c2c2530169fd9cd623b66c9
X-Git-Newrev: 96ac57460fedab7fc0ed23355ed3ecaf395423a3
X-Patchwork-Hint: ignore
Message-Id: <20260916204031.6212996AE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: fix Config.in comment
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96ac57460fedab7fc0ed23355ed3ecaf395423a3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The comment should be shown when !BR2_INSTALL_LIBSTDCPP is true, also
treat BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS as arch dependency.

Fixes: 54f96add94901511862df18e527e456982005b8e ("package/bind: security  bump version to 9.20.24")
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index ab8ddcd0a2..4eb024b260 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -51,6 +51,6 @@ endif
 comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
-		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
