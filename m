Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BCCCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 16:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BD4540887;
	Sat, 10 Oct 2026 16:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANroyrMO7ktH; Sat, 10 Oct 2026 16:34:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4487F4088D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791650053;
	b=MmR07TBi/rgQBGWMregATucP9n1oCGh3veiIZBBknh38X/9yoWQfpMIjVWyDSYbE0VJC
	 2Ni7oIOdiFsm1S97odA3EiW+v86sHsUy2+qk5pg/nbiDU3uzhMXDM8rnMKpPApuU3llp0
	 +dYIVtvki3JCHPg6VnP7mt5Mm1NBGpcX0qNGBSxwupLVRlEpn/WoJeDF3oo3G9SiSNlim
	 a3+nGgpi+IwCIj60ScZ4BdnLDy4P7/etbNQH7ocSEuPAeh5vAemdA7enyPqrCN6Cr1uQK
	 Q1r0zcmMm6L86F3lWlTGPNd71s3daquW5t2Jt6vZu6KSPoG/wt2YODV4Bs1VVZINFng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791650053;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CaPV555eF5TdSWHSFN9gvcKPuu22xlk56XNNc4oWgj0=;
	b=LvUUJ4f8bEAR8qhvxAbBFmhKwxi9LtauWQJeoEWCrC5o1hilZJlodd0qpUA1Oa7NyH/Q
	 6mmU2ykaLFzY5vs/Zsp6azNbHoR0eCEkKGUNJbKrzaQBqVB8fM1GioWmyTOf6Cb262YRC
	 geh5BTOPxesanZ/7NgJsSfyv3rHGElina8T4r3WkdZNjPpJr7dl/TVjhiIfEzcMXUJ8ik
	 mmFrL+27vKPbfV54ZkDtQl8aOWog934+gqxouixTQO8g3hA4nnHm4oyMzSF+yeno6lNNi
	 STYud/6XrdmXT3e6HWNqCT59tG2O1X0MdtIXc6bXxwYkXNOw4e2jomxTz1FOAsBrD0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791650053;
	bh=CaPV555eF5TdSWHSFN9gvcKPuu22xlk56XNNc4oWgj0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d7P3gn3K/1UV3ZQyVPbP+7J0cL+ossEF78xSQnSwVjZJDaZ+ly/O+gSmV2zPYcauJ
	 7nwzZSX/B7anqLaoUpgKNIQ8S4Xs+dVa/Jw/qVmMC+BVMfUM28niXQGH2GgZO8RVns
	 0P0BguI+oW+FiFW+KvHdF9o3xZY9Ic4ZBX/mxmHIGgABf3mjw+Z2YsLTaptx2ucJwG
	 pUAW1PTP1DOjH+FLLjPTytBiqF1Uf9t/dpi9p3NAQEBHTF9DnBIxdiRrdHgi8aN4jU
	 cQwzji3YQ7dKrPD4OyR7Q8b7cjdAe3dtOxS3V69lvG+ISpz1ffGa/H3iMIVJoNIlwT
	 cOqMmfzIUJnnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4487F4088D;
	Sat, 10 Oct 2026 16:34:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63628156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FC784070C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:34:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TT8AN-WmeDRh for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 16:34:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C9AE740782
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791650048;
 b=s02lNXa98heFcJfD2ibGpMdJnl0OQkEl3zOBLdlV2HftxjkF7y3AUNeSh5oWpRf7RpIT
 G2pmb5LtpxcJ/z142sQPdDRVFl8E/mPhS1xL8++a4b7zCa/6dhnkMw7w5OIVazcKumAHF
 VtpaeloPsTWGuil2se5dGi2XdRqZGhTDTVCuneLYEuihNGrYt0cN4Gm3ghdo9RPlJmlOu
 UtvK38H3lVM+lhTCQCYljWuPzXZKuX4a0y/uVS2pQ6eE93sk9wf6qsSSIjZH72fTLFcnF
 DcU9wVoaUI4BGqlTRAK32xpaaBC8k/ri7F8nd7MqKgK/Pl0kMETKsHP8I47Lz9fGvTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791650048;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=agiUs3B3NdfjH9SBaWjwIOL80Qq1oPngCwB53iN7sQI=;
 b=Ksv6NG0htzBv5qJ7l0z+qajpOFlwTdRWy1XjIfgbEyrdrrX42vdUsoHrvkPXoZW9rqrm
 ICVy8rN9AqJ3pA5GzLz0KYTlVX8n31f1bFCeFuhyFi8cHLSAsy4UgSYE8PdYC5E+rV9W/
 gdA5hxHg96A+Vn+qmbP1sGyNYmROpUQ8BNYqv6qPVOI0zgLnZl1KBdbWgc2pv8fPBlYpw
 rrnp/j0BwvIKajgdh9FbvRwJWv7N3sXFlY6aSsDpTzl7SaEv1VMjMj3OzLT+YUvlA4Q/m
 smwxFDhkqP1R3X8J07GWcDDX7AMlzYAkjZByIfS4azyk+1g1mY8fLPN6OISZyHhKvYg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9AE740782
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 16:34:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84E7C92B40; Sat, 10 Oct 2026 16:32:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 18:33:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9d690cc5ddb7f75249b5544a52fad269dc1807c
X-Git-Newrev: 98ba8f3951ecf7b968a7d3a6f65ec14acc51b568
X-Patchwork-Hint: ignore
Message-Id: <20261010163250.84E7C92B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/visionfive2_defconfig: bump Linux
 to 6.18.55
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98ba8f3951ecf7b968a7d3a6f65ec14acc51b568
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When running iperf3 with Linux 6.18.51 on VisionFive 2, one CPU core
stays at 100% load during the test, while network throughput is limited
to approximately 793 Mbits/sec:

[ ID] Interval           Transfer     Bitrate
[  5]   0.00-10.01  sec   945 MBytes   793 Mbits/sec                  receiver

The regression was introduced in Linux 6.14 by commit df542f669307
("net: stmmac: Switch to zero-copy in non-XDP RX path"). It leads to
misaligned access exceptions when parsing packet headers. During the
iperf3 test, perf stat reported approximately 9.6 million alignment
faults over 5 seconds:

$ perf stat -a -e alignment-faults -- sleep 5

 Performance counter stats for 'system wide':

           9620073      alignment-faults

       5.029337000 seconds time elapsed

The kernel must emulate these unaligned accesses, resulting in
significant overhead.

The issue was fixed in Linux 6.18.52 [1]. Bump Linux to 6.18.55, the
latest stable release at the time of writing, to include the fix.

[1] https://lore.kernel.org/all/2026091704-CVE-2026-90059-36e6@gregkh

Fixes: 98aa14a186e1 ("configs/visionfive2: bump Linux to 6.18.51, U-Boot to 2026.07, and OpenSBI to 1.8.1")
Assisted-by: LLM
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/visionfive2/patches/linux/linux.hash | 2 +-
 configs/visionfive2_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/visionfive2/patches/linux/linux.hash b/board/visionfive2/patches/linux/linux.hash
index b2cfc9b7e7..63b8047edc 100644
--- a/board/visionfive2/patches/linux/linux.hash
+++ b/board/visionfive2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  linux-6.18.51.tar.xz
+sha256  f410638061a165c12f42ab871d2f3fcd525515359b5faeee80969cff84524df9  linux-6.18.55.tar.xz
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index 7ce605b84b..6ae6f25a8a 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/visionfive2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.51"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.55"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/visionfive2/linux_defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
