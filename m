Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36C0C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A52A40C9A;
	Fri, 18 Sep 2026 13:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGE21I1AnkGc; Fri, 18 Sep 2026 13:07:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B0A0B40BB3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736855;
	b=sslV93zNUOlM5biCrFvu+nQ6GS0eEiwB8zNmDyKlP3fR2m7he6thO6LG7jaT3cBJ232b
	 tsvxylcEdMi5HU70IZO01LLxqiEG3n6du1BkpKEvABOBG4pFAETMuFXUSo3XUmLMGAFs/
	 +p+72LP9fnFTBz8+Xp3fn2K0uEXMZGSQXDYYB/V+EcVC5PwCxjqZfAIZohX1CPIRMj9Ez
	 dQ4wcH4fuOkgETISwkjtu6axi3+kdWOSum/fRmJtPLP+9UGtHpIYJ7WyNNDyIFZAkUnsj
	 wk9sOWMhGqs20ET00M9oogkzrflgToSb2RZEWglmjafTvAGajK7eVFinXCUizBLdryQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=368Spqfo0pTDd5zKyMoZIOb6eFDBnFRLoU4KxFAIoxU=;
	b=HQMrlgLtp6gLMQ8cecVDh1znbRnN1sl2LZyCzDAtX3m4WdFXVatZpvKbAGgIxWmsfsiP
	 CBSHay6h388S/c738B+/2/zu5IY302EqWHVjviqAm8tteGcEe2re2lZTPqmVyhqTGrUoi
	 8cxq4lb08VumKD6hd4J0gAppFGDjsmtI3Jiqau9CPMl3pQZaGScrHNKKysHkzXBcxuZxi
	 SuIt0f4UXOgJ+B5GmLXauo+BRxRU+2fcFqFZvTaZn8WV4UvM6wg6mZ5C+sLUjVmb3/xIA
	 N3xTcY8mnkRcvQnC09SrvG0TwrjscijOImwJwEJoVLL2X3DEjYlJJO44L0xfBNVsWQw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736855;
	bh=368Spqfo0pTDd5zKyMoZIOb6eFDBnFRLoU4KxFAIoxU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VheK9NedAemPMjkzYd8hsb/ciEYuxB7aTrA9sRK3DExW0sqUyH3v8TEYPNEFo3+N5
	 b2BKK7X/xBw4+yvCgHtQ8bLrTT5s2Ot4R5CxncNiTLBl/fZuh+Qrvahic9xrkGZ2Qs
	 O+XvNsbS3YpZcJ3UzVXcQ+1HRvGgQX42SrcXwFldV1ohP+8pCzkP84HNsavOTNCZ/r
	 gvr029JotH8O4wRm46k/5pJ3raxsndDwieKdKAq7jDhmXOM0cRbQxttQSfLC2uu1c2
	 uo5SRqGoROPB7Ce+a7TPu8zs8h33ktpWV4q3VFlzDlJNa1/rhiio9Ji9ILr+JBYuD6
	 zXe1iiVrcsc0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A0B40BB3;
	Fri, 18 Sep 2026 13:07:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86754224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6840140B7A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tUkC9FX7L5Et for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AECA540BFC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=s+PGtMUuD+Mv0037/L0XY852Of25AdIeU74ucpFXuqTbX5K6YHkAChULqWlIruT47dLo
 txRsz4/gZvh2FX1P0KhAj51l/dasgk/5x9Xb7XBuHhlmL4znJuoO7Y/HRJbr52SRggbmV
 +D69wXwySWzput7IoD4BmoHfgRigBBa+GnCYaPB/ejgGo8967ubv+FdOhjIwZhZTnBpRY
 O9XSdhRj60J265Bbl/+XPztIsrDzv6N4v2RPHx1wIx1ueCzPg6+fmqp4xL1igBt6S5sC9
 145jU2AamDzBd1dbumOMQjgG34sxgXJSTviM5tzDJua0LAX9R3RpPmSvakeT25ckN2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KqmnJILz/TyTutt9Koi7Yuva+gjlJsUel5BY+2BeWLI=;
 b=FdnFZLk/M4dZF4AALlcAOf1Ke4tLiy4lVdlMIkPv72fcmBmm7SrwAnE00pe/efa+AyxI
 SFwHS/zxx99n7gBqvfpNC3f0k5Uo4b/ynrbjd9kQgSNobz91fLW9imfSELW8kd6ukCxYp
 MPEDXEgBzkvlFzjCIg36ho2DnH/4u0ESoCIjD/qWcUhp5O4i585/S5W/a2wTrb52nmSDc
 ynrbtpu6q7QXVSXQ+6nIV93JMYnVrqoLTvgaYbO/JpnOjGIsqTSLtBdp0R/OH04LDVeL9
 wlJlYdicNgu4LpyGThkJ8nY/L5rVRF4M82ZgittPM33pGZ0FbJKudpFK6q5ZKvKMBuw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AECA540BFC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6725797698; Fri, 18 Sep 2026 13:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 12:23:55 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d854788bc7a0413222c14d70c48111ff8f562a3b
X-Git-Newrev: 0e9a175cd201f44a3608e80eeb4c6a7e8154d6f8
X-Patchwork-Hint: ignore
Message-Id: <20260918130545.6725797698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/clamav: add
 missing BR2_TOOLCHAIN_HAS_SYNC_4 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e9a175cd201f44a3608e80eeb4c6a7e8154d6f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

In commit 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa ("package/clamav:
bump version to 1.0.1"), select BR2_PACKAGE_JSON_C was added to
BR2_PACKAGE_CLAMAV without propagating the BR2_TOOLCHAIN_HAS_SYNC_4
dependency from BR2_PACKAGE_JSON_C.

Since at the same time a dependency on
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS was added to clamav and
Rust is not supported on the few architectures that don't have 4-byte
sync intrinsics, this has basically no effect, but ensure a correct
propagation of dependencies.

Fixes: 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa ("package/clamav: bump version to 1.0.1")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 39b840beef568ab7e671e9145d186b5c993a1b07)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/clamav/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/clamav/Config.in b/package/clamav/Config.in
index 839518ebd6..92cd75cf70 100644
--- a/package/clamav/Config.in
+++ b/package/clamav/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_CLAMAV
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_HOST_RUSTC
 	select BR2_PACKAGE_JSON_C
@@ -29,3 +30,4 @@ comment "clamav needs a toolchain w/ C++, dynamic library, threads, wchar"
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
