Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAB0C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 20:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31BAD4061E;
	Sun, 16 Aug 2026 20:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1IZAopTMUss; Sun, 16 Aug 2026 20:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 019E2405EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786912333;
	bh=3HHr4ILdnaX0auWQs7beqmWis60KbUNLPqkxzuXP6Aw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mdqfYehBQ1Nnkyk6Oj8iWpuifHjyv82juOvjOU4CwCHbScUzY+1QDttGXrutO+zy1
	 dyAs+VWqQM0grretwhYjwxZdtgdYv+N6HIDwPm58OE67Mq37Uu0t6NDLSQOVK2PbtB
	 T1U0KCHa7TYIaI91tn3WD6lRG/50nsEC0Fw2sZyEV+20OKqgZ0CsNZf0pOlTXZLze7
	 iQ994clDWIlNd5GSC9nAniUKFDSygImmlamyejqqtluOlJ2zzRgWREkNd7BPb8J7F8
	 d4WBZGObFHul0zzILSXyqjw18th5U8+BNmoWOlIia702en7Sagesp57oysOEsKRBbz
	 ZiTEu6dXNJmeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 019E2405EB;
	Sun, 16 Aug 2026 20:32:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36DFF147
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28B06405DF
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qDqLoTYPsLV for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 20:32:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EEBB405EB
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EEBB405EB
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Lr2WEYBw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EEBB405EB
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786912327;
 bh=CNKpITC2wixPCNP5laIApxI9SUjPIaIp6Ov8siF8BIo=;
 h=From:To:Cc:Subject:Date:From;
 b=Lr2WEYBw/E+fR5GFxmV/n450Iw+WK8h9jq73TINkLO0Uve0K7rtI6Xyf/vnudNGjk
 9iL50Ehgq9xBXoasafmfCsr71aDpKWhXmh/VabJwR04zp2U2s/ImkpRWLXW6DXX0YB
 2pEDrNlZsllx3sG16p6AKAUHal3CNMKyVWCF7dQw2HU3ffyz7UHA6F6OI8DZIuBPL/
 E9Y4QHoz+DQWhmdc2PSbZbq7bgDTzoVtTykBqyBwM9NEz2oG3Lk76KJkhXRx8EZr+X
 nJEQ0LXGacZ5sbQX/DEEDv844O5Ab7c4Y/cKalNPMo8UrUckCpto1IUw0iIAqSoeCW
 VbJFNa6hkeDyA==
Received: from fli4l.lan.fli4l (p4fd6cf91.dip0.t-ipconnect.de [79.214.207.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C414DA4C387B;
 Sun, 16 Aug 2026 22:32:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53480)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvhWZ-000000002MC-23OA;
 Sun, 16 Aug 2026 20:32:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 22:32:03 +0200
Message-ID: <20260816203207.3980846-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/5] package/containerd: security bump version
 to 2.0.11
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containerd/containerd/releases/tag/v2.0.11

https://github.com/containerd/containerd/releases/tag/v2.0.10
Fixes CVE-2026-47262 & CVE-2026-53488.

https://github.com/containerd/containerd/releases/tag/v2.0.9
Fixes CVE-2026-46680.

https://github.com/containerd/containerd/releases/tag/v2.0.8
Fixes CVE-2026-35469.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/99b74ab8c322d7aacf9b9bee370fc273a0dc7fa5

 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 0916c603bb..410e5d61e1 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  2bbf9fedcf4ab31736fcb3ce224ef22610a87da9d53bbd8f6d205710fd849831  containerd-2.0.7-go2.tar.gz
+sha256  eadaa5301c0f633f6fed6a3b22f5cf4343ac522401ad2e84bb3299f811a35976  containerd-2.0.11-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index a334f0fdac..4a3a371ee4 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.0.7
+CONTAINERD_VERSION = 2.0.11
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
