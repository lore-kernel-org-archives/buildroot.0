Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D98C88E7F
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 16:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9651E40533;
	Tue, 15 Sep 2026 16:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YKwXCzkW8VtR; Tue, 15 Sep 2026 16:32:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BBC12404F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789489954;
	b=thRyidLYSRcyNs+zST/Y2XUjCejKKsBONqUI6JUXlmZd/h+FbCP/CurSMogluyAkiJ31
	 gRRaNZrcTiDG/HUXyQqFdiikNaMLuFFZhnEsyjCQ6TLCWqsTOEmJUv29ioIjBYyMoPtXw
	 /TzvK5EUSNDiFBZda1hNv0oE32eKikqnzeBD652Wu9SqzYdmgtlDcjS3oufIw3XUUBBiS
	 sin8orMcZktQDsjnkPipy/1GAi994XVY7AD/ne1g2+VRUkkV+bQwY7lAGxhAxk86tXez/
	 /ykIYzOErIS8VOfPp2ahafJoHG/6XfA5e0dI9+QuaTp65pwcha20QK5It7/YL7f3psw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789489954;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eOLOFwKRGluHyOVQQlxJevUUA61I/NI3TrbF6dPAOLE=;
	b=CFajb6eDzkKD0DODHcZ6heZzP/CjZ2Hd/fO8Q2OFxyE1K4AYYPoZ04iKrkj3XlohMfzV
	 VIjW3mRUvp2LPFojEatnDg0uqaX0zYpi6+IR7oRmth2a6yp3/Fbi6ebYkflJDrQtwIN9s
	 xX1RvGsUVJ3nxIkCWSIpTpnN1eFrz4RK2JchkSfvv5Y0zx8e3baVJ9EqMKdBFR37eM9PR
	 5o3YP+Uoc+TsHcYZynPGI2ZbwosHI+pc9O54BmDxzJUruHcMa9WpQ4knckGZ4pf9SMwCl
	 hXB4gNGg6vzAz7AQ0tkusgQsReXhb6yrTlBG5lAa7lBhX1hCVPFK9IoGtY9DLJYYN0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789489954;
	bh=eOLOFwKRGluHyOVQQlxJevUUA61I/NI3TrbF6dPAOLE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mdju+PN/ah7eYehTW8AMKMX4KmvBQVolvCEb4UbmQOVgNvdMGlONFmejryB6uQmJP
	 waHsB6hmrIG0Hh67yrzDPhHJHyNPTtUVkMpQ5b3bjqpCBXKZzhoBZ0eYA/MIveBd8o
	 yasjnW3MNmIAQL3KqJ77RJuIZmAVoHO3kDYCgosT5uFyTuB7zxnv+M2pfFseXARyMO
	 QJaV9byalopkqUWhaNS5xAHYevwvQ6HHlwe26ZNYsYeD4DheWnlBdXBt3BTg4KFgjH
	 epTYJt2x+OKtz3ZpvwwJPTPriSfJqq5K4Kd5os1s08RbV4FQ6lGCxx9/PQ9vWG8j3a
	 n8eRJA1SkwV3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBC12404F8;
	Tue, 15 Sep 2026 16:32:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE9F82E3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4761404F8
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11QJ3DGfNCgs for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 16:32:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AB83C404F2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789489951;
 b=U5oGgbJ/D8W4TGZezxooJMvsXGXVnpLuroXQooJsuq/o2ZLBT1k2aiMLJGO+prP/HR+9
 MDHfvMzKtp6Ze1IoZ6S3qxA4xlM7hJ/bzrqW/QPoOsC/G8+1C2/K9eI+K8axof1lT9qCP
 iwVh5TATngmxbzVGXarWoERk+KpaOU5LEMcQQE+XPdU5RcRGhcDKUQOXwnuZPuEfSicNb
 24w8cDaIb2VqSjifwQA+lQzk4oeFiXxkOI6d4/VGA5+7WFuUfS47IehdFFdVF0urUd7lF
 Ptycv7dVODLB9L2V/X6tAyX5xDQiKiVA8vGgiGbZFhKp91gASDIjzZKfY4ijNIgU7+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789489951;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iwsvjHhHYi9AkUrKypwm6HKKwLQCdJC3WMrIjkgnSwc=;
 b=cbA+xzmkoGe+1V6SOYAuRmpyt02wPTIvRdPj8C24HcF8Xvc8Hm9JepMhh6OrZpN/upqu
 jJ/C232pgWhxy8Wfk0do9mD/1TBEvDe+GH/Lf2K87diXeyE90LGUf8r7i7rbgJ8eq28oQ
 zBq/aaMCpz2pki73U3YXaz9g2zBt1Wbq1nfxnSUD7wZPbnyXjY8uXJ1p65pfowcVZe0Al
 XIVvYXKeYKMQUNPnjJ3MmMSI8AFaYw8WOytgXCyWLmnEMQG6fxbUA3mrleWlwFPXAKxF5
 ztxtfNGw8kgkEsPX1bVBFHXJCom1PSZumi6bI5G5ugN/AwDxDONaY6M47qGAmRSYbRw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB83C404F2
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:32:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B519A95CD1; Tue, 15 Sep 2026 16:31:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 18:28:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fd1f6b629862f48e832d7e0379a7b48dc9eae42
X-Git-Newrev: b26324b6c0c6d88b6632bfbf0c35777c646d436f
X-Patchwork-Hint: ignore
Message-Id: <20260915163125.B519A95CD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump version to
 20260910
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b26324b6c0c6d88b6632bfbf0c35777c646d436f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Updated the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 103f4ecf7b..c9cb054689 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  ac17c34fe73756926a961fbafadf8d8f07a3bd2dd2f4ea31a0fb5d50c714a49a  linux-firmware-20260810.tar.xz
+sha256  f3937ca282ba256242e2b6dbe523df8a80007d29ffd61f56d270190865492ea8  linux-firmware-20260910.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENSES/LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSES/LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSES/LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSES/LICENSE.sdma_firmware
-sha256  7b828cc147af7a6cd397a9cd33c23eb95f7725b6bf96fa428261198eb93bbd75  WHENCE
+sha256  8bc466434be59e1c044cb3821b30b7328859ca250a451bb6c799ffb21ae47f2e  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  LICENSES/NOTICE.qcom
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENSES/LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSES/LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6025436c84..c5749513c5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260810
+LINUX_FIRMWARE_VERSION = 20260910
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
