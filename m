Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF144C982CC
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AC5F80C3B;
	Wed, 16 Sep 2026 18:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hxuOL7DElaMp; Wed, 16 Sep 2026 18:50:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BA58D80CBA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584607;
	b=S9JkQEhRicmAnFWcc6BLQk196R6wLFJ/9I2aURflHNevdmGri+iiiXaq1c58JUS5RIOW
	 TF4UKiNf5xoDvL7GwqAFaZ1PjZL0ZJzsqZG5JhVJVxfKpj9SR0wlQPG4XEkzdfbiTRk/o
	 T0izcMnoIKup5FxLrM0RTgZxutF/cygNBOQdDqk0kKBem6AJr2p1Nh9HkubXd/TE4c2Uh
	 /ONfpBarzKYIMM7WR1M6dk2GJYe8KIkXXftP+41HlhhTDxMqATPNjvXMDjMhLdANAijFt
	 LFp6xLf05uCVOqi//R5Cbwgr7HB2vh46g9Dyu/zpYh0gSecOyNO81nRp9d2MdKdWUUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584607;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hjeeuJi87jJhTh26JloLOtpDHTbIczaZi3u21Vh9rsE=;
	b=F7rriF2QiM4s/lpYDnROt654pA2x7zOUtxamBPVw/OVTGtqaX23liK6ne2pjupaF3PaN
	 dlPCLR8gFMFXNcnUzbrtwivfi5l5mtvdyV7e5TILVzURKK/gIH+2MPh488AwQJ7uPAuva
	 m/yQ+e9Fkujz8hY9w1it86h9uwm8OWhZ/bGPusJTgQ/RWsWP58D9k63hC/11puQwLDhW5
	 Gpi74m/3MgzEKVZqFBgW8AcTjTkZQPYkJ3n/DRb6yZdwW+qTBRLeS/QI7X/M73lqNZ7TW
	 hXdoHTkQxC56gJekGXIYJkaWeP6Faj1Ejbwbx/5IMBIMaGYe00s4R7G14NNQLjt4lIA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584607;
	bh=hjeeuJi87jJhTh26JloLOtpDHTbIczaZi3u21Vh9rsE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WUbLpj4qUInENOkooli/XA4oTGOjSEKdcb/Dfx+41TFTugdQXs3dO502zwz1bkswV
	 V6px6kdn8CIkm3XHOuHIwy2bIoF5XlOj1u8JwMC4+OR0FaX6gSvrReCwyvQQguGpNO
	 J7ja3gEWt5xOLVV24zt4eGRKDfeS/gL8Brba14RIJQEbK5pE4A61wMRYGYrK48OX12
	 /uahMIHe8Ow3+vveb1BAecB+0cY6gaoHJXNBJKewVikOUs2FhZyMuxf91M98a1ipFT
	 QRWEftHcGYN5oEbJ0xdNVUQh9nMYAb4y2pQwnspZeJS+KEnOFyoMzQlhwfD6HyQ687
	 BPBDrKpNSHPOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA58D80CBA;
	Wed, 16 Sep 2026 18:50:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B9C37AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 321754008B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTm8qxBhnZC9 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:50:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0C55F4006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584603;
 b=Jb3uqHQvpM0293BdoUtQ15tmiDyCnT4rZRi2fLlXFmhmSnzC/xDf3CNHckJf7cKWTTMP
 ISAUIpliNfEMVzb1fL1yMPPHn/jC/kr51lVG1sW057eTYi8kA05OU90RTATXOofXYVOr1
 ig30guGE5qL65ER6tV2TWaVdJi3bvwm0GaRxJRhsZEa4b1IuMi6tOVLujxUucrv7bmOLo
 x70Ru7w00vhX2N55h9E5+P4SMWDTVgp5ujAHY+8P3GE4R58mbs3FCLY0ghu+Oa8o5vx89
 2xnI2Yq2Fn7TMMOqzAMz4q9vBgOIoCsc52xS1aNkvcJaJuSQ2J4ighlyy1TCfnZhhBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584603;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=X1k6JUugQrIOMrF7O7Jl6XBYugUlvruuqXj2qwoeFMM=;
 b=jnkY5rTn2QH7XOxNYg+Gft5iQ0HkSy09Al4bYN0W9PrfqWOiXKhX+i+8V6Bv8fLX6ERO
 ++L1toNRmjkH31oeeoeUn8JEefRzVpB10SSOMfgcDIPlpJ61i90+HPhIcdY9WKARKmWMy
 SNsSgb1raNNvckuR4SVR4Dha+/XaX/MSx6rO7bm+DPZzbgRZvDkhIlFnntS2qALkVetnW
 FEnQ2JoRlmCP9U+eW1OPJL26iR7Wm8f9/dpqeOSm7w/SCINbVS1W1yJy9Z6nCKW/+O+Jg
 AFzi5ilOv3Ve5mh7VuysXXQXZB1LtLOQ22YVOua3FlxENU9umNtwKY7qNI0RYr5DJ1Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C55F4006B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:50:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88FC1960DD; Wed, 16 Sep 2026 18:48:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 20:48:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c730e8e0461a159658be808cc56e5bb57fd5a71
X-Git-Newrev: 84decc3a1dd8ac5ed44fc2123dbe1620780c86b0
X-Patchwork-Hint: ignore
Message-Id: <20260916184856.88FC1960DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-gmmlib: bump version to
 22.10.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84decc3a1dd8ac5ed44fc2123dbe1620780c86b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/gmmlib/releases/tag/intel-gmmlib-22.10.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-gmmlib/intel-gmmlib.hash | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index 0d65167829..07bdbeca31 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  33ebb6e65a2617c59f95a9e70ce0cbeca098316cd265345a0f4db5b381f1024c  intel-gmmlib-22.10.1.tar.gz
+sha256  94d0038ef92bb65b86d08f004197c56f8d81f82f9ac7a25c202a88afd653a30b  intel-gmmlib-22.10.2.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index 6fe5c1c067..e3e1cf5a9a 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.10.1
+INTEL_GMMLIB_VERSION = 22.10.2
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
