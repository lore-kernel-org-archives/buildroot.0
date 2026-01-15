Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3F7D46609
	for <buildroot@archiver.kernel.org>; Thu, 15 Jan 2026 18:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EDD2843FE;
	Thu, 15 Jan 2026 18:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9Yu8udFOihE; Thu, 15 Jan 2026 18:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 135B5843FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768500070;
	bh=KoG8qbV4uJghwxyuVeffz0cUIkbAZ8PAtcehYeZfklg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l13EfjyYLvRswIO+rM5B3bRq1rbzYiQ4vCPB6Yr/vMcutjiRKJb6WtrTjf1tk27kh
	 AiXP1WIc9YrETtsWRR+84ndm1zRXMZYnE2zdKzsHHmm2TtEklfZ7fPkyqykfhZ7Esx
	 wr5ok/rWkUx12T0FfnDixpvm1CMQ/0JbA+wTw+jjlomaxhfQNFvTWs7bW3qllKKULt
	 Vfx7J9CrgZk3vGsEuv59oSO60NuiYnofX4NC8Vin/Pu1Xici/e02GWCvQLfoWe+gA/
	 vaBCsGLk5wfLk0PScqH7rRJ988SGRm1s5j9v3Yoi36my+NJO3mV3MAy2HiMghJvFtU
	 Euqeo8AWsWAXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 135B5843FF;
	Thu, 15 Jan 2026 18:01:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E5B01C3
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 18:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B435E402FE
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 18:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOfQ5-ctB3dg for <buildroot@buildroot.org>;
 Thu, 15 Jan 2026 18:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 078D840318
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 078D840318
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 078D840318
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 18:01:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd81.dip0.t-ipconnect.de [84.161.189.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ACDA7A4C435B
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 19:01:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54074)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgReS-0000000055j-19UN
 for buildroot@buildroot.org; Thu, 15 Jan 2026 18:00:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 19:00:56 +0100
Message-ID: <20260115180056.284506-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768500061;
 bh=XEz5Dxscr8UZ7dPwvILbJWIUxiOUo0jX8Jc0xXOyR84=;
 h=From:To:Subject:Date:From;
 b=bfEGsW6jGZSyCrgwv1boeOVVg6Zqn478ajRh50Zu/z8O4meEJTM7YXGpUFjREn7kl
 WizEU35oTUWgB0JG4Tt+zCpips0vJk6sP/7fgtClqOwpgF8FVczVilOY0TJdQ/AQ5A
 LmCAggo3HhJ5Mu0VxfOwqYlPowbrzIVdDkPU1OjY0xvVDUsTR+Nv/+tz5lWlgK1wYO
 /5mhMQkjncsKr3wyygiVhz/IpXa+q1/uFiTMHubVs8pqpPhkxzDCUalBAyVVPp3trc
 UXtEtV060FPLW1goVRZCKGZW8T71TRUQt7bk4oUZTzwVK2TzCQ3Y/PO2ABAWm5kPq0
 W58PoAU/2qIQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=bfEGsW6j
Subject: [Buildroot] [PATCH 1/1] package/lsof: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

Package lsof requires libtirpc rpcdb option enabled with non-glibc
toolchains since the bump of libtirpc to version 1.3.7 with buildroot
commit 3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream
commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

Fixes:
https://autobuild.buildroot.net/results/59e/59e0cc2692a8a7d587f5a4da90ec268237141dab/

/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/14.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld:
 print.c:(.text+0x166): undefined reference to `getrpcbynumber'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lsof/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index 48ceb39a99..424778d3d7 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LSOF
 	bool "lsof"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	help
 	  lsof (LiSt Open Files)
 	  The lsof tool lists information about files opened by
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
