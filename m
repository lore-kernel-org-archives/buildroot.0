Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A788CA6009
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 08:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E207380F2C;
	Wed,  7 Oct 2026 08:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzC5ucui69ST; Wed,  7 Oct 2026 08:05:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 10FAB80F10
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791360342;
	b=nXgXCTjcP6aCKpBdfoRVMGRT7tqu1dX1wSAH5RbVveixpS96GK7ciC6Kz+Shbrh9Uwbv
	 3YA13BuNHu/8ShH9kUv21hH2cWRYuI7+D2t0BsRfU6+Z054L0EYO7vTvUTvtLzOkC4lQP
	 k/TSe1VGvrZSPouN0bkq4lmFK14hUxYbITXjQ1hXsdMLMA+B3VKO3zH6Sl7zY+JY3RKbm
	 bUMV5aJUmnqQLXU9CqBXsS7kWObn+yR8QUNdZebs5OQXjSlqO+WnPKbTnsjl1Yk1edAvx
	 FNSCdzoJWataKRx/w9YaN/1oq169Z/MGQFI4T9A2HPrTYNCtOquL9v49m2NdXWTyOWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791360342;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlVZYxiePzBM45cpd82+oxWeoR68qY30A4+VuukNVVU=;
	b=EtYaeIHLBCu5o5UH2WdO7o7U1sI8QcMMJ9TCPvnNfzjtfqy485Rs+3mWSHtnichVSbLd
	 Cekb94G43LnF9OlHmNS9q1GBTNpnnVbfAJTHkWi2kE54sZfej0qze2nJ8dt+n7oG5dhg5
	 AJ/LQ5HRc/PS/Q91j8NvkE/fVIbrEl1s2KQnfsCZDc9xdMEfnzRt4GWjvhOxesgp3DRIC
	 omRAWU/QFeMpacjqtyTW8nqsVr1Fky5skPs8zFUca9KAFM+5www2350Al4TJaxLw7oyke
	 rGB4z0A8YrQSTezL2IjUDlOrCvXgacsi/z2yVWQgEOURT/nNS0AHpSJuWleRshO1nwA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791360342;
	bh=WlVZYxiePzBM45cpd82+oxWeoR68qY30A4+VuukNVVU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NyZSeLF+lACzYFZCTS7dCDbBMrt3tyCuTz3iDbN6sUC+mfRjl0L+21w5s7vWP8UPh
	 qm/f5I5FoJ0Wx0T+j+o2BXTdHA8f1FC7XubakFGqWNMRiuX0ghk0l+DPCr2+uV9q32
	 EMJJJkOsi+GnVAvuA6cvj4+uWmnaMlwpP5obMZoLLd70ITtzW9kyl5jCzfbQ8C6bRq
	 UA2aKc+ubeKEQ1uTrl3V+uZvrsbSap3ZKuGaLh+8RshgBvLP0lMsdwnM+AZOoup2eX
	 i6IG+atuJlToaMf1DhhPXUhVdxVJ/vhWnw12x9iY1vLInaoGiHhlnVGYFzncj0TrRz
	 sxBY9HNNS0M2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10FAB80F10;
	Wed,  7 Oct 2026 08:05:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EC74341
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 011ED40070
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdGoLQQh3dVE for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 07:57:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 565B440062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791359844;
 b=ZNJXQ1iITVKsPvukaME+HQcR6MvaJ8/OrHp5eJaIo7FMnZXvFVM4Z2Oy8cK+sHeCEawi
 5WhhH0F5R5Ocx/U6qPeNQlf3eBcB+I8vEQ3jhbrz7AeWGs5hpWimcgmH4ZfQDFZEgIY6C
 csRYvTNeqg8V1SE4BZG7nM6SneIZiA/nguDAR3gWAbkNXX2yLzfvfe3iClyp2D5K5gEh+
 2VI/hSJPjlyQ2+pY4ahr0PZwlZ4ewHjs7TtW6gl2SRfRGAshWGcDuMevT0KP50ZuAYuyy
 3WJJm1VwBL+4jAeSh21MARdhm1GBW73r6dkEhOaFYi6DS+3wVp9H9b2+hzqiR9txtpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791359844;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3sPdxdzjH6liXJkDYxb0tjbAfAiZv2zCrAGzutVuk10=;
 b=hXTuV0lJ/iC2DsCONsS+c8VXfm3NlcbjVu7ANoSRnRbrfngKZBkEmIfwaKVncbdeQunS
 +3Ci4fc2wBbXSjZHfBZ+uoQ5ytWooAfUHEXRWrV6TNnhUejVTdPEFygCa6kIaKFlemk1U
 rJETUqV1czvs1VSNntH4o+pBt0K9gaKJ07oWgbv0x0yadysEXwD4Fjd8CU5npVWOmjgyu
 KNX2DHfMfOtueSP5tvNmVRaSnbtpelyK24GAfg+b4uEAvSznb9D9Vj+PtRHq62Gm6G6Hi
 L1tS3PJ2gtwrMpYgwejqrFbRfSrSgeFysdUo37v6y8AlPOUMX8dQPbc8xOZP+Pc9qPg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 565B440062
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 07:57:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AAF78DA9C; Wed,  7 Oct 2026 07:56:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Oct 2026 09:56:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0594de6b1c1341d28e5e1b781f44d8f3757e5c4f
X-Git-Newrev: 716a71553911e0c812c3eeca74974064844e79aa
X-Patchwork-Hint: ignore
Message-Id: <20261007075607.9AAF78DA9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: selftests: use
 KHDR_INCLUDES to locate the headers
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/716a71553911e0c812c3eeca74974064844e79aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since v6.7 [1], the KHDR_DIR variable isn't used anymore by the kernel
selftest Makefiles to locate the kernel headers. Instead, KHDR_INCLUDES
is used to specify their location. It was only available between v6.5
and v6.7.

Keep KHDR_DIR for compatibility with v6.5 to v6.7 kernels, while
KHDR_INCLUDES is used by both pre 6.5 and post 6.7 kernels.

Let's pass it with the "-isystem" flag, as is done in the default values
used in the selftest makefiles.

[1]: 43e8832fed08 ("Revert "selftests: error out if kernel header files are not yet built"")

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/linux-tool-selftests.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index db7e4fa1a3..032a71e320 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -24,7 +24,8 @@ SELFTESTS_DEPENDENCIES = \
 SELFTESTS_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
 	ARCH=$(SELFTESTS_ARCH) \
-	KHDR_DIR=$(LINUX_DIR)/usr/include
+	KHDR_DIR=$(LINUX_DIR)/usr/include \
+	KHDR_INCLUDES="-isystem $(LINUX_DIR)/usr/include"
 
 LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
 	/usr/lib/kselftests/tc-testing/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
