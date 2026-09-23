Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AABC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41CA840B18;
	Thu, 24 Sep 2026 18:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBWLj1BA5fpS; Thu, 24 Sep 2026 18:57:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 392E040B51
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276225;
	b=BiAZF+YZMbaLxrMqhyctrJ4A2PrAwy+o6/9cD6xtXanV+fnmu8sjs3Hbk/6Bm5UayApH
	 jXaw7uGi3Xwfe0yDdoFp46jnIEtBs2c9wgP/fJk37R3uDoUUByOL+RCPtVtGJUzLOX/SO
	 WV2Yc6ElybGhLOiVQqc6MfDyLH06YsRd2XjZkPuT8yhpB1ieKbnVwMgmASBS/7M5b0U/K
	 0l8KXrt+IlzL1bwzg37I/tJkggPgdc/JotFpPYIefU10pLQhjldQtpz6iBrusMP+ei+Qj
	 /V9Qm3xOfvn/3FlhA+DCti1kp3oASiZ04Qsyw+qeysDEq4Tmkb0pQJoOsoqDhhqjlIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276225;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=MVxt21tRqB9XW0u60HKLAT7TNq1beiD2KJhStbCj1Ys=;
	b=kRkOW9uj+YrhpyLzqPTWci6fNLrJzdmKMoG8tGq91+ygS99FpHTrgERLm13lF+HfkLi7
	 53Z/Mg0MMbMxvmbQHxQZoXhRST/c165ZpwgqExnLcA3yJLCXW4umDdJE7wYPa50aLG0dZ
	 8ADGXpyOhmmUAvTUKCHkJwY15w9bZz+3q9pxcPTLhpCIVSgTKtRbXKa3q/XW6+KzuLUhT
	 gR+Pon4uXtMq0HylGS4ptJspp5t9Yw/TAt4ImNAFwG7/YssAxVErP32SUEmfulhFldZxh
	 Fx5MBJq1UeM9ovhj0vOYQX7xwL4dAJX2L0tC9+9W7wVyCLmgxM1pChZMlefHyByZ5cw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276225;
	bh=MVxt21tRqB9XW0u60HKLAT7TNq1beiD2KJhStbCj1Ys=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aaVVoK7iDOvKu/gzt13Y0DbvqMTGoVZuFrTHZnG9UULsi5takyzFtGhqoI6TU9xXF
	 wVawGG75gi2bZA2pmFloDjDfJJzgs7WitMbM+mnAddlGBrIB9DyELwaH48zw9xSo2g
	 GJb9TK658Xc/5QX85TieA9VKUpW4WQz59xf1kIlJQW+Bk4fmWMPGY/3q000T4Hc2Bo
	 zmtIQCLyDh2dfJsk3OmxIuzP3r2eVBFk0UMM6QcUXW2kQOwNopFCp2XpHb/iXxyTCD
	 Ahmm2UISoBg0C6SZRZWfikba8xe4iE+QRb3cDSStxfMkUBjsjsTrbaonS/FoFPF6wT
	 j80W1XDSN+nlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 392E040B51;
	Thu, 24 Sep 2026 18:57:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32309431
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A30F40AB8
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yvaon4ic1Cfv for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A9C9740AC1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276202;
 b=Z9Ij0jCGPa8nzWRxfTISY90PUb3u4cMg6CMPUJszhxTGXKwxsOnRwkYsuD5aEEIigZ0r
 6QVDo/9iCMDe7yexSYLA2AHVus6XzH5zylVNQKq8rUmPCWnK53jKOJQBr3zNLzef0PkRW
 nc1SfUrAMXPhk46pscYiEMtk8QnhDNS/QMM/pKdfc9HR/toBfR38q1hApBZmN/nNN60Zx
 nKpTmjdgM2NvrXvtoXPVQDZ7vblLg26Ej6lBOLqCoajLg8gN5YS8HPiRYqCxMhPamP+q8
 UGXsJ4tUXpwgOmkil680pzwQzWoTkNReyBawk+D3191B+FN7QppBLEJKhqzoHbuTyJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276202;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9mkCecmgqWWyNVR9UP8SYoPO3JxMiELRhDvLGEIASV8=;
 b=nBupr8hUOKu0QNfQ9H1w2xTdJ/DvWmgAPnCm/nZ/fPC23j25+yePmiPdEgTcDarHCtCW
 8XcsMfTNGVv2L/c9+EE2M1KitHlaH68Y5xMCyh6zI4JWCEXfWFQiV5X07QJQUPmP1rnYK
 RRBGctGUTdAm3Aa8QhYBbNSSN0Ia2K/H42DKH42NGm1cx1il3+oY8vf/aJ7atYnlRgQEw
 JN1q7/V5fJ8b1Yr2qyjmQMni9C7RTzpOPwln78C8Yfb2HwaNQU6daM97V2m34CX5UB8oW
 EUTShKLEJ8kt/GAdXMjV+SshJoUnRs9ySulX2xdqpVktEdSSlggAd22XNuRTEUQ/MKQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9C9740AC1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D6B198385; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:54:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a09e6149f0c6e74de5d352c562a7cadec5cef4b5
X-Git-Newrev: d432920a769af24e8d340608d02320a4f7e8b243
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.4D6B198385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xen: harmonize
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
Content-Type: multipart/mixed; boundary="===============8693589482031290941=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8693589482031290941==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d432920a769af24e8d340608d02320a4f7e8b243
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index e8168ca8c8..f758bb8222 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -34,7 +34,7 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_BASH # runtime (scripts)
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_COREUTILS # runtime (stat)
 	help
 	  The Xen tools can be accessed by the xl command.

--===============8693589482031290941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8693589482031290941==--
