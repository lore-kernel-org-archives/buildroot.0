Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A19AFF60D5
	for <buildroot@archiver.kernel.org>; Tue, 31 Mar 2026 07:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58528230B;
	Tue, 31 Mar 2026 07:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBfMZNRvlHUo; Tue, 31 Mar 2026 07:08:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8C3D8230C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774940888;
	bh=SrHkfh4AMMNKTk+7iPzITyBQIH0JJIsvPAJTop9AuOA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qoc3mnDrDnBwTsiDpYYCcoqRjwmtS6DB+QxDSZUOfIVxepXqvbDrn5gW8DxXh5h9Q
	 xRC81jrxO41x/ezt7eVhDogjrEMD7tgfHPDS7XpOzqWJR3S3ZVgxxA2TUlY6qedN3L
	 d+n9xKHlZAfew/sdZILDkkff+5XT/WEqUFL9iX/JbqCC/OZXfUXVvUtcWxC+CI0ahk
	 NKbm+zKN7/F8rm5u+4+7x/43MDyLaJ35nhWpLnLWekVWeiF82uWqz2jVSjsEsfuzEk
	 8TBL3lRpmLUmDv20gJqg3QPrPramWM09vPvyuzsKBAAnxn5tl+20tOZyL6NZ4fCxTe
	 BCKLjBMdtp6bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8C3D8230C;
	Tue, 31 Mar 2026 07:08:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5642E4
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 07:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2D2E60EE2
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 07:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tw7dTdsXfMyO for <buildroot@buildroot.org>;
 Tue, 31 Mar 2026 07:08:07 +0000 (UTC)
X-Greylist: delayed 904 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 31 Mar 2026 07:08:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D321560EE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D321560EE0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.92;
 helo=sender4-pp-o92.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
 [136.143.188.92])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D321560EE0
 for <buildroot@buildroot.org>; Tue, 31 Mar 2026 07:08:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1774939962; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=enZmZ4Z+PMpMU/klwgq/ixfnkqcYt5c95Hk+15MvXfIkjA2oWn227NvCWBRv/HoSXj5NMJrGvwgHDEGeHhAyH02hsWjwDe/UnwXetB1IG+fzO7gAlV5oVNN6ixxbLKg9g6KNg2tq5HFFhR53cFrXK5XXUmfUkenND4NRmJ2PJxY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1774939962;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=XuV4ocXjNtJRdAewSfolsf88557qte8CUhm5D3QC8VQ=; 
 b=TUF/bnpnoA0sF2jCeoZi/WTA65+uPpW8ydpnTipVYTCTAbwdsld7p6WpB8pmhsT14gXUt9u3OWuhoW6touLT5TORiusQ1GIWwusvwJ+O0njuBMzZZpcnlW8IKbdVpiK+BNuYOw6mz3Mz4wbdexV9GFdHkjJ/Zwvgo1STVhZjxyI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1774939955318627.4817320297221;
 Mon, 30 Mar 2026 23:52:35 -0700 (PDT)
Message-ID: <65ece732-4f93-4fa2-ab73-b185b8722371@zohomail.com>
Date: Tue, 31 Mar 2026 14:52:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260212190349.537465-1-kingxukai@zohomail.com>
 <20260212190349.537465-2-kingxukai@zohomail.com>
 <f8955a26ad11369180218f17a335a6ce@free.fr>
Content-Language: en-US
In-Reply-To: <f8955a26ad11369180218f17a335a6ce@free.fr>
Feedback-ID: rr08011227004a7c2d4a2e2069aff4f5530000c9c31f9abfde617b14eb09e94404513246461cf909982c3258:zu08011227e375b94b546e530b5178274c000014da8fb7e8f65ea74d5c7d65b1894b743ab4c51b149e2fb543:rf0801122c8eee8d7d1b263cbc3d49cc870000d1f01be750a48e0654d8c59989f1846147a5fab6fb89cc14f518df979cf4:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1774939962; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
 bh=XuV4ocXjNtJRdAewSfolsf88557qte8CUhm5D3QC8VQ=;
 b=Ggd6rBJ3zMVc2uEs5gMZcGzyzK3rioWWqGwNPo90LZPJqgsfoCYdBQIa3jheqnzS
 OJji4/5yF/95XcAXPzBG+xLKblqryQVRTLGgUw2UZdBSmpqyvceeyb5v7xXTOoJdXua
 qhNjXKJQoRBJ4OO65Gd2l3fSFiKjAPA2jrWA6yaA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=Ggd6rBJ3
Subject: Re: [Buildroot] [RESEND: v1 1/6] package/python-cloudpickle: new
 package
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
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIwMjYvMy8yOSAxOTowOCwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gT24gMTIvMDIvMjAy
NiAyMDowMywgWHVrYWkgV2FuZyB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBBZGQgc3VwcG9ydCBm
b3IgdGhlIHB5dGhvbi1jbG91ZHBpY2tsZSBwYWNrYWdlLCB3aGljaCBwcm92aWRlcwo+PiBhIFBp
Y2tsZXIgY2xhc3MgdGhhdCBleHRlbmRzIHRoZSBzdGFuZGFyZCBwaWNrbGUuUGlja2xlciBmdW5j
dGlvbmFsaXR5Lgo+Pgo+PiBUaGlzIHBhY2thZ2UgaXMgcmVxdWlyZWQgYXMgYSBkZXBlbmRlbmN5
IGZvciBneW1uYXNpdW0gYW5kIG90aGVyCj4+IG1hY2hpbmUgbGVhcm5pbmcgb3Igc2NpZW50aWZp
YyBjb21wdXRpbmcgbGlicmFyaWVzIHRoYXQgcmVxdWlyZQo+PiBhZHZhbmNlZCBvYmplY3Qgc2Vy
aWFsaXphdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWHVrYWkgV2FuZyA8a2luZ3h1a2FpQHpv
aG9tYWlsLmNvbT4KPgo+IFNlcmllcyBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgo+Cj4gRm9y
IGluZm8sIEkgbWFkZSBmZXcgY29ycmVjdGlvbnMgaW4gdGVzdHMuIFNlZToKPiBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZDI1ZjE4YTNjM2JjOTg0
ZGY1MjljZjJiMjY0YmUyZmUzMGI1MTI1Nwo+Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzZlNjU5N2RlMjE3M2NhYjNlNDBhMTE1Y2YxMjgyYzlj
ZjllYmQ5MTMKPgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2NvbW1pdC9iNjQ3YjBjOTVkODIzYTI5NGFjNWRhNmMxNWQ1ZGFhZDQxODc0ZTFjwqAKCkhpIEp1
bGllbiwKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHJldmlld2luZywgbWVyZ2luZyB0aGlzIHBh
dGNoIHNlcmllcywgYW5kIHRha2luZwp0aGUgdGltZSB0byBjb3JyZWN0IHRoZcKgbWlub3IgaXNz
dWVzLiBJJ3ZlIGNoZWNrZWQgdGhlIGZpbmFsIGNvbW1pdHMsCmFuZCB0aGUgZml4ZXMgbG9vayBn
b29kLgoKLS0gCkJlc3QgcmVnYXJkcywKWHVrYWkgV2FuZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
