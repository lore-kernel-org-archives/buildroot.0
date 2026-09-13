Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D58C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 033D680CFE;
	Sun, 13 Sep 2026 20:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFqPkjvq_W3O; Sun, 13 Sep 2026 20:01:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1D8EA80CEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789329715;
	b=WQsCJBPBc534Y07vKX+Sj+0Wu4ckRtxlzczzfdjFGMBe2kRy+vcKOb7PUfRdIrxFOpxI
	 7sSgyy2s2wP4OvCRb2LN2hOgyH85OxcyySSG341Z5Pl9fmQFKxpUh3UGgn/NNtc2e6GG3
	 pp8DMpCYNXFmAFOPYwUnwr8nr8zc/hD9RmT/PYDxvhzmpZyykEO+be+RdE2jS6rk8+8W2
	 AYdvwKRSCVUWdBrSOhbB5l6LbJvRDUBmEWYZi3iAido1VyA7P9VIi3IjtRiEUTvNQ7De9
	 ZJaJLGtqge3xlSR2E0Z86v5tX/5u/1I3Tw3RlKc47FwmzmxIXDp2AtM8PoS++hKK7gg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789329715;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=QrpqeTCTGonQUtga56moVFaAs3hVxw4T0+Lk9kg5QQI=;
	b=S9ZjWDaYcuNRjWw/zSU64vJF9sCWE8Mw+zAsIMuC8V7dVPwmxHOC7eEGAgmDChik3Z2z
	 aRMTkdyHG4Nuojt2NgX3YM/O26aikeS8CmXoLzOm+bkVqSbTfBwCeMFqophzJzZNFkudH
	 DrT+m3vNjzNrw1AvonV3236bztaT/KtiSPeRkk2swlEYX6xFlY+Nmn/fduiC5JurXDppj
	 zB7tSyh6GoN6QuDeScMC0v0dKiL8f9Yy/r6iwkuR9KIGKJNYfFK7JamEABHPKlx1/CmsI
	 lWJGUdBFRLgncjO25XAXhRhfSKxARyPMTLqCZw+2M0ixLp0L7/KiayBUQViLNwdwQrA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789329715;
	bh=QrpqeTCTGonQUtga56moVFaAs3hVxw4T0+Lk9kg5QQI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jp/64A6/6w9y9zUMXe/uwgU902x0MDTdc/IS4GsqQ+EwqWpZnE0WcyCqlHU1BNxOP
	 N71dyyy0rK2eMUUX8p65BqrkjK+FHHggU0uFORBLlP/YijXnn1wJjtqbEDRIE1VQYY
	 ilIQYKgfBYNNv1BMuEuU3kCEohKs+s1ObuXlh3VQOpj08myD/FgUdjzPGR1f3Neo0+
	 BM4eaksbnKjzIfEte5hAO1EUjM42bmWSAdnRYDdUbAnnF/Wfr3z6dI11vioL7TIcT2
	 zlGdYsZixv7NZwfKg3PnExj1g5eLDEWHd5w0zbo9+0NKMmjZcTy6ISR1WkAwrkvIpe
	 rKKDFNlT/Pz3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D8EA80CEE;
	Sun, 13 Sep 2026 20:01:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0339E29B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E950D40063
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_8haeTXxltZ for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 20:01:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 30CBE40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789329712;
 b=i7CgZeYI9p4bmN0tmOfeBAApy37z+X7+sbx+HXEj9ySPxJZ/Al7ccCWj/Bq2PnJSKkdK
 Uv4VURw5GlUimf3WVIfnMxAJMOnutUPobWXYQpEgykoAA67bNqSk9sT16LOYuybk4Q87w
 SK2KwBBpg7Rgnx8k9h6zNr42PkRjU4lNKmuXXpRCubyZ4oY+ksm0G91ugqIaANZt/m7nV
 8E8GvZy6h2Fvfw1GKMZAopx1YrnccQd1qrnUv88eyvtfcz5/T871lxyaOWzZQaRqC5Cer
 g1omb48iE7rutN5MICxSxqsRUnMxxZ0uenzL5sVGrujCnzix+4jJzDSzi9MplusvaWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789329712;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=A7qhxVX3UQ1Aiiz4FHNS+PLrpNixfhUyiHm/15lkQzE=;
 b=dQTweSZ7JKRbQlx5vxAOfYBmtuPagTUtFQEvaYKPLZYVGwKWeM9pYBKwTgPs7FemQD8x
 qnv5hhmK0OPn6qKlFL8v54UEGc8nJxq+3a3SEJkMfYRwGfMwvUOa5AB0GJF+cW32LD75p
 MqHPolfrZiH9p7Wk7B8RMcTJ2chqz6p1XFNtKjpdIBRWwonDeTxxOFrJ8XeigLLo+gMCj
 1+yTSU5VBAqomPR3KUhSRLUPjiYnqlHSK0qWB3OJCgSMlp9/0EoPoKH0PEgzKTQwNDvNw
 hzMDGzuznyYPU6+43dT6L6awp7aWhphc8n5CnFF+JvxQneZy4vnYa/B0vtEcJKxmZDA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fl42KETg; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30CBE40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:01:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 89B6F5FFAF;
 Sun, 13 Sep 2026 22:01:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 22:01:45 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 22:01:45 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20260913194745.1726052-1-thomas.petazzoni@bootlin.com>
References: <20260913194745.1726052-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <4ec414288b2921d2b73d63e659113bc7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/mosh: bump gcc version requirement
 due to protobuf
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/09/2026 21:47, Thomas Petazzoni via buildroot wrote:
> In commit
> 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump
> to version 20260817.0"), libabseil-cpp was bumped, which required the
> gcc >= 8.x dependency to be upgraded to a gcc >= 10.x dependency. This
> was properly done in package/protobuf as part of this commit, as
> protobuf is a reverse dependency of libabseil-cpp.
> 
> However, mosh, which is a reverse dependency of protobuf, was
> forgotten, and it no longer carries the correct gcc dependency.
> 
> This commit fixes this issue.
> 
> Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c 
> ("package/libabseil-cpp: bump to version 20260817.0")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
