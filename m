Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58C3CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8460F82392;
	Wed,  6 May 2026 16:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNNSU5c7HEVK; Wed,  6 May 2026 16:41:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 945B88254D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085696;
	bh=lBn+UAeUS6tdUV3US6f98XQLflBzXizb+z45fW5kfv4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q1UwKlJk7eQs/nNRtMbk7COxeoZ80CDx1sNmz+F0DQOfn1nA3N1LjBqGtMj/WTu9k
	 uPzIj229wdJm1MOyWytcTugv49Sz/I2u40CGxDFd2GyLBet6bZOZSjB0Gx6RLpQbQ8
	 U08CiYNCvX0TqQq1WJyQad2Um+vKRajUwtUp7neioHkvfn9/nuEf2sSl1t/o35i1S+
	 j2YzlvQpxJ32MBhfXVvT1Af9GZJE72kDxO6ubZfknEH0zXcVXqf/JWinCNS+njWPID
	 264tZTUILxd82ak+VcpCtwMjT42WTFl8VTUjYTTeibjlre6f+D7fm8Gda45jrARXol
	 YwXkWxLWE5U2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 945B88254D;
	Wed,  6 May 2026 16:41:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B077D11B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96AE940EF9
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKS5RLa3NoY7 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:41:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD80940DF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD80940DF1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD80940DF1
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:41:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DFC92A4C127F;
 Wed,  6 May 2026 18:41:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49316)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKfJU-000000004Gm-0NWv;
 Wed, 06 May 2026 16:41:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Wed,  6 May 2026 18:41:32 +0200
Message-ID: <20260506164132.1336919-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085692;
 bh=9Bayiyg0AzAx74llGguvyAD3rhFqcEk94VtmxUgK1UU=;
 h=From:To:Cc:Subject:Date:From;
 b=k6vt+EAnstW2/EoDfTnTUf0DhIZO3cSU9l1BS1ThViGeoVq4yw2slvMhlkfEo15q6
 1xpMIt4rSxPxh+DQ1VtjmoqN/jPLSVn0z1EkCOo8ucEu1ZWo+kZ2Ckd/oEZPfPW9ov
 4Br5tA4Jy73+i6waf6++EFYVTBlvcRBeYq/XyO7y+DucaynWky5evy5qc9VvUnnZOB
 uNhFmLrQ2Q8RUuMYusUGKd+iyGwiMnAwNDk3BD8/vmTvmnP98CdqNaDF7NMYR+KuL6
 iUEspoFC1zUVPzF/bMfbsc3PsFxuS+vc4t4LQoVhgM6FYxeviRspkNRdBE2J6ZZbSR
 EX40d2nGx7LKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=k6vt+EAn
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 22.1.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://discourse.llvm.org/t/llvm-22-1-5-released/90734

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index eb3775659f..9155ba8c53 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.4
-sha256  3e68c90dda630c27d41d201e37b8bbf5222e39b273dec5ca880709c69e0a07d4  llvm-project-22.1.4.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-22.1.5
+sha256  7972b87b705a003ce70ab55f9f0fb495d156887cba0eb296d284731139118e2c  llvm-project-22.1.5.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 1aa02e0800..eedef3a1c5 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 22
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.4
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.5
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
