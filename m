Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4804EC88E72
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 22:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D89D640544;
	Mon, 14 Sep 2026 22:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RyAlFUjEABC; Mon, 14 Sep 2026 22:52:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F25C84053D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789426324;
	b=s+Iybf1m4HPMliAs0P5RD0M57ocTpamryO3U967tRQKezLMMsDqVB/V1OOmNZLr3KeaJ
	 Gx/PEXwqyqatXcGeAlgpERCDxWRn1NMzDsbWHFBX2KyA9aPct7EWoCt0xKvDifGUPs8FY
	 Diwmq64pZTNHP0IWfROSFMXERkiyMhulOw/1PlFHlO+hJybuTAXassYU2Q1HjCOf9h6j3
	 +XO5g4o0PPrAKykzgDrRIz7Q+14K5cEzax2R+1awgXcLy6mLVHMW5ZoQXJa+w/CNltJ1u
	 /u0LRtuo5NKJdwkPt7+f0faAxGh9j/sb58IR540Ufj6m9SXDWiGVjUgG2hLSQOR7aLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789426324;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s9hApH7HmLMj49DiS+1bPT9ndK+gQGokLNpVZIEkDOU=;
	b=bWP7w9rFz524AVDf3NWgRLkCejB/OVacwxfyw64Xoai4jumHp3wcA7+GcWsBM/4tXiWW
	 V4tOo+aF8buPu9Gq3urqK9LgNYdZ0ItQqmtXIYRIkxc4+vN9OC4ahNyIUAxT9A1A0IUWk
	 oKIkT6akSdLEYW369r1QLUEgT6PHOmqdrN8IO96kEE4YURDnUVuxngvGzG3iZzM79n1/A
	 1ENokvC56SkyN4gWbVp5g59dyczub4531D2Q1ee9sf2rECm6eA7IwERFu+lAO/+rWWPgo
	 I/Quv2N2p4+xQwe9S5K8j9g1VZhvtXWhpX10tZCzwSkbbP/mtf5NmsM9PwquB34R6pg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=t+3UyM1X;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789426324;
	bh=s9hApH7HmLMj49DiS+1bPT9ndK+gQGokLNpVZIEkDOU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IueTZhhzLcPuoeCpuuenPr5qk5YZBlH2t2wnWtnQucfwcMdanT6FSb4LbU3dNbHIo
	 tBAKxvGCH8aIVBTkXQq58VHebhzYjlhMhPj6lQ8uCuTa5B5kpWp3ImZMekNTr2sSZJ
	 udSVko08fUwxs00bo0ZZDVjIgQU31YK5ehbZHJtNoghP6uz84jEDVVqFFCvRjB/CIH
	 h5kzqBbd42+bX1gBPig3ynA/sGXdElE8/0FqA7EeF8Jq6NohWYk1HG3JGEiCGoRN7a
	 eOPY9u+r9VAqH8I4C7k5PVEBpx4BssVKaISIWqnHxoCIA/+TPaLa/XCbvnCXhGIld+
	 Pk6mZx0qwBLUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F25C84053D;
	Mon, 14 Sep 2026 22:52:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 472F4224
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CBE94053D
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11lrhJaQ9S9I for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 22:52:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EC66240538
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789426321;
 b=XhS7HDKkEXiuvpg1iNC5wW7Gipwl5kMQ/FrY7FlMWLJYXZVw5hfdf25wxb9k2FYB61J8
 ppkXBM+Q3dUjDcBOxV1Hk6iR8BTuopU+puOQ9TcDi4jP/ZYu3MTpppOQ28ZAyhVwG1arA
 4DCzfagII0V2WoPAV3jJfwMlHK6F3z9I3T2EL/QUnTsjZC705TqBUgIiYklY1pZ9wDTUv
 Fg9mddd/r7pp11kvZ5F4V6aadIzd/U9O3287BadPRpGe2/JiXFdBKXCiByq3uiQu4oha2
 XsnOAoWXTWXFgDoI2v9+g3qQXvrQjHd+CcXPd3v5MyNAttBJrOUcSO7il3e4XV/Tm3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789426321;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=vXRrzKxCzVYtwkxObMLls8KNUzpjqeglgXtSoXpdrw4=;
 b=jDVtEcXEpeaK9QAxZCHajFEJnOwiEJ/yS037zpP7n/8N79YRLGKFyWf1L8s50WJbnQxE
 T2hxht7VLL9qZEI0DVo3psgnFHQh9r+ieKADhUMvn5/lBzcp53j2LHdCKTOLOcejS/FY3
 G7ipndWeA8S6Exj1Vo+Spi5rTZFpI4xjeJ3yugxSYceT/d3CZ5vF8kbhv7IlJG9FPrMie
 Q5110TXVK7C1xH4JTDxBZ56lM9akGFdLAb1g0TpnhaqPHeV89IIQoFtD4JmJq3y6RpPZH
 zyzrjEnqvRjTQkYUpCnMbqmOv9VSxqb5RZYHv4OApm7yiD5UKL9xTsezyJ94eN3RdWQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=t+3UyM1X; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=t+3UyM1X
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC66240538
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 22:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789426318;
 bh=vXRrzKxCzVYtwkxObMLls8KNUzpjqeglgXtSoXpdrw4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=t+3UyM1X6EsKY68q+hFmzOdlMQMJRBRW6hP4tnVbx202IxyFDtlY0q//i3tv//0QZ
 iYDk3KElyaPrXXDAJ2eSZeVvVz8kn3u2INOgwsE/J8o1uPMaRwCJ6RNMewWFvgHSes
 QRPHFOhwOgN5Pha3+CEBj+pw3B7VkK0t0Hxm8sdUuxeGh0slu1w19Y1A7T5vmp5Wha
 ief6hTGn/uu69LwbAGzJ1fqOXjgt6Mr5qdCuOJ6vhNFcMLPxZovLR6n86WOaZm1ZHC
 bJRhDaPxhsCFr58xOxhrhehEdLMPcXgHOtF5m+eFxgpBFe2k4f2neiyAqVPXQxqLS/
 DF36OAPgc5tzw==
Received: from fli4l.lan.fli4l (p54a1b56e.dip0.t-ipconnect.de [84.161.181.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6DCB6A4C429F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 00:51:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6FWn-000000002aS-40wh
 for buildroot@buildroot.org; Mon, 14 Sep 2026 22:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 15 Sep 2026 00:51:56 +0200
Message-ID: <20260914225157.3786041-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914225157.3786041-1-bernd@kuhls.net>
References: <20260914225157.3786041-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: bump version to
 26.3.4
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.3.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/7e319a3379342ce37f1a0e7b1ce1e7c704448ee7

 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 3f4486aa0f..037b4d4760 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bbe4deb0d2f72e5c58adaf17f87b7a11bf639446d99bf4193a116d0588647a97  intel-media-26.3.3.tar.gz
+sha256  94558a167cf863b190aa83d02b69c2d67227cda15ba320541b30171fe3fc4f26  intel-media-26.3.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index f1a6dde392..90cd4189fa 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.3.3
+INTEL_MEDIADRIVER_VERSION = 26.3.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
