Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E4C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 17:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB0B680986;
	Tue, 15 Sep 2026 17:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vNLuHbWZf2Yc; Tue, 15 Sep 2026 17:31:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8E29180E44
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789493504;
	b=MlnwiJi6/Sl67y42VDT0OfAVzYIJ/E1kfnm0BkGUN7K9Yzjs3h32MHhMW4/uVpMGn3Ll
	 pao/rtsc3W1ri2Y94UhNyS32r59mJDttM5SoyZlPK/vCi4F3e4cd55qsMmLvDk7xLgiz3
	 cj91i7mqe+4E+Kq/gyehP8XZ+Y9At1QiKnDMLcEKsOw4zib1mcUC2qRqupBwSMPWxFTbF
	 rIyGI2KK3bKMwHX9urug55a85+tmt8JK4gAhj0jGtO+uxSX+4VCD8tkKXj/ZtLiIO0TD8
	 HvzzB61Q2NXKYqpVB9tfQWrIqG+sni59cX1n1KmHCVgRH+HAAWPrD1XGGr+zclKILDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789493504;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dW+iTiDDsm4b9zah5ONGvZ1hd0z4n8X3oX+QErTyOPE=;
	b=BpEVzumnGSONErLma1tAWelNvtY9KLtL5G+RXc3ZIyTxOQod1h8LC0+vCGRClyVZm0qM
	 zWOsCrw6nhAp/Nvw6TEDTdTuudxS+tSjpIwT0TlwWnqgJ3x0VPNfAeqls6Ik2GGxXaj0Z
	 DPmWfsp6Dz8LzwvhVbntxbql+n4Wo8uMHkkdh/8EMDIPdZfF9HX5wjMBK1JFkoMHTjE/X
	 2kjrKhSI2ftF8+TtCaYpXJXNo/Dy2fi9PebdOTsgNPi/0b6VjbQYRnU/5yr7KtJjtiPvN
	 gCf4EHcb2X5X2XbdzyAzn8nvLATKohS3NBRdexnjQWxyNbRhIYuYs4GTdEovwJRxj6Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789493504;
	bh=dW+iTiDDsm4b9zah5ONGvZ1hd0z4n8X3oX+QErTyOPE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kuwoj0xgDkXL+g7O5ljL1EtY7e1mUuL+B9+ttcupfYNIZLvb6CzD4RC4PkG7pwj54
	 WjIlGcpez9g2KipBVAvN4+LbX0019pSCnoDSkQ1163DCE/7XM72fNTa5KFE/fBaG+N
	 zLjrdSfIChPdz0bi68aw8cWpnitobxtNwBE//Qk6/jjRqBlgv4koASoqCj4XUg51qe
	 TvTA3aEso6yF0S6SmAxcigwGjcyPcFcFkcZyGcXyCvrhtDC/Z6iqr3tezvPpYKP46f
	 Y968/Zq7/S0M0ZyLBNhnRNjD3oo9kthd//OQNq8Hb3Xu4plI1E0JkKK71I43lETFD2
	 ShJGUT/DsV6KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E29180E44;
	Tue, 15 Sep 2026 17:31:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B26F423F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A48D46076C
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifKFTvYGYbK4 for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 17:31:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0803B6075E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789493501;
 b=FekA0ioZ/O+QPleIlJ2zKA5UPcsDhqfg6moKBoE5BbxbYvfQ0qgqDyvb5MBa7QTJhPpN
 YmUkEWtxuq68WlPcAAM7flKdQfX4C6ykLCHguVObSnltK8b6bSa109A8VN/ATJXso45Ph
 3xhUVp3rUG19PTRG1fpd5B0ztICG/eDI2/8u5sQu5JFTIr3K55q2v7QZqc/6nnrzO7Ylm
 HW+88xa0mpftjt5ECiGuzsPIt2RGTFbniUJXxJhhC5xc0Agfqsx3LkieDf6R9LWJzCUwG
 T1XVN5cV6nnTaSbjSbaBOF5ZInoE35y/BLm1S/VgeWE4baslgjaMhOKoHeDjQmsZfgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789493501;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=annFvkB7ldhAInWQcbZZMt8IWRtFsKeqc9zV9kuEKyw=;
 b=rXqcarR3i3omFiFOs20I5nFAw5TIF9PuDD6S5Rm9DY7nLr1C6TjL5Jwh1oekbMfvz2Bk
 CFO5Ps9J03GWg/ymB5VMVhN4a1X2an6s9WuSTZzDvoXZ/4vVPjgMX9VJEh2+CIIJK3f9N
 EhHYR08KHBoHHWXuHjnVZRf4QNRN0H36G3T/UIz5w57Dz3LdPD/F/VOqc3CeQbLu6NLpi
 cS3Rjh4VadN6hVSMg0vNV2EjhjrdqUrrx2E14FzoRRUdZUJrdt0Pc3+H0GUjX35Idn9DS
 NFyScF7G3RSOiCfj69uBLy6VwIl+N0xxMo60egeNLpwvoQ6vLHuq2aRfHyMm2dtxNVA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0803B6075E
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 17:31:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06CC78AA1C; Tue, 15 Sep 2026 17:30:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 19:29:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3472fd59af13245a68f9ea2cdbbeb52fdd6abad4
X-Git-Newrev: 6dad789282b9f48d3dbe799c40648a5459dfdc17
X-Patchwork-Hint: ignore
Message-Id: <20260915173035.06CC78AA1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ndctl: propagate !BR2_STATIC_LIBS
 dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6dad789282b9f48d3dbe799c40648a5459dfdc17
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

ndctl selects kmod and keyutils, both of which depend on
!BR2_STATIC_LIBS, but this dependency was not propagated into ndctl
when the package was introduced. This commit fixes this issue.

Fixes: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6 ("package/ndctl: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ndctl/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
index 708871d693..79bae61ebb 100644
--- a/package/ndctl/Config.in
+++ b/package/ndctl/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_NDCTL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS # kmod, keyutils
 	select BR2_PACKAGE_INIPARSER
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_KEYUTILS
@@ -19,9 +20,10 @@ config BR2_PACKAGE_NDCTL
 
 	  https://github.com/pmem/ndctl
 
-comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10"
+comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_HAS_UDEV \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 \
+		|| BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
