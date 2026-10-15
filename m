Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E4ECC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C0FE607FF;
	Fri, 16 Oct 2026 13:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8IW_Pj3LoQM; Fri, 16 Oct 2026 13:13:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6721C60F54
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156431;
	b=kgDLAmStW1KORw4k473obLPXNOeD4VO0bRX/81+LZxyW0v+x18e4gARDtdVtzDaUgi8c
	 Ap6JcmsBBn7CRrw5LigIfXt8OWmwiYZgqFHN4qmwh/Q2pcT7d+yDpcT/zs1ovN4WD2CCD
	 aHDFXfjcjLzzy7aM7w+JJogX3WuEZFgqiiNgmmQW2NhuWjxuDNH9brbtql7Obrr0TBwrj
	 oNt4Z6a3+6hcQP5w3ArriJwpola88pvyjiNW6s4jMF2RNbIDENqcAx83slh4BRpSpmwn5
	 adl8SVyjGTJxOeC8ES1+4Dze1U5t63WLO7sY4wNblWYZOWP2oY8T8MefPzHw4b/zyMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156431;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=NzDUwjF2ZAIW/kTCqeU4BSvw3potfcssXMpsNWCvOv8=;
	b=XsVy8lZu0rnGLpVS23FS+V02Lx3V4N3lZtHXHY9UqsKs1IusoM4maQ9kaXl999f+urPz
	 B/FOFmZzL/fb8sVsO0PJTTDCbUYnTYOI6a3TX8ADlakpC/GZh+QETi4tt1H3F5kSnIsWY
	 aKwg/BKoaYUgdLPyvLUBE3mDn+Gbs3R/6I0WDvSSR6A03RgqDGXGatll2Gh2F8iFTXmuQ
	 pdhqQnEBcOvYi5Mhr4E07mdjQLlzv1jhxMAQNgLLMh0YGiD51SaObfl4dxdpDwcg/8rti
	 qo20oGNUKrxDnV5o/ACi0yq1MzsMVPpytuAnEDQO217T92PmRXEMCwPP71CZn0aEdTQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156431;
	bh=NzDUwjF2ZAIW/kTCqeU4BSvw3potfcssXMpsNWCvOv8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Azo/kQcVKyux/AlA+G7jAKE03IF1LG880+YOruKJxdBay2MyOLhUpWQZoURY+bxZj
	 pbBJFegqI3FnNizWEEeiBekDejT/RvkD0MqpmRVuYIknYaZJzY69EYsct2VS4/kdNw
	 Xeucy/1Apk/Ea79X/vxN/90UPl+YCpdClpUq/JxcEUZixtxLAwubJxtxAkvWOAq+mg
	 maTCtJtfwrUZCPnug7o/i1xkXx3FUdU0s5r8ZS0+1401C1CGiI04jlQJ/ACniOB0mZ
	 T1/UnhjCxwmnYSm1mKHqCAqOsZ6kI1nis4DPgOgwGtdJHVqQfXrurfl4SVz8DYzEb1
	 C8/jbhOZWil0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6721C60F54;
	Fri, 16 Oct 2026 13:13:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6F8D920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D813A60F1D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KFzgOqL1ptS for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DAAEC60F4B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=D/eGBFiyIxkiciFfoPapjXmJ2RHL/TV+vRZfPranIsfMxpsdXcTTXM+nBxOHBOfhKgsK
 6Hxd/a23qbkmdCJmyo2xbRY2ixM/XymnLSDR80rJXgtSal027WGTXB8pCYfxwcLLZtCeH
 6dsjILIzt6WZbRtx3CS3H8w2He02BTWd+MKej+DGMLtNUQB9DyZ/TyJCleqZlJWfA5ID6
 qNVI7U8pXNewrT/VQgyqB0Yrq3Qy+S21KPgkxyevTqe5hD2ABD4ozH7/6eWzHtt5rPlro
 j1B9HWMB/o+sVDOfUWkpMpzBRHZwFasiEGKIZs+k0qDrJgpK4HSvlAx7NoEBy8ivojA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ssK0lncyOwftjHmnrwkJ6i/gfmWT4b+TeozIYEOcmDE=;
 b=pq9eTEm7OOq2cXsm+UpZBg8+EKUdxyr7npu7KYWlLO3yOnWWzuQrJ/oTrQfKA9GhYoxP
 46Y8+qmTxOjzKX85r14cHDvmUccWfvz6gqWgHb2+uvgqMgIU2gzJTyj4b1yA+el3wV1hJ
 o320BLiK96eSG3QEtyKJ45JhBZoN1sANkak+HoJd0yKv+XUPVD4Bapyv8q2ohQSqvngb0
 Zd3VgYf9aJVfGEJK53UunK30vcJo+n9xyeyNBnyNPq3QewS8b5eFufR//54DhLJ+y3MWb
 OcWObeMuMc92DGgANdmj89urvccb2X/EKAmIexS104LgkNfmtFhXw18sf+HHOXMUgqg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAAEC60F4B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA59B960D3; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:41:10 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3422727b3deb3b2e3be2499e655cbf690e903e17
X-Git-Newrev: 836392d6413ffb2f5893ce6dfbed9c044b9e26de
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.CA59B960D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/util-linux:
 adding cfdisk enablement comment
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
Content-Type: multipart/mixed; boundary="===============1418245202178059200=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1418245202178059200==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/836392d6413ffb2f5893ce6dfbed9c044b9e26de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This commit introduces a menu comment to users to indicate whether the
`cfdisk` can be built, even when the basic set binaries option is
enabled.

For users wishing to support `fdisks` utilities (cfdisk, fdisk and
sfdisk) in Buildroot, these utilities are enabled through a
`BR2_PACKAGE_UTIL_LINUX_BINARIES` option. This option configures
`all-programs`, which will default enable `fdisks` (along with other
program options that do not have an explicit configuration). While a
user can enable "all programs", there is no guarantee that the
`cfdisk` utility will be built if ncurses is not enabled. Even if an
explicit Buildroot menu option is added for `cfdisk` (where we can
force select ncurses), there is no specific configuration option in
util-linux to toggle the enablement of `cfdisk`.

(alternative to commit f7019acad226cf01c40f278dfebc32dd5e8dfd73)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/util-linux/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index e6ee4c3ced..32fe0ada5a 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -67,6 +67,13 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	  The setarch utility also installs architecture-specific
 	  symlinks like linux32, linux64, uname26, i386 and x86_64.
 
+if BR2_PACKAGE_UTIL_LINUX_BINARIES
+
+comment "cfdisk needs ncurses"
+	depends on !BR2_PACKAGE_NCURSES
+
+endif
+
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
 	depends on BR2_USE_MMU # fork()

--===============1418245202178059200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1418245202178059200==--
