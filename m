Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576DEC79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 21:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E573F40675;
	Tue,  8 Sep 2026 21:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6daNrBDaiOJ; Tue,  8 Sep 2026 21:33:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A224D40670
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788903200;
	b=ZEGA+S6D6ILfmXWPMqGpfBAIHGQX1+6pTb8JZe1pWnS9n18MF+z49SWE7ZRPF8gAJtAd
	 MhK/sOuQXl0Cw/LOgxJZPgjzrzTng8742QRkmlhoXBvAcRLKz6npDOZc5BtGSz6RUOodE
	 oZdeaiRmrWWkWb1/iT4lnVHGp5yDRIzz7iHF5W/T79gq2QsO3OMzBcHVl8/anHLqG8aXB
	 8R+Wr9AWQa8sbCJjrD+8LVkZWCDyUQY0TNtbjsY7XKXw7ZZ+yLpbBh1g6OdkbaxHd7pvS
	 F5SbYcjoqQioyU67iHt/DMgtFfay67TnmngS1b2BqNgpcwjE7jqVlxZ16cJ/QQBQDiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788903200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C4M4YfCcdhvLFZ3ZPuHylNAzOapmixja+Gd81DUDh+Q=;
	b=HdrN2dyA2SWqtsR1NK3mPaV3HK978HM8hW2zx+F/BRmcpYs09KWinhDHBppixYHrGSnH
	 yLNiN1xXOxP6MrfuatTGwbpIuglqWBsCM5hZqiSRG7Fy4LsShJSY6N/iIPeY5T3ZUhm1A
	 C5ibwMLHjaodjEzxuqG+AhZ/wtHDaD+Cdj1i2ODnfL8SXerpN4PwsReEKA4q7myO1MFmJ
	 /eQJVBQ20zqzeyW5x2bmL2Uqc/v5NCGbZbZg6Me/HuG/7nUKUs3GRIOw/JLPgOA3kq03C
	 Z7dtG8TLCEWBiuxgpkWZjOvuC+lGstg2VtVYbrVwzJTLSO7TAoTQsqgJ1TVNbzf5QoQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788903200;
	bh=C4M4YfCcdhvLFZ3ZPuHylNAzOapmixja+Gd81DUDh+Q=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+LamIs9aW4TbkhUmDqJWoccAeBoYaf8ppHJ0ilOImSb6W8onky2AysEZbyRQA5Mm
	 vBwlAjekxC0Lau5VvmxWF2Ee10K/YPMvTovMsvl/POxh3fapRsIdiavwPebR8zRqAd
	 AfsQohUaN2l/Heift1pJmCEz211obY/2TMv+YWr1De4kUfmrzCSBFd2sHkYQisK3oK
	 T052pYyRA1+WJEE6MrY8MgbZ8hI7+zdSeMH/3qWDzlXXYtivWM/fs734H7A2s1W6kX
	 ZaaJdLglKau1Xqyt1FWVUspHRH7feRxRmZCRHnm9UToNlg7Jr4EZh3LPfknoAZ2y55
	 WN9bkoTggDMNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A224D40670;
	Tue,  8 Sep 2026 21:33:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D404E372
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA21F60703
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGhBXkqG18kI for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 21:33:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CFE59606F8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788903198;
 b=Y+e+XaDXzddUvykvnOiXLb3YNyWWv145zrrXfl+bCc2iWtfQTWs4vecP5EZcjHIxa+zh
 VWHNFI9q2fMhf0XYrmR5IHz/qviu6niLgnvjag6+Sl7KOf5+C5LISmZXSEwUTv9f4XnHv
 5JZ9U9kwndEsZBA5EpodeGjZAjm9Ag+/fn3UNPcCbx3Vp3CfDjfVVWWsEV1ofcNxdnHyj
 vxr+yfJKTFR3LGMFEgrjjPCFezh1JgrKmkjTGWHYRP5qVoB6zU9kuKMeP3M8IE+9xL9FX
 gazvb6+ccbmhNRiaFAtOSHnf0WHQplYNeLmYjntLgTOn6RYYr4n+rWLyQ5sFEM6fnZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788903198;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=RGVm+nVBC/8RrMz73TLp3R886HWmsDc2m+nDCwcaOs4=;
 b=VzAVXEeO7frsIb6ZX35WLdnnWYwpCGGt1/mAFSHXZHwu7v7q04hTmN0iReXbROZy8yBB
 ALpGTJAyKYhIN5u+cC8BWIq6gPs7vfoc7NISOuU7GzQBqzlc0xJmH+8XL6Smg9O1twi9P
 I1AoLjaBdQYf+GhFH2KbOR5CWOZCTuqgacMtYFCA6IK/ORQtQAcwUoBi0TuLxB3jxg88k
 Xp35RWSLLyF0mJzPyMHayUZKaocrm1K98k4xuVaNOShDAhx5yt6TftGnzwQXSKVQZDfA2
 yDJwEQEX7IZTkCv0YRKpV39Rvt/keiJzKQPQn6X8OCQd4oeFa3KkhwHeYYUHNWkUkvA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="j/mU8GmZ"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=j/mU8GmZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFE59606F8
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788903182;
 bh=RGVm+nVBC/8RrMz73TLp3R886HWmsDc2m+nDCwcaOs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=j/mU8GmZSV8p64Ul3flHYHXjzzhZvEhgJmpDGkatNHoB3tb/vtLIVk3bLmnCUg5Jn
 /LQNk1udHPBorflaxxX6wAIaIBnBl/Bsw2pcsUAL6hZBY1SMkk+18645C3f/adjTP0
 TRDttkoosM1N7wUCzQ7z21UCziH6pnWFpbXyMkLuNtV0uSxvRiPhLHRRT1TL35YeD2
 Cxn9mupNwTjIDEsCjnZW6wzh9SO9J3N9vInVmdZ4JI5LmvC13f783ivg1D+0L0ovW/
 ZijAP0kX6QLF2UmvvzVwihfQEqxnXw8cqqsq4UnMg4SwrOU3NyHVCHp5bLWKXYe4B4
 g1wkhs68M0Ybg==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 04126A4C3BD4;
 Tue,  8 Sep 2026 23:33:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53342)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x43Qe-000000005r1-0BRr;
 Tue, 08 Sep 2026 21:32:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 Sep 2026 23:32:31 +0200
Message-ID: <20260908213231.2542239-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908213231.2542239-1-bernd@kuhls.net>
References: <20260908213231.2542239-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 4/4] package/snort3: bump version to 3.12.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/snort3/snort3/blob/3.12.2.0/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/f4cb6546911bbbad6d372ec48f2ea849497f870d

 package/snort3/snort3.hash | 2 +-
 package/snort3/snort3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
index 599818ee24..02ebcf85c9 100644
--- a/package/snort3/snort3.hash
+++ b/package/snort3/snort3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9465d19b0925088266504e8962e97e55359bafd6a19f66b4169dcd21ef1d8ec5  snort3-3.11.1.0.tar.gz
+sha256  43000d6b0e0307bc1a735874d00deb61e8b6a96d074f8cc9b2fe2cde0058720b  snort3-3.12.2.0.tar.gz
 
 # Hash for license files:
 sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
index 273aa56709..a6f296a062 100644
--- a/package/snort3/snort3.mk
+++ b/package/snort3/snort3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT3_VERSION = 3.11.1.0
+SNORT3_VERSION = 3.12.2.0
 SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
 SNORT3_LICENSE = GPL-2.0
 SNORT3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
