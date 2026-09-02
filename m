Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EF3C624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D51926083C;
	Fri,  4 Sep 2026 11:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckM-B3IrAtgT; Fri,  4 Sep 2026 11:14:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D7E3F60BBE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788520494;
	b=hh1pbJOcKJrd9izYCPTXgYCTM2yYB29j6Bn1X5f242UBSf1Vu90+qnlo1ScUgjEYLWZD
	 S9CrzjgOtsYspUpuhkwTlW7i26+kNbZMXTz3rl8GNzeSp2Y4n5b5eByh+6SieL/mayoi9
	 /jjkPQIq4xogIookQFIJj5CG5cgAQ1+e02xPHEhd533iOG7sZF2CTYJ7a4FksV6Iz1i0G
	 G+ax1JJutcZ12e61TY7fykuiDBATFsEAlj/T8BqGL9uJBDh0hmtwNsBL/AVpXcxnPgszg
	 gf+AACAqLsb41xO+8LYhpeC5nSi69qKeprs1iYtNaRMQbm1s771wITf9io3xx/jtNdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788520494;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BB+WffT/9XdJIF4r2rtByLQi0qMXrq3RE2IOIRO0VFY=;
	b=ZUqUozQEsTlwlvZOFuxOAckfbl81J8TMBVV/Sx7xaLy1EiDTJesiicATPegduS7vdGP2
	 RVazec2Y8mDfs/46T5wt5VWS4BAvlSGlhMj14iMLoCAlLE4Ik2P6Vr9D/FasEjcfRxn9c
	 iHaf0IgCjQ0zGFTe8K4bW9deZw4UQi661awqG73OhKVzJGKu7EEO3R1o3gkh8l+hZLqwc
	 hg2La2bk7i6WJd2nedQxbX95yBW524qiUaXXXJ2LZN79BAPm9gO+EpYReqoCMwzku0B4c
	 7E6FvmcGpqnMQmNHs1xYU3oV4mLr5w7mGVn8hJUVoSwz+6+VLzQmg4GkCCWPVQFheTg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788520493;
	bh=BB+WffT/9XdJIF4r2rtByLQi0qMXrq3RE2IOIRO0VFY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RGhvbHz4wT2VeLXA7nZ80qEDr4esl1r4Y14Y5NZBuHwTBBSRRNSmkgaVgSBgXasBy
	 qMWdmX6dyE9NsOGJfPSujw8jION5Z3OBCTcuB8KU+6l5px4uzlzQj1oLVtQ3RPKz5H
	 FuC3+b5GV2vdGdYUKOQRsPSBfxrVM6opTYsoVZiijA/dH2hopEqceklMmJC+VpPQpR
	 LQQUqPVPQRrrMyCXAqi2+dy5NP7q4OSlUelHCrUItTk0cagXwZDd1sZDw8OydndbrT
	 dlSCIe9+itmMrM80KdH3v4fqpBe7LRR5OO0WdmnV12DXop0tge1egJsuS4afuxvLBE
	 LTqL8XzKgVy4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7E3F60BBE;
	Fri,  4 Sep 2026 11:14:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2128E20F5
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 048EE40399
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmcFlv_pOsas for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:14:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A8C614031A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788520488;
 b=jDM0iQwbK4pMW3wnr2ls8KYiuJ/1Gaj6DNtw7gNQh3796wY+v6hEsfMXPMn/kVmGWfZx
 wEgRe2ZXVR2n7DDfisUmSeRfWHFd/+ExBg/X0il9ZFs0un1ItuJXma0nSuuDajjJXXQM0
 ynKwkxBCNrWSgjYvRevyfEkuWVMYhzD38dIZbuiYHMASgQ41Ib5gbMKVSXRc145GA+76I
 wGvAq279pSjgNw9tQIfAHLMU0UyqNH7SxNI84ginfOHYF/yehU1sHfr497oRJnswjdqJW
 bmvvz58UaL/lqT/3cojXEeyMqrzgMpOsShjudYtlGHaRsQMkz7gqCvydGkmq2sveawg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788520488;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6qDYdRfynGNCAdbQ8PDSKjGj6r3+jYg9ZvyJv1zJryQ=;
 b=Plzh1N4fhuBuThrqCq3ODkz6T7up/88ciWVHtmrh8U4byRXulaqqgovBvYkaYA2L6fc5
 Um1aP7i/halWM3V4gHs05F3rPDeIFSMmaSBKGRi0ALCfHgrVS7j2WkWH4kKIQhu/v+iSR
 F1z4HA02Qi52HAT7XVqNES2DHgRiVqE6uTRJcocr/7ifgYPsnFw4qd7757OXCDjtVou4m
 1OdVunPIGPBL7JEA6PrvxGbufo7UFVwndMRkiWJkWkuiu1vGhBVOb2t7cpv1LZXr+RAPl
 XfqoPs+6xoqTSVzXFynxSlTHJmHN7fPfDpqHOLKqW+bPVnLOkBSTcKLfBMHvGwqw88g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8C614031A
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:14:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30F1A946F0; Fri,  4 Sep 2026 11:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Sep 2026 11:58:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b555d3a79ba758805e2fa2f512455b2cd6e1338f
X-Git-Newrev: b15faac929f80a212b03ec58bf8ab29574af4b14
X-Patchwork-Hint: ignore
Message-Id: <20260904111348.30F1A946F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 5.{10, 15}, 6.{1, 6, 12} series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b15faac929f80a212b03ec58bf8ab29574af4b14
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases:
    - 5.10.267 -> 5.10.268
    - 5.15.218 -> 5.15.219
    - 6.1.185 -> 6.1.186
    - 6.6.154 -> 6.6.155
    - 6.12.106 -> 6.12.107

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 88ad40324d..334ffaeb6a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -139,7 +139,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.106" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.107" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index cedce9b179..6d92a2f601 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0392555761d99c7604503f6178951e2df77e978b92cc96d11e248423e48ed785  linux-6.12.106.tar.xz
-sha256  edee00f83db050239fc1186535e1037782a5025001381f1353d0d3d741ed0234  linux-6.6.154.tar.xz
-sha256  3864d9a1137dc626497757c7406a6d865456fd8956c80795ff3aa46c7f1a2674  linux-6.1.185.tar.xz
+sha256  a5f8c5be3fde2d6d9ca14e9631642cf1f44487143f11059da730dcd5892e307a  linux-6.12.107.tar.xz
+sha256  4e67a9263f2c19b070112109c9a282ee8e8ea49f1641e41faa5cca2c41654982  linux-6.6.155.tar.xz
+sha256  eeedc32bbf2448205aff50ee2760a4d87172cf8f8279c1e5930069ad36f6236e  linux-6.1.186.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c3801bd134f3e9eeb77e370983d42126ac1a1d75039e985f928818dd6b8df236  linux-5.15.218.tar.xz
-sha256  5b440750ac42c88abc06c26f5d47d2c839164ead382387df07654517c67cb106  linux-5.10.267.tar.xz
+sha256  d04a4f798cc26f81170b5ecb27a3d8c8b4838f3aaf2a431b577043e2ead05ca4  linux-5.15.219.tar.xz
+sha256  7b164daadbc3743e61946631a924eb234d5136d7923dd4f3b40a18b91e52263a  linux-5.10.268.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9a01db38ed..158e5192d3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -429,11 +429,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.267"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.218"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.185"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.154"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.106"	if BR2_KERNEL_HEADERS_6_12
+	default "5.10.268"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.219"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.186"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.155"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.107"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
