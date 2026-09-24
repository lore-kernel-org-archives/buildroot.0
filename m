Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90888C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53810410E8;
	Thu, 24 Sep 2026 19:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OePcYu1b3OHV; Thu, 24 Sep 2026 19:14:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 49E63410EA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790277298;
	b=NlyXYvkBxrrnoR5O+DIhBBq2LrWLtZ+usD/TMwvzeXTJnaWH1TYYqTqstK3V8hunPm+j
	 DMi2OkhFoIQCP4LYH7s62Dk0iR7EOYehXs+r3yMD0TrhO5ypNokrfVPM0ZtudGS9TCHfm
	 VygI3nV/T1leE5I4D0+QrROnd8rbDn9RE+xTuzyli7LEW3lp8WnX2bq93o6DVwg+eIpOC
	 f4Pa2IRfjusO3yetAd/uRZVuQtYdhPAhGRYg8H8vA0G7SzBJeynTLrUXkspFBP7ZwNix7
	 7HtZniEKQo/Ax8t2NO8ms6gtQZ5LE48llcjslaVV8USqMc2kiuFDvKzv/qozefcNwJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790277298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JV2qgu5chk9CLXz8kENfVNDhDYenCixyNt74Utnj7tY=;
	b=PaMgawOsB1r05Lj8rJWrxOp1urxDcj1PFxW/Ao9dC3BLLVDGmS6XcntxXPHngBNrwbJY
	 xcFWluT2uhJ60aRMeUd1KUNsbssbobsMhkjJk3hFw/r7UhvrsEvbyQ8n+50wkaIXl1GZv
	 WUg7Fa4m1EqBh6pgiTnTJ8VexB8ctAY1K4FN3pxOHwICJS9ZWqTlhCA7CWNumCfzb5A00
	 zoulbj8mafjMRHjY8GaLLnrggB+4I6ZnLPDxI/apDTx4FARTce57A9vj5h/X99WGtOH/K
	 EJ2xC2bKYVi6pJPxJZTngxXLGa4BFi5vGRm1+Re2D2u0I1L8V9yEo0mJ7PZiPzKpmwQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790277298;
	bh=JV2qgu5chk9CLXz8kENfVNDhDYenCixyNt74Utnj7tY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QHwMZXJ05+SKsgOaXIi71lACNGFKVy+EWqh4JgUdIxmEoH7vphIklyMmXzbfH533Q
	 xqrfOOkLBo22xda2tnK3wQ7/QYFCIFGE6x4UhCjjeORk+PYmpvC+Hrx9aYDsm01/1n
	 IlxpcaSZzLa49UFsni+X5xbXvNjbMJVW57uijytk+Q8cEWXpLd5SDiOTYi0QF6fPpy
	 rbKnZZ1VpyJBbY94cG+mW9ZPT7hnDRMugzK8dPJszYoQXvluvJ7JYiF9K8XdlZKhRl
	 El35wtmdSZixWQEgATKgvcnj/VJcAnVH/nOB0Ry0LcCet3Y2iG52QFIWGa5liJswdz
	 /b0WhGayPQaRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49E63410EA;
	Thu, 24 Sep 2026 19:14:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3D9332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A25960BB0
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NOauDGxppvU for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 19:14:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B967860BAF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790277295;
 b=K59/EpBQcBPq6HiUyam9r3vKe19mVaJB2wZ1Oa70uV9GRalaq7715rqE/6h/STYqsDA/
 B5rOanquJPEe+nnktUJkgNVMlPriENLrsPikjHBdmvZO3XY4KpIECTINA0F0L50m0upUs
 bo6mBwlxyQcyI4FnNddGYtIZi+p9fsdxeRWKe41HtMDoJ+pu7blAS0xuaKR93O/ygI1D3
 5e3IUORwQB81vaXyl/ypvlV3KTga4PY0VuPzZfbiwwDCrNOD+Ily8oR9+ohUi2CLdgixV
 NXpmzGbHGLol7ylI4lUOjc+NWGr+M6y7HEcXGTiQf566mLT6PuK8fl23EfllUir4SLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790277295;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PbK6PZ0iLJSbqEB2DhmT3METELIbd1CPIuJSsFBcH/8=;
 b=c0g3rU440NQlCndp9/qj0/oC2PZb+L5Dw6V0sLjQRfEwnLJofwmYtOofLCRd0wENa+AZ
 Dengn8zocUtls/EeUVJbmROl8DJtWoO8Zz5Kqvmqdu09tC98Y3H0zukhuOvEgvYlPLMFO
 WRh6SLnymbMfP3tiiuavAJnwpC8quXpat3qsT9UGdLUva1XmwjUuqgwE1Klvsf3Q0Xyli
 6MX4FW6v20Xq9GvjHbYDVIL5r4u5D8vOvMU9b3nU60i9C60rckTOgXkxM5AwDNfKkDzuL
 FJo88NNyUiQpxBid6lvgD/XZLWezdCvIatk5cdwzXn7jOWYbeGmRXKtt9btzlLK7PVw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B967860BAF
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:14:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48CE698391; Thu, 24 Sep 2026 19:13:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Sep 2026 21:05:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15ea2f82218a3adda63b97339c5d46e9019dc028
X-Git-Newrev: e7bbe36be89f5917329fb33051d8f702ebffb402
X-Patchwork-Hint: ignore
Message-Id: <20260924191345.48CE698391@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.6.8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7bbe36be89f5917329fb33051d8f702ebffb402
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceforge.net/p/fetchmail/mailman/message/59396310/
"It also includes fetchmail 6.6.7's security bugfix for NTLM, which
has now been assigned CVE-2026-94184."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fetchmail/fetchmail.hash | 4 ++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 023667e207..0fc6eb55dc 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/59381086/
-sha256  bece8aaaa68e029eed9fd55fffd2adc7dd6cd5e9574d5bf92e2d9208bd97a881  fetchmail-6.6.7.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/59396310/
+sha256  fff279d7ffbf4d9449110f715c0deb5ff5a2b13b317914b6f2c810ea12a0b7e1  fetchmail-6.6.8.tar.xz
 # Locally computed:
 sha256  48aea24325e55932dbd79b30f558b9c87a416d675fe5f94445e8be5cb6606fde  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 9d00d876d2..92cf3fa090 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.6
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).7
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).8
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = https://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
