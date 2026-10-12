Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA20DCA9EDF
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EE5C4058C;
	Mon, 12 Oct 2026 10:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6_IOvXZnSApP; Mon, 12 Oct 2026 10:22:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 599ED40595
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791800537;
	b=CfaFWsepuV2IbsE0E/TxCZYVR0GnccFJBh2h9Tiug7vBc6aMamlmZVRvh/mAJ6w5NAki
	 Ymzvr5UJimPW5GDCFjF99SNe0/m0e+Hi6frHbPGbBBFNna7S3SlxZwvoE2S8fWOmFHEqo
	 ccnju8Dww60vmrXe877VU1umUo68D3/SrrafyxWxFjGyDcEeCcPvWzjF9CkeajZKY4Xuo
	 uq1InOkLS+sca0+sOHKcUUauYYylpXfuPIXpw5dc/ITeimGzYQru+ZsMR1Lzs13ufwlrU
	 V5y46/jPfwTYUDUqTQyTXs9RQ/Fifia1ixzVWBJZ+ufY3Me4PiYFZSAA9+RtsTFZwMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791800537;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Yd7KQ4Izj1E//MHCHIIGZNwbK21s5/qXBXuPVTdQKPo=;
	b=XqT+kHzzbDkiSpMoykfshBxSusixxaM03likH/sa9SOgaTJxsPXScYXZM56OJd0nCK2V
	 UBVUAJSwN045l30LEqX4oMT0+tE/+18TDuFXJoKat0eYvNSKWKPoxujXUJQii+OX6WbCv
	 z8Kkw07qIHulyVXPdSjXGS4oymRl56OzB7b6fHtCQD2C9MCSMuSOGFwGhMpRBS5XMPAKG
	 0y6dzbaPIRkKF4t/RafGs5UzAbSKRCcjCgABzw0H1eEgao/D+b2MG0Z20h3m7TnAbnOcJ
	 qD86keu/B9Kg/wNAwyfA/e9CcSQK7vOFTPebUbyqkzk5hWPuCxbAfixz0A9dwaoVMoA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791800537;
	bh=Yd7KQ4Izj1E//MHCHIIGZNwbK21s5/qXBXuPVTdQKPo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KB0f9jl0XVJ9lqN6PoS3fPnK1l6LC5osZ3cgqxH6KxQGkpgwCIlooz2vQaZQwyD3L
	 xjBvP01hpQ/WJ7/xice5xihd87cS6maW/8kOiWrRthkXbLgQdVCrU6hUdi/4gDlM4W
	 0jZeYGzMUwoLN0Qtfw0TfofCFibZzH+FvEHemRM8n4c9MgCOuofkZWLav4LWMTcLrR
	 qrTj8TuyNW7K85vVGez2g1cwkZfQ+lPy0mf99p3zDSJEAN9j5oODrwfGfmrNvsU/Bf
	 oy/o0+suK3MFHcuIbOBnXYW4HSN04T2/hfnI+Gb/KPux2mvlcZvkgVFKyywFRfh/Jk
	 HRU6/1SytfzAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 599ED40595;
	Mon, 12 Oct 2026 10:22:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EF398A58
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECF934058C
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIiaaWOA8Fhc for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A1FA40595
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791800534;
 b=ZYaiDYlQLAzjRkCd7e4k72vJsmY8SucaXzPfE8/ofJ5zlbGo1D6ewoykWJuqMohc9+Zb
 Q1lVP6uE52Z3e8faBSl2BV4KOoFDhA4C/uf4gZzUOur+v1nTosVKaJtQ7d7wYbUTZraqV
 7U5D2C5xPsrBTMme6v85I8t82cJaG12Tn4WRlMreUx9L6CQxUchrJAhzv32UBeC/aB5WH
 HFNK6T4YRp6w1Flh837Xt3MBziqgeuVUUiQDarO61UUL7kuvINO6Y4vAzFjqGbLVZrl2p
 5068skiNXh/OKHdiNJR4/0x7O0g5KjJugUfVhS/Crt+x6TsxkPA3MGVAgcnHrrYCIhQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791800534;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=o+CZ8I1Sv0W61BLVotpLoO7mVg4g06ZAk5j5e9YbBnU=;
 b=bt+Qg2Y61MZhTkE3FtjyC7tr1a6kwkGb2QC8VaoguoEiO6RRk0hlC1IxmZhRLeHF/LDo
 uLPdMNpRIm20l541h+BWSjrGoN4iCQGUiNkFAXzDZZiTcP+OeJ9zaNWkbU0L2kdsLBZzC
 j6nHSAz9qrCfp4FNpsdUYlmfhGWD64XOdYAs1X5icmKOOtl2aZD43JvyUQJ72JCGWtLpB
 7VRr4LpgoPfGe/QvPQ/Z/tdm0kQLcLPAzi3alhaWwrWO8n8Sron6WRXuXwnaBow4Zl7dL
 HOoVAB3GXpzouf0EcfuKiGwfG4JkssZF4a5DL8zNcqkj/En12tbvDYpCcxEnwgx13RQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A1FA40595
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 10:22:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17A5393494; Mon, 12 Oct 2026 10:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Oct 2026 10:55:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf9b13a7f5bac6bcbbcbecc3f2cef830804e1c0d
X-Git-Newrev: 8f975c3f20b1f4bcab5c3e3c836b8dd38cf036a2
X-Patchwork-Hint: ignore
Message-Id: <20261012102055.17A5393494@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qwt: bump to version 6.3.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f975c3f20b1f4bcab5c3e3c836b8dd38cf036a2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://sourceforge.net/p/qwt/git/ci/qwt-6.2/tree/CHANGES-6.2
https://sourceforge.net/p/qwt/git/ci/develop/tree/CHANGES-6.3

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qwt/qwt.hash | 8 ++++----
 package/qwt/qwt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index d4fd210cbd..e20c9ebada 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/qwt/files/qwt/6.1.6
-md5  cc71be5d6c33c2fc19ae8082ccdd3e83  qwt-6.1.6.tar.bz2
-sha1  b1f17a86c9b1b0790a0c0067ef69fb6277efac79  qwt-6.1.6.tar.bz2
+# From https://sourceforge.net/projects/qwt/files/qwt/6.3.0
+md5  06a8f8eb1bc07bedfb1df601804439cb  qwt-6.3.0.tar.bz2
+sha1  9180f33f75ff8817f27019c94d10f92de840a5e4  qwt-6.3.0.tar.bz2
 
 # Locally computed
-sha256  99460d31c115ee4117b0175d885f47c2c590d784206f09815dc058fbe5ede1f6  qwt-6.1.6.tar.bz2
+sha256  dcb085896c28aaec5518cbc08c0ee2b4e60ada7ac929d82639f6189851a6129a  qwt-6.3.0.tar.bz2
 sha256  d8737db330e1eeb439962e11654ab7f1aece3561d9415454a8c538643824ede6  COPYING
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index 9f0b78655f..67292ee025 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.6
+QWT_VERSION = 6.3.0
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
