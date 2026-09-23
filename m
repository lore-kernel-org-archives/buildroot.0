Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF01C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC19881223;
	Thu, 24 Sep 2026 18:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7H7fMH_6npYn; Thu, 24 Sep 2026 18:57:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E176C812AC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276265;
	b=IFFusmEwUNDqDADu3ML+9jxpe5IArX1AT16tPnKKmDitHeqAHg/VCgwGL2um/0bwIFH8
	 Uu7N3IeMUSQtt0yyg40IzOo7QtJ5915qukpyZzIIgwh7c0aawWowonqU0ks4GXHaMAUIC
	 MZIwXjVix0SaBt+HdUvj3ER4x4BSx2bgCgY0dTMliRRTDjnfaubBiw871gJDkYC+teqMg
	 Q3O4x+4ho2mSt0uqRHB2WKP5QR5LA2gng9M108lavhUgvmGVposu5JRlJwq69ySxYNj20
	 kVWyfrLEYk9eF0WKlUTZopnsN0Qq4bUWsVttuMN9ZH9U9NYSd6APup4FG+a5xgUUGfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276265;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Gr27MiCkKr2JBU+BDUVn40DxiF1FvqixRrkAyF7X6y4=;
	b=dX58GYT/ad43kOHj2/zKuAe9htbO/dstRCbz4gyF8uFsBFg4c1hfqgJEyVerhMCV865O
	 5Fg1xzUpnJhJZ5waSKSUbG2o51GfIYFFH0NtH9OkyChXBYLPe7fKOk5L3JYU7Ru/xsawR
	 uDeqgGN6M2MGvCo5H8580cVwgi2l+jSu+uxm98ZdbarGutZ9HqKCqniK9VbGP9Xr9iNEL
	 ENZTz6vgRxF00zQX/sqwSwIIi7j3mzrOINwz/oEmcUH0nTmOb2ACQBQMpVxyzO84TwsTh
	 hpoZ5M9pcBhFZyljtTT3Au3I1BnjKl+5t9fh3eiDhvstjeAl74gZRT4eaGgB5EXl+zQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276265;
	bh=Gr27MiCkKr2JBU+BDUVn40DxiF1FvqixRrkAyF7X6y4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kDZ08fWTu7BX/2ZmvVPMG5jd8oErzCUSKjiLqE4yfG2RT52HcIc3penRI3nizUbYt
	 9K1p/+kELlc/KO35Ic7T7YwG7xgUUWY0EE+5oN/0BucAPeqjh6c5gF0NhOxc3DqEIS
	 0ZHmhT8tdrY2WVaB4yJz9DDuzMpx8ikHj2S2Rih7oWS0z29+Gzs80xe6vZRVWYToDV
	 Zf4UlXZi/54sQJ7GWSQhh7drxNTU9On64et+HHhpSff4Gq50ZP3d2BR/sJNBxqxMWs
	 TBaN95e7OHP5+Yhk5LUxsyBCRT+DtDEwTprQ8mnUqOV9kZSIRXbR4zFbwb3cb2OfTv
	 k7tjhd9Or5Mmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E176C812AC;
	Thu, 24 Sep 2026 18:57:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E82113B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E649F40ABB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05cGY2XhQh7Q for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2CC7B40ABE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=keWcs5+Lm6k21sKWWd+MyYTaGBJCG/UsbQ61RHTxGI9pPYGm2FkBtEyMUMG/N69lhrql
 ACsdCUzRC/o1mlp3gcZnlMTQDavRPHnjYsMKT9KV/64XVYDAsT5dguMgmhrPJWfpXAVhK
 s5hexRbG10WwK9RiKWULE9hmww/rl1nvg6deRRgPWRtnphbcBUp9RiiAv7hMznTBSQ7v6
 blP8DP7wajXERfhDKH+H4ekt2ChIATvX+PsIAcgZyeKdNGto+5KW8evL55UjruuonXQwq
 qmTtra/HiAZkefDNEpDKqZ84MpoXEWOPWvANwAqInLu/w7F6G7GxDDyAn/81Fmf7vkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DbokT8IA6uf1dPR6w/Pp0uu4GZ9osKNLtujnyvAY0CY=;
 b=Ud/jYlaJag7FaM1+t1d3Gzvbk6TY5zEMmGmSu3kaqmsiIZ5iWDuxKP0R+bOKM/SHRiNS
 GwGr9DhyaiNq2h+OyC20qQG0N4U9ZURxiDoyz6Lmvc7aGRnCWve8952kk0vI5dOMzAsbW
 1T90vN+og/trStabT0haHxtoMXePD7fXt3D8W3hWqozSTrWkNGVbUzf2PgYo7cfWZdjzr
 YbbYfNLfbPPfmOlYqmzAprqyFBiqEmuEM2GGd103PYwybvWLBI9tKn/7/re8uZEQ93RYg
 vwuciBj7tiWF4/Jk+rrk8Af5mVyJZSpKd/lFs/Mll8meGA3l0AtJyAGrCFR+/wKKW1Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CC7B40ABE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3D2298372; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:21:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bae413fe79c2123cf0569aef08b82e5fe62e2f62
X-Git-Newrev: 9f12591982c2990578c983c9141258b67ac76f7d
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.C3D2298372@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cannelloni:
 security bump to version 2.1.2
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7200561202637532307=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7200561202637532307==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f12591982c2990578c983c9141258b67ac76f7d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For change log, see:

https://github.com/mguentner/cannelloni/releases/tag/v2.0.1
https://github.com/mguentner/cannelloni/releases/tag/v2.1.0
https://github.com/mguentner/cannelloni/releases/tag/v2.1.1
https://github.com/mguentner/cannelloni/releases/tag/v2.1.2

2.1.2 fixes CVE-2026-37539 (CVSS 3.1 score 9.8, CWE-121): a stack based
buffer overflow in CAN frame parsing, in parseCANFrame() in parser.cpp
and decodeFrame() in decoder.cpp, allowing remote attackers to cause a
denial of service (crash) or possibly execute arbitrary code via
crafted CAN FD frames.

The advisory names v2.0.0 explicitly, so the version used so far is
affected. The CVE is not reported by
https://security.buildroot.org/master/component/cannelloni because its
NVD entry has no CPE data (vendor and product are both "n/a") and can
therefore not be matched against the package version.

Apart from the security fix, 2.0.0..2.1.2 contains only a handful of
changes: undeliverable frames are dropped after a timeout on a broken
CAN bus, variable length arrays are gone, the default remote address is
fixed, and pthreads are looked up with the CMake module instead of by
hand. 2.1.1 is a maintenance release only, as the 2.1.0 tag pointed to
a commit that was not the final one.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4dc8e8b6f927bcfd11302a3cee68ea958cc266dc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/cannelloni/cannelloni.hash | 2 +-
 package/cannelloni/cannelloni.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index 625e43d157..6b45d497e4 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3dde63727549d4a39154e78b95f4a5dad96af236ca6cef531f347c0b923c74d5  cannelloni-2.0.0.tar.gz
+sha256  c704707f7dd9f1ed64e9195097809f8882c03b1fa0a79864b8e3bf286521e3d7  cannelloni-2.1.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
index 7978cfccf5..2e6a61545e 100644
--- a/package/cannelloni/cannelloni.mk
+++ b/package/cannelloni/cannelloni.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CANNELLONI_VERSION = 2.0.0
+CANNELLONI_VERSION = 2.1.2
 CANNELLONI_SITE = $(call github,mguentner,cannelloni,v$(CANNELLONI_VERSION))
 CANNELLONI_LICENSE = GPL-2.0
 CANNELLONI_LICENSE_FILES = gpl-2.0.txt

--===============7200561202637532307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7200561202637532307==--
