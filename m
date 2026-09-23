Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE273C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF3B641048;
	Thu, 24 Sep 2026 18:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2C2Rnx8t5ndV; Thu, 24 Sep 2026 18:58:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AD1D541040
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276328;
	b=Wy7gdiTtmOen6V5r/fxEKqhc24w1OtWi6DNCd5QqgTz5CIqSnGWrzE70dihSIOdHLyqc
	 YcjTHZJKC3In9e6si1C+w0BVXNrLk9xIn6Jb9epBF7xv3OVsNYCMrGyqB8Y/T2ha3XBWP
	 udFnqLQfTW9iFN3RWH/t8NHGbFwWJ0zyu4PDjKNr1nT/gXr+e5FJ+6V86bFpY2GiIsARI
	 eu+YOJ5RmBm7UBUH1lvudoUQczB9UPwT9eqelr7dKiEkmxn/lWM1fTxkYYDFsyA9+dEkh
	 neLr+3dsmy7bgS6G2WcDlYCMugdpxFFq2InUTyoSkvJaXjEltvHPkbiFXrSKezw2t3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276328;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1C3dX0hbtVjr50YdoEl+zgsY54y0Tw0F/4u5X1Vg8Ik=;
	b=Cijrz9cH/kzvVEk/xI9HiXsRZWEeHix2A7PyXzEep4qaYzgrGD8mrB7I5pjUhw1RMAtF
	 bwS5NbXYEnzFzxsh2pCOVlsu0FbaFUfwiPqxUW1BLlRC2tMw1Cb9O+O0LQR1LxVVp6Nie
	 t/WGBwPloTKOLHjEsGBB6sEhLsFaVQ5m8NZj/inO9I4xX2Ta3w8vqzFN8GW7FJHT0V4gQ
	 YcT070OQ4DReJQXGFuFgMOg9edqugbKWIfHA48/h4fMMoEmHtuNsIirlllsvF2wv8ilgw
	 2Mx9DRdRoGUZ1XXRXZodC89o+wMlnUR+346Y8Q/yKoo6+Zg61qQTy3F1azt4O3JUbUg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276328;
	bh=1C3dX0hbtVjr50YdoEl+zgsY54y0Tw0F/4u5X1Vg8Ik=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S+EB1UmAnvT/vyl2mh9JKxDCvM04G7ifCRKUbCwX43u3lc7PDuB6suD9mNPjiu5yU
	 qgYquDE8EkPIHav/W4CXKxxZMkVRzTpELjopS67Gwi1pZ78myYhEd511fBpKXlgUPb
	 zG3YNzXWVRyOS7svIOroSPrriTjFA0eP6Bkso8wiComtPUzJbPUz8iOn1jv8Nv8XAu
	 Yn3XBGSKOoLHjpu8BciZkD2Dce8i9aA8tpMx1lhz/FO6IbRCNxV1/7BtShJc4LP5EG
	 NhTh0540ORAWFTQpShmBlBcvpxKVH1qrajqUhBgxvgr6JfE+1hkx04KNTRmTK0wIXE
	 VC5Kpr510HypQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD1D541040;
	Thu, 24 Sep 2026 18:58:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22226332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1105B404CA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DxeeGzLUTW6 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 270B2404B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276211;
 b=ZQc1vdt4AFMFphXAKO2tDLvfnbxyWJm9ETJkJsQP29G/0lqUlP1ZNd2dOZTLcD95TUtg
 7CelVNtJmKtkoyUNBgBfQ092K880VB6ug/tKrBvLZ72rP9vqS80ZELwelMNCY3OcRCl3W
 bN1q7/l5zqPCgLj44sHWV+4uSGtB2PRzhSA2ra7YurdRjtaQKCrhwPqz7T3f3lWiNNSJP
 K/SW8HTPfx+hosh8nhZzuhXw2tLjqlTchEYJ4WXKVhVUVMEFnn0gN8T8i3g2T6qAgPqhz
 ldrwDIs+PtJPA6HcwNCflMRTkhmHk7QkxEAhjb1CGZvbVUgb/KaoZglzQfebrnudDXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276211;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vYgwsKQo2x1jBBW9Aqio7zu1p3iLeRoph0LmqVvnEo8=;
 b=s7SpPrvoF8U47nYSol0Di1oPHMiPaiXDEEj9fRayTBUmzYEXs57PbEh8n4Hrwnay5FIc
 OImp81hS2PJ896zz/YKtJndIdpWDqFbOnfeNHWOeOwndi0J+pMtxIN4Lmx0JCfDyRHgEZ
 N9JjGz9B+Nni4wFhH0aFPobYe0jQxZDo0dENsL6+lDpsmPqxW0Mav92jzU+8V7xm+P4J3
 F/AaI/NwwOUFrtMzLCAROFsidWMJDlXGsbdEhKe2riTj/ckxI6lifLWGsUjA0C5exZKxn
 ZCmnmcldYhHbYvXgXyZIA1yi21HbD4LqreuLgs7Xtp6WSVu00a/XvJvDM6n4G/u+NhA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 270B2404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEA5E8F0CF; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:54:31 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3716049995b1e80990d05aecdeb4039b868ade7a
X-Git-Newrev: bd7d7eecda6ee1137d9fd6aa370b713ee809e628
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.BEA5E8F0CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/xen: harmonize
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS select
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5452498110462972591=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5452498110462972591==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd7d7eecda6ee1137d9fd6aa370b713ee809e628
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_PACKAGE_XEN_TOOLS needs the full blown version of bash and
coreutils, so it selects BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, but it does
so only if BR2_PACKAGE_BUSYBOX=y. Which kind of makes sense, but is
not aligned with the vast majority of other places where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected, where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected unconditionally. Harmonize
this with other packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e62e06b19d635e06687650de0558ae257b05ccbb)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/xen/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index d63a3f6002..47f9dfa6e4 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_BASH # runtime (scripts)
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_COREUTILS # runtime (stat)
 	select BR2_PACKAGE_QEMU_XEN
 	help

--===============5452498110462972591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5452498110462972591==--
