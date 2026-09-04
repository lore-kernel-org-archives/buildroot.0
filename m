Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB73C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D171D6069C;
	Fri,  4 Sep 2026 12:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yU6kcXZYr5Lv; Fri,  4 Sep 2026 12:15:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ACB18607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524114;
	b=Guv9bj1cw2UWaTDJni1i6XpFFehN8Slt2xrA+S5fRvvPFvkvBE0b+FLo7W/YmnPePkMe
	 jexUeMaVSrQx8xdAiYKjb7BpaNErBg1u4HxipG26ENgQ0ixcmrMr3CJ7RWxaYr1eCng2+
	 XJODpmz5Yn/RM1uJ9x9u786Zg5AFxd2abydyggsNJEc5Z/9t9t/FweNDIaZkkPTWc4/S7
	 4/o3+nDhNd+JHia7/J7wxRssKhhJHMohYyUcvLzI14NZR6BL8rzJERhPLx6xuO0/MNfH4
	 0NOsjn8NmEUWoK0xYyJCo1PBxgHJbJYtqJcy+cSRphjJYZJ/CN0A8A1qYUQdXYOclOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524114;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=esAFo/Ltw9YzCA1M60yEez5Sg9JuwAXC0Sr5T1qhigE=;
	b=hjMpBbrYbtYFdU7MQ/+8OZS49MVfoNvkzlCt6Jc6osehv7X1QREK1sluDa0SS5yAg/Pw
	 orEQCi3UXpVef0SOz7elexkA0ft0ZbcOWum/Ne6TNF9BpbntzT+o8RTWqK3meMffYhM+R
	 hYdjvTSgU4sW2EKc8lmPbsbbBQA/vS6DbMsZSU3++vHf49v0cuoaXZ0NQyWaacSgCZtDN
	 qc2KLTqFJCtk50OUKsNrKhLkSeeZjbHtr+7mhO1Z8On66vSnA2dhdnzK9o7Uuka4Ce4ok
	 Sw6TXZIWjxzQ42MdMWdgrK0POS/0chkkq/sfuksiDwfEx91Y9lQs/EwKBL32Z9OF+ag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524114;
	bh=esAFo/Ltw9YzCA1M60yEez5Sg9JuwAXC0Sr5T1qhigE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MZ10mjG0YPbIeBWpzi4AfzFo6GlmR/RXJcK7palngTnV26byVTy55MCX75/M7m9su
	 WFILt9EzBh4k3Pa17uTyJJ0o9Zlx+Sm9L0ZjQ80lWv5bvefJu9Q0EaUPK8tWlDHQMi
	 xTgzgZhChZvna5HHDW2FNbkyPZH+dQeMaQ4BqubmU6vTpM/pjRQZCST22933f5reK2
	 vqKYP5LPScc96ad2YNhZ5uxJRKwws4KlfaGr03oOAmumf6CngGQ0z6oIGxPsUzRxhm
	 4Y0zyuab/vNGpT+++/bUtuw4a05MpM+P9NWQfy6UJemIffrj8bzOqycbqVf34BNH+U
	 GZPX5HbHfw6aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACB18607FF;
	Fri,  4 Sep 2026 12:15:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F385810E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E55F2607FF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ga8FTpFuPT1 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:15:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D3ADB6069C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524110;
 b=OTyaVAjxjFO4tHoUPbX+ABeOoCvGHkoV2ozj4GQzQjj+iG8AiuDX+v2zlubvT2czIEW1
 TfPaX7jgT8A3YFRj+YeiXxnKyRE6htzinlwkQT6A1MuLqJ45L+FHuFbXz36fQtpH99IDf
 GvJVaSoqtUrCC6L/A6/ruKiOVT1E1eG7toq26/1qSRuJJjhhG3ASLidan95Ei27txNdDS
 1FXUQpnRkW8ysdeoo8DqMAS4BVSf6qSnK7FmJb1qIpzvol7NhKUxpjf4/IK3QGkTwVYB2
 ibetnFUj06fTbvFDSgMAwUBP0ucYEtFBeOPhLu82xrkuZ9MrbL5dhnj5Ny9sx1tcpUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524110;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RXG1rgLMN8J7HjsSAySd41TTaE3Y9LnSDaNBHo3F7/E=;
 b=a4y+wko+A7IjaGXadjrk6Ek7qZbtZytE6hfcFvOhj/EX59vUMvetmfdjGYJ5ECw+isiB
 idXRHxGYlon+pbKe0uiTAfhI37Cbkkdb8+9IGTbm9BFbjl9vUwWLPeMt7wTGy7T3HmAbi
 lBF2P76dMKSGyQPsPGfddsCKwwLvLJ1joyYvJmF9Z9ET4h5V8eydwFYPqMMiwh+j3Bun8
 TdgNrI1kmf+y6Da6cdZg8ooyeCKD9z7DDQa+KpWM5eCLonsvVbtJb1Lcioh5XaWg7JtmY
 VQs6Za8ZThdgHzkliylnTyPrTYYhMVFe3hQEuKxO+1NAgo5pLmGU1p1LtYFIRx9O/2w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3ADB6069C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:15:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4312893635; Fri,  4 Sep 2026 12:14:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 14:08:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e2e88e3f0c949086a323dc325b1c9f4334af844e
X-Git-Newrev: 99c6a4c7289e8e38a41200e0579727a03cc56fbc
X-Patchwork-Hint: ignore
Message-Id: <20260904121410.4312893635@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dnsmasq: security
 bump to version 2.93
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
Content-Type: multipart/mixed; boundary="===============2615872627164844970=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2615872627164844970==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/99c6a4c7289e8e38a41200e0579727a03cc56fbc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release note:

 - https://thekelleys.org.uk/dnsmasq/CHANGELOG

Backport the dnsmasq 2.93 version bump to the 2025.02.x maintenance
branch. It is already present in master in [1].

This fixes:

- CVE-2026-12725, a heap buffer overflow in log_query()
- CVE-2026-12969, an out-of-bounds read in find_soa()

[1] 374d0a02e4 package/dnsmasq: bump version to 2.93

Signed-off-by: Stefan Müller <stefan.mueller@rey-technology.com>
(alternative to commit 374d0a02e4595247aa15c34d1bc35c5dcb316c7c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 74ee5c415b..176e73899e 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.92rel2.tar.xz.asc
-sha256  43d72b8c129bdf33d17bafedc98823f63e46b5005128066bf0d2a472a32ce06a  dnsmasq-2.92rel2.tar.xz
+# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.93.tar.xz.asc
+sha256  0c00d4e5c97c8306e5fb932b348b34269c9c29a0e7df0e8e82958b407092bc19  dnsmasq-2.93.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index d7ae8a3312..b9a76fd5cc 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.92rel2
+DNSMASQ_VERSION = 2.93
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"

--===============2615872627164844970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2615872627164844970==--
