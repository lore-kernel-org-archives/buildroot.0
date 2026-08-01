Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9F4C55173
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 11:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50EF540818;
	Sat,  1 Aug 2026 11:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFht93_pHLso; Sat,  1 Aug 2026 11:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3154D4083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785582686;
	bh=ZS8Vs3SyrgH8SdSPNwNdjxa9ribdHDmUp4Ph7hCl4WQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e/R5rNXWMCWeGckugOGQfwZVHe61Wk8ii6grFq9kjlUsz3YBLfaZbzSMJyN4l+2l3
	 DfF6BXa/PR3pqXhTjin8pn0p/6Mtb9v7fPuQMDbZ3sd4pxbEzJQPNhAH1HDN3ca6ih
	 E2YbEO0dUR47fa/C98muZ48rIrP5l4GVdAtwYH6NFAXqy3BCgcRh7OCe1+zfrDKNur
	 QZJ+zaPsy6q4gAiu1UwACGEY73/OeuB9ZoAOmqeHOjXf3D44d2uNlLs0+wUX95YsSD
	 hw1zGYyXudq0YbOk18njyAs2NowzLEYFno2UtrJ5gZEPFKS/occGuQfbsXckcCwDKI
	 wyNMNaQY1wV2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3154D4083B;
	Sat,  1 Aug 2026 11:11:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C13AF1344
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C5564079A
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQq-kHoA_jxk for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E60DF40798
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E60DF40798
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5477286C0F; Sat,  1 Aug 2026 11:10:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 12:35:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b5eadbf1f2c1657b16de8dc8099e83df08bb636
X-Git-Newrev: fd685fc8c2c061641e94bff8f5db76d49be6a18b
X-Patchwork-Hint: ignore
Message-Id: <20260801111037.5477286C0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: fix build on mips64 n32
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd685fc8c2c061641e94bff8f5db76d49be6a18b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_ARCH_IS_64 is set for mips64/mips64el even when the n32 ABI is
used, so openblas was built with BINARY=64. Its build system then
passes -mabi=64, which conflicts with the n32 sysroot:

  gnu/stubs.h:35:11: fatal error: gnu/stubs-n64_hard.h: No such file
  or directory

For openblas, BINARY refers to the pointer size rather than to the
architecture, and n32 uses 32-bit pointers, so BINARY=32 is correct
there.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openblas/openblas.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 64e3b00691..ce0a21c5e6 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -49,7 +49,9 @@ ifeq ($(BR2_STATIC_LIBS),y)
 OPENBLAS_MAKE_OPTS += NO_SHARED=1
 endif
 
-ifeq ($(BR2_ARCH_IS_64),y)
+# mips64 n32 is a 64-bit architecture, but with 32-bit pointers, so
+# openblas must be built with BINARY=32
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
 OPENBLAS_MAKE_OPTS += BINARY=64
 else
 OPENBLAS_MAKE_OPTS += BINARY=32
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
