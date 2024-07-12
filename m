Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B714C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 538978408D;
	Fri, 12 Jul 2024 19:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-QsZ_ETYaml; Fri, 12 Jul 2024 19:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38CDD840E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38CDD840E5;
	Fri, 12 Jul 2024 19:52:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 423791BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A5AB60655
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oPV5X77-so3l for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:52:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04EE46064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04EE46064A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04EE46064A
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:52:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4279c924ca7so11828505e9.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720813923; x=1721418723;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RjxGSkqJTQz4aO45Xr1qJgyoOF1aVYoob0l5BIFGhr4=;
 b=A710GYW8SD5p9XGoVAr92FPhkNnK5SO3KuNiyFrR1kNRFQCpPrpTcDGAzwkcbf7BBZ
 tvrzfEmvsHduMF+Ag6Yqf7oL8JZKLFJJc3ehUHHpZlIdn7XcYqYpr55amn9eu8Y8L+6m
 zqZaOuAfeMfCXb2/b8dUOO6vJ5d5OcbwLDeTRTdUsrSXhrW/bDaUUFuT/f//YFTk3yFr
 qyRaDyCVOxhyE1DIewwadco7N4mG7ZACBtxtJ2XqtZy1IhodP9ZrLwNgCYwO8D1Gw0A1
 1w0QbYNqvl+bOSkgF8EsEigvZxspxZqssYM9ynISfEAygZ8f8CiK7DAdkqPF7gDo7aKn
 knSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnBbiGRYim6DJZhHIzhWJdqGYI8B89MFigKcDFDkS3RUuxj5o9hdKGb+2RS1nU79fIgA33YjSXwuBF3SJEPT96UQcjjxi09g==
X-Gm-Message-State: AOJu0YwdLpfgx1oWcuFjl7pvL4dxF14HETp71jTbKSEOm1ksBhCH5clz
 v4Y2y6//ehi6cWIesVWup0CvL2gKIg8LtDUap7iZYD4XlFRQLwL2jQd5dMCVfqc=
X-Google-Smtp-Source: AGHT+IHuj/WbRuwam/73dP/JFr0/HgyVsbVUok/gRaOB8TdBVBW69Ym8j8bWAK0rh+/+vaE3oqh+KQ==
X-Received: by 2002:a05:600c:4797:b0:426:5440:8541 with SMTP id
 5b1f17b1804b1-426707f8fcfmr69971495e9.27.1720813922822; 
 Fri, 12 Jul 2024 12:52:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4267255858asm105273915e9.0.2024.07.12.12.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:52:02 -0700 (PDT)
Message-ID: <5d78c650-f662-4733-ba33-dff3aa71727a@mind.be>
Date: Fri, 12 Jul 2024 21:51:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, "Rush, David"
 <david.rush2@hpe.com>, "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <DM4PR84MB1664512ACED9F33EDD096ADEB6DA2@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
 <69f8bf8d-7bf9-4941-987e-9fc59ba40a7a@smile.fr>
Content-Language: en-GB
In-Reply-To: <69f8bf8d-7bf9-4941-987e-9fc59ba40a7a@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720813923; x=1721418723; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RjxGSkqJTQz4aO45Xr1qJgyoOF1aVYoob0l5BIFGhr4=;
 b=aUCG7de4Yd49db3MrRhka8KF2ZJp7ER2y3k8xBpKPUkrwTvlegIkNV/iAjqqKuehfM
 lanQAP0DjoO+h5G0wsexUDOBWOEASsWzartCNdbHGJoRwMHQvVuVkvzeSFD5KREBfXoN
 RB9+spUMb6sULqOU33XXdGgTz4Z+2UUjR8BR+Z5AF30BmlwHsdnQHxh04G7BAXt+UCTX
 JRM1wNoiiB8BTHIT4fgDc2JwCo6951GfhZqLVxw4geL6Po+lvuVm5tl0vEoaCHH3bqNh
 b5m0iI0MZ2FX5lDb/Dx0jGa7rKXuRaOCXlKLs1V9XLrR9OchOJU+vMby7ohVAm4IbMS1
 lnZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aUCG7de4
Subject: Re: [Buildroot] bare metal toolchain tuning options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8wNy8yMDI0IDIxOjM3LCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBIZWxsbyBEYXZpZCwgQWxsLAo+IAo+IExlIDA4LzA3LzIwMjQgw6AgMTk6NTgsIFJ1c2gsIERh
dmlkIGEgw6ljcml0wqA6Cj4+IEhpLAo+Pgo+PiBIYXZpbmcgdGhlIG9wdGlvbiB0byBidWlsZCBh
IGJhcmUgbWV0YWwgdG9vbGNoYWluIGFsb25nc2lkZSB0aGUgTGludXggYml0cyBpcyBmYW50YXN0
aWMuIEFzIHRoaW5ncyBhcmUgbm93IG9ubHkgdGhlIGFyY2ggdHVwbGUgaXMgY29uZmlndXJhYmxl
IHRob3VnaCB0aGUgZGVmY29uZmlnLCB3aGljaCBtYXkgbm90IGFsd2F5cyBnZXQgdG8gdGhlIGRl
c2lyZWQgcmVzdWx0LiBIYXMgYW55b25lIGxvb2tlZCBhdCBhZGRpbmcgY29uZmlndXJlIG9wdGlv
bnMgZm9yIHR1bmluZyB0aGUgYmFyZSBtZXRhbCB0b29sY2hhaW4gcGFja2FnZT8gRm9yIGV4YW1w
bGUsIHdoZW4gZXhwZXJpbWVudGluZyB3aXRoIGFuIGFybSBjb3J0ZXggbTQgbWljcm9jb250cm9s
bGVyIHdpdGggYSAnbmFubycgbmV3bGliIGNvbmZpZ3VyYXRpb24sIHRoZSBmb2xsb3dpbmcgY2hh
bmdlcyB0byBnY2MgYW5kIG5ld2xpYidzIGNvbmZpZ3VyZSBjb21tYW5kIGdvdCBtZSBhIHdvcmtp
bmcgdG9vbGNoYWluOgo+IAo+IFRoZSBCUjJfVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09U
IG9wdGlvbiBpcyBzb21ldGhpbmcgbmV3IGluIEJ1aWxkcm9vdAo+IChhZGRlZCBpbiBKYW51YXJ5
IDIwMjQpIGFuZCBpbml0aWFsbHkgaW50ZW5kZWQgdG8gYnVpbGQgenlucW1wLWZpcm13YXJlICh4
aWxpbngpCj4gcmVxdWlyZWQgdG8gYm9vdCB0aGUgYm9hcmQuCj4gCj4gSSBkb24ndCB0aGluayBp
dCdzIG1lYW50IGZvciBhbm90aGVyIHB1cnBvc2UuIEZvciBleGFtcGxlLCBidWlsZGluZyBhIHJl
bW90ZWNvcmUKPiBtNCBiYXNlZCBmaXJtd2FyZSBldGMuLi4KCiAgQWN0dWFsbHksIEkgdGhpbmsg
aXQgd2FzIGludHJvZHVjZWQgaW4gdGhpcyBnZW5lcmljIHdheSBwcmVjaXNlbHkgdG8gYmUgYWJs
ZSAKdG8gdXNlIGl0IGZvciBvdGhlciBwdXJwb3NlcywgbGlrZSByZW1vdGVjb3JlIGZpcm13YXJl
Li4uCgogIEFuZCBJIHdhc24ndCBhIGJpZyBmYW4gZm9yIG1lcmdpbmcgdGhpcyBiZWNhdXNlIEkg
ZmVhcmVkIHRoZXJlIHdvdWxkIGJlIG5vIGVuZCAKb2YgdHVuYWJsZXMgYW5kIGFkZGl0aW9uYWwg
Y29uZmlnIG9wdGlvbnMgbmVlZGVkIHRvIHJlYWxseSBtYWtlIGl0IHdvcmssIGFuZCAKSU1ITyB0
aGF0IGZhbGxzIG91dHNpZGUgdGhlIHNjb3BlIG9mIEJ1aWxkcm9vdCAoYnVpbGRpbmcgYSBMaW51
eCByb290ZnMpLgoKICBCdXQgaGVyZSB3ZSBhcmUsIGFuZCBhcHBhcmVudGx5IHRoZXJlIGlzIGEg
ZGVtYW5kIGZvciB1c2luZyBCdWlsZHJvb3QgYXMgdGhlIAp0b3AtbGV2ZWwgZHJpdmVyIHRvIGJ1
aWxkIHRoZSBlbnRpcmUgc3lzdGVtLCBpbmNsdWRpbmcgbm9uLUxpbnV4IGNvcmVzLiBTbyBJIApl
eHBlY3QgdGhlcmUgd2lsbCBiZSBwYXRjaGVzIHRoYXQgYWRkIG1vcmUgb3B0aW9ucyBhbmQgdHVu
aW5nIHRvIHRoZSBiYXJlIG1ldGFsIAp0b29sY2hhaW4gYW5kIHRoYXQgYWRkIHBvc3NpYmlsaXRp
ZXMgdG8gYnVpbGQgbm9uLUxpbnV4IGZpcm13YXJlLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4gCj4+Cj4+IC0tLSBhL3BhY2thZ2UvZ2NjLWJh
cmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsKPj4gKysrIGIvcGFja2FnZS9nY2MtYmFyZS1tZXRh
bC9nY2MtYmFyZS1tZXRhbC5tawo+PiBAQCAtNTcsNiArNTcsMTAgQEAgSE9TVF9HQ0NfQkFSRV9N
RVRBTF9DT05GX09QVFMgPSBcCj4+ICAgICAgICAgIC0td2l0aC1tcGZyPSQoSE9TVF9ESVIpIFwK
Pj4gICAgICAgICAgLS13aXRoLWlzbD0kKEhPU1RfRElSKSBcCj4+ICAgICAgICAgIC0td2l0aC1z
eXNyb290PSQoVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UX1NZU1JPT1QpIFwKPj4gKyAg
ICAgICAtLXdpdGgtY3B1PWNvcnRleC1tNCBcCj4+ICsgICAgICAgLS13aXRoLWZwdT1mcHY0LXNw
LWQxNiBcCj4+ICsgICAgICAgLS13aXRoLW1vZGU9dGh1bWIgXAo+PiArICAgICAgIC0td2l0aC1m
bG9hdD1oYXJkIFwKPj4gICAgICAgICAgQVJfRk9SX1RBUkdFVD0kKEhPU1RfRElSKS9iaW4vJChU
T09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1RfQVJDSF9UVVBMRSktYXIgXAo+PiAgICAgICAg
ICBSQU5MSUJfRk9SX1RBUkdFVD0kKEhPU1RfRElSKS9iaW4vJChUT09MQ0hBSU5fQkFSRV9NRVRB
TF9CVUlMRFJPT1RfQVJDSF9UVVBMRSktcmFubGliCj4+ICAgCj4+Cj4+IC0tLSBhL3BhY2thZ2Uv
bmV3bGliLWJhcmUtbWV0YWwvbmV3bGliLWJhcmUtbWV0YWwubWsKPj4gKysrIGIvcGFja2FnZS9u
ZXdsaWItYmFyZS1tZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5tawo+PiBAQCAtMjgsMTEgKzI4LDE5
IEBAIGRlZmluZSBORVdMSUJfQkFSRV9NRVRBTF9DT05GSUdVUkVfQ01EUwo+PiAgICAgICAgICAg
ICAgICAgIC4vY29uZmlndXJlIFwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIC0tdGFyZ2V0
PSQoVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UX0FSQ0hfVFVQTEUpIFwKPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tcHJlZml4PS91c3IgXAo+PiAtICAgICAgICAgICAgICAgICAg
ICAgICAtLWVuYWJsZS1uZXdsaWItaW8tYzk5LWZvcm1hdHMgXAo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAtLWVuYWJsZS1uZXdsaWItaW8tbG9uZy1sb25nIFwKPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgLS1lbmFibGUtbmV3bGliLWlvLWZsb2F0IFwKPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgLS1lbmFibGUtbmV3bGliLWlvLWxvbmctZG91YmxlIFwKPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tZGlzYWJsZS1tdWx0aWxpYiBcCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IC0tZGlzYWJsZS1uZXdsaWItZnNlZWstb3B0aW1pemF0aW9uIFwKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgLS1kaXNhYmxlLW5ld2xpYi1mdndyaXRlLWluLXN0cmVhbWlvIFwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgLS1kaXNhYmxlLW5ld2xpYi1zdXBwbGllZC1zeXNjYWxscyBcCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIC0tZGlzYWJsZS1uZXdsaWItdW5idWYtc3RyZWFtLW9w
dCBcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIC0tZGlzYWJsZS1uZXdsaWItd2lkZS1vcmll
bnQgXAo+PiArICAgICAgICAgICAgICAgICAgICAgICAtLWVuYWJsZS1saXRlLWV4aXQgXAo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAtLWVuYWJsZS1uZXdsaWItZ2xvYmFsLWF0ZXhpdCBcCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIC0tZW5hYmxlLW5ld2xpYi1uYW5vLWZvcm1hdHRlZC1p
byBcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIC0tZW5hYmxlLW5ld2xpYi1uYW5vLW1hbGxv
YyBcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIC0tZW5hYmxlLW5ld2xpYi1yZWVudC1jaGVj
ay12ZXJpZnkgXAo+PiArICAgICAgICAgICAgICAgICAgICAgICAtLWVuYWJsZS1uZXdsaWItcmVl
bnQtc21hbGwgXAo+PiArICAgICAgICAgICAgICAgICAgICAgICAtLWVuYWJsZS1uZXdsaWItcmV0
YXJnZXRhYmxlLWxvY2tpbmcgXAo+PiAgICAgICAgICApCj4+ICAgZW5kZWYKPj4KPj4KPj4gSSdt
IG5vdCBsb29raW5nIGZvciBhbnlvbmUgdG8gZG8gdGhpcyBmb3IgbWUsIGp1c3Qgd29uZGVyaW5n
IGlmIGFueW9uZSBpcyBhY3RpdmVseSB3b3JraW5nIGluIHRoaXMgYXJlYS4gSWYgbm90LCBhcmUg
dGhlcmUgYW55IHN1Z2dlc3Rpb25zIG9yIGEgcHJlZmVycmVkIHN0cmF0ZWd5IGZvciBkZWFsaW5n
IHdpdGggYSBwb3RlbnRpYWxseSBsYXJnZSBudW1iZXIgb2YgY29uZmlndXJlIG9wdGlvbnMgbGlr
ZSB0aGlzPwo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
