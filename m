Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91BAC79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7303B8115C;
	Fri,  4 Sep 2026 16:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaUqqysCfYRk; Fri,  4 Sep 2026 16:22:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7E49081097
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538943;
	b=oMA8eDs8gkI5EIZuXq64M3TBZLz0Xfjfoi5Whr8ajod859uDuUkiKWhRGW/GJPmkL0W4
	 B050GXi8jVg97l3JSaXvbxzxTJwqXdvtDNiqzlWeJdfPqSBEvLhVpAF2yj1tO8vIDylv0
	 w3ym3bSmhWGmq85c9l+pGSm+2KpURq5d8sPnTXkMwNJ7nadCn9oxcd9tsqWvRE3TKvJkn
	 38JdGq+35Elp5QJAIJ7rVQ/enJF+Rigv+mJVEPLHlL+bnqHYCfirAMvjcRfc3VymaNoPP
	 0T1fd9p9cm4UQAlxai6VOlIl7V0sirWgIkFA+/Hv2qRiteIoeNfan0HIzGqyScj+79A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538943;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=krbmHfhFUDkwjfWpHowKXI2mFlYKRHRG+EorPoxAL4s=;
	b=V2ymEWVGrMBhrFE9pix3GdfddOmdAR0ODxVaTq2/F7ta4/kH6idGiwmgESnYfJxxZoYv
	 yAfmN5xxeCrNFvimvJCF9bUKJJQJz1WvcjGoe0IkiSuL4TXy/6gWDFHXkM2xMrqtnjUBz
	 uooxPW4IYdVagE96vu26jfvDt1tS58kwrHPDE8KTCM4cDyreXvzRBhgrtNRAu7JUsvJEV
	 j5Q/Y+DDrZvaQedQjPLGfYAMjG3WyXAXyD6r6QKOfH77ZEYzBPA9aE0ecZmYicleG4isB
	 udUM4h8T79tx+mg7s1P8HHpPTyLR3ffG2qLUgYGrDCiSOu4D/IgVfTWIi1Neu5RkJ8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538943;
	bh=krbmHfhFUDkwjfWpHowKXI2mFlYKRHRG+EorPoxAL4s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PCcx6PW/FvIghgKhh0S3sz8ghAbWDnEauKUtk13XYYgu7JAfrryhls+wSBrmnySNh
	 8xkboEeBxGQVEzTTCkY36+F5HBGEO8UseQ1A9ofh4naoKDT1/JGhIaaA4YdFZzP+lX
	 QFFNMXU935f9x0uL5N5BLcyx0j2H8cPJyYrrcn5PriV+DjOxYjX4UO0gaF3SxXcfGd
	 97E7u8zE/5f3nBK7VGWukLN+xwbrHnTlljRi2Dyuf3Uukqgac5S+QEGIdzf75R030e
	 o2EzQIDWprboTAxY37cKGmxCoAQ+ldzXWdgIEroZSbUMvRoDKku1H6J9NA9Gt03lYN
	 vuhHf54wkh8Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E49081097;
	Fri,  4 Sep 2026 16:22:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 313573893
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DD2080F77
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWxKghD_Ax54 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DB8CA80F64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538926;
 b=UOG/Zh1M83MXHYJ6POoI3Oa9BerncBqKm4d87hsxF4bYAxschZB9/bqysfwxXKpu4gKL
 Mg5CspTategEim3Ese9ab3lByqF3IwFR0W9mHsFkjFlyqAAy55ObsyIlnLAKNwpkvoeJq
 H8Fv4fmjsdxG1k6aK2gYISQAf3EVtSi6b8nEcxi6+uYXNqoe10wHdmE2HbUB1JvQTW5QY
 EZ/0MOPXBBwZUy7ZIR0w8IJPmmD27WkQd6+1gTkYdyagh2e+XzlK2uyVIdpnB3bxOJXpg
 MOqhjBxRv46me7ehQ5uYAjka+1YGTGCvqG5zaFbtvzhTPAbOm+yNTP/y6y5m0fhHl8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538926;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CelDGhdcsFACBOkMJU5CVtnllTlos2rC19ReKacxBXo=;
 b=r43NApV5bzsbEQbvRhT4RJ7PtzTDVNl4MeTOo8QnsHTZKeIxqh8MI6/t0WPML7428YVb
 H6FRp4Pr4NxL+YQtTzYfjb7fYhf4kFlNI3YIpanCU33w5G2cIaiX+7yzX+50x4xcVyTO+
 fO+ZLbD7T+mhPG4PnlHMRMfCaniYnfuJHdyzUQUvbLjJK5cE75TphHOJF0T3IOjKJwtij
 5tD71V62gZLmu90FDONj049D8M8M3y6Hi9YOg9i0Giwi8nx9apyffcsyKC3PZbbI4Wr5n
 8/GcdA4Hc73+MOkYDJ1Sw8KrNXGjcCjr6wTHMJCUcrTp5o/0ap9Bucg0BD9BidEMEEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB8CA80F64
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C98C94CC4; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 22:29:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5180309b1b66ef3b8eaccca70ad69be8e0729a1
X-Git-Newrev: 8a5fc970b48a432f5df3be1f1e7667095e712b3d
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.3C98C94CC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: backport upstream
 fix to build with Linux >= 6.19.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a5fc970b48a432f5df3be1f1e7667095e712b3d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:

  https://autobuild.buildroot.org/results/9b270904b2f7cf9eaa661c98370c582a61ff2342/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e4cf512c394f218cc71eb6b496ce4cb004c917bb)
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../igh-ethercat/0002-Linux-6.19.0-support.patch   | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
