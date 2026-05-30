Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B29ECD6E52
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAFEB6F559;
	Sat, 30 May 2026 13:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejhujsgYJkJJ; Sat, 30 May 2026 13:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66846F55D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146075;
	bh=S2jFUKPeyNEAF3p06ng9aaWYAy/fY223LS00LzXHjLE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=eyEe79BF8hTMrng0Jbb86Ayv65hcMsYP3XSafiPbN7ooOFyS/zNPAPnkjTlwLFgid
	 1xsuwUUURPzOx+SRxCjU1lT2GlAYnbmvTahtH2xY8s0ZYydi/Sl051BDU4gmCvBufJ
	 zz8TPSTnkfPuOtvgFoE1nFJ3B9rlhcGUHKa4aWOxJlmm1zfIadV1lIMchMVupz0LTi
	 BXN7x3QofDx0iuBy/RyDhEcJqB3dc+00/b37UEddCaXK81gF1gvVhaax9UbbRtDChM
	 SSZj56Ol2kXgZijNRyvSPRc52MggmGY8GHWgSDSZP+uB3RvDDf3fQB9Gh95OQqI7K+
	 um9E8QdUuk91A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66846F55D;
	Sat, 30 May 2026 13:01:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50773D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36C1E407FD
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOVrtxUcYUCc for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:01:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB9F1407A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB9F1407A3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB9F1407A3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:01:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D62E5B97C714; Sat, 30 May 2026 11:21:34 +0200 (CEST)
Message-ID: <e4cffc15-e6e7-41bd-80ee-89b842834aa5@rnout.be>
Date: Sat, 30 May 2026 11:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260524171618.3225459-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260524171618.3225459-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780132895; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=BFfT600cFFZbehSDxqABt2kjo4XqHnwGHN8bbtwCls4=;
 b=DP4wmf9BDmZ6N6M7QK3vCBUs0BuVf1uhmvrA0h3Xb62MDGbj8Y6gxov37RhbMWFkqptBtI
 94c3BGUKDqnb2tX68lvoru3hYBZR+pBlCcIXl5TYEes0PpI/TNI76Xw2Jqnhf0ADkBY+ox
 pcVFVzuLaNA6DlPWv0G+c2l9yP5qCA5r3fgMq8/lNBC49t6UoZEj7FtfnRCra1gIDvSGsQ
 zIWYUz6HSfSpsYdCMEw5sZpenOEgliI/CIQwXf17wx6OkCuXXYeaB1lpzYcQiKVPDXzChk
 abGz3cOt45bYjHJdlZVbOgp9b5qwunuIf2nW+ug+llsuu/xoqtzUlLCvTEVNvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DP4wmf9B
Subject: Re: [Buildroot] [PATCH 1/2] package/powerpc-utils: fix build with
 gcc >= 15.x
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

CgpPbiAyNC8wNS8yMDI2IDE5OjE2LCBCZXJuZCBLdWhscyB3cm90ZToKPiBBZGRlZCB1cHN0cmVh
bSBwYXRjaCB0byBmaXggYnVpbGQgZXJyb3JzIHdpdGggZ2NjID49IDE1LnguCj4gCj4gRml4ZXM6
Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzk2YS85NmFiMWQ5YWQ4
YmI3MTZmNzMyY2Q3NmFiZDNiNjQzNzZlYzFkNDhmLwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5k
IEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgogIEFwcGxpZWQgdG8gbWFzdGVyIGFuZCB0aGUgb3Ro
ZXIgdG8gbmV4dCwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiBUaGlzIHBh
dGNoIHdhcyBjb21taXR0ZWQgdXBzdHJlYW0gYWZ0ZXIgdGhlIHJlbGVhc2Ugb2YgMS4zLjEzLCBp
dAo+IGFwcGxpZXMgdG8gYm90aCB0aGUgY3VycmVudCB2ZXJzaW9uIDEuMy4xMSBhcyB3ZWxsIGFz
IHRvIHRoZSB1cGNvbWluZwo+IGJ1bXAgdG8gMS4zLjEzLgo+IAo+ICAgLi4uLUNvcnJlY3QtbGli
cnRhcy1mdW5jdGlvbi1wcm90b3R5cGVzLnBhdGNoIHwgNjQgKysrKysrKysrKysrKysrKysrKwo+
ICAgMSBmaWxlIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3Bvd2VycGMtdXRpbHMvMDAwMS1udnJhbS5jLUNvcnJlY3QtbGlicnRhcy1mdW5j
dGlvbi1wcm90b3R5cGVzLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcG93ZXJwYy11
dGlscy8wMDAxLW52cmFtLmMtQ29ycmVjdC1saWJydGFzLWZ1bmN0aW9uLXByb3RvdHlwZXMucGF0
Y2ggYi9wYWNrYWdlL3Bvd2VycGMtdXRpbHMvMDAwMS1udnJhbS5jLUNvcnJlY3QtbGlicnRhcy1m
dW5jdGlvbi1wcm90b3R5cGVzLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi40MzczZTg5YzVmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcG93
ZXJwYy11dGlscy8wMDAxLW52cmFtLmMtQ29ycmVjdC1saWJydGFzLWZ1bmN0aW9uLXByb3RvdHlw
ZXMucGF0Y2gKPiBAQCAtMCwwICsxLDY0IEBACj4gK0Zyb20gMGM2YWNkYWUwOTBjYjc0Y2E2MGM4
MTE5NGFjOWFjODE5YTE5OTM1ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogTWlj
aGFsIFN1Y2hhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4KPiArRGF0ZTogTW9uLCA0IEF1ZyAyMDI1
IDEzOjI1OjM4ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gbnZyYW0uYzogQ29ycmVjdCBsaWJy
dGFzIGZ1bmN0aW9uIHByb3RvdHlwZXMKPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1U
eXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6IDhiaXQKPiArCj4gK0ZpeCBidWlsZCBicmVha2FnZSB3aXRoIEdDQyAxNSAod2hpY2ggYXNz
dW1lcyBDMjMpIHN1Y2ggdGhhdCBhbmQgZW1wdHkKPiArYXJndW1lbnQgbGlzdCBpcyB0cmVhdGVk
IGFzIHplcm8gYXJndW1lbnRzIHJhdGhlciB0aGFuIGFuIGFyYml0cmFyeQo+ICtudW1iZXIuCj4g
Kwo+ICtzcmMvbnZyYW0uYzogSW4gZnVuY3Rpb24g4oCYZHVtcF9ydGFzX2V2ZW50X2VudHJ54oCZ
Ogo+ICtzcmMvbnZyYW0uYzo5MzI6MTg6IGVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8gZnVu
Y3Rpb24g4oCYcGFyc2VfcnRhc19ldmVudOKAmTsgZXhwZWN0ZWQgMCwgaGF2ZSAyCj4gKyAgOTMy
IHwgICAgIHJ0YXNfZXZlbnQgPSBwYXJzZV9ydGFzX2V2ZW50KGRhdGEsIGxlbik7Cj4gKyAgICAg
IHwgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+IH5+fn4KPiArc3JjL252cmFtLmM6
OTM4OjU6IGVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYcnRhc19wcmlu
dF9ldmVudOKAmTsgZXhwZWN0ZWQgMCwgaGF2ZSAzCj4gKyAgOTM4IHwgICAgIHJ0YXNfcHJpbnRf
ZXZlbnQoc3Rkb3V0LCBydGFzX2V2ZW50LCAwKTsKPiArICAgICAgfCAgICAgXn5+fn5+fn5+fn5+
fn5+fiB+fn5+fn4KPiArc3JjL252cmFtLmM6OTQwOjU6IGVycm9yOiB0b28gbWFueSBhcmd1bWVu
dHMgdG8gZnVuY3Rpb24g4oCYY2xlYW51cF9ydGFzX2V2ZW504oCZOyBleHBlY3RlZCAwLCBoYXZl
IDEKPiArICA5NDAgfCAgICAgY2xlYW51cF9ydGFzX2V2ZW50KHJ0YXNfZXZlbnQpOwo+ICsgICAg
ICB8ICAgICBefn5+fn5+fn5+fn5+fn5+fn4gfn5+fn5+fn5+fgo+ICtJbiBmaWxlIGluY2x1ZGVk
IGZyb20gc3JjL3ZjcHVzdGF0LmM6MzQ6Cj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgU3Vj
aGFuZWsgPG1zdWNoYW5la0BzdXNlLmRlPgo+ICtbdHlyZWxkOiBhZGQgZGVzY3JpcHRpb24gdG8g
Y29tbWl0IGxvZ10KPiArU2lnbmVkLW9mZi1ieTogVHlyZWwgRGF0d3lsZXIgPHR5cmVsZEBsaW51
eC5pYm0uY29tPgo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9pYm0tcG93ZXIt
dXRpbGl0aWVzL3Bvd2VycGMtdXRpbHMvY29tbWl0LzBjNmFjZGFlMDkwY2I3NGNhNjBjODExOTRh
YzlhYzgxOWExOTkzNWYKPiArCj4gK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBr
dWhscy5uZXQ+Cj4gKy0tLQo+ICsgc3JjL252cmFtLmMgfCAxMCArKysrKystLS0tCj4gKyAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAt
LWdpdCBhL3NyYy9udnJhbS5jIGIvc3JjL252cmFtLmMKPiAraW5kZXggMTk4N2MzZDkuLjQ1YTYx
ZWJmIDEwMDY0NAo+ICstLS0gYS9zcmMvbnZyYW0uYwo+ICsrKysgYi9zcmMvbnZyYW0uYwo+ICtA
QCAtODg2LDYgKzg4Niw4IEBAIGR1bXBfZXJybG9nKHN0cnVjdCBudnJhbSAqbnZyYW0pCj4gKyAg
ICAgcmV0dXJuIDA7Cj4gKyB9Cj4gKwo+ICsrc3RydWN0IHJ0YXNfZXZlbnQ7Cj4gKysKPiArIC8q
Kgo+ICsgICogZHVtcF9ydGFzX2V2ZW50X2VudHJ5Cj4gKyAgKiBAYnJpZWYgRHVtcCBldmVudC1z
Y2FuIGRhdGEuCj4gK0BAIC05MDEsMTEgKzkwMywxMSBAQCBkdW1wX2VycmxvZyhzdHJ1Y3QgbnZy
YW0gKm52cmFtKQo+ICsgaW50Cj4gKyBkdW1wX3J0YXNfZXZlbnRfZW50cnkoY2hhciAqZGF0YSwg
aW50IGxlbikKPiArIHsKPiArLSAgICB2b2lkICpydGFzX2V2ZW50Owo+ICsrICAgIHN0cnVjdCBy
dGFzX2V2ZW50ICpydGFzX2V2ZW50Owo+ICsgICAgIHZvaWQgKmhhbmRsZTsKPiArLSAgICB2b2lk
ICooKnBhcnNlX3J0YXNfZXZlbnQpKCk7Cj4gKy0gICAgdm9pZCAoKnJ0YXNfcHJpbnRfZXZlbnQp
KCk7Cj4gKy0gICAgdm9pZCAoKmNsZWFudXBfcnRhc19ldmVudCkoKTsKPiArKyAgICBzdHJ1Y3Qg
cnRhc19ldmVudCAqKCpwYXJzZV9ydGFzX2V2ZW50KShjaGFyICosIGludCk7Cj4gKysgICAgaW50
ICgqcnRhc19wcmludF9ldmVudCkoRklMRSAqLCBzdHJ1Y3QgcnRhc19ldmVudCAqLCBpbnQpOwo+
ICsrICAgIGludCAoKmNsZWFudXBfcnRhc19ldmVudCkoc3RydWN0IHJ0YXNfZXZlbnQgKik7Cj4g
Kwo+ICsgICAgIGhhbmRsZSA9IGRsb3BlbigiL3Vzci9saWIvbGlicnRhc2V2ZW50LnNvIiwgUlRM
RF9MQVpZKTsKPiArICAgICBpZiAoaGFuZGxlID09IE5VTEwpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
