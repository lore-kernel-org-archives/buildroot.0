Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89710C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 10:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51D2880E1E;
	Tue, 22 Sep 2026 10:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaYmRhB8MaJT; Tue, 22 Sep 2026 10:33:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7E14180E13
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790073203;
	b=n2HW6oxv/OnNeivY0bnU5pdf887UubNHVK4gAETOCU6t7QuwDEMZZpL6I7lSb90pL3Qp
	 UFIziJFyP7Y7R+xk2/MGF+6GEA1gk5Cc/VlR6JRhvyUFboUP6lBJr6wO4WWqRssLWQB12
	 gDfJviNZxLeoW9xg01idScm1lEkxjI+0+8ltNwncCpFm5DyTHFUDirWPPJXIacXcrguGo
	 G/4mzj0DJ+/XJhB4PktJZTbmkGmuhmL61mwn1SL1iUHt8cNfL/h95zhfhYU2mjthb+uJB
	 ozCo33ieAUPutwOzej7vEZPK00VtT7RZinjwhfYjy1Tr+syzT1ZwbZ0j/QUn1id2N0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790073203;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JgDflYWsyRYQab9gkovTMwEELaMONQz2YV0bO2xvjuk=;
	b=mgE4FFB++VOZHaM7DZDY7Nxil0sIugWybQlfsRyD+7Wq/fSljUoIse/PhsWq/DnwJv/L
	 UC53szc6k9X+RkmFDm7C+hO3VhTMPjQScnTIXbO9K6RyT1rS+CnX3O9+H7i0CH6ZhMkW4
	 7wX5VUK8X+xuOmRE01sDlX2zUVP+r62XgdMUcfeIL5Yhvjn445IQBeSmho2AboHAUl2Bj
	 zlPCRBEzkAPIkePKMB4DH1Hw1lamuWTTXitNr7jmWdo4KeZ3tCl2KD7S4WeV4l1byQmJx
	 GDRDgZ9ggFWiPQgHaBH4AkbMrowYpXYL+0EEstOttXuBkSbaQVoMdVNC/yMCryd5FoQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790073203;
	bh=JgDflYWsyRYQab9gkovTMwEELaMONQz2YV0bO2xvjuk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kciSIMkMxn4u/EwmNMAB+wVLsywSmhHYeJrwPe+XGt2SSRz2KThz4N915J0Qt+4yC
	 f6QLfqln/wVNn1h75hO3GTBScyS2j35FbfxbVRVXuZn+8c6GeINjKGcKncyymiCdSU
	 DJHXd1KwZfzO0IFuLZSuOQQreLm48Blt4inUlBw//tphiL2/CyEb/fzK/m4aC8wHf/
	 V669QjWpQC2kCIYXPs6Cn06WUwkIae3XwzXc9Dj9gK29+41NhCJOX7GRcYT6usz6fH
	 WqXHbJX+9PMvR5MzasIG7yK90imaVUSs25z/7tOH4mHv2O4pHwXW8jcQxMBlj0dJ5I
	 fTeztTRpVBJ9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E14180E13;
	Tue, 22 Sep 2026 10:33:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25DF5352
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1831C6074A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-SARNw-NO3E for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 10:33:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3ADCB60760
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790073200;
 b=lczVIe94vCj2GFj9jc5AGx7YoNcVnCaIisdqu9P4lqPZDCo0bYj6uH8Npbd+v4aOX+qa
 i2UXz9yaUm1T+7gcXrnBq2efcLZLWuxYowQQs4IeqgtrCj5PD5NPSNP0w2l+RGX6LwEIS
 4x6Y39XXQrkWuAndac2i/BurcBHuET86J0qFOBwCYxSFDXw1gEa7xdv1gR4nbC3GERcnk
 KD7YkGJ5aTB3ZVehZwANmi/v9prdHjetDJ1OT3y9hB1V2dxTNpxxmhGygf2ii1guO4D+E
 q9BLR8hZGfQyKWOgYhRvBn8OEhXzvJ/BlFWlTyKB/KBhOcoxFO0NgVaCQb6Amx0KkUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790073200;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aoSz36oTtFXIRemCEcYUHS3+ZhnerBUmJPZin+1hQOc=;
 b=HA6QJ3ZVO1ehetiTop1GulWZMv0THRZr/Jwx7ZylBqnex/q9EbtGzKbKULLBdCywg/fU
 tn70a5BaO9gK1GptjQaJYgiVeMRgqzJe/oZgVXt4u5B33sb6ivFsr7Q3EjXq0rPWzIZPF
 3YTVyTVW2rkhHBtoSZ6L55wfk95VQuGxjpR17++OIOUfX8KpHBunljykRyTAlyQy0yKPU
 cHU4PJTOym8Ddkar69fSpdD0dlp4ilhKe9O04mn0zKksurMW/mroXv+ZHqVYXW684yphX
 br0FS6NSA3sV8Lwhs6PAydQTNZkLQG2IfS98G3ttkJm0modXZ90HQZnlMNspPaeVUnA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ADCB60760
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 10:33:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9A698D6C9; Tue, 22 Sep 2026 10:32:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 12:32:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a0a1c19c1f28267daa19411a261b938feb5d546
X-Git-Newrev: b0511042e8921a4cc9fb01ced9ae65ba31bca8d5
X-Patchwork-Hint: ignore
Message-Id: <20260922103210.C9A698D6C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bpftrace: bump version to 0.27.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b0511042e8921a4cc9fb01ced9ae65ba31bca8d5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/bpftrace/bpftrace/blob/v0.27.0/CHANGELOG.md

This release includes
https://github.com/bpftrace/bpftrace/commit/d7a3bb54a3d5b5682cce92fb326aa01be2092d47
which adds support for LLVM 23.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bpftrace/bpftrace.hash | 2 +-
 package/bpftrace/bpftrace.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
index 48572d1c58..b5f793320b 100644
--- a/package/bpftrace/bpftrace.hash
+++ b/package/bpftrace/bpftrace.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  555368f32f94bfcb74b119a3d9c67b68200be6375b8f452f794a2d3f6ebbcd16  bpftrace-0.26.1.tar.gz
+sha256  87bf01fc3269ada7109531b0d964ceb5527d1ef7b9c9a4269b3aabdf872f0e26  bpftrace-0.27.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
index 7c9bc6b7a4..929bc0fdc5 100644
--- a/package/bpftrace/bpftrace.mk
+++ b/package/bpftrace/bpftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTRACE_VERSION = 0.26.1
+BPFTRACE_VERSION = 0.27.0
 BPFTRACE_SITE = $(call github,bpftrace,bpftrace,v$(BPFTRACE_VERSION))
 BPFTRACE_LICENSE = Apache-2.0
 BPFTRACE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
