Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CAACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D6641113;
	Sat,  3 Oct 2026 07:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQ7bLolnn4PW; Sat,  3 Oct 2026 07:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 904A6410A8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012088;
	b=PFCsvIKpMWAKjatQ7rVepKZNCBKLP3yNOyN6Li9XGwwBcboWGAhwcfBIFMiIY+ZHay2B
	 E2aLtUHWe+QDXZyeb7sFzxyFFtgr6qT0SaKkz5tLiQKqeoctMc2IV6yC+8p6pYIDnWCRw
	 FOhkUU4fIeA4vRjAf3ugXUbQLYhkcqhrUvy2YTZWb+8cAuwUi/DnVQNPQWhppza9ZhijQ
	 3LZJfVuuHTlqA4TiypXYiDobLtPpzOY4JAoAESMOpZq3cd6Ern9mgduUSzg5y7f15Hoft
	 4Ey4y/+1gS0AIlI2GoGRf9CgFgsMB9hZYK8mj9LlqlOE2VWzhy/+X2sAB7jh+HxEOmA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012088;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=W7Ux6fC+zrmAo+UwDsSHIt1+wVg3IFl/GzoqYBYDPmQ=;
	b=KSf+cX+UX2FmhU9REV+Gh/CkfWG2R3yeokuyYRhlIpEp3T5sLdqdZUl6/hMdVJfXVTZM
	 qHvqbNYB85nscnGzK8+7ibhRMn8BVwML6W6RoU1aelF7uDOHW3bb250s3MkQeWg9Af6cb
	 dAdGLSqb5mo1JoCWIvrNE3MQTwzgTiZRTex9+qzTNYAxqiYcQDNEjg/ndn3IqJwQ+Udif
	 MM9C4qYe9pFYQ5yq8U2hQka5k02lDhcLgzWnNISE3U2umNwPE3Jd8s/lkkU3dHvFGkv4y
	 Ik7lFpKvxWr+Jy74bEq0wm+n3svXUwQHfJaD+sy7h7TIFIEpN1mhAxzI4qX6yPWA9VA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=FpHm3b9R;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012088;
	bh=W7Ux6fC+zrmAo+UwDsSHIt1+wVg3IFl/GzoqYBYDPmQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=b+btTgW6wUbz0Vp1sTpJuVJ7kudWEd5lNfCwne0egWZ3fvtuIZ7yVm8wd32S1R/Bw
	 +JslgVwE4dTtCSX2geXmP6okSSjDk9ksiMOjfpdHmdYzgypX6WDw8NA2vE9DDJQM8J
	 jCS+HtQhVSziLU0xR8kI0KcWDFCuC/8UCE9Lq2lFMbKVwfEUlHT3r6yJcpNAs4zF8n
	 9oK3qHU6LrxDluVN+wIlaB0SbOBu41jfhSvBiSs6x6j7pxIKgnB8pxAWmGRxt0JEFs
	 SvNEeHJxb+Dx46O+FiGHROmoS8sP8kJ5OxS5EdQ2+sNSrDYsY4KW85gSxAk0X+6H07
	 ZzIf6xOSlahFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 904A6410A8;
	Sat,  3 Oct 2026 07:21:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00C2234E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAEA5410A8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvOpFQRpfbF6 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0720341096
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012086;
 b=Jy6pIqGq5npVQ7fY6OSPRDmNROXdqId6O0BToVN/4s7c+hG3w5e8Z2nzd/VwvPC3rJDe
 d88A7Wm0Qgs+JlWvaTICWsJL5kSKTa8AmDcYHLB1ouzEj0kvMrkMiNT28nUut+xNMGORm
 HDvTFJ1n8L2uWx3bjWuPzXIvNg8uU4cRml+SxOY2NHCEUeiZOMX/TcuK3R3Qg10khW+Ep
 2J5X9AxCl6QAqXJGOjCgW0wH31KRUXrizf7sI3hftBb3CubkGxWkBOFDImbxhNtIbufei
 A/tOub16IbNneY1n2ZSZVx1yaMbSsZJQw/3Kutz4PU7Dl8yDVHGJhyg7IxiIPv49sUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012086;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=YSehWwJJSCq6Bo3BHdQX7gJSutoDB+FuXkWiAzmeBpA=;
 b=J3Zobu71e77474YUD8EudmD6SCGFq+VdzY0qxY/o9FdN5ic490Uqzfd10F0//7/LOL9d
 v6NEA59PPBe8tyhVaXqlToVVAIzAK5esnqGUBsIvh4jV2NlDRhRbCBt3djrwthaEB8DFi
 XRHIm5w2pgGY24RhNAfd912j2nfU7Shv4I8jTkZS3muNrXi545ldO81/p+MYM/pachcdp
 LBYkeF7IIJKvwWbv1Pk/MV5qMangFDEZwLQtBoso3h4vC46vwSWu36KpE5SQTSmhQozNz
 CAe/0WlC6dlrNpA0wroSmDzJHEdj7b2m72TeEsjgbJDMa6P9cdzmHxSIW4h3W1XFZDQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=FpHm3b9R; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=FpHm3b9R
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0720341096
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010940;
 bh=YSehWwJJSCq6Bo3BHdQX7gJSutoDB+FuXkWiAzmeBpA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FpHm3b9RrTmc5x/Nn7lRPixpAQmeWmRG3Vt9D3hkYmMEdfwo2MsQHzQYspYG+wRdf
 PEF/3J/Mehk4rWP+/aeLxB0QKlbTgt+Qu6YDjXvXkwa/xqnrN/uZWfbb89jnzs9q/c
 i1WvxCYWn6TiD8vMMTRGZR73qbXQmNx37o2mF1iCOyIbE6FHRmB5FvmnHqXWe60tUL
 5iHTodtQl3odhGILGTVpmSWj9QdD0eJULaKQpOr5piCLmguLgrVZT820qgQL1TKBMm
 tmqbicSTjpYHdpX2lMK1SqKHBeusl1VeEJtsSNs31oYwAqhq5ObT6bFI25UrZn+9ts
 RnGM0tRYlRxXA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 SrG7j36sGZlEW+7F/38gyUJGubhSxRYcKx6wgAirkUzvoAi1Z14ydVJFKQA7ZErCRTu4D+gfr0Y
 J9bSP/BPGGBfJW91MRcPSdNH1Ozais1Nsguk4ZszPpurgojjD2MVRHBTwiv2vrWx/5ycmYJBOh9
 p+ZuV2NQn4eJQjQaMf0r5SL4kD6ECiO6zlsr+lFk4jQeaCjMI+NbEmi73oQgOSuzJjM/h+9Ai+V
 c/aX20AliKi1hYi+gl8ddjCWJlR9ad/ahteH0ESqqMPtVkwN+JiG+ffxIa+WUOHRdQ2ceYGHy4Y
 GXQwjCJ15iw4ZYRjcJcvUuPD+EWpXBfUnqNMapYGKT1p1VL3h9zIDRKE0dypKm23vpu7vL3HziI
 akTieFU4CxZy83i9w5XxfNPh9Ej+hCPu9fNOW8QNgN0I/mG02w9i/cSRKklPy9PNW5N0Ts2DyDM
 zqNEhCrPD5XEueAfl56Cci4rvMu9EU1OnbtIxeu2JXOxRTGQc0NB5aRn/jOCIvKpuMgZeKR2N/+
 yzJFnqOh6KoxOBWUE2eBlT6/ekrfizcks+yoHkuero2Bs7ckyYLnbz32nNPWaay6I5sDkO5sX03
 U5QCRDce8D7Bm4bnnfV+/Fb8OngIRCSGoQYgpKxFfIP7Bt8QYXLgdrpBD5ZnrDXR
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 554FDA4C5515;
 Sat,  3 Oct 2026 09:02:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkd-000000007Zo-2zRq;
 Sat, 03 Oct 2026 07:01:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:06 +0200
Message-ID: <20261003070128.1295458-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 034/114] package/python-humanize: bump version
 to 4.16.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-humanize/python-humanize.hash | 4 ++--
 package/python-humanize/python-humanize.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index f1ed743cc4..03ad44a5ff 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/humanize/json
-md5  65cf3c77127d6ef9159e56c4ca728c07  humanize-4.15.0.tar.gz
-sha256  1dd098483eb1c7ee8e32eb2e99ad1910baefa4b75c3aff3a82f4d78688993b10  humanize-4.15.0.tar.gz
+md5  4e367e1d34263e88451d0ff700a6a6ed  humanize-4.16.0.tar.gz
+sha256  7dc2244a2f84a4bfb1d36c37bac80cd78e35cdc5c119206d87b018e1445f3a3f  humanize-4.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index e314fa5f78..81dac19f2b 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 4.15.0
+PYTHON_HUMANIZE_VERSION = 4.16.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/ba/66/a3921783d54be8a6870ac4ccffcd15c4dc0dd7fcce51c6d63b8c63935276
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/0a/ea/13a1ef3c12d12662905801495283530251918b70d62d368f1d2e0272c70d
 PYTHON_HUMANIZE_SETUP_TYPE = hatch
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
