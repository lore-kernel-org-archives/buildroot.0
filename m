Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E300E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD308331B;
	Fri,  3 Apr 2026 17:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZeL5IN-E1Dq; Fri,  3 Apr 2026 17:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 225AB832DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775239024;
	bh=BatZgcxbjwB4K6FOI/n4pqRdCjFjQ6FpaFToKHpsf2I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WmrJ/ZndOi8m9oXBDVKfLuzFMOXJ++w5pFSpOp5+5EnkaW5mrjqklOJ5ys3BM0YR8
	 2lvJ+vPWwkJJDpuIUTvgGQR4/cNtaL3El1FqYqLVgM3f7UkAond18TsMSJhzfZ5f7A
	 /InarnOCRgG8MbhkpdmPiqzMN3SJAZCfKUy21QdwVYY4/7v5HXDlZKORkYxwLqbPaH
	 Qm4ho77cyvyTSheZHml2y0E0FnYzrOtcN4RZC4brf5mhxzWyiXbwC5hzjsMCn7rJkL
	 M7JK18jVLCrxiXCtGqoOCCXkz1fxrLRL0Xfw1AHe5MisyfuNsCHtIRPEYQ1P3Be//W
	 sGjGxzZCPi2+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 225AB832DC;
	Fri,  3 Apr 2026 17:57:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B5081AF
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BA5040226
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqvwRmwzWLGg for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:57:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A1FB40202
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A1FB40202
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A1FB40202
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:57:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 761086013C;
 Fri,  3 Apr 2026 19:56:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 19:56:57 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 19:56:57 +0200
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260403-openscap_bump-v2-1-dd4242ff402e@bootlin.com>
References: <20260403-openscap_bump-v2-1-dd4242ff402e@bootlin.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <6b1475adada2414a1bdf9321c4352be6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775239019;
 bh=yMqi+l+/+H9hDqjg8zvuxL+03q8YbPawvFApYX3AzzI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F+EVu9fkGlFKBkGol5nTVNGeYHRf0srQCH5CgH2Q2fHu5HJmNXZeEQUpP3MbNYNyl
 lLhO/U5WZfo9hu7rl+bX4x2nalo3bO+xxzMJYeKWYIAT0r5q+v2hb/p4gAsY/rIma7
 191/U+gKixPABtMMofcc0G0jmIQK7CPXGzvuVI0XSwqkwBt/knISbS/W+pXJRs/j1j
 //sjT/YcuvFCsXuPtpwZTwJrcdjpMuRkv2MNJz5hZPdz5uUbDwApdbua+cF5we7oXz
 cHdzF2AJr5TUfH2nCqeKQ3gVkFyX5/dbwXgXH4RYUmOf5YirejO1aP0nXXF8pYHpoM
 DkKRJ6LMbiX/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F+EVu9fk
Subject: Re: [Buildroot] [PATCH v2] package/openscap: bump to version 1.4.3
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDMvMDQvMjAyNiAxNDozOCwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gVGhlIGN1c3RvbSBwYXRjaCB0byBlbmZvcmNlIHByb2plY3QgYXMgQyBwcm9qZWN0IGhhcyBi
ZWVuIG1lcmdlZCAKPiB1cHN0cmVhbQo+IHNpbmNlIHRoZW4sIGJ1dCBpdCBpcyBub3QgcmVsZWFz
ZWQgeWV0LiBUaGlzIGNvbW1pdCB1cGRhdGVzIHRoZSBwYXRjaCAKPiB0bwo+IGFwcGx5IGl0IG9u
IHRvcCBvZiAxLjQuMywgYW5kIHVzZSB0aGUgb3Bwb3J0dW5pdHkgdG8gZml4IHRoZSBwYXRjaCBm
aWxlCj4gbmFtZSB0byBtYXRjaCB0aGUgY29tbWl0IHRpdGxlLgo+IAo+IFNpbmNlIHZlcnNpb24g
MS40LjAsIG9wZW5zY2FwIGRlcGVuZHMgb24gUENSRTIgcmF0aGVyIHRoYW4gUENSRQo+IAo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0NBUC9vcGVuc2NhcC9jb21wYXJlLzEuMy4xMi4uLjEuNC4z
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290
bGluLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuIEZvciBpbmZvLCBJIHJlbW92ZWQg
dGhlCiJzZWxlY3QgQlIyX1BBQ0tBR0VfUENSRV9VVEYiIGluIENvbmZpZy5pbiwgd2hpY2ggd2Fz
IGdlbmVyYXRpbmcgYQpLY29uZmlnIHdhcm5pbmcuIFRoaXMgY29tcGxldGVzIHRoZSBzd2l0Y2gg
dG8gcGNyZTIuIFNlZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vY29tbWl0L2NlOGY5MDViYWMyMTg0YmRmYzQ2NmIwNzJkMmU1Y2M1YmJkMWUxNDkKCkJlc3Qg
cmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
