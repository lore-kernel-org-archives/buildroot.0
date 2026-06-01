Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2A0CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975B2409A4;
	Mon,  1 Jun 2026 19:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLEv_tzxw6SU; Mon,  1 Jun 2026 19:29:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4F76409A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780342155;
	bh=zuPaGELPeJzSwMkUNgVECwIUJBu/m2YmfSBfNiCdD08=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=nceMAxaQZdLBfDEYMwlktzsd1fgg1kr8MMGm5Z3qC+w82wQ/IyUnQ6A/FM+GbP1TT
	 uZSMB2JyPPtwILC2WkkYpWjUPtQFQhuaypNtQS+ToBz6EKslDAHRvK4yvz7QVcVth0
	 i6u0MGIkXFzNARlpstPwOLKDe9stsA/Zo1PNEko3g+Y6eLbfm2fcDkVBbMvdl2vDdz
	 AccgmQq2zyQOHnxEUxmcL4X/Um+GTIDjBXvIcu3lLLV4Qy1CBgBqAbeUMMf3fGimSX
	 MocCVD2zvt8U7GZTXdbQrD6ZmPBcX6EhWDHmDJHj+TXQWp4NsAILkrxFMX7tAw0fpI
	 CJ4YJAPpV3wRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F76409A8;
	Mon,  1 Jun 2026 19:29:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B030F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20D23409A8
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqnkG4VJCCwo for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1855F409A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1855F409A4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1855F409A4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:29:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34283B97C77D; Mon,  1 Jun 2026 21:29:12 +0200 (CEST)
Message-ID: <472e34df-bd1a-4d01-bdb9-b214513f3a0b@rnout.be>
Date: Mon, 1 Jun 2026 21:29:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20260530203544.1383862-1-arnout@rnout.be>
 <b6d17dd9-848f-4414-9494-899ac5582761@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <b6d17dd9-848f-4414-9494-899ac5582761@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780342152; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=7zKpNnI7ipYG+CGcD9xQH8IOAA2ORta1YJkyxgwIKwk=;
 b=VgA1uCkWtGwIAOmAfbiI6wYAwNRSuc/hjqhhCh8p9vK5Ai72Il+8B9FJsFIMsvze3molGQ
 Whdp0FItLQfddTvzgtg3dmckK3gXdP1uQXYQOKvOc9Wh9JVG/DGjjA0n5Hcju66oy7u4rQ
 PTrzPbtIgGB8UE3jUOTOy2Cu8U0C9Tljb9DPolVWE8GsECLWhpZORrgMwE7ERXLbhVgTTs
 C5Fw7zHIdAzaD1pk4D24xByp6XNFo3MiONqp1wAwZD53ALHHmgHmiUjVDc9+ZKNecf0qAd
 t0la9/N9QtuWYEgyykgn73kYApheDVwBmAL4+Y2h953iP6VjJZ5wW55dolTy5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VgA1uCkW
Subject: Re: [Buildroot] [PATCH] support/scripts/generate-gitlab-ci-yml: use
 large runners for defconfigs
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

CgpPbiAzMC8wNS8yMDI2IDIyOjQ3LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gQXJub3V0
LCBBbGwsCj4gCj4gTGUgMzAvMDUvMjAyNiDDoCAyMjozNSwgQXJub3V0IFZhbmRlY2FwcGVsbGUg
YSDDqWNyaXTCoDoKPj4gZGVmY29uZmlncyBhcmUgdmVyeSB1bmxpa2VseSB0byBzdWNjZXNzZnVs
bHkgYnVpbGQgb24gYSBzbWFsbCBydW5uZXIKPj4gYmVjYXVzZSB0aGV5IGJ1aWxkIGEga2VybmVs
IChhbmQgb2Z0ZW4gYSB0b29sY2hhaW4pLiBUaGV5J3JlIGFsc28gbGlrZWx5Cj4+IHRvIGJlbmVm
aXQgYSBsb3QgZnJvbSB0aGUgYWRkaXRpb25hbCBwYXJhbGxlbGlzbSBvbiBsYXJnZXIgcnVubmVy
cy4KPj4KPj4gRm9yIG5vdywgYWx3YXlzIGJ1aWxkIHRoZW0gb24gbGFyZ2UgcnVubmVycy4gVGhl
cmUgbWF5IGJlIHNvbWUgZm9yIHdoaWNoCj4+IGV2ZW4gdGhlIGxhcmdlIHJ1bm5lcnMgZG9uJ3Qg
aGF2ZSBzdWZmaWNpZW50IGRpc2sgc3BhY2Ugb3IgbWVtb3J5LCBidXQKPj4gd2UnbGwgc29sdmUg
dGhhdCB3aGVuIGl0IGhhcHBlbnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFybm91dCBWYW5kZWNh
cHBlbGxlIDxhcm5vdXRAcm5vdXQuYmU+Cj4+IC0tLQo+PiAgIHN1cHBvcnQvc2NyaXB0cy9nZW5l
cmF0ZS1naXRsYWItY2kteW1sIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL2dl
bmVyYXRlLWdpdGxhYi1jaS15bWwgYi9zdXBwb3J0L3NjcmlwdHMvZ2VuZXJhdGUtZ2l0bGFiLWNp
LXltbAo+PiBpbmRleCAyYThjOWJlNWY1Li4wMGNhODI2MjI4IDEwMDc1NQo+PiAtLS0gYS9zdXBw
b3J0L3NjcmlwdHMvZ2VuZXJhdGUtZ2l0bGFiLWNpLXltbAo+PiArKysgYi9zdXBwb3J0L3Njcmlw
dHMvZ2VuZXJhdGUtZ2l0bGFiLWNpLXltbAo+PiBAQCAtMTIwLDcgKzEyMCw3IEBAIGdlbl90ZXN0
cygpIHsKPj4gICAKPj4gICAgICAgaWYgJHtkb19iYXNpY3M6LWZhbHNlfTsgdGhlbgo+PiAgICAg
ICAgICAgZm9yIHRzdCBpbiAiJHtiYXNpY3NbQF19IjsgZG8KPj4gLSAgICAgICAgICAgIHByaW50
ZiAnY2hlY2stJXM6IHsgZXh0ZW5kczogLmNoZWNrLSVzX2Jhc2UgfVxuJyAiJHt0c3R9IiAiJHt0
c3R9Igo+PiArICAgICAgICAgICAgcHJpbnRmICdjaGVjay0lczogeyBleHRlbmRzOiBbIC5jaGVj
ay0lc19iYXNlLCAucnVubmVyLWxhcmdlIF0gfVxuJyAiJHt0c3R9IiAiJHt0c3R9Igo+PiAgICAg
ICAgICAgZG9uZQo+PiAgICAgICBmaQo+PiAgIAo+IAo+IGRvX2Jhc2ljcyBhcmUgY2hlY2twYWNr
YWdlIGZsYWtlOCBqb2JzIHJ1biBvbiBlYWNoIGdpdCBwdXNoLgo+IAo+IGRlZmNvbmZpZ3Mgam9i
cyBhcmUgZ2VuZXJhdGVkIGJ5IHRoZSBkb19kZWZjb25maWdzIHBhcnQ6CgogIEkgd2FzIHZlcnkg
dGlyZWQgOi0pCgogIHYyIHNlbnQuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKPiAKPiAgICAgIGlm
IFsgLW4gIiR7ZG9fZGVmY29uZmlnc30iIF07IHRoZW4KPiAgICAgICAgICBmb3IgY2ZnIGluICIk
e2RlZmNvbmZpZ3NbQF19IjsgZG8KPiAgICAgICAgICAgICAgcHJpbnRmICclcyVzOiB7IGV4dGVu
ZHM6IC5kZWZjb25maWdfJXMgfVxuJyBcCj4gICAgICAgICAgICAgICAgICAgICAiJHtjZmd9IiAi
JHtkZWZjb25maWdzX2V4dH0iICIke2RvX2RlZmNvbmZpZ3N9Igo+ICAgICAgICAgIGRvbmUKPiAg
ICAgIGZpCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
