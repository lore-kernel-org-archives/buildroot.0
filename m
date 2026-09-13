Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A60BC88E40
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCE7180D7A;
	Sun, 13 Sep 2026 09:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZCrmRDi3Np0; Sun, 13 Sep 2026 09:12:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C76C780D96
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789290745;
	b=nE7D72E+mPQ49MU1MOaWlnTPQosqVDSXR5htCgCdBwdqFcLLjboEOVOTEL+68BhW6NUr
	 X9nuijQotrZZ9LUHXjUInkICL/HgGc2Gvtah6VkDAoRhL/SLm2odtD97f91wxPUBOWmpr
	 o3fT9YL7C8m7h8Y+q0zCHKuP455CP7KX3r8iitcrybs1raKDtK9EpOL4gVRwnOr3K7UVw
	 VB3rLHzzqn/qN+dW9wTPWmbnU9Nm+QlHuclAXCRSl1TKW3iMgAo1unOEuYnps/HOCSfwZ
	 2HkdL/UGTP/HIADA0koLDJLiNclzS38hqmsUH8kfcKJtb98VIgNK2Prw6rmjJtwxzmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789290745;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uI4CsjOD8Q4elq77BI8xeAZro+RE+F6ooIHc1bU1QVg=;
	b=DXm2+68I731dY6kRaS0SrkB/IkJLckpmPIrIz/DNLK9s2POoi1u2WkNyfYRdlHaVLyNL
	 2pm7Hhem51iy4cvNETiiHsi53H1T0EdeBNHpQ4gyANprah+9GukUPj4hRT+73xhR0k5l2
	 Az8ZnScjGoS3YVnthVcfGjaPjQDK5NDsQI0mLwgt6OndynL7J0OFLRGAZPAgU6z05AbyZ
	 Ua7o1UqDJoK0uh9X75hVLZ7pOTL3RTPB6KuSNfgfQaxYnQGAaMlO401WCpByx1/nhiiZO
	 7WpWaRwoy27QB0+iu1EMpGgSx5S4eFWGYk0Wf8ertzMfbtEBic5OwwbIJ9GVzvRUHEw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789290745;
	bh=uI4CsjOD8Q4elq77BI8xeAZro+RE+F6ooIHc1bU1QVg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QOmFK2WjiOEe5CxWcy9Kzi49HddneiP+GUN1NgG1aNLtVDr6YIqmdfVvxeGacbp+t
	 ka3rw54SeohpGrw8CAapk0Ub3Fe543b1iIhT/YJPsd77hzApIoMgc9QtHpFq7hXClo
	 yYWxDbzBBNmkVuoSDhgudfB49dchhWIZwOWz4N6TUbED4SWjGpbxtYSxh1tmvyibOD
	 XEngOPNReQe2J/tG0YGYAT26gRyJkJMe4q0CVEUEIpeda7pG8MzkbrV8YkJXUtAWuc
	 XeahnXvJvV4BTRBspE9XgW06PHm8EIs2N7tvqejJ5oOMCsgh5zEsYF9xZPfZBKM/zE
	 Cmj+VJbs/uRkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76C780D96;
	Sun, 13 Sep 2026 09:12:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDDD423F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B411B80D96
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmaedUc5ecyF for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:12:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B17D280D7A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789290742;
 b=GlHeUGfIoguk9FP0oJcnU3722zkzLDPGdBdWsTi7ebLcS2z06FndsWJVTIQKca0Lw3T0
 sYtXTtj0ZO2s7cxFr/nDic4hvvaGfGhGLbtYX3011NKB3EkXLB+fj0zw1KI+E2o9+Cygs
 ntESoveeNOoCZF1Ak6CzJA2LcHjqYQwL61tkuTqAvSiRKdXEqMsprHkvTD1VUSD9/3kxj
 /Vy07ixqKmlW/01zCvxiXr7NYMTkl/3H88G8tYb652SpGBQtysu0YlDr9WMnpUdf6cGZE
 lvzbgwmHizieIUxGHH7y150WOpAGt7puGl/jJSXdUfuVa4smaMhyYINRcYVa+59Up7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789290742;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=mCPrRNbcuLFLt4t/tmTXton1U769SFfWpOMyNkXiGro=;
 b=Au/VG0dwVuS46DZUDHNFcu6DX6+O35pNPkQ6jwJdqgJgdUGtZLIUDct6U7LcrP7VM6Wi
 nuuUIbJ3dqbTAJvNhUOlLIxGTlFK89S2QXCVX1wMV8NrygbIc87aPzQnkAyUO2RBfTeUr
 XwOETcv8hdtQhKg6kkSeGXXssKIjdH0x2vHsp4oz/IafBXFKrWEM/bI8WxosCUtuuIxcs
 PLrt7hue+ZWO2SVBUtWsUBPQMYXIO/wws0yeR2qiLzFw9gIgD6Yd61lwyLC1oDcLa+l+r
 KNacrmMmgDMuTUHxzadHMA7ktggV9cNtPr57i5NwqBGLf25WfOeCiEBdgOCT0cigoJw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B17D280D7A
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:12:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DBF2C95B31; Sun, 13 Sep 2026 09:11:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 10:52:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa38fea91c4677af141f8012723f9263a4f00ae1
X-Git-Newrev: 876023bc5af11c70583ebe136f87f2fcb971d6d1
X-Patchwork-Hint: ignore
Message-Id: <20260913091117.DBF2C95B31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-vpl-gpu-rt: add missing
 BR2_TOOLCHAIN_GCC_AT_LEAST_8 dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/876023bc5af11c70583ebe136f87f2fcb971d6d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_INTEL_VPL_GPU_RT selects BR2_PACKAGE_INTEL_MEDIADRIVER but
did not propagate "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8". This
commit fixes this issue, which was introduced in commit
ac65841defece904e91afe1fb51419084c993dba, when onevpl-intel-gpu was
introduced (it was later renamed to intel-vpl-gpu-rt).

Fixes: ac65841defece904e91afe1fb51419084c993dba ("package/onevpl-intel-gpu: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-vpl-gpu-rt/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/Config.in b/package/intel-vpl-gpu-rt/Config.in
index da26ea6aa5..44b2b1c304 100644
--- a/package/intel-vpl-gpu-rt/Config.in
+++ b/package/intel-vpl-gpu-rt/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_INTEL_VPL_GPU_RT
 	depends on BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS # libvpl
 	depends on BR2_INSTALL_LIBSTDCPP # libvpl
 	depends on !BR2_STATIC_LIBS # libvpl
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libvpl
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpl
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
@@ -18,9 +18,9 @@ config BR2_PACKAGE_INTEL_VPL_GPU_RT
 
 	  https://github.com/intel/vpl-gpu-rt
 
-comment "intel-vpl-gpu-rt needs a toolchain w/ dynamic library, gcc >= 7, C++, NPTL"
+comment "intel-vpl-gpu-rt needs a toolchain w/ dynamic library, gcc >= 8, C++, NPTL"
 	depends on BR2_x86_64
 	depends on BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
