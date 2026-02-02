Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D58E7DEF1
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F7DE82419;
	Mon,  2 Feb 2026 14:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CESA7GxK3vsw; Mon,  2 Feb 2026 14:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B49D822FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770043644;
	bh=v4GTQUv3XEeq0JfT9XuecW17zGVuQcIlyFqo2sfLFmw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MrGGrn7IHWEPdONUNdPd6tsT+OLCs53ha11j6zPYQfszpTYKscgrDgWhafZr10A8Y
	 c8QwSDtGMXwVQuBz1lIOCcJcFddH5fRga5Rn3ZUMiNpgwAcBAWbsLTJ0pnBvbauSpN
	 h4vaoUL6XS2HsHTChnFYWdLjaJOMY6RCoWwz5hx5mGnJPejOBE4asVQCBtkc/FxMpc
	 xI8ErOTaQUsE+4/ViI1CjcEFaLXHHmlh8dFJJJL4sqBmBC1W5on85OjSAZr6KJgMz+
	 n9iaTk1mX83WJOg8uLH96iJdzY18cai4SacKiqrUlZPDMJ5T1cpbaoil0yiVJWLkXU
	 0P4h5QEeQDIAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B49D822FC;
	Mon,  2 Feb 2026 14:47:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 778C51E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C08B822FC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNU1NqgEeQYw for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:47:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50BB081701
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50BB081701
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50BB081701
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:47:22 +0000 (UTC)
Received: from home.juju.sh (unknown [109.89.232.55])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 02D6B19F57B;
 Mon,  2 Feb 2026 15:47:16 +0100 (CET)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
	Julien Olivain <ju.o@free.fr>
Date: Mon,  2 Feb 2026 15:47:04 +0100
Message-ID: <20260202144704.980271-2-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202144704.980271-1-ju.o@free.fr>
References: <20260202144704.980271-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770043640;
 bh=IdAqSppc7jfZYt4Z46jfRT8K0jZQa7sFqLvqOxJyKH8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lEjxr2A/3X0C2DV//daEtIw07aD7ZG8BGoNUwuPinQKCTT3fwBrE5USthnnMmPJXs
 JpPhhinFWmo7/+insp7jygdzYLS1izSCoL8m6vpyD5XQOx8Sd5Rm6SD61wJjzaFXqq
 p2/Y+T0dobKwFS1jjcBSij4kHDGS7j5LjCylLesyjnu8S9ANXaS90M6CyKABUI/d7d
 M/vzTcrH2ayRpvoVfJzUXy2qbyVmSxb4Fyk5C+aLE7W6oYzAU7wimhl/+5Bi6moK23
 DXa4rdJOBIHUmHbebN8S4fM5uphyw+p2xXHxnmlw2BxRvH8lcWCkrZwn/sdMCmaltF
 419Hl9Zgt0oBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lEjxr2A/
Subject: [Buildroot] [PATCH 2/2] package/qemu: bump to version 10.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://wiki.qemu.org/ChangeLog/10.2

Note: this commit switches to the new qemu stable-10.2 branch series.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qemu/qemu.hash | 2 +-
 package/qemu/qemu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index ee70e67694..f8e750225f 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  fbaa7a0d7a9a1deb5695b125916746ec28fe0de6275d4454f3e3bbaf8b339b53  qemu-10.1.3.tar.xz
+sha256  9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d6672785883a  qemu-10.2.0.tar.xz
 sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
 sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 5cc98138d9..d7d7971941 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, check whether the list of supported targets
 # needs to be updated.
-QEMU_VERSION = 10.1.3
+QEMU_VERSION = 10.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = https://download.qemu.org
 QEMU_SELINUX_MODULES = qemu virt
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
