Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93CACC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D83F40693;
	Tue, 13 Oct 2026 07:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ze2I6CuPrgzB; Tue, 13 Oct 2026 07:46:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 853AF40689
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877567;
	b=Y8Y/BdzcB7aIdFkghvJF6dFL1kKakwYgn7GHmqwBatqnUs+uRWRLYH9Z6lc+vBZZ7yJq
	 qaMB7sgmUqLpCizi1guygNBnK33AyJK64zLu8ZV7cborHtNbqG7ZS6Br0qZxu6hAX1R8I
	 yxl+v/ZZ8640eCkVkcAkMmxySADLZVh5r50ycys6SutkyUDTT1LKnpPIPLrWi6+Gq0UvJ
	 FkjKXC+0EvZS9huzBQgVgNyZZGtgqu1DTge8xGRyhZYSdGwlnwzSZKPePOWzRze39CVmZ
	 OmYiEcC/tnVv2VVNzQaHhK9qgtEB36D4NTOYafYaMw/n7mwJvna6E7NEBVErhVrracA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4pGjm5sYZHpBrTxksq2O0tq6r9kiOGZYSwfG8cr3IaU=;
	b=edx9K6qxJ8WJD1eR+WULrc5xD/gjZr0e05FbUi0dVTzaJ6wx4P3ymHYSzpIHPz4a6Uzq
	 x2na+9U8ie+TcqjoIV8cKkD5jtB4ZQ9cK+3QzO8tooeTxeMieM8+PfdFNUCQL7fKhJyTl
	 63Biq4Qce8MgEeGuMFyzLaCHkNQJJhPmtoByDynlCFwG7oNLy87IDi1hEIz2RsxpTwBsd
	 FYx8YT30ccwdhmtGWyTthk73kbQENG4qG2FfXdhSBIZmVyvYB/oeLr9AyUJ+uo1nFfKqr
	 l8gl1/ICx+wG3gSrEjic9Uslc69F1FPeEYQJBeAjQWAq7TPyrZIbU/Y3mAcPd9kyUyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877567;
	bh=4pGjm5sYZHpBrTxksq2O0tq6r9kiOGZYSwfG8cr3IaU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i28IY/tlGszFf+hd+xuSB0aWM8WJSN+6OAku5rwIwrr0gAF2Vyf/13YTyavi9YLws
	 J2BehBbPTv6bQAxp58jo7KaSzp95teZXZ2bhf8je/675zNIE6wgELQLPXDqHI+ahde
	 KsrYBNE3jWHBh8/ZL4qkTDhGWGUnhE+5JJ+OYib3Ny28zQ7azaLNQhgStZUXAFttrJ
	 4OzzJW92O53aThH+ZMA9V5scc0MZMc4h//taU0lJGdtD4p+uzd8k4trOYcsBgyn6E7
	 9J/jHbjDN9N5GFagQk3hTUosHjjp02IHx1dlCnI5nmQXcGktWviBEHQg9Qnf7tHOGB
	 gFGZ3bJ2c+3FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 853AF40689;
	Tue, 13 Oct 2026 07:46:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71D2C1399
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5827C40068
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqzNWhZH1d61 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A864340204
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877551;
 b=YfFDQq4NNTHcGNVUmTUCKQEizz2myjZ6TdjrShn2FsDOvFl6+5HZ6FJO4X4sAp64uuUg
 vkp2R6p4gUDlne+GEACmCral+q2lMIOM5W9IFBjmAUq4buDjHWuNo9+0bTxEL0Xp3//5S
 zCp8sOS8+91pgKrOwdgdC806lcV3ERzCP0JQv2fjUG4f59l9xxeCK4U1Qca7zx2SNr3N3
 HxNMlR96hQdmNj/osH69ub93r/7U7+zYl7cCQwpyjIaxHCTTPnw+QQL4OUYApQfxN29vJ
 j8G2x8JIKlfX+5NGOXXmR7iJSWN9b/hjdi8JrO5vd5R4RJxMTLjJPELGA+Pq3EWhFtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xkv2j6qylwLKuKDH8MnlCfyqH7wP+W7tTvNTFwXq4Kk=;
 b=NugJsixu5Y/IwHEGu5b6E45I1+hC8jUG4gs2NEzMic62HmqLTD4PDNYCnxFSm3NkVoGx
 3Gs+0zwCl0U3OBcFuhuALtaDOtnWLvKRCsNlZs3wJQOzIY7wj1F0WE+aVyhCk1hWi6Csv
 8z/w6GMa85jRH+mOf9lsz4JWX8HM4WEy71ihv1WVl1uW7V01DTjMr25lwoudqLkSs5X+z
 Gk6tW9ssm1de9806IcaKyu6S5FCVM5uoy4SYjdCLMKGctDdCSeAKFbKgCsTI62sSf/k5E
 dvwLFn/ZHfDblKHA2GBONdFioV8BQhSdv3W4dVdrDhgwTp7ntZlnh91KoDBFT/rLH1A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A864340204
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D49895442; Tue, 13 Oct 2026 07:44:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 08:42:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b35bd725dcca6d2ba3b36447da860964bf352993
X-Git-Newrev: a7ebcb62a7dba25139981f89c810479909941a2d
X-Patchwork-Hint: ignore
Message-Id: <20261013074432.2D49895442@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-plack: bump to version 1.0054
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7ebcb62a7dba25139981f89c810479909941a2d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-plack/perl-plack.hash | 4 ++--
 package/perl-plack/perl-plack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-plack/perl-plack.hash b/package/perl-plack/perl-plack.hash
index c9e2bb01f6..341847e41f 100644
--- a/package/perl-plack/perl-plack.hash
+++ b/package/perl-plack/perl-plack.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  0b3e573458b37ad69069fc8cb307b6b8  Plack-1.0051.tar.gz
-sha256  bebde91c42298ed6ec8e6c82b21433a1b49aa39412c247f3905b80f955acf77b  Plack-1.0051.tar.gz
+md5  2aff327a947accfde698fff73b42e1f9  Plack-1.0054.tar.gz
+sha256  55c44c483c534ac584ec334da29d9d7dafeefb26dda763c449b15da8493efca7  Plack-1.0054.tar.gz
 
 # computed by scancpan
 sha256  8a0c0ad4682691b5bc138e553636adfc8bb38f8885c4c44fd421ec8cc69c9a8f  LICENSE
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index 2c591cc05a..6d0c04d564 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PLACK_VERSION = 1.0051
+PERL_PLACK_VERSION = 1.0054
 PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
 PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
 PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
