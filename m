Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD6EC4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 20:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 485D760900;
	Mon, 12 Feb 2024 20:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRbFI79SukXZ; Mon, 12 Feb 2024 20:27:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BECC608FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BECC608FC;
	Mon, 12 Feb 2024 20:27:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BB921BF284
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 20:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18EB281ED4
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 20:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kBNA5rlhlu1F for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 20:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FCD381438
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FCD381438
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FCD381438
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 20:27:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZctQr9PnYPYgzZctQrcP0E; Mon, 12 Feb 2024 21:27:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 21:27:08 +0100
Message-Id: <20240212202708.3514522-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFZfYhZIt7nbCk+Ssta0Pa6wWuBjEQJQWPvjm956jP73T4CIuvCbDn1et1qLDxubQqXXPRSU135lzFgiYVNehPkKHe5FWbKu+yqUCSq+jgAtdI8tiRs7
 4qf3TWom5UUmwVl6EDX9CtqDKefGTK6X1b7RScxY0irEQn4Gjqh1JOrCyBbZKkX2luIG3NkyIRloXXfT73XAdXhqRw+hYKKD9zwIYRq5wlqn441Q3m/cq/cU
 /8WQleFM6RHeNF/sO9SOjcsNIstSU81/m4XgPKxXOHYh9MuUBvUPnlcr1jgfedOERjbeRbCJRJYAu429it2LYA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707769629; bh=Ve1ecL7J7SrbEP0Db6Au94a+RJP+J+oX7nYO9hYQdc4=;
 h=From:To:Subject:Date:MIME-Version;
 b=Lr54h0E1PjaO7HmmJKXIiRdXvHrM3Q8MZSkKw/eaT06B1iPcidBOE3Uh63GXQJJxh
 3PkPcRy5lbSrbRJROzG/C9iJ/yr4JFXK8k9uYx5LVm2afXuuUi5RuS/DpFswSkWlc8
 lAq8x1OX5Xik1PqREhKrrN01OgWNv1PV4VOjbIvJkPbDxpq/JWJxXrCzQuMacat5C5
 ICR9D/3TT/GTQTHgSt0FLSGj9hsEW2JSI0AZtYbwgUkTZIgqOKKj5UyD4WZoLgjPOq
 PwMeWsoApQjc1A5dm3wkbityQy2Lb0HAr74oyP/HAOyof8PLjvuNPxoqkGW8dBlF7s
 jqJWECXs9cGGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Lr54h0E1
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to version 2024-02-09
 on branch 5.11.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It supports up to Linux 6.8.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index e27acba124..a08ed04010 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  2326902c27aee022bd1f6e49e8dbf789b08613e660385c23ded8038074d7929b  rtl8192eu-a928f08c1dd4f9a1e84d85811a543e974551bc4f.tar.gz
+sha256  b5d3b8de0b4f05aa2b452dd01f4386e9b671e03c2bbf8e032f1c593befc5a153  rtl8192eu-e90a6043be141bde8847e84223e106eff38ecdfd.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index a2fde6fef0..3d24b0caf8 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = a928f08c1dd4f9a1e84d85811a543e974551bc4f
+RTL8192EU_VERSION = e90a6043be141bde8847e84223e106eff38ecdfd
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
