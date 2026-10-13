Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC06CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 07:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77E70606EB;
	Tue, 13 Oct 2026 07:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7r407DyG2HN; Tue, 13 Oct 2026 07:45:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5D2EC6073B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791877555;
	b=s9T34iV7E2NHlXlqQsqYCRvVLn8FEhZvJoijtblRjYjvOfmukW/n1HNLv1xoyPg1WzDl
	 S5RjNj3uS3/87oXeH7UoG3QfyEFJyBZ/Wq5pe8SRGKdojN9EbpwqIzLKTRo0jTiP0D3yG
	 HgL0XCiq7oa6Bc1qe4SNzmE07wjyUGyKDssdzZ3zjzlBVQvl7u8kUFGizouPSB/sQnuzh
	 aOMTD/9uuYhQB50QitBhsuLJ8l/YTVSYNNH0DZVeeZKTc4D9MHB+c/wULpusqUb7WYngI
	 4tFUIcsN2tW0gH9GwVDsAWLq8Dk3/S2dCtqnna1CyN4Mvi21aO5ILQJm/Jg0m72C3OQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791877555;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1l1QFyQ8JTs2VbyZ+llxetv+47y6MUDSKz516vSzk6c=;
	b=UT6khiGcP3wICvseOfRFsbRpQ+jIaPWiTXDKyEcfNDyGjVehf1/7penW2AflKanFXsK4
	 ccLqw1VZFZPs7NTA5q/mMIBWuqHTXydu0YOYCdi7MwhyMhbXeud1Jf87j2JD9ep5S+HCD
	 jPQCHG6RuTuvMc4Mo5X13hhCMfDzoSdWGiuV883fwWrguQh/0HDAEbTQoq+D8va6kfRa9
	 w2DYswduXg8MNDjmBvWiZV6CKJbbGl/hmLbcTryN8IDjUvAdOCU9MUBx4W3epGT3umLyv
	 XK+bzOPTde6xPcYwLtggn5GskE9Osh0RfsWtW3Xw12qtlIdn0osYx5cGyFH20eRGPEA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791877555;
	bh=1l1QFyQ8JTs2VbyZ+llxetv+47y6MUDSKz516vSzk6c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jfX1RbioMXi4SWIsQRwcjA+MT7PKlKJMvn5pRrLYnH216fOVrJMNEi6LR2/DmrI6H
	 yQixGDKxSfXd9XYzi7P62dcrxyYRgUqi0tvCnUsAVQUg34MqwT6PAZBygG02UKgNJM
	 QlBifmxCaYq6zRkVjP5gqX857ah76KqM3hBvaAFi/991tcFRrA2ef3MpS/4GGOViG3
	 mloT6hXu4g8iwmFzoIWD6pthfcSANjT+Gbz2sLzwpwP29b3B0l0ZY+B7aoSlItlSXD
	 UCkkL90d4Iu9Hh6fME718YTtQWIPRQxgp/h0ThrMX9/3SonBMNpJGCaMR2753CF6st
	 chprKA7+61UFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D2EC6073B;
	Tue, 13 Oct 2026 07:45:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C853129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C639606C1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Yeau67DNRXN for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 556F0605DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791877551;
 b=rJoI0k0YZXhO2KEWqgN35Wqm0sDXddGEP7r2JQjhlEAB64bxzCKFJEOJj0JZrgaQzMEs
 CuIy1zqD69m2Cj75o//r0glYLy1ze4iw0pdpJjDs6nwgrCpsD4sw1giN9LCk59lRC244a
 EmEodGzkypL1Y75glOQqJglDznvGDymH/HHxdkAVXGEx3pLkrT+zfl/Hz45ucRx0oQ8Ej
 RGg2bNuxE90A8y24Q8tL6+pMJhRTbDuYGEy11qW5a3gULYo8l8iEnnDpt3WLR/LPQHO1O
 y641HmSwqdMj18mrm8VZLWitbZtCJpbLC8vHJZQH1XdEZyumGezDcYxVHk93yFwfMEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791877551;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ja074II93zIogj8P0bbws86ohJ9RkNPF1bQE/Jpp4gQ=;
 b=P2u5nNp1TFNp1+HLWdutXN2cBkWo23rvuxTo3sGBj1JvGOxmGwAJGmKIVO/mQDuVFKen
 yWkbviwaDEpPwbIUacRnJ4xNfujD8lBsnz/saLxTvK1rgddQs2wax5JSnlkYkYRY0gtVm
 EnPgiueu3kVOPH+whEO+oy/3Q7orMYKGwR3mZs9EjoRZgC7LecuY0T/ovRPX1gz2QlKbr
 cTskFybaJH9vWNmgtFbtHLCrmZPKYK3ks7wsCFPelgurnadW0dTx40Uc74TG2IeQr3QV4
 Wo5PkkfLZESYwR52XASSZoMKsg+goR9yvAm43XKZSYYy5OSg3WPACrv9B6M4gd1HMvg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 556F0605DA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 07:45:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC0F395441; Tue, 13 Oct 2026 07:44:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 08:41:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e17cfc9b3b728059d97f9f8c4d890b4444125d1e
X-Git-Newrev: a380ee2a164027259cb62c6911912cb93985fe16
X-Patchwork-Hint: ignore
Message-Id: <20261013074431.BC0F395441@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-date-manip: bump to version
 7.00
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a380ee2a164027259cb62c6911912cb93985fe16
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-date-manip/perl-date-manip.hash | 4 ++--
 package/perl-date-manip/perl-date-manip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-date-manip/perl-date-manip.hash b/package/perl-date-manip/perl-date-manip.hash
index e9f686891a..2d00767aec 100644
--- a/package/perl-date-manip/perl-date-manip.hash
+++ b/package/perl-date-manip/perl-date-manip.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  322b14e69dc35106b9df4f45a4f520f0  Date-Manip-6.98.tar.gz
-sha256  acfd8a60519ba4cd181c8a67a83d7f029c6d9ab4e8b0212dc47e41d6210fda49  Date-Manip-6.98.tar.gz
+md5  58ab5bfd0b0f96fc80f49805e4b10265  Date-Manip-7.00.tar.gz
+sha256  37133eeb09d36da6d461546cc216b8f6a2297a43331c680a6848f3fff925975c  Date-Manip-7.00.tar.gz
 
 # computed by scancpan
 sha256  8ba2a138654f8b59b7e1e3ad0d4c81918b9148ff95078b172ccbb45fa241431d  LICENSE
diff --git a/package/perl-date-manip/perl-date-manip.mk b/package/perl-date-manip/perl-date-manip.mk
index a82fcc0a20..c4629b5c61 100644
--- a/package/perl-date-manip/perl-date-manip.mk
+++ b/package/perl-date-manip/perl-date-manip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATE_MANIP_VERSION = 6.98
+PERL_DATE_MANIP_VERSION = 7.00
 PERL_DATE_MANIP_SOURCE = Date-Manip-$(PERL_DATE_MANIP_VERSION).tar.gz
 PERL_DATE_MANIP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SB/SBECK
 PERL_DATE_MANIP_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
