Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0BFCC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 544F74050A;
	Tue, 13 Oct 2026 11:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VTkNwS8G1wK; Tue, 13 Oct 2026 11:57:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B82640475
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892664;
	b=On5Fly4FrZFg50oXbrg642WtEov70bLZ6Gtp3w4XmMUSvdT8EQTcblZL9CbuKNDVigau
	 gtFr9iPbzlGZDaqFbXYS7WVjS1xORcLYOiXh9HcPGoTm1jdKZ3bnmGaOL+VyNjOaNF/KB
	 NMfAYISzd2qlpZgxJbemwA/l5tO8CjVHXSmDW9QAO/O2jR+wK8NoZQl0B9e8Nz0Eza6sS
	 YIz3KDUK8KP7kLzufFoONYC/vAwH3B4/soLWS5TPhFp3pQ/oxH9qrIZltEDFpQ7jDINSX
	 Cq1g4dozIQDFOLRy3r0gULYdD4yzhgHPK1tVmFlNNu/XiCOmacvyh+bxDXLFFiY3nsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892664;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=P8MOujoNZgy8Q95gI11NfBEtgI+bFDj4SG3I5sQPdmA=;
	b=ccPzijJeoDm+0xpee4mv7K5I+NKRGPgWZyM5mNMda511rcGWBA2rFG4gSn/UctKoOJvs
	 yUghkLB05jHD3z7MoAJOBwTlQ6rI7WdovHqNwuWGL4Li+zo+rmMnGpFEsikOf+ZCD1g+B
	 5WogsBjGR2vigSfBr5xc+LUAqI7tGlQQdwzs+FF94BxRm/iPcH79xPHLcw1T89ooe21mj
	 UW85ohDbItFp+sJFs0DLm6hnaupjEP0rq+YznFHQGfbPXeq8hdhjGLLLBKPOMmdVQOAK2
	 D9eLs5d313Hax5Cn3nS5WaKZsRPKlbVvYVsMHVHH36oJlLckK5zFyxnPWXhML/JK15g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892664;
	bh=P8MOujoNZgy8Q95gI11NfBEtgI+bFDj4SG3I5sQPdmA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q9bDLTP2D+MUHFGriaNqFRCj4zeVki9osPnEtem3Y9rseZUVCkPtNXpTjtb+SZ0nv
	 HmPxQrWDVwsMEObDJtxfFrIuzOv7KQE6hkyG/8QEHaQmOmtCBRyjQfdsP5jmttYEBM
	 kSQjuPcI3EjuFHKhyJwaTANUkQbNW8KMJMDG1beP0GgqWfLSoFeuiQKtC/8vxc/6ev
	 IXk4R3a7bV8fUWtnUpsiyS5TiPvwWu2isz6Gh8zXjC3ZilyQq5kqTqr4+aZrB6gC9p
	 2gkgO116zgh8hwUa7zYG2dsZw0JH3Ky/FeLrn7W+IxqkMFxlBmKixNRzN1fyh1GOAP
	 LJ6zfdhubNrcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B82640475;
	Tue, 13 Oct 2026 11:57:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F7C31399
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D60A40296
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9Sa9reZy3zk for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6EC8240297
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=jfvwXYpQaaipDZmY3dPrj0ZjRjVsiram91R88GfYhqTsdsVroveSP1VMEyecBnfWDmq+
 UfxI9wx1oMvTYWTVmkdH0OfFVuDX5u2zxjFS+xgxShJwR7b/UsCfW3jnKw41iQjcgyBL9
 +ud5Zj7qK8W59F2tMwY/bX1FBrbGqhs/8TGUSak+90EvPuWG9EwyLkmpIe6Mm2ixNxJwB
 BEyf46D9y83d+eME8QkjvoMw5r+D/g1kxrOb1Vk6/7ewnfrzLvt3aXQPeZaG7yg/NE3w3
 PXtOMGbEPFsWEc1feAxp10XJewQGr0fpDdrlvhgCIVCbq3Tqf6gyVCGFAnpd0xhHLJg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Km9GRJriCun+zVrRXCVtC1cIl0cBa6z+CLnSJTrrQGg=;
 b=G+ENG2fcd1xjw7kDKThxb47mJjQVSEhzf2z/DLRtHqExe9uHUFFvlHc4H3O6PWQVM0v6
 0jjtrEuctBorFAXDwDvTY+T619TSrtBjdRFETqi4/vrYXklKUtQRiGRdGoFKU1ZytXdK9
 bmnH/TzGzjL6m8uP5Y2rlq9x5h1jFPWkXzKoWIfEhPGh3vvmUgpwcnbKh8wK4ACS5FwCr
 K+Wvq6p6GRI4xIjJ5qvx3KaMGNGhVsyzEIIWwFgqABUF62sG+b4paim280IW80FRxoYQd
 ZaL7xPGKikMu3oG+p9RDF+lwViUTGQnRzN8mCKWItB4WZpUJ/TBuleOlL9+r1pY8EvQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EC8240297
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA40D9565F; Tue, 13 Oct 2026 11:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:55:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1de1477752be6330f78db14c02456dad2c2bf473
X-Git-Newrev: 9077096abd6bdf9a1fbe9d205d997ebcc8f9ec41
X-Patchwork-Hint: ignore
Message-Id: <20261013115617.AA40D9565F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-clone: bump to version 0.51
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9077096abd6bdf9a1fbe9d205d997ebcc8f9ec41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-clone/perl-clone.hash | 6 +++---
 package/perl-clone/perl-clone.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-clone/perl-clone.hash b/package/perl-clone/perl-clone.hash
index 2cd62648a8..0a75d5afc2 100644
--- a/package/perl-clone/perl-clone.hash
+++ b/package/perl-clone/perl-clone.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  62ff032a4df0c4abb74f76adf519361e  Clone-0.47.tar.gz
-sha256  4c2c0cb9a483efbf970cb1a75b2ca75b0e18cb84bcb5c09624f86e26b09c211d  Clone-0.47.tar.gz
+md5  dfd3f7bffd1c2725f0d114c2ee2880a5  Clone-0.51.tar.gz
+sha256  f17f66fec97dacca67ac9585701d2d079cfc80539fe6e8160c201c4e55f67507  Clone-0.51.tar.gz
 
 # computed by scancpan
-sha256  40aa7eb133e97b075024380640528760a54aefc344781741ed02539a375db5ac  README.md
+sha256  ef9ff0dfbd1bda7c74ad764a806ddafc976f2d5b6568b16a3ede8bdd2e8469e2  README.md
diff --git a/package/perl-clone/perl-clone.mk b/package/perl-clone/perl-clone.mk
index a5d18558bc..43a038188f 100644
--- a/package/perl-clone/perl-clone.mk
+++ b/package/perl-clone/perl-clone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CLONE_VERSION = 0.47
+PERL_CLONE_VERSION = 0.51
 PERL_CLONE_SOURCE = Clone-$(PERL_CLONE_VERSION).tar.gz
 PERL_CLONE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AT/ATOOMIC
 PERL_CLONE_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
