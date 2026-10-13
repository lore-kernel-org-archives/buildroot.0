Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08C8CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8009640467;
	Tue, 13 Oct 2026 11:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvvLyrkwhvtO; Tue, 13 Oct 2026 11:57:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 96F7040536
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892675;
	b=ev+zlcO2a1JNVpmGrCQVsaEy7n966zSkMi1gIE6Yxu7VHsC7olwZ55b+B40AeE7w/key
	 vLibXqStoOTjmziP4SC1DFXcP1H/tkHXjUOXK12EuTCu7ayMrrsbateRkr3CazuWIsIsy
	 6jDipIy+whZD6CGDT+n4kQRMm8D+ZbU+5M73rU6ez+KLXX5haxCC5Sr/KZOAmG4too7Qz
	 MJR8FxNNzE7hbXELwzbmJV3Jx7X1VwDrgCXw25t/AXJoTRbJ9qAFErXLU6S1Awqg/VUCl
	 DAoy+2QN63l4oFxulVUNVeRR8NHQXY9xkcCAQDzs/nfR6YD7Ir9P2p1fAr3HNDLYAAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892675;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YGBfVWqGeNOigOjp4CONRpMBhsdYJIs8zPycMJ4TFT0=;
	b=edusBpf41Aa3jVU2MQ5R2czrxdXc+d6FEJzIRWv9Q+uzLfahm6/EdhCuOKNq99U1+QW9
	 xvk2oFQrrWXeST3c6pBqt42kdUz9X1zv2OI3jIM2BD/ivwMxZ2BNNgIsHSioUubyb8goS
	 zFnCelpCMqZmwiBnSQ/ayTOWDTGDE0UR0FiZf3Qi0bcyW6jejTK+0ZKCWM6qBgGl6oI7U
	 0Von/Gzf6Lg/YAvwzexCIGNReX6lT6IB12kIVB6U4xqxnEU/qTEqlNrN8JKX8rOWjfG1t
	 NCeTZF48jqO1tF76I2F8kzkS3oPHqKU+g5fuHx9MdAUIds5qjeSC07qO75ToTLGSASA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892675;
	bh=YGBfVWqGeNOigOjp4CONRpMBhsdYJIs8zPycMJ4TFT0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rXO4GJdG2RM8qE6TnRGoUFqnE2GsXcgqiC4M+h7Db9F0OXXhQnXELiMU0R3fILwja
	 rKOFsZr6ZL4XjHtXL8vZ5CFWG3YrsKzvyClpUTbx3UEq9Mx2c8A1Yjk4ITz98WFnHB
	 hBJqMgs/kXPLziOP9VRwLCmxiZv65WfDemJ/U8Gvzoen6jWtI409dcIRR5DxO8Fvx5
	 uJwbeBb9trMh3I1SAUgCdWUBn9KYQLlWJ7sYaz+86JakRdTNH5xdPONBtKcD8V07S0
	 WBmjVqVTFqDOjwphZXGF0/lMtXeE+m9UVClIya1Y/0EEsisUwHMX0/wi7m7Sv30cC7
	 5ukCa2TKAvLXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F7040536;
	Tue, 13 Oct 2026 11:57:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8723E129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75691605D6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwUsmC1l-hMb for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B456C6061B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=Sw0JvDWuVmnxru6ba619TTKEc5OQ+30DxVoCHPHWw1qdl+wF13CFsDFLL8GGvZY7ZEWI
 5pQK3wlIfnukagpOYmMlnFeDsZprX03D4yjGmsrUhKraYbarB09JEkrIa5FsxWRL+KPUc
 KNFilZdw66KcMfo/0Yc3SBVbaLROsFe5VKszk3Ocjxo1ux36KfigR42Xkzq3lv0Cfg+yi
 3R0uNt2LFrXrPgsmjUrI+X+7h/aNxWgO8dq+FYkFF6ndfIVVjvm2IwgLBoLzkyv56zkFw
 MlPeGafZ/DhKyc+/yOYZp9vhaicnAlB2T9rXVHKWO9x+AkhJrY8IHIGnTh/NetzWTlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CWe/yKX+aJMGVdsNgkSS89y/O8Q/UgL8UvQ1hoY6CBA=;
 b=M00aTmo2H2FX9V7rfelGbw5JH8Ga48Ms1iCPPkDZOeADCGYl3B74R+5GC1vn5J1mrFN3
 sJxhqrQJjAXiDeghpgZ30hjjTpGVfMhW53XrxFjeuW+tjUjzV1MlwkgRas+ULHcn3GTun
 bxtca+aKdjmwNVl/5cQqWkMo0v26GPL1LBTlmqpPYqIRLwVzTuQDMGNJrDkKxRSLgmt1c
 WgfePNmEIwHUNP8+fHH2d52yFWvI8fYNkZKPtoAsz3dJNqsPRb4VCDS8fDEgaOOcrFgm2
 V3mv7rRq/XKqFdF/kvEAD3JclmMHCc7CdFo2FIA8JggGXTDAQ6CjNcTGUpnuPe2MEaw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B456C6061B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 236B1956A5; Tue, 13 Oct 2026 11:56:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:56:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d893bb58ae585acd55b8a23870e93ca90bccfa67
X-Git-Newrev: d5494f43c5b9e108599ad961f9b7389188f00167
X-Patchwork-Hint: ignore
Message-Id: <20261013115618.236B1956A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-role-tiny: bump to version
 2.002005
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5494f43c5b9e108599ad961f9b7389188f00167
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE:
see https://metacpan.org/release/HAARG/Role-Tiny-2.002005/diff/HAARG/Role-Tiny-2.002004#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-role-tiny/perl-role-tiny.hash | 8 ++++----
 package/perl-role-tiny/perl-role-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-role-tiny/perl-role-tiny.hash b/package/perl-role-tiny/perl-role-tiny.hash
index 33de6a53f8..a7ed8863cc 100644
--- a/package/perl-role-tiny/perl-role-tiny.hash
+++ b/package/perl-role-tiny/perl-role-tiny.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  9ee45591befa3d0b1094ac75d282b6ba  Role-Tiny-2.002004.tar.gz
-sha256  d7bdee9e138a4f83aa52d0a981625644bda87ff16642dfa845dcb44d9a242b45  Role-Tiny-2.002004.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  b3d6525e0c802aeff6b26ef5a928a6b1  Role-Tiny-2.002005.tar.gz
+sha256  4618ec524618c104dc28a8cc86af129a00cad282aea7f4c75060ba05d4c8f4d7  Role-Tiny-2.002005.tar.gz
 
 # computed by scancpan
-sha256  a8a1595c2347f7d10e896809d4f3dea85ccc10ac5644b8073111233cd120b14a  LICENSE
+sha256  ffea2963f1483cccd3b52fa6f1f137bc093715c64c8d97a01b31da411d43bc25  LICENSE
diff --git a/package/perl-role-tiny/perl-role-tiny.mk b/package/perl-role-tiny/perl-role-tiny.mk
index 64d5085fad..3377f685ed 100644
--- a/package/perl-role-tiny/perl-role-tiny.mk
+++ b/package/perl-role-tiny/perl-role-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_ROLE_TINY_VERSION = 2.002004
+PERL_ROLE_TINY_VERSION = 2.002005
 PERL_ROLE_TINY_SOURCE = Role-Tiny-$(PERL_ROLE_TINY_VERSION).tar.gz
 PERL_ROLE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_ROLE_TINY_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
