Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B358FC9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 12:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7749280D0B;
	Mon, 28 Sep 2026 12:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnXhXU78uFnT; Mon, 28 Sep 2026 12:36:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8FECA80CF8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790598996;
	b=l58tEGROS6BPFziP7i+HyGm6D9OGPXtKYjf33g8w57IiQWlkv4WkEpEYqfyUuWMMshdE
	 EFyN3Pdi7eruNqDz04fvYXpf9eaISkmMdpsWtdw60ME1H+P4CpcQZSdg/tDslGJ0AknkT
	 JpuvzWXcyUqOAV0gsWNlGLnNMoakTFMHiV1+3unmFjM54TJTFpjbC5iV+bu0lVtfCUNvA
	 hR77VrJwFAxDrykM9/VElgRDkj4Frc2cg5vH9QDfCBlcHyRheo3NAY6eq+aVRtJlDDCkt
	 DqIDBdL/QT+wS+o9GeEglqO6ocM1UgxydsK3DAUHsEstfS5VYa3Uaiphf/ZwZbAhsgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790598996;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pvL6SQP5a5WoWcR/A4WoVAa61T96t38RhghrE9ghMAg=;
	b=FoiY4zgKOZVznSrwzihJcg6nHkeSgmoceKJaCoOKuBkP+/2JTn2fqR7TCJA0/i7Z18f3
	 1s3YvG1+Zx6qhiSuwL+A3mi99I5ViDNgVuZ+xt0Y8b2MFIq6ZvaXX0dVKcOdny5Tm5kZx
	 J0sUkpJmwBrvzunfAOIxeqxIeTUntB3SwQ6XTw9sZu2wFEa0YLfrr8fjUdFa9K1rTmOMR
	 0cpzIOcvSwXcl2AyR0o8QJ84bNSiR9/+yEmgFNdqKsANwdXSQ8/Zuit4Bnl44pKusZWcm
	 HTT1rwRM6J5AFt6ONOi1q3ufwLVcTOvz03qTGSNkSNpyy83KUnsO15J9W/FFaxS64DQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790598996;
	bh=pvL6SQP5a5WoWcR/A4WoVAa61T96t38RhghrE9ghMAg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=newXVZvpndwWmElmuZL8SpYLjrJ+WXik/GhvwMwLCKgW8RKFzcB9uauKgqtS5dZ9K
	 K9dgGg4T5CY3/2viSBeivjcuRTWmPbpd3reDqSqkfB4wgVWUFiT7wrW61lKK/SGGdg
	 kxEvjEEA9ivuM+ZTGfYp4AI9HdQibi4CSKhbBZ1zRQDqs5pwLpeFMPpogFM1D9lKrD
	 cNtUvyOWlVZ1hNC3K419yWZb7l4mzLyJoytN51QsdnPOKvi5yAx3Hc7WO29ibieLwZ
	 ZZ7FMvAxNFCCcjZpa4X/zCsWeKLfRb3fPhnhqWfVGFfhVC1eLjT3shVgTgQ5j9zOU8
	 lxbTwd3xll8Mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FECA80CF8;
	Mon, 28 Sep 2026 12:36:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ED7C2B6
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3046B400DB
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AB20v6TFaA4j for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 12:36:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6CF9740024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790598994;
 b=LgPDtAG7Pakr+BRDWpED5SpaE5xyh7M5/BUGZDPNTeJg2dmxQy7alTvTl1fih+5iJwNA
 kDSdImnPyJfjbCjG/uL7ub/uHEm1tvX5ljFfR7/y7Q7DacpzQJbeEWqJt9M7cS4NxfgCn
 US0uAHBrsQ7kjLLwU9tmJAeBs9n9LzegsE/D5FPjtwfLQIzi5Q68Gu3XKDgU3bY5JBlzm
 Jx6pMsnR1nJjWsbutQ23jfB5l77eKy/vzYiXUIK/ylrOrFgiMKmICjpZMxAiDInf7BgwK
 F0/sL3Dbey7DjnTuTobU3RDCXVYr7mn/iN1mwRN7xt/8AE8NkuzIO4l+Kju1BTnuRxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790598994;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/ki+K8S5KsiLxSH/6t4R9DEYFpOU3OEHVMqTNU4sQ10=;
 b=AhOE7Ns/pUqsvI1kMvHt6YuKdCglZM0XMw6RAPZIJC87NTy+jKtq2hnfSQ+SmwqV47gG
 sarZy6G+gVX9K8woMWvhLi/w8zIz3lghx2EKZU+u2LuQmZzXLHkGqR/fDwNa9/oBnJNbT
 m5v/jXfUG9DokObKtKOK9VP5f7IX7jEOu4/rvKhGA+j/URgGhQg/od6HrdBCDOUABlxTy
 cwa4xdvXKqqgScnIQonyj3hbkW6nLoitl62GxYoAYIkhl64V7yZKVi3h78GSRygRKYaZN
 8UxZbBbRSndoL4m9h0EbQeMeoszK1cqHTADD0uf3B4plWmVoNbtV73vVuBIJPmal3hA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CF9740024
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:36:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F1AA98378; Mon, 28 Sep 2026 12:35:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 14:33:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a731846e46fde7aa5fc575e9b2e784e92f7161d0
X-Git-Newrev: e2f49a31c8429d321035a2ac674e102b1c9db7c9
X-Patchwork-Hint: ignore
Message-Id: <20260928123522.2F1AA98378@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libp11: bump version to 0.4.20
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e2f49a31c8429d321035a2ac674e102b1c9db7c9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/OpenSC/libp11/blob/libp11-0.4.20/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libp11/libp11.hash | 4 ++--
 package/libp11/libp11.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 8a31a6f39e..10ab7388ad 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.18
-sha256  9292de67ca73aba1deacf577c9086b595765f36ef47712cfeb49fa31f6e772fb  libp11-0.4.18.tar.gz
+# From https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.20
+sha256  a125e0310ff10c189fc1b32a9652101486ea94a6b07c677a30e90e3638d2db48  libp11-0.4.20.tar.gz
 # Locally computed:
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index 51a44f5b3d..38cc1c2e6d 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.18
+LIBP11_VERSION = 0.4.20
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
