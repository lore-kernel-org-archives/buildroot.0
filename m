Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A51CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CA4B6064F;
	Sat, 10 Oct 2026 14:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrjA-9ct5HJj; Sat, 10 Oct 2026 14:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B10EA60670
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791642564;
	b=TXAsc9JLGenML2Gev0BEc9qtoe28cfRCErI1UfSFvQl2A1G0qw+Uxbc/5ZC/bzFOYvq2
	 zMZSTnNQufGsm9zQl3HAEfel1gGIHRnPL3UNtcSEoJAWK/R8aBHYHcE/NWiVJ1NYBxndU
	 l/Vwt/ua5c4CUpC1a4nPfqziBFh4O6CJjAL0pEN8ZZi1WhQuDtW3LpUxrqvJwvOUgOt17
	 0lKAdvBXNwTO++QkaPG5kzhGfwxt6Jgd/WQovNcwz0LUrURdRfBxf+W9ampkIElPnjzCp
	 891snaOOcmEW2P/guD3teLefU+6/WRH/tnbTmn7DfOg9CTdukz9ns8q6/+Ek4TJTCow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791642564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SaQQouOB/3uSgWbRjs9aXRSoy5xuYvXc8XI9x7oGLUw=;
	b=XL+1MWLmQM+O6TWYgEF8/GzY+Dpqb0IzIy3uujZaRk1HDLbYgbrIumXa8aPikZT1Iq/B
	 G1z6LW9VVZDr+Eg+euW0hspsagYhAXtxbMsNLg5zCyHNXrFrWavOcqFG4/qU+waDBmQ97
	 +V3JjGzVTw31OUQUxNu5YXEKOTs/165daiSMtluMEOwXejSC4D8NYppv3Ye1JqnP5pV0I
	 azLydjYa8gGIQgF8lCGHdsuqsKl54AxdlMO2kQlLBsdsQbIZTcrheHcM21xzYJxa0lzsv
	 /RTN6smLUwe+GwT6XsKC3sfdrwgn/tQELJlor4nVrWt95iCulZQkEf9bsyCgOgH3BTA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791642564;
	bh=SaQQouOB/3uSgWbRjs9aXRSoy5xuYvXc8XI9x7oGLUw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JtRvwmEEY+5vR0us+j0wCIxoJ/9Wip/e9uTLvR4G7PMO24hwXWb6ZOlobogummEKD
	 kjL4pQYlQT9Labmu704VzK84oWnThqGnLsZpi8MunVdtmTR8pIwjatcp5MTuFCHzTq
	 LngY9jxK3p/LuMlkOPKBKGbdSvoeowZlOUuSceQ90AphPGBSVzcwoHSASCloOmFFo3
	 zwJ0zRBMdb6sn9UEHZ/pmsDY5b+LTjWrNYaTrVws70+YtZju4XUvpWOUkFqLKRu8SE
	 TfdK8ZlQwQgkbja2LUdkCjvDPp3xHF2PuDVgQ27nYRLsnESS7JZvwc6RSsnCtR5G2x
	 tayVEUbRRX74w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B10EA60670;
	Sat, 10 Oct 2026 14:29:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71E39105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D3334087B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VznQ1bSZP6-v for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD7DE4079A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791642558;
 b=fjOQ1yhj9RbbfOWafNriChmAUZXQGDE/ElfmibKgs8MOs9yABqtaYCYfWVgCzVE78Q2Z
 4cprCkwVVQxq2tfRDGlA8ObLPik9YHgvP7okMawVippAdrNqceH2QogTQrkjaegRoNR0B
 RnPkuiI23/us3l7Aww4WhH9E+LPOJfqNQhAtRbXohYm0WSSzkXCUojRT4aphpJeho2XKF
 cnLP7ZJja2JOKNWmgesf4EmxXUavyeRB5DXhAYP3daIktk+GoWrf2iJd7q7uxaAsxn6/v
 GUwdN9+dXEl3hMKM/akxCAVk/vtjuAD+A24mwCk3oSqiptPbDgpPgZ9Jh4O5CPOIm+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791642558;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ORqs1pG8/aQbgqIXvfOiPwmDZPCXF5W551T1zgKJrM0=;
 b=QTlJmSjzBUX61wedtShjoqOutGB8q184XSTrO4IXlCSH/9izulUPthCCHBlDyGeVP7hK
 Y+jpCor/KlXXuQVbfVPDZ9ssqzStKR2gttFLqxges5aURo3/PcWW2aG3Na2LcgRwJzWEN
 xZy1pKQKDQUI5h9dZFDokDho5ZXoG9BI1K3YiaIeKJ0WbywoCcXuDUH/PVmS4HheJ4c0/
 ypzXJy5YWr0WojDyttVgjRlAt/gWVeXts8vlL4mtOrMBkEN8yOXy/PkHupbmf8iq5cZwi
 Vk2VUQXYsxqWT+BLCv7llnGw+flLnSQxNUsDEp4dJsLrPM0vZypgRiiI542ZUhli3kw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD7DE4079A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9BE792083; Sat, 10 Oct 2026 14:28:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 16:28:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce4fc125fb32510c1378cae250040ecb9c8fb25d
X-Git-Newrev: 6c12e9327c7c0f6ff86557eee40e854d8034aac2
X-Patchwork-Hint: ignore
Message-Id: <20261010142800.A9BE792083@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlitecpp: fixup Config.in comment
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c12e9327c7c0f6ff86557eee40e854d8034aac2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 8b651fd817a9e0c11ebab12bd558ee6e80b86cd4 added a dependency on
gcc >= 4.9 and as part of that updated the Config.in comment to
mention C++11 instead of C++. This is not consistent with Buildroot
convention, where we only mention C++, and separately the GCC version
requirement. This commit aligns the Config.in comment with the
Buildroot convention.

Fixes: 8b651fd817a9e0c11ebab12bd558ee6e80b86cd4 ("package/sqlitecpp: require C++11")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlitecpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
index 614c46cb54..8e98b16137 100644
--- a/package/sqlitecpp/Config.in
+++ b/package/sqlitecpp/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_SQLITECPP
 
 	  https://github.com/SRombauts/SQLiteCpp
 
-comment "sqlitecpp needs a toolchain w/ C++11, threads, gcc >= 4.9"
+comment "sqlitecpp needs a toolchain w/ C++, threads, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
