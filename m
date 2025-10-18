Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29851CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 16:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA27836E1;
	Sat, 18 Oct 2025 16:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SeCfq5iIYU0; Sat, 18 Oct 2025 16:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3088D83657
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3088D83657;
	Sat, 18 Oct 2025 16:12:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 315A41CD
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CDBF4070C
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DwRzpEr3VlPE for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 16:12:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C73F40654
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C73F40654
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C73F40654
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 16:12:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4A60E13F88F;
 Sat, 18 Oct 2025 18:12:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Oct 2025 18:12:30 +0200
MIME-Version: 1.0
Date: Sat, 18 Oct 2025 18:12:30 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Maksim Kiselev <bigunclemax@gmail.com>
In-Reply-To: <20251017172621.296710-1-dario.binacchi@amarulasolutions.com>
References: <20251017172621.296710-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ab2727f76a9af8ea51c4726060c1079e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760803952;
 bh=w96bFY114Bc4Pp0F+1XH7Z/CC9livkiuqo1T9CRG1PE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PJVGzfAUrAmRfEghdQ36JvIWS9AfOzZr0OFfRhVE7OLG/rCXlDKWwiO3jGdPNVlhx
 vXLZpg1nxIPJ0qXbROjvGFAEmtTVQ1xx4EBZMTwAQw4GbL75lSA6QBaHQc/gJvPUX9
 cGfhjYhjbfy8vgyxNPeIdB8/GiBmZL6klLNB0b9Vk6eVsLXdYIXN9lirRKJAtSFuV3
 DOhVXb2YmIueesZdgb4vRtE8N3bFzKlGm1J3ShABLXi1R2nWR3DVvY/tZjNrJk4bw3
 kowcGfz3pgRUYAAVLjbKITp5Vyi73Wkg0AsGrI8epte2MlCVLibFJMFBVhePWqu3hB
 bUPgctjUMFc0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PJVGzfAU
Subject: Re: [Buildroot] [PATCH 1/2] package/ledmon: add upstream patch to
 fix build w/ gcc-14
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

T24gMTcvMTAvMjAyNSAxOToyNiwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gQWRkIGFuIHVwc3Ry
ZWFtIHBhdGNoIHRvIGZpeCBhIGJ1aWxkIGlzc3VlIHJlbGF0ZWQgdG8gdWludDY0X3Q6Cj4gCj4g
dXRpbHMuYzogSW4gZnVuY3Rpb24g4oCYZ2V0X3VpbnQ2NOKAmToKPiB1dGlscy5jOjExODoxODog
ZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiDigJhzdHJfdG91bOKAmSBmcm9tIAo+IGluY29t
cGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCj4gICAx
MTggfCAgICAgICAgIHN0cl90b3VsKCZkZWZ2YWwsIHAsIE5VTEwsIDE2KTsKPiAgICAgICB8ICAg
ICAgICAgICAgICAgICAgXn5+fn5+fgo+ICAgICAgIHwgICAgICAgICAgICAgICAgICB8Cj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgIHVpbnQ2NF90ICoge2FrYSBsb25nIGxvbmcgdW5zaWduZWQg
aW50ICp9Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHV0aWxzLmM6NDg6Cj4gdXRpbHMuaDo0MTI6
Mjk6IG5vdGU6IGV4cGVjdGVkIOKAmGxvbmcgdW5zaWduZWQgaW50ICrigJkgYnV0IGFyZ3VtZW50
IGlzIG9mIAo+IHR5cGUg4oCYdWludDY0X3QgKuKAmSB7YWthIOKAmGxvbmcgbG9uZyB1bnNpZ25l
ZCBpbnQgKuKAmX0KPiAKPiBGaXhlczoKPiAKPiAgIAo+IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxk
cm9vdC5vcmcvcmVzdWx0cy81MWFmMWQ3YmY3MTA2MWYyMmQ0OTIxMzk1MWE1ZjZhOTU2NTcxMGMz
Lwo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KClNlcmllcyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
