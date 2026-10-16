Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ED5CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5404F60AA8;
	Fri, 16 Oct 2026 13:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKs-efQqNGZ2; Fri, 16 Oct 2026 13:08:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5815D60B4E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156127;
	b=pTBBIauYc7AK/KPFPgG921rcioqmrUVwVvnVN4jIxdFTJi1oJuxIp1V5AAApS/1UYImo
	 SlN3fITtDwga51nxT7No+o+xN0ESpvL70fChlNhS/ZR0mRLoLtrfD0xXw6pQmGa0FY2dm
	 o/atJt0Y/8+I3bKZ6wQZd2MXEZm7G3Qk0qVgcAyfV/GQP16Uoa/1u1btgT88tBfXft20D
	 iCBIWIAARIqLHLqkfkJMexVxe7XMkkws2KF/KKNCz3fMvp0msRqbBkQ1Q1mQ5J5gzrRmn
	 oFjiX5HuKLDb08Gsji0ZXe8moIz5i4VL6tG/C0xyITwIvFieC6U1ZOVuH/CfowwQ9Jw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156127;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=f7i4RaPGF/7Bz+qCVdyFtWekBsfKMkZmtdHxFAsnP70=;
	b=pB2gP8PMuEDzz6QsKWX5dw8CQrtnOvUUfHnXoVZxjdDo9+zQ5d7f16MycoeTzIVbaNFi
	 9h6hu07D1Ysq/EVCrBX0j2DLbdS7LEVPeu/KNbBIPVy5FB08uyUfvdpyP4A0rQFaKAKlw
	 oXueo62tC2cykAlAD/7FOyQ4dU6ZJW8SiTxh2jj4UPmNPPMS0b2ZRHjbNaFKOJZJDFzU1
	 FLK015l3l1HiTUqY2RJTiSzQrlXzc40uRKlPW8/EiUxm0I4rfqNJ5XgVwe4lHq3mGorgf
	 TUD+i6LZCHV9gzvf2xg7nMjcCNX8yHfMSyxOSNezRT71EFgHM9PGKwMMzCWZ5arYHbw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156127;
	bh=f7i4RaPGF/7Bz+qCVdyFtWekBsfKMkZmtdHxFAsnP70=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g1MMeG2SNjt3yQjPE28es9HS438xvgATmacLQD6nnV9+gIz3Z6syg7J4HPNIE/pfX
	 CO0VidYlPWjCuDp07nVC+cnTZ9zl5TnOAtnfN8GSBS/ghbFLzqUrSMqRBCZbTzlAEV
	 cLNuntAkrOG12af90dneXowb66s5be7t4Ne+G/RG7eHt1yaXNenpszDPC7wzoxdaDp
	 iRnwLj89Z1BBo2SygMCT2B2nTqn2d1CSTmLDSZ1bLAqwLqfwYUbomY4p3pQKHIV2DO
	 xirRxMBiT7V8/mfnNrh5Um42SzB258QoyxtrXB+8+1qssWIfEONWX03ww0ibo1YhB/
	 RxLuluaxiGXAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5815D60B4E;
	Fri, 16 Oct 2026 13:08:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2507DF45
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08692814AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tv2cUFlrmJq6 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F17F6814BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=GJmo7TlXTHjG9wRuwJ6To1O6QdqN3558Fx4mbcpbqt+ddBrbCsWwc8HWjiVCH80wDxBi
 0szN4JwT0x8gp5TPWJ14h3hfiSBJliiRnDN4/MI+oeXb0I+5+v7KpqXHKx9eG+m7ifc8B
 HyI2Ptvb4RazeogdBvqQVSqTEEzTYpOsQXQHxj+l9QD5oAAm57qH+XXeNd8PeIR6UJ3pw
 Nhl669K5qjds85d1iP8rOvo147Kv5LzLIL7VocsrUCIMX2RxSupu64CvwQ8l7fuMFhSgi
 Pje1b6e3HGqlbW6LepRB/ZMZ5F0qIzGYrA3zpOn1UzFCuVwKvyo+AueUBkaGsOzsu1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=J8RqYx5s3iu/D78EtmJkNhVsXvjqrFG8WUKdEIgTdO0=;
 b=EJWy4/O2M+WMNEhKqKBfscoXLh760J1jneF3rhU+xkar/W+DVHGfR8DFQLqiQASAko97
 OmcZgmFnGRvPUeOZ7ToHT7R1Amb8nvkJ1T/RYjPXCmGp0HKfbU8PDavMY9U9qpHCDW38+
 /tzSbfJikDR7l9uuD66FoVXSCJvIVMUdyUTQ3BEiXkJwgASxjpuZhYfZNESP6SUCAi6v3
 VmkKtEfIahiEzQtyYt4fntqkyrz+uKNMLxIKuCNROlDhA295PO20iE8J9xpdwE0i7DTxj
 X1j0dFE+T4YZo6EpbrjNbxIvhndEKvZJHaG3EF+YnYygVvecEx8b2LhdKvEQxT7+/ug==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F17F6814BA
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E27D3960D5; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 21a76ca9fca296e9ec712b24ded4fbd30dbb1b74
X-Git-Newrev: 36d34369e48f190a590df3ec8dc5acc5a5154b9c
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.E27D3960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linux-tools:
 selftests: use KHDR_INCLUDES to locate the headers
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
Content-Type: multipart/mixed; boundary="===============4364118530901574871=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4364118530901574871==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/36d34369e48f190a590df3ec8dc5acc5a5154b9c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 716a71553911e0c812c3eeca74974064844e79aa)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============4364118530901574871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4364118530901574871==--
