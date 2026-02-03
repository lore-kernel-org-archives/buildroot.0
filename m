Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6974FE8784C
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 18:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 267D240BAE;
	Tue,  3 Feb 2026 18:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5hBPS15D9r4; Tue,  3 Feb 2026 18:18:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 499D940BB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770142698;
	bh=7yA3kmwUl8NXAHuiiZWNw5ORzAZXXCbk195xxSe6YP8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Kw5QjBck4dMl4+3GZKV+CpFrl+hmua3hm+Q8XZdF/RZAMAYVi6GL48g041jkPx5oz
	 M3NwhMdG63lcVzqOC/PsDA3PHBC4M0z0i/GwACASzICYYXVtsbFxq7VLY3TY0/8+7I
	 /AfO34/RjhiGGXk0VuV8Tz3+ipJlhS6szYV6bAR1NIuO0c91WF1fkGAugwmBAYeoDM
	 dosYz6QlOD6WwGDIaoN0gw5LdSKB7RoaYeREGb4Ht7LhMjzwQaXq0GkpSDVNTKrInp
	 RVjfWWmByjJI4owWW9ukcj8qgg74su5hTuBwMQ8P+yxUrBD1f5kZP9rqJAdmb8luI0
	 IPGngtcgMto0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 499D940BB8;
	Tue,  3 Feb 2026 18:18:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C759913D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A571340380
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1d2iVLcH7hj for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 18:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D36774037D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D36774037D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D36774037D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 18:18:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75430B97ADC0; Tue,  3 Feb 2026 19:18:13 +0100 (CET)
Message-ID: <3d7b84f3-0f64-4c61-b499-94ea854069ff@rnout.be>
Date: Tue, 3 Feb 2026 19:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20250603063844.194753-1-raphael.melotte@mind.be>
 <2345bdd4-08d4-485e-b2db-8e497717ca05@rnout.be>
 <9a12494f-2a50-4fe3-98ea-95060a5ba672@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <9a12494f-2a50-4fe3-98ea-95060a5ba672@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1770142693; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=rNG1/8dvYIMjs13cq/yo/4jjpYmRrAX6aeYM6Zyv6L0=;
 b=nILQVIRN5UsSiRx2vA3eu31XVygfl/9pBECvHT217uvTKZ+6dJzwthPGsM69+oSWPmHB3D
 P2me0H8QO/V5IBt5PyvcuEwk+OTrzbHOZYDgBlGjxxILYjK4wija3lO98h/PvPxFmtb8bl
 V0pdJX8tB8GsotVw7vM1fi7FstjLnLqVCiu5Hnayj4QdPb6uYKmcqztAuLcb7oiwUGVWa+
 qeNcavyNHI7EKSinPl7AhNgP24LYEjmkbukZ4AR90crabaiJtbOe2h+zmdE1dTY36EmC95
 hpxwIulaKo3Cn9v92dTbJk3WKMAGwy9WtQY+FLdrgm9pDi4EDyLPnSi7QA6Kcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=nILQVIRN
Subject: Re: [Buildroot] [PATCH 1/1] utils/get-developers: add option to
 list packages matching developers
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNS8wNi8yMDI1IDE3OjM0LCBSYXBoYcOrbCBNw6lsb3R0ZSB3cm90ZToKPiBIaSBBcm5v
dXQsCj4gCj4gT24gNi80LzI1IDIxOjI5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4K
Pj4KPj4gT24gMDMvMDYvMjAyNSAwODozOCwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9v
dCB3cm90ZToKPj4+IEluIHNvbWUgY2FzZXMgaXQgY2FuIGJlIHVzZWZ1bCB0byBiZSBhYmxlIHRv
IHJldHJpZXZlIHRoZSBsaXN0IG9mCj4+PiBwYWNrYWdlcyByZWdpc3RlcmVkIGluIHRoZSBkZXZl
bG9wZXJzIGZpbGUgZm9yIGNlcnRhaW4gdXNlcnMuCj4+PiBGb3IgZXhhbXBsZSwgb25lIG1pZ2h0
IHdhbnQgdG8gcmV0cmlldmUgYWxsIHRoZSBwYWNrYWdlcyByZWxhdGVkIHRvIGEKPj4+IHNwZWNp
ZmljIGRvbWFpbiBuYW1lIChlLmcuIGEgY29tcGFueSkgdG8gdXNlIGl0IGVsc2V3aGVyZSAoZS5n
LiBmZWVkCj4+PiBpdCBpbnRvIHBrZy1zdGF0cykuCj4+Cj4+IMKgwqBUaGF0IHVzZSBjYXNlIG9m
ICJhIGNvbXBhbnkiIG1ha2VzIHNlbnNlIGZvciBicjItZXh0ZXJuYWwgcGFja2FnZXMsIGJ1dCAK
Pj4gdGhvc2UgZG9uJ3QgZW5kIHVwIGluIERFVkVMT1BFUlMuIEdpdmVuIHdoZXJlIHRoaXMgcGF0
Y2ggaXMgY29taW5nIGZyb20sIEkgCj4+IHRoaW5rIHRoZSBpZGVhIGlzIHRvIHVzZSBERVZFTE9Q
RVJTIHRvIHRyYWNrIExUUyBwYWNrYWdlcz8gVGhlbiBJIHRoaW5rIGl0J3MgCj4+IGJldHRlciB0
byBoYXZlIHNvbWV0aGluZyBzcGVjaWZpYyBmb3IgdGhhdCAoaS5lLiBub3QgREVWRUxPUEVSUyku
Cj4gCj4gTm8sIHRoZSBpZGVhIGlzIHRvIHVzZSBpdCB0byB0cmFjayBwYWNrYWdlcyBvbiB0aGUg
bWFzdGVyIGJyYW5jaC4KPiBMZXQgbWUgZ2l2ZSBhIGJpdCBtb3JlIGNvbnRleHQuCj4gSSB3b3Vs
ZCBsaWtlIHRvIGtlZXAgYW4gZXllIChwcm9ncmFtbWF0aWNhbGx5KSBvbiBwYWNrYWdlcyB0byB3
aGljaCBNaW5kIAo+IGNvbnRyaWJ1dGVkLgo+IEZvciB0aGF0LCBJIG5lZWQgYSBsaXN0IG9mIHN1
Y2ggcGFja2FnZXMuCj4gSSBjb3VsZCBidWlsZCBhbmQga2VlcCBzdWNoIGEgbGlzdCBzZXBhcmF0
ZWx5IG9uIG15IHNpZGUgYnV0IHRoZSBERVZFTE9QRVJTIGZpbGUgCj4gYWN0dWFsbHkgYWxyZWFk
eSBjb250YWlucyB0aGlzIGluZm9ybWF0aW9uLCBzbyBJIGRvbid0IHdhbnQgdG8gZHVwbGljYXRl
IGl0Lgo+IEkgY291bGQgcGFyc2UgdGhlIERFVkVMT1BFUlMgZmlsZSBleHRlcm5hbGx5IGJ1dCBz
aW5jZSBnZXQtZGV2ZWxvcGVycyBhbHJlYWR5IAo+IGRvZXMgc28sIGl0IGxvb2tlZCBsaWtlIGEg
Z29vZCBwbGFjZSB0byBhZGQgc3VjaCBhIGZlYXR1cmUuCgogIE9yIHlvdSBjb3VsZCB3cml0ZSBh
IHNjcmlwdCB0aGF0IGV4dHJhY3RzIHRoaXMgaW5mb3JtYXRpb24uIExpa2UKCmF3ayAnQkVHSU4g
e209MH0gL0BtaW5kLmJlL3ttPTF9IC9eRjovIHtpZihtKXByaW50fSAvXiQvIHttPTB9JyBERVZF
TE9QRVJTCgogIFdlIGRvbid0IHRoaW5rIGl0J3Mgd29ydGggYWRkaW5nIHRoYXQgdG8gZ2V0LWRl
dmVsb3BlcnMsIHNvIG1hcmtlZCBhcyBSZWplY3RlZC4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4g
Cj4gCj4gS2luZCByZWdhcmRzLAo+IAo+IFJhcGhhw6tsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
