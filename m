Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD027CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73F3D60FE5;
	Fri, 16 Oct 2026 13:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id li6_co360s8z; Fri, 16 Oct 2026 13:10:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4126F60FCF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156250;
	b=jYghB5W8rIj2hud4zn0HkVX/bjermQYvKtWLCo1ILbrqD14Q7Rowl2xWyJHCnW+ynu5+
	 v0EJ3tIqPaTHo7l753kfZvAWJQra20TkCr0lJ/hd2bbqhE7skWpvmshdjI01PHReGdB0m
	 Jj1WN6hV1iZmQQZJklZVgHO7LcGByUKrAVxqEnycPTDqApY5jfYYtFS0sy0YuldThVtDU
	 YiIHq5fTkNaUi/PmNPFu1V8B04iTo+u4HBNus78cQfYgwICLglRa199uERxGQmjBXF8mw
	 wHY5okVXEHlplm0iKyiGaEBHgCZlYe+LxU3oGndgHI5OoRmNMT3Gk1PZvcyicfOzy/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156250;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Vs+p8/6Jb0JZqn4q23g4KArOSQZ5kbmFIcllVjIDyaY=;
	b=ZD8S1jsQ7jCIiG5IDe9TW5JRDeMNgip0DY+RBpzqSo5GtXrrxiIkYt5EbwScKPZIYOv3
	 4U7Rvobs4FfBc1F/uvKmvobbmrzgtblsLcU3am1HDH05yKvy2vd0PXnAVj/DuaJrjCjhW
	 sK3JWm/htMycDybt125pgXcHa71Rz1dKc63i+4RnpCBI5klfgXynLys4wnHv6F+ogeGBc
	 BG1RECJEFql9UrxNj/VtuCaFQ8WmcDvh7Hw9RdCg8YASjLWPLXEMlIn5tWdhL8UbZzhME
	 iLEflLgRtVaIOeG9QZ6Rml3ROr57zmSBWvIs/bdDpHwL5lGbZ+80T2Ouv+Xbv2xET6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156250;
	bh=Vs+p8/6Jb0JZqn4q23g4KArOSQZ5kbmFIcllVjIDyaY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V2BrYhQomSvlyrMQn6AVSur4J8osBYWy6fUzDJmh/oC1wFqUXMdrsiCm2sBBbH/Ef
	 /1e4HRV5Z6/hZyv0wnN2AbZGNcgNbSnL0n+yQ2gKIEFCjlIfYR5PkXdjrlSlKczvp+
	 LPrkUfhuzjiKedwXg4ib17pqdes6tFGMpMKDYtQwouvqvgTrhA9l6Y2cWYDlQf54uc
	 Z0AI/eRvUUVyHcG3W+Hs+wU+ghJB0DNaPg6L+jAtbAiZf3faivUPBDAb1eSVdUVJfr
	 6bEJUd8fRG/E++dEfB3J5kUH4UfLss0XrOnMPxN+JXyjoJNPt/PTwwlwHWYS/7ZVKa
	 pfTSdFwV+qYCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4126F60FCF;
	Fri, 16 Oct 2026 13:10:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 358991C64
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 310E6814AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aVMO5kYSVg5 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F024D81516
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156109;
 b=Uhq8HvNVGlCRTkZB5BMisAztnEDlLhmX6i9i+GD9x4zYT40l6AKf62Ngdq1migAq2uYP
 BC5kcPN4uCxZ47AdeEhGIONvd389xm42/ooZKtuggQCK+/nDxqPt3RXPAy1vJ3Fb5fIrk
 gfl5hv7Y/zXnQtoKuICHze6m4fVlPlj1O4+S4hJpysOvEcYsneIDg0TvuAILBeuItEYBz
 JmoAADKUcLPk2MkgXQMiT+TcpqmX2xWoMznWNbsv28Y/phC+ExqRUIhvk29EtnO3+eHsp
 zAAH2l4n0Tb15df61iCusXG47AezBf/MOCX4T8fHQLXJO0gA5ZcOJICCayUzeTU7yGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156109;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=an18V9PoDhd1on6Sf2sL82M2Mz7Na/57ui4VBWJjH9E=;
 b=OzF62mvS5VCedbFu4qTUMxlQwqLDKVW3a8oxwhbFIb9XDWdKn9bDPq3iIpQ7DeNXiJ2u
 4Oc/iqjJN8M3neQ7Q726g0o3UTv2nsQzbV4tsOC/XrjDyKdrW1zfR+Svn39elHO46mSXM
 ir1U19phSvyaSYPabGcqZ0fghSGtQ8YpJD5TORvEdxu3ESfpgfkDcKD84RQLT88NSoRLE
 WSz07vDSGD8t+6haPmttldhgnsXTbDGs9hnhvnak7urO7q4p6loFtp4+03VIYxg+Gy4HQ
 p00pqxTdruL3q6A4lTEsJRUknoo8sk6qL3BJEva5IXwVyg+1vmqd/I+RW408M7y053Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F024D81516
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEDC3960D8; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f6acb76a5e45b16548474a91497f5edd560e7f34
X-Git-Newrev: 613db8496ad628b37e97882eac521f3e8c90f255
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.DEDC3960D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/qemu/Config.in.host: fix typo in comment dependency
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
Content-Type: multipart/mixed; boundary="===============7459022855405008148=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7459022855405008148==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/613db8496ad628b37e97882eac521f3e8c90f255
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The "host-qemu needs a host gcc >= 8" comment depends on
BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT, missing the trailing "S"
of the actual symbol BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS,
defined a few lines above and used correctly everywhere else in
this file.

Because this typo'd symbol is never defined anywhere, it is always
considered false by Kconfig, so the comment's "depends on" clause
silently loses one of its two intended conditions.

Assisted-by: LLM
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 280e9755d5241e634b897fc07010b7872fc65eee)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qemu/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 63f1b3fbde..76fb22c557 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -40,7 +40,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 
 comment "host-qemu needs a host gcc >= 8"
 	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
-		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
+		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
 	depends on !BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_HOST_QEMU

--===============7459022855405008148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7459022855405008148==--
