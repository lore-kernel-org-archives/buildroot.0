Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF44C982CC
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C88D40712;
	Wed, 16 Sep 2026 19:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzXu7oXGfTU4; Wed, 16 Sep 2026 19:10:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 904E5404F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789585814;
	b=UWTdSIxNdsKlsaVw6ZLJ7dR2AQ19YYwyLCDCXoxqTP5r7uCh3ZehVFmBgh2QSYtZVI++
	 KMSqyhzup+y4sQ93LcDiD5VF4mawzcuZS2NynmzPIOZLDZkOc1dSkcDG7kxo9J9u3MQMn
	 eQTh5ph3i2sf0iAod18XAoubVjpyqQ7sVHPTkF3tEsTJSuxzoWMlzgBb5q5hOpTWOJDy1
	 MzfpKIjghRgVtmyQ1J6NXyn0wwKKCZiTTjfM1ttFxLFn5XVJi8bAq9SBi2gWFIDNY6D05
	 rk38+IKgjQpz6goub0ZsU/8XS8hkblSJR4PqT04+kDxJSMK5raF+6rbaeTOMH+8Cd0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789585814;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HYt5CWqxY57KYwetqNeTgTOGyobeymt5Uapkj9ZTWDQ=;
	b=MrQyj0/pHMLPCz0gA8qoWSynZdUuH9e63tZSR7PgHi+5DBe+mtfcZZNv7pcF6iiEQ5E3
	 0Pi5dR2pMeNBLXwRJsh9WntcV42czlBqRhaGwT6Qr+Bdkg58D4iZtW0jqUyOyKnUnTQXX
	 Qv+a8cX9RmgjH1w0+m3cQ1BdGUpN+033ZIpNpxbBV0SxAhtgbrBclH16zSJ1e2YEGIBA0
	 /K8kcPZYDvjPLrP3q4VOWQXrkCePfdq3oCDDo2qY0TNXfkZ77UToMICHAzNE37x81oox+
	 O7wsmDQjzHSWdHW1xRtHmp3ggQJ6Eu+PHKF5C5pewYnII0UwmAxvGrgcOIGWLZ1Dvcw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789585814;
	bh=HYt5CWqxY57KYwetqNeTgTOGyobeymt5Uapkj9ZTWDQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T4e3LaoJHi2BmQRxXKZ3nNJ/9sIxR6hCMa0h905HHHw5oXayPSaBLz2CFklJ4wury
	 b6cG6wNK8bH/LD/z5fs3JOV+q3VhQlTudBTen50ao74cqYydaGhDGPflvZOYaEwB0A
	 ClNnACVDSqxm6mwrWqU/LF9yPNzaHpo1nSnZPRb62tLPih9Al7D7Sacsy/bX6pYdEs
	 insafbEz17o8+Q4UelVzSK4f6WLlVsRPXRtmdW5hWMBAI6rH7NX1AYazqnbxt7L0yu
	 7HLt+OcP9Ml1+derxKk42teGNreDA8RkL9tzyiulY+NmXea/6vBBnWLDQuLwNz+Gqq
	 9+MTE/sIjS/cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 904E5404F5;
	Wed, 16 Sep 2026 19:10:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F0287AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55E0E60619
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6b9LO4J8K0o for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:10:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9E2C9605E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789585809;
 b=ny7mzclkrlGEjIm2aaNMOf61CHnvltF+ZmVBSKRk0jIp46g6wKzkvMnl6s7RYdcO1kt/
 U2u96spIXLft6o2MoY0XX1YdiLyIbGv3MUT8XVDohsfIWy15n07eHEk3lXU8hqkp4UMAz
 VA8Kki2iUQBaKyp8NWaw40klTrA3V+EOvTsEsBKcsLnhVFcwCqPpSPGdOAcvgZQKeFxLn
 CySJPR7Eob8KcO8gK+mJOYefeJBAfRKkZPDSsA7hqETQfqa96K7RXrwYs7IFE8pB/udzM
 lJWDhlko6/CQHBrJOFqC3JECQohWIn/7CI9P/wwGRCHZKsj9VmpZ5fgm58/T6tvsWnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789585809;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tD2CgxmgyLPGnSswpou/OWxiWNA1Szn3/3OsBZcFM34=;
 b=TUTbN3XUilkAYrrmLadQyxwoJOD0EoSiGrM51iZ5EBTruaQWf+gHZ1djPL4v+kqCU1mc
 MX9AECI6FSJR3mUiKy3qTlJXiW9xJUiYpysWZuGnuB1d831seUYirQYj+WGFTnM+St8UC
 q3RtLMas3Eh3KsnJFe566JEHxEXWpDhhp+lGhZtMgK97r3zN6PGHRjfQJSqiMU8/H66xn
 zQWgiDPv3peASMCERfcvOAYsvfrSatSGRtlXfmHK7cUlDLrnZ4llAfj47r58C/4jw61Xq
 sC8PyugFrAdBx5TmBlzNpoX/n2iXLQdfkArugX9Pfg1LGLeWaT1KH7k1+sUgLyRC94w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E2C9605E5
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2716696872; Wed, 16 Sep 2026 19:09:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 21:09:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edd3a015cd90441291d2b5513c71e2eabf682e24
X-Git-Newrev: bfcba48c74a3f97588c3509097187293f67f15d1
X-Patchwork-Hint: ignore
Message-Id: <20260916190903.2716696872@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburcu: bump version to 0.15.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bfcba48c74a3f97588c3509097187293f67f15d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.lttng.org/?p=urcu.git;a=blob;f=ChangeLog;h=44d0d303b649682d05b3be85fa702eb919343807

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liburcu/liburcu.hash | 4 ++--
 package/liburcu/liburcu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index 5b5947f6b8..6f45dcc28b 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/urcu/userspace-rcu-0.15.5.tar.bz2.sha256
-sha256  b2f787a8a83512c32599e71cdabcc5131464947b82014896bd11413b2d782de1  userspace-rcu-0.15.5.tar.bz2
+# From https://lttng.org/files/urcu/userspace-rcu-0.15.6.tar.bz2.sha256
+sha256  850b192096eb11ebf2c70e8f97bc7da7479ee41da1bebeb44e3986908bac414f  userspace-rcu-0.15.6.tar.bz2
 
 # Hash for license files
 sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index cf1b08e469..14fe6e91eb 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.15.5
+LIBURCU_VERSION = 0.15.6
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
