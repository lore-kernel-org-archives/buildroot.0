Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7B4CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6187481183;
	Fri,  2 Oct 2026 19:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDNui--ayfKM; Fri,  2 Oct 2026 19:24:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 824868121D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969082;
	b=nDaTTO3k2YFWOEwDhV+YET1rzUTmg+Waru/SfGn90cOuTQlr6rWdP7bYeplYlci3ddyF
	 lyyTdOUHbRPm+kxIs3PbIQAymJ2OWY1eX1K0mlF+Si/1pV4JL4wieQBYzYM5k9ntrmNwd
	 oFBJomnktLjqL2dPIJxT46g5gvBjUnuLV1wPz9C0dwFa66qRgsyD6tsexGGnlZXvLO6eO
	 mWxp9XAw82HH00dA0bLwpk+YvNjBRuIzFkPCU3RpPSx94pDG8LYutrnM1/FjeKyD3VxWm
	 s3PzZHhHSCpzyfO9f5vmWAEbBCt50HmTguCMLjwUdxxkg7B5BlAscdeXrAvcYNRm2+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969082;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MsRTPVBSUfOJRx5uwZI0ruTfT9mYDZAgcDnyODBtjuw=;
	b=T40Be6Fx1GB6FrLMARHyX6tefgDKLoEfYMW32gfLfBVVbQ8F6w+4r6gjUFMJFgPbvRiF
	 4B0snmE6Ny+6ySud/RtdTAcMp6MJr93fuZ66kIDgFSJSSkyKQSgBvGk/2NVO6SNEUbtI6
	 CQY2IrX2GyMhozEBgJA3NbQ0XUjEJmy1i0RzLRFAqjSm8CFBdAH3OIHW5Q2sMkc7/lU4A
	 jRGT6/9sTIq9dHxSW+3uxyKQzXuRYcaHzymsL8BFEhmIkuJbrah3kKfINmh7D2kl+O1xc
	 X4ZerLW0BLSGe9VcjxsW274XCIL7bWqIgHl9DXPB8rw4EouXcK8OXMR8H3KuXYJZzQg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969082;
	bh=MsRTPVBSUfOJRx5uwZI0ruTfT9mYDZAgcDnyODBtjuw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hWTEcaqsXTeeaoS+uqeY4n6DtPoZ3yg5UPbvhOw6XJdsrPSrLfBStHZyPZhvozQ12
	 1GcW2PDh4VeWSCcHMCKz0rsn3x8X2zh9+SjwR7DamzvOcoSHPZzaU8FmyGx4MOH2Rx
	 gA+c/ohqSOxxTHo39yCaEceAcSNQFiyDXL+FoQFL47Vbm8nwyQ68iK5udQrM7Tvo1I
	 nrAV4y6XOHHf8SxZCx6k+1OyH/eIjg5woc+p4jbbYun3QgLuQapVyCDbyrrI0K+5Yn
	 7pobuRbQFPxHhbJAaFoDRd5cNugGY75ssEoZSnVjlVnl6LUhDfNy3f51EfKGl85i8d
	 /FgCDNUi93dvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 824868121D;
	Fri,  2 Oct 2026 19:24:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1392B282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED54181183
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxrFKwtP3-mG for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:24:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4BE3A8121D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969080;
 b=YseNW+vqzlbV+N/aKnYn5bwd89cwWyY3Wr1L1qsNOq6Zqtm9nYPt3ei8o6B7Rao3nU0l
 cTyS5u/niD0nWk5WbVWCEMfm7v1AdEqWQAZ4PH/BMgyADox76Iod77kBy/gUDASgFNxGd
 Nnd/bobY0Pf8KzQaE9aORWTVqyPbP4evNr31khtewTzGFUYmoNBkcQU+qeXFMDDE2uMpm
 V4Z0PnpRrHySESnyPfNqA0K1Sx/HZR6S7loVlKXV+uHMKOWwGVEAuk0zzcf9J5FXE3zQF
 gVqtk/oUo3WUL7i2jEtg5xMrI9Z+RsVZaCock2FBYOlcHqoT2MfrwxIRw1CV53U5EUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969080;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IWuog0WYVr/nzkxZXpGbsp5vcMGRE84VeEP8D+mimn4=;
 b=Zz4ICO+hwn1GjErLO3FwaIM1mgHg61sWooDtivE4+El9746psuXLyDZTViCL9QjuRJGU
 IpKhXD/+RTXNjlzv0b88EzEh9xOn+aklucgRrrqKXqYoBATH2/dDQWWbz+LJq3HUI7qH3
 //2hhPGhBDjQz4Un9lXVmD+ne/cdZHUppE/WYSblQlGahCcEmzmP4uzRfueYwlJFxIKNW
 VfMT3C1SCTBRvFzqDTvqPw5AMBdEPCs8v5FsC2nklclaJmu/dy1xgWvNHyVWVQDGvzf+6
 nXjKXSL4QyvNOeR98TJkZqEdAV1X883JR2R7RvgxvxlRsO4M3s0ncmy+B7Qpb6T6f1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BE3A8121D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:24:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4D5A886BE; Fri,  2 Oct 2026 19:23:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:23:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf669d533ad4a0078fc2627b51fa3ed91b0f875c
X-Git-Newrev: aa3db5b4e15c8dd67914d58c8d03ae2df3c92cab
X-Patchwork-Hint: ignore
Message-Id: <20261002192325.E4D5A886BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gawk: bump to version 5.4.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa3db5b4e15c8dd67914d58c8d03ae2df3c92cab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 35524c7742..45c0ea38c8 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.4.0.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.4.1.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1  gawk-5.4.0.tar.xz
+sha256  07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109f105a826f5fd37  gawk-5.4.1.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 10ca336844..dd465a40f9 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.4.0
+GAWK_VERSION = 5.4.1
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
