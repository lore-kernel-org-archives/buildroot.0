Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99706D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739EF80ACD;
	Wed,  7 Jan 2026 17:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbxPfPxrgWRs; Wed,  7 Jan 2026 17:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F9A780B4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808567;
	bh=DBblaTeAA5sMiYNDs0JiDaRgRP8+mKkJcvxnPOPPMO8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P039l5NMGnZ7vDlgqTsdebbHNUEVqt4A9YgqTFijaCjTVXUp0c11pqa5icHrEL0/s
	 ITCZjFjTGig5SzcLCO4JdwmR15EJi6CQOmmtHQOpqeSiGp8Hc9rFE2PWW5Jqoe0bVL
	 sELjSJ2N8qt0XV66s2dPjJnqAlANCulOQDa4ziafoMtQAj+/YCsGrl+kWucibubCpK
	 4F3nQ4qfrU2883X2aswFBAkeMW+TsaabiMaIg3Od+rrnOQn1LEcknB8srtoXSzU6zz
	 lvYRAJje01DiHbQANSXnrwKyJKTck94/7cTnVWdSwwtI0GQckYs3GmJ5RZqE59j8JU
	 6dKGghqZdvUpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9A780B4C;
	Wed,  7 Jan 2026 17:56:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 712509ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6339640128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TWZKZoIpDhUs for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5119440160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5119440160
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5119440160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3ED00B97A704; Wed,  7 Jan 2026 18:56:03 +0100 (CET)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:56:00 +0100
Message-ID: <20260107175601.230733-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222145428.440712-1-buildroot@bubu1.eu>
References: <20251222145428.440712-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808563; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nRvETRQ9vE8As1hwIoXR2hqvs3qnT+tReN3ycEaHMrI=;
 b=Uwqxm+oTeuMjaj+eW83e4if1aSblSRj3kIEzFNF424uGNqWODG3JIDuuY3ygNYbuZsejPx
 b7GMlS7rR+p2Tm3rEYa1HfoPwI8tndyLs08b1FGB3JNUrJANlgg5Ef2QwWmmfmg0QS9Di/
 32Py1P2k1GTx97LnTas1f5oGq2PaacRBPvf5u3oKevCSpfTEr0XSegwCQrSgyLylNtQNX0
 eJY7RrAB7tDf3qUkMfFhCJ1MNROepOq+vTaz9mLlFX+qTpsuyi0vD7Ow+7p/dWNdALjeqq
 /bSBUslpN/6NZuO/63hPrNz+4j2D+Pu4s3vCm5JfN8yHksVXKbn4UHDb6Ew9IQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Uwqxm+oT
Subject: Re: [Buildroot] [PATCH 1/2] package/python-django: security bump to
 5.2.9
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gRml4ZXM6Cj4gKiBDVkUtMjAyNS0xMzM3MjogUG90ZW50aWFsIFNRTCBp
bmplY3Rpb24gaW4gRmlsdGVyZWRSZWxhdGlvbiBjb2x1bW4gYWxpYXNlcyBvbiBQb3N0Z3JlU1FM
wrYKPiAqIENWRS0yMDI1LTY0NDYwOiBQb3RlbnRpYWwgZGVuaWFsLW9mLXNlcnZpY2UgdnVsbmVy
YWJpbGl0eSBpbiBYTUwgRGVzZXJpYWxpemVyCj4gCj4gRnVsbCByZWxlYXNlIG5vdGVzOiBodHRw
czovL2RvY3MuZGphbmdvcHJvamVjdC5jb20vZW4vNi4wL3JlbGVhc2VzLzUuMi45Lwo+IAo+IFNp
Z25lZC1vZmYtYnk6IE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1YnUxLmV1PgoKQXBwbGll
ZCB0byAyMDI1LjExLnguIFRoYW5rcwoKPiAtLS0KPiAgcGFja2FnZS9weXRob24tZGphbmdvL3B5
dGhvbi1kamFuZ28uaGFzaCB8IDQgKystLQo+ICBwYWNrYWdlL3B5dGhvbi1kamFuZ28vcHl0aG9u
LWRqYW5nby5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kamFuZ28v
cHl0aG9uLWRqYW5nby5oYXNoIGIvcGFja2FnZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28u
aGFzaAo+IGluZGV4IDQ0OGU5ODYxM2IuLmI1YjI0NjBkMmQgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9weXRob24tZGphbmdvL3B5dGhvbi1kamFuZ28uaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9u
LWRqYW5nby9weXRob24tZGphbmdvLmhhc2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAgIyBtZDUsIHNo
YTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9kamFuZ28vanNvbgo+IC1tZDUgIDAyNjhj
NTJjYjk5YmI3NjQ0OTBmZGQ5MDUwMmRlZjMyICBkamFuZ28tNS4yLjgudGFyLmd6Cj4gLXNoYTI1
NiAgMjMyNTQ4NjZhNWJiOWEyY2ZhNjAwNGU4YjgwOWVjNjI0NmViYTRiNThhNzU4OWJjMjc3MmYx
YmNjODQ1NmM3ZiAgZGphbmdvLTUuMi44LnRhci5nego+ICttZDUgIGU3ZDg5ZGRmZGNhNzk1NDIw
MzlkYmFiMzFlNGJlZGU4ICBkamFuZ28tNS4yLjkudGFyLmd6Cj4gK3NoYTI1NiAgMTZiNWNjZmM1
ZThjMjdlNmMwNTYxYWY1NTFkMmVhMzI4NTJkNzM1MmM2N2Q0NTJhZTNlNzZiNGY2YjJjYTQ5NSAg
ZGphbmdvLTUuMi45LnRhci5nego+ICAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vt
cwo+ICBzaGEyNTYgIGI4NDY0MTVkMWI1MTRlOWMxZGZmMTRhMjJkZWI5MDZkNzk0YmM1NDZjYTYx
MjlmOTUwYTE4Y2QwOTFlMmE2NjkgIExJQ0VOU0UKPiAgc2hhMjU2ICBkY2FjMWM4NmNiN2FiNDkx
NzAyYmRiNGM0MWJlNjgwZmFmZGU1MTUzNjc0OGNjOGFhZWUzODQwZWVjNTNlZDE3ICBkamFuZ28v
Y29udHJpYi9naXMvbWVhc3VyZS5weQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1kamFu
Z28vcHl0aG9uLWRqYW5nby5tayBiL3BhY2thZ2UvcHl0aG9uLWRqYW5nby9weXRob24tZGphbmdv
Lm1rCj4gaW5kZXggOTIwZmQ4YTU3Ny4uN2FhYmNlNjhlZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L3B5dGhvbi1kamFuZ28vcHl0aG9uLWRqYW5nby5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWRq
YW5nby9weXRob24tZGphbmdvLm1rCj4gQEAgLTQsMTAgKzQsMTAgQEAKPiAgIwo+ICAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtUFlUSE9OX0RKQU5HT19WRVJTSU9OID0gNS4yLjgKPiAr
UFlUSE9OX0RKQU5HT19WRVJTSU9OID0gNS4yLjkKPiAgUFlUSE9OX0RKQU5HT19TT1VSQ0UgPSBk
amFuZ28tJChQWVRIT05fREpBTkdPX1ZFUlNJT04pLnRhci5nego+ICAjIFRoZSBvZmZpY2lhbCBE
amFuZ28gc2l0ZSBoYXMgYW4gdW5wcmFjdGljYWwgVVJMCj4gLVBZVEhPTl9ESkFOR09fU0lURSA9
IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8wNS9hMi85MzNkYmJiM2Rk
OTk5MDQ5NDk2MGY2ZTY0YWNhMmFmNGMwNzQ1YjYzYjcxMTNmNTlhODIyZGY5MjMyOWUKPiArUFlU
SE9OX0RKQU5HT19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2Vz
L2ViLzFjLzE4OGNlODVlZTM4MGY3MTRiNzA0MjgzMDEzNDM0OTc2ZGY4ZDNhMmRmOGU3MzUyMjFh
MDI2MDViNjc5NAo+ICBQWVRIT05fREpBTkdPX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UsIE1JVCAo
anF1ZXJ5LCB1dGlscy9hcmNoaXZlLnB5KSwgQlNELTItQ2xhdXNlIChpbmxpbmVzLmpzKQo+ICBQ
WVRIT05fREpBTkdPX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFIFwKPiAgCWRqYW5nby9jb250cmli
L2dpcy9tZWFzdXJlLnB5IFwKPiAtLSAKPiAyLjUyLjAKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
