Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B87CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B52E9615A0;
	Fri, 29 May 2026 17:12:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gk2-sm8bzErf; Fri, 29 May 2026 17:12:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E17976159A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780074777;
	bh=JONrHxG2sp6gBweVmORTJEVLBKucjTLPVblAeSog1+U=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=VCeFzeEkFTJEwVcaiFlonVz7xf37tQyWt4QdFHk/mcPdza0qLLPVaUh46rlCuByAh
	 ocJC4jD2k7sWYkOLN94zsYc0aDaD0NXpy0kkEjdBedNNa7/4FamYtRuMtg0yLIH1V2
	 phjS2j7DDIgUCaCSf55TRuxYpefCOCclqSDBrA2c/A/0cJl/6TbIVatmkvX4302eAl
	 BtnaOwsslh41d2t99vgAD3/OwcbzfrAn63Z1MYx7tsA84eUoql4Hc2RNxaeFqVu0DO
	 klZAL5bf9gej2t1OU1MSfkImg/+IGSfAQ5XuY3h/mANprlCH2ldZ1BlNX1oiMB1Fw8
	 4aWsOELtokoCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E17976159A;
	Fri, 29 May 2026 17:12:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8D0FD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9934A41F0F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E4gCGFdugWVJ for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:12:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAEE641EDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAEE641EDD
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAEE641EDD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:12:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E6BEB97C44C; Fri, 29 May 2026 19:12:52 +0200 (CEST)
Message-ID: <35e8dddd-3543-4ca0-b795-815f16630152@rnout.be>
Date: Fri, 29 May 2026 19:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org,
 Titouan Christophe <titouan.christophe@mind.be>
References: <20260529102144.1446114-1-romain.naour@smile.fr>
 <8b009d4a-ecdd-46d2-8181-de8b694d401d@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <8b009d4a-ecdd-46d2-8181-de8b694d401d@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780074772; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=uG4Mc1n6hzw/7edAUZN1OUXwEUkxILZx4G6O8foItrI=;
 b=USDFi+S3OuYoSiQK5oIF0S7H2XNvICIoSsJYKHdNZ1s8IoQMxScig4fLcPfvzydae7GmHN
 ahdsvWbROD5BQMZWILpTskX8Gt/Qxgj9DE1hWeWCSldMYiKFBzIyfchJaF1FOZa5HFv6T/
 fHn5QvaGvqsGVaoh9v/o0dg7zrq4vjn1vKOY4fMvmmpFXYth71yl6TGTlRbu6SvPQ3LV8C
 skAtNBF6ruFtMej8HWRe5G06wxoPPWo+CVHTXRx6tbld5Z9tojcsao0FrQmRtj7GDsEyvl
 lSsP4noqVG4seJ4aPs0DDrN3oxG/RIouFK/VuXM6qgIePh6vzk1LqLNfXr01rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=USDFi+S3
Subject: Re: [Buildroot] [RFC v2] support/testing: generate runtime test
 jobs with runner tags
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

CgpPbiAyOS8wNS8yMDI2IDE4OjQ5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiAgwqBB
cHBsaWVkIHRvIG1hc3RlciB3aXRoIGxvdHMgYW5kIGxvdHMgb2YgY2hhbmdlcy4KPiAKPiAgwqBJ
IHRyaWdnZXJlZCBhIHBpcGVsaW5lIHdpdGggYWxsIHJ1bnRpbWUgdGVzdHM6Cj4gaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vcGlwZWxpbmVzLzI1NjIzNzI3ODcK
PiAKPiBMZXQncyBzZWUgaG93IGl0IGdvZXMhCgogIEl0IGRpZG4ndCA6LSkKCiAgVGhlIHRhZ3Mg
YXJlIEFORGVkIHNvIHRoZXJlIGlzIG5vIHJ1bm5lciB0aGF0IGNhbiBwaWNrIHVwIHRoZSBqb2Jz
LgoKICBJIHB1c2hlZCBhbm90aGVyIGNvbW1pdCB0aGF0IHJlbW92ZXMgYWxsIHRoZSAiYnVpbGRy
b290LXJ1bm5lciIgdGFncyBleGNlcHQgCmZvciBidWlsZHJvb3QtcnVubmVyLW9ubHkuCgogIEkg
YWxzbyBhZGRlZCBhbGwgdGhlIHNhYXMgdGFncyB0byB0aGUgTWluZCBydW5uZXIuIEZvciBzbWFs
bGVyIHJ1bm5lcnMsIHdlIGNhbiAKanVzdCBsaW1pdCB0aGUgbnVtYmVyIG9mIHRhZ3MuIFRpdG91
YW4sIHRoYXQgbWVhbnMgdGhhdCBpdCBkb2VzIG1ha2Ugc2Vuc2UgdG8gCmFkZCBhIHNlY29uZCwg
c21hbGxlciBNaW5kIHJ1bm5lciB0aGF0IGhhcyBzb21lIG9mIHRoZSBTQUFTIHRhZ3MuCgogIEkg
cmV0cmlnZ2VyZWQgdGhlIHRlc3RzIGFuZCBub3cgd2UgaGF2ZSA3NTggam9icyBydW5uaW5nIGlu
IHBhcmFsbGVsOgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9w
aXBlbGluZXMvMjU2MjQyMTA5OC9idWlsZHMKCiAgUmVnYXJkcywKICBBcm5vdXQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
