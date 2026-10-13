Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDCBCA9ED2
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57BE3404A1;
	Tue, 13 Oct 2026 11:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uG4JlzEkG-D8; Tue, 13 Oct 2026 11:57:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D64A940334
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892661;
	b=sdYJ9PxA1mVkobzq2T7FNSQHqwlNdM4sgQ6pfPiXDEGbDlk6xUwChR4d4pvEiLqA6DML
	 kGqgZfklpeCDFo7bCIFj9CP/hFgGSwEtvcqiF6gN0L4c2V8Fm0etQFF0wREGMboYygDM2
	 EoeGiRYLTPKjOl3uWp78Hz2kKnCb8+ta1+SAODpRmAOhlRPEAdYyWPtrHEcHhRwNJ9XZD
	 X5rW7UCyVXJwexLiMGJncqqVb+lyzvZlKmsx9YA/QJVPmu9xkYuZJaGwDc0CeMwxf+FWw
	 /rsnj5h0R30kYRNAwEii+RwxyHJGicMVzK1gLvG8metrEvleiJAgxTDY94/b5pV2/1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892661;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yXPUJpaUp/8JMP1bdNQtnf/PI9uPPV95ioaYKfHgIWY=;
	b=aAulH3UzOZ3Rr0kUsOc3Q8kqXk1LYn6Bn/RfY/xnWh7ofqmqcuSKMALHdJqH3fZTQCHx
	 WLLbS5px1Fzfq3xj/voeD0N8mPuYmh8I2UYKWVxmgWJ0ffUsOgtlqKH+nNr5FRzKZwfMM
	 c/0mWDti8ki9wM7p3wbfwsxu8WSa01gh+lNqYiVgzOw2vU6M7l1joo0MJ/qrstj1Y7jP8
	 7863EEWmcwLr29Xh/m4YZxT70k1D6o4Z0aCacqWS0GH2wa9MHNbIsy0iAOi6cQXI6WPfO
	 EXZSRwEgRZFmUrCThNqheoPFPJfcaCpopg0X5vvmGlbJYMj6jy4EdH6p2bt/lN5c87w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892661;
	bh=yXPUJpaUp/8JMP1bdNQtnf/PI9uPPV95ioaYKfHgIWY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U3lZ5AbDJ/t41T4z8Yr0kmpzvegM3FwEA6q23OocrrVOy734++evPSvbhZIM/pDCU
	 El/Nq05BKdyWgfrwo9TzN7fxRrzdsaYsyCFnR00qu/aTyd2ZIsfj5Fm6X1m+fLiIjz
	 /X3M9in1GDOme4ndJdEQrfFIU/0UqrbWMsssJHzu1vkXCx/3ZEMYd08/4Zozp0HCK6
	 TvTSTloPZH10LovWp4jg/+N5K2agAAT1EbJMFGsrb0LV7rLb7lEUIi0LGGP4kY2Ipn
	 mj2Q+jx1QCpr1DeEfqQru3ByDVBZ2d2FPk+ck/LTMlAzFN9lwRDPiI6RmQ3Z5emjpz
	 TW3P7qZp4nE9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D64A940334;
	Tue, 13 Oct 2026 11:57:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A9354DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29D8A60667
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQgwiIrAPPTQ for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 76641605CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=Q+m7H7y8ZGqD41hUnXMTCO9eLTUxizfYdnRy9azTVFbG6BvYVvqsech8/LoQEoztieAv
 dTcBbfJp5xnsLsZGnCQXQtMGwyD/sbiP2zIFHLU5SJIpMnlQloRmLbkWr6J2DXhdK0pp4
 6GivWZ2ESs6CaYcOtlfd4isuB7pp2ywClQuZoE9P+8fxufU+qg8SbHnOFnz7mA2AS6sh6
 adc2fQ5YoZ2Gijno5lxjaaa806Gn0flkDMSWJzkkmSDWnhbeHyK7mA1+ozNrJucx4Cjtm
 0Vu68pVctySb3Bes2lPxfC+8HMgH7Th03LLdilWVza20SPJC+qnE1HexFGRz2dcJQcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yn7LPQ3TAZlTVoGflm88FxmvXlfrh2tNxJrTItj3gqU=;
 b=J7Le9K9rhjzWJMRMyAnXqcDeBpPEvUsiD/1luNax2jUDbyNLZG2x0j/oKxeKo7RcaBX8
 cimFIjTuS8UhO4x0MmGN6S8AGEmannfljGMpzqu4bJ3uKHNA6VtbSXchVb3ueU7oekw7H
 z+jhSXzYdodlSwVleu/m4Ph66YCgi5GkGoVKbZ64IrlYfU9hsYHrC/JEfAGupFOtejkRS
 pBMBBz8mlaHPmSqQMuzuK/01TnHzkptd306PZgWANTTV7qacAf2rVCVFwwD1HCAzqnGJ2
 YDDhBxwpZhcVQNDZcM2IhsmDzh4N5truyMYBBjDrDWWXs0ImGJOScFMPiDP0Nniusxw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76641605CC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAC72956A5; Tue, 13 Oct 2026 11:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:55:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2699b79baa9c7dd39334f021c09a477cc6ee622
X-Git-Newrev: 0c54043a9020ca5f6e71d6c4e3be271aa9a99d7b
X-Patchwork-Hint: ignore
Message-Id: <20261013115617.CAC72956A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-http-daemon: bump to version
 6.17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c54043a9020ca5f6e71d6c4e3be271aa9a99d7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE:
see https://metacpan.org/release/OALDERS/HTTP-Daemon-6.17/diff/OALDERS/HTTP-Daemon-6.16#LICENCE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-daemon/perl-http-daemon.hash | 7 ++++---
 package/perl-http-daemon/perl-http-daemon.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-daemon/perl-http-daemon.hash b/package/perl-http-daemon/perl-http-daemon.hash
index b1d92ad8e6..c7b6799587 100644
--- a/package/perl-http-daemon/perl-http-daemon.hash
+++ b/package/perl-http-daemon/perl-http-daemon.hash
@@ -1,5 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-sha256  b38d092725e6fa4e0c4dc2a47e157070491bafa0dbe16c78a358e806aa7e173d  HTTP-Daemon-6.16.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  14f98fd61159ec4740a21781b787944e  HTTP-Daemon-6.17.tar.gz
+sha256  16281580c40e23108d028434698b5d7d53637bf904c9df822481e253cbec920c  HTTP-Daemon-6.17.tar.gz
 
 # computed by scancpan
-sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENCE
+sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENCE
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index c017c4e099..835a6cc496 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_DAEMON_VERSION = 6.16
+PERL_HTTP_DAEMON_VERSION = 6.17
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_DAEMON_DEPENDENCIES = host-perl-module-build-tiny
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
