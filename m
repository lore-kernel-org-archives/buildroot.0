Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A102FCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B3AA40D5C;
	Sat,  3 Oct 2026 17:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HSdxDjliTuK; Sat,  3 Oct 2026 17:47:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AE1D440BFD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791049637;
	b=pOOWB5DzqGp6ygLbdBj3m2QSdZApQi1tSwoUlRPIa8VQWcPG5/pW6ZUU2HYsuThOxC/C
	 Zn+b36koxJjT3NXvJHcpLTK1N45wxs5Zc4AKORlZOEnSIOZCp/Lknr5UJi2hHNaz+DUNa
	 +r2NfHlhmIzDhvZTBsLyIIYEdochwK3KxwQNXIlItwIdRCvpQs4StP4SroKVx9Irkh07G
	 5MjmZp319Je+mLfMjhxkLdj2cZ/5CmhRENOQ16j+0bUUj3ULP2e++LffFWEelsnDCOQMy
	 j9iPrPseVCKdfOABmQjaTCuQ2WPrryvKBClmYYl0aFSdSa3BNjPuWtAuHTy71IEmN4A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791049637;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Z3Epqql2askFUV5JiOCar00Fq0S+u65+ql2hkkm50+Y=;
	b=EzJreAxQRtra1GlEK51fh7FPy4WLxUxu9geqdfDpOf6uyfYi4viRcoiGFcv7TM7o7TFz
	 dEVTZyMyOwH8BYHcBhehPAU2dHq0bcPrEUeZ/0EUzzkIScVLKlIM6apsNaXCKLDtnDwo9
	 kXvZMfxCAlx5lKjCFXoSO63uoleleRsqEYuetMWyHGkRttemAAKzfe0ihvftyI7jp9r4t
	 ZYScoofoMKNrQMQpNtJ+iVZWMbNemFjfRhikZsOXMXq85QWPB+izTUmU1cyCXkeEoKWAT
	 3go0zxCFr4qmD5VgBSbxQ2z0HKm5fYcr7KdhI4lxSr1BRgecIRqD383lFxHcQF2qmFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791049637;
	bh=Z3Epqql2askFUV5JiOCar00Fq0S+u65+ql2hkkm50+Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qxOhIFY9NY/c22n6YyXTMBgKIobstiBdy0UTdneMxXQ9AAa1y6gWbuLkpjLAPLFY6
	 MxkVCOvRwD0Mk354/jpg2x+xDsZAr2c/PDtq1txiUlOwL7ItQ+FJZIjlpGIbQLW42V
	 6M6XendNEw9vcIRmiIVvgGs29140XWq2nqImWwbs0WDIHCBHLtdP6tlVomn9tmGTki
	 INl1WElAcocdx7IMDCOOA7Ok8LoBNQWIGYYPYDyhk22BjyaSG5SfauQg8nGRuuL6z/
	 e4AKDnT0c+R6Z8tK8YT3LMXpfhXThTADMvaF9Lma6+0e81w8EAWWczAhb1qgSmcOdS
	 Ts8BNtjXXKjqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE1D440BFD;
	Sat,  3 Oct 2026 17:47:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE5831D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF7B84008E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhaV7AEt60gh for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:47:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1300440024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791049633;
 b=M8EW5LwDdvpBZDdKN6Q3/mrzmNZ1o692IJt5fFFdmc6yS/K9o4Wpe4jlEA8m2SB865yK
 GCZa1W4PoptOkQd1Bv8QWtbfzW1cF++Xu+xitlTnYXkPCCGXI42eh3oMKv/Di3vTuJNBZ
 wQp37DeAX5U5VGpsiOA9XqHpTxusKjTDrR9Qn4U8fkcHJOmpq+aHVt2w/fraXwTwxlxcl
 Jor/jB3LD8yKYHnuhfc3YW2QfpQvd5mLxaZlaqQbCT4KTS3GH+MpqrP+prxEUD77TCj67
 gPeaDGKvz4KiVhZVUbIRjbftxwxu2sQQplLEBwa7LZhKx+IHSJIZZMRgN2xmQ3GFMQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791049633;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fepZmSWvxjiub//YnBhiYPa0KUJoCv9BQy+uA7bPvR4=;
 b=BxfVaXUyTggy6yE/oZ6VA9EL6aF09fbM2vlNeZ/tJ3OTcCIcllYMuXCcHrC2MzSaWm5M
 6514Ot8DCyCU/nlVKo0BcbDdeRDiRMDqjgy62lrTekIYoPNyG734DWshTOJ8xWQvYCNi0
 0Ak6p+es+j0hSBeDKpMY+AaMNn5qcO2g6g8bNh6hNH+Gyho6s4N0IN/5NWX4e8bkXnnuy
 cOLdH/fWoyq3qC7gsG7ID3jomsK4NtT/f7ScWHHXxCcyI0y40sb7YisEvIjWcvkBFMVHz
 Qj9Z1TDMzB71LX/Mqnqrz/BjVgrgZrWkuHeZhNqYJS7r0vykVKGL82UBiGnJnZDHiSA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1300440024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:47:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27F638B542; Sat,  3 Oct 2026 17:45:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 19:45:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21e040e7f9eaf6ffde59d41e231508657ab83a22
X-Git-Newrev: 3010c801e36762a97c453cd7bd173bd02f4b6b6e
X-Patchwork-Hint: ignore
Message-Id: <20261003174558.27F638B542@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/setserial: CPE ID for setserial
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
Content-Type: multipart/mixed; boundary="===============0185371271067108445=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0185371271067108445==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3010c801e36762a97c453cd7bd173bd02f4b6b6e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is a valid CPE ID:
https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:setserial_project:setserial:2.17:*

Signed-off-by: Bjørn Damstedt Rasmussen <contact@bearware.dk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/setserial/setserial.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 9beee349c8..98b2dde2f8 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -10,6 +10,8 @@ SETSERIAL_SITE = https://snapshot.debian.org/archive/debian/20250307T084701Z/poo
 SETSERIAL_EXTRA_DOWNLOADS = setserial_$(SETSERIAL_VERSION)-57.debian.tar.xz
 SETSERIAL_LICENSE = GPL-2.0
 SETSERIAL_LICENSE_FILES = debian/copyright
+SETSERIAL_CPE_ID_VALID = YES
+
 # make all also builds setserial.cat which needs nroff
 SETSERIAL_MAKE_OPTS = setserial
 

--===============0185371271067108445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0185371271067108445==--
