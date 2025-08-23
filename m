Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1EFCA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 18:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 487FF83EC7;
	Sat, 23 Aug 2025 18:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9VguDq_fIRJ; Sat, 23 Aug 2025 18:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 509B183ED8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 509B183ED8;
	Sat, 23 Aug 2025 18:51:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDE2E4
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00C5141545
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7XBiFWR6er2 for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 18:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DC95341541
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC95341541
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC95341541
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 18:51:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3c79f0a606fso332515f8f.0
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 11:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755975103; x=1756579903;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OW+a9DmiKppwYEi85tbzZbJLApofcz54aMgc88TZh4k=;
 b=IPmF+Ei4Hihukik6c78GX3zXCbJdkRJnbSDDHwlaVSPkqtkE9TWM1AiEk2bP1zPllw
 kpn65yJivtGvTGhsY19/zk58CivuNZJuACrKW9DZ9CgQbjvzp7XzeVCr5a5tnxsliR4m
 gWP8q7vB2e9PnKjbAR6oJBThnW3RX/KEd3tmRRtXxCGsE+YtrQNENWzpBe5a7sMblF6n
 jBpvdtyexZvl+0ePIeaeVj4fHtkrn8O/tEDGZLrP0E0zG5mP2QEzicshVL9JtdWnMG6N
 irSfNDODIxJc9bv7T3LUbdf+FWSqBcGpwKa98vLvGSDJwG0RocN1FyILrb1tw4qL8K2H
 r/Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD6PfPM39M+1exRRYjIxjhfjTf0feRzRH9dlGwOijkAJuSL2xCW972fOZchdCg7jnX+ZrV9vzZv3I=@buildroot.org
X-Gm-Message-State: AOJu0YxZ8IIi0XnlmxRSVV7XPVhcKafCwmY6qrH6MTdT1bXC3mbI8LFn
 IRAZ2ZBGCq961+kZKzxaAEt/5Yda5aUT9364qK2zJWW7zG+dTcuLOFaqBLtZzhfUT1iaYX5AUnQ
 gaHTI
X-Gm-Gg: ASbGncs+owa3U/EKBijlQVay3bw8zvOTnO3dnIa2DzGhmDKc8zMJ0NzSbO4xssMDV40
 ivcjOW5w4Y4LKQI71eD5Cd3ZU4lb25wcuJYtS4ALQxseEySAAFZzhFkr5g46FwNDW7DrzHSZY4P
 CpyFifHxtfhs28YvxDPb2IIrmTbS30yP+hqFZjoOVEp+e+TdFFZSV+4v/qclYUBOthBErpRpcgz
 gfhiDAguy1aUev1bKezS8GCZ5GWzhT/GKud/ClRQiN2ixG8vDSUK8lmNpQrIvZ1oqByfLmLv8v0
 l9/CF2Exei4gI5liSorQSNiPKqTx1zSJj+2YFlXUuOlnWbpmgoUUufbp66AKknoqyTnmtKX57Cf
 jMbPOvz/NF27y+I5LQ3M8hctfoFUd5Kuiz3r25LoJ0/gGF97kG9mq4bpeN9UGWzu8SX/aE9btB+
 vB1PBW8I9SiS/ybiMsEuXEJi8jFnDBZSXOLzu/rmr/cvmYlluWvchW2j63yCRM
X-Google-Smtp-Source: AGHT+IEjZlxloaviVXOfRmIm/dI0qo38Z0GofOXSbmBQt1j6kzU9BhIv++G7RyY1aQFTomRvwk+6YA==
X-Received: by 2002:a5d:66ca:0:b0:3c7:2491:a2e with SMTP id
 ffacd0b85a97d-3c724911079mr2298542f8f.44.1755975102809; 
 Sat, 23 Aug 2025 11:51:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c70ea81d38sm4686227f8f.17.2025.08.23.11.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 11:51:42 -0700 (PDT)
Message-ID: <9e5e6e70-9dbc-4d1f-b789-7e6c6820efc2@smile.fr>
Date: Sat, 23 Aug 2025 20:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250823170545.59420-1-thomas.petazzoni@bootlin.com>
 <20250823170545.59420-2-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20250823170545.59420-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755975103; x=1756579903; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OW+a9DmiKppwYEi85tbzZbJLApofcz54aMgc88TZh4k=;
 b=fUBYdaafW6Gj0/7N9wbQP3SCxKwwXl+ZqkqUqep8HkJiTSeMC19MWyh+eAvn0z80up
 DCRksU0/8uPHHYlpWjAMPKOxDUoVaclaYNAi7DVr66mbK7WcT2Gyl6ZA6qVF0RktBx8s
 j9S/nRxP7NztWtfd0Izc0//EBemY+bNIx+J9o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=fUBYdaaf
Subject: Re: [Buildroot] [PATCH 2/2] package/sdl: fix build with GCC 15.x
 with X.org support enabled
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAyMy8wOC8yMDI1IMOgIDE5OjA1LCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBXaGVuIGJ1aWxkaW5nOgo+IAo+ICBCUjJf
YXJtPXkKPiAgQlIyX2NvcnRleF9hOT15Cj4gIEJSMl9BUk1fRU5BQkxFX1ZGUD15Cj4gIEJSMl9U
T09MQ0hBSU5fRVhURVJOQUw9eQo+ICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eQo+
ICBCUjJfSU5JVF9OT05FPXkKPiAgQlIyX1NZU1RFTV9CSU5fU0hfTk9ORT15Cj4gICMgQlIyX1BB
Q0tBR0VfQlVTWUJPWCBpcyBub3Qgc2V0Cj4gIEJSMl9QQUNLQUdFX1NETD15Cj4gIEJSMl9QQUNL
QUdFX1NETF9YMTE9eQo+ICBCUjJfUEFDS0FHRV9YT1JHNz15Cj4gICMgQlIyX1RBUkdFVF9ST09U
RlNfVEFSIGlzIG5vdCBzZXQKPiAKPiB0aGUgYnVpbGQgZmFpbHMgd2l0aDoKPiAKPiAuL3NyYy92
aWRlby9YZXh0L1h2L1h2LmM6Nzg6NTogZXJyb3I6IGluaXRpYWxpemF0aW9uIG9mIOKAmGludCAo
KikoRGlzcGxheSAqLCBYRXZlbnQgKiwgeEV2ZW50ICop4oCZIHtha2Eg4oCYaW50ICgqKShEaXNw
bGF5ICosIFhFdmVudCAqLCBzdHJ1Y3QgX3hFdmVudCAqKeKAmX0gZnJvbSBpbmNvbXBhdGlibGUg
cG9pbnRlciB0eXBlIOKAmGludCAoKikodm9pZCnigJkgWy1XaW5jb21wYXRpYmxlLXBvaW50ZXIt
dHlwZXNdCj4gCj4gYW5kIGEgbnVtYmVyIG9mIHNpbWlsYXIgZXJyb3JzIGluIHRoZSBYLm9yZyBj
b2RlLgo+IAo+IFdlIGZpeCB0aGlzIGJ5IGJhY2twb3J0aW5nIGFuIHVwc3RyZWFtIGNvbW1pdC4K
CkkgY2FuJ3QgZmluZCBhbnkgYXV0b2J1aWxkZXIgcmVzdWx0IFsxXSBmb3IgdGhpcyBvbmUgYnV0
IEkgcmVwcm9kdWNlZCB0aGUgaXNzdWUKbG9jYWxseS4KClsxXSBodHRwczovL2F1dG9idWlsZC5i
dWlsZHJvb3Qub3JnLz9yZWFzb249c2RsLTEuMi4xNQoKU2VyaWVzIGFwcGxpZWQgdG8gbWFzdGVy
LCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhv
bWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiAtLS0KPiAgLi4u
aW9uLWRlY2xhcmF0aW9ucy13aXRob3V0LWEtcHJvdG90eXBlLnBhdGNoIHwgNjYgKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9zZGwvMDAwMy1YZXh0LUZpeC1mdW5jdGlvbi1kZWNsYXJhdGlv
bnMtd2l0aG91dC1hLXByb3RvdHlwZS5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Nk
bC8wMDAzLVhleHQtRml4LWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy13aXRob3V0LWEtcHJvdG90eXBl
LnBhdGNoIGIvcGFja2FnZS9zZGwvMDAwMy1YZXh0LUZpeC1mdW5jdGlvbi1kZWNsYXJhdGlvbnMt
d2l0aG91dC1hLXByb3RvdHlwZS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMC4uY2NjYzA0NjRiYgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3Nk
bC8wMDAzLVhleHQtRml4LWZ1bmN0aW9uLWRlY2xhcmF0aW9ucy13aXRob3V0LWEtcHJvdG90eXBl
LnBhdGNoCj4gQEAgLTAsMCArMSw2NiBAQAo+ICtGcm9tIDZmYjVhYWRhZmM5ZDk5YzI1ZmI0ZjFh
MzdkMjI1ZDViNzliYzkyZTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IG9yYmVh
IDxvcmJlYUByaXNldXAubmV0Pgo+ICtEYXRlOiBTYXQsIDE1IE9jdCAyMDIyIDE1OjEwOjQ4IC0w
NzAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gWGV4dDogRml4IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyB3
aXRob3V0IGEgcHJvdG90eXBlCj4gKwo+ICtUaGlzIGlzIG5vdCBzdXBwb3J0ZWQgd2l0aCB0aGUg
dXBjb21pbmcgY2xhbmcgMTYuCj4gKwo+ICtlcnJvcjogYSBmdW5jdGlvbiBkZWNsYXJhdGlvbiB3
aXRob3V0IGEgcHJvdG90eXBlIGlzIGRlcHJlY2F0ZWQgaW4gYWxsIHZlcnNpb25zIG9mIEMgYW5k
IGlzIHRyZWF0ZWQgYXMgYSB6ZXJvLXBhcmFtZXRlciBwcm90b3R5cGUgaW4gQzJ4LCBjb25mbGlj
dGluZyB3aXRoIGEgc3Vic2VxdWVudCBkZWZpbml0aW9uIFstV2Vycm9yLC1XZGVwcmVjYXRlZC1u
b24tcHJvdG90eXBlXQo+ICsKPiArcmVmZXJlbmNlOiBodHRwczovL2FyY2hpdmVzLmdlbnRvby5v
cmcvZ2VudG9vLWRldi9tZXNzYWdlL2RkOWYyZDMwODJiOGI2ZjhkZmJjY2IwNjM5ZTZlMjQwCj4g
Kwo+ICtVcHN0cmVhbTogZTczOGNmZmZjZWQ4YTAwNjA5NGQ1NTMzN2Q5MTczODY1ODJhZGE0Nwo+
ICtTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3Rs
aW4uY29tPgo+ICstLS0KPiArIHNyYy92aWRlby9YZXh0L1hNRS94bWUuYyAgICAgICAgICAgfCAy
ICstCj4gKyBzcmMvdmlkZW8vWGV4dC9YaW5lcmFtYS9YaW5lcmFtYS5jIHwgMyArKy0KPiArIHNy
Yy92aWRlby9YZXh0L1h2L1h2LmMgICAgICAgICAgICAgfCA2ICsrKy0tLQo+ICsgMyBmaWxlcyBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0
IGEvc3JjL3ZpZGVvL1hleHQvWE1FL3htZS5jIGIvc3JjL3ZpZGVvL1hleHQvWE1FL3htZS5jCj4g
K2luZGV4IDJjZWFkMzVhLi5iYjhkMDRkNCAxMDA2NDQKPiArLS0tIGEvc3JjL3ZpZGVvL1hleHQv
WE1FL3htZS5jCj4gKysrKyBiL3NyYy92aWRlby9YZXh0L1hNRS94bWUuYwo+ICtAQCAtMjA2LDcg
KzIwNiw3IEBAIHN0YXRpYyBjaGFyICp4aWdtaXNjX2V4dGVuc2lvbl9uYW1lID0gWElHTUlTQ19Q
Uk9UT0NPTF9OQU1FOwo+ICsgLyoKPiArICAqIGZpbmRfZGlzcGxheSAtIGxvY2F0ZSB0aGUgZGlz
cGxheSBpbmZvIGJsb2NrCj4gKyAgKi8KPiArLXN0YXRpYyBpbnQgWGlHTWlzY0Nsb3NlRGlzcGxh
eSgpOwo+ICsrc3RhdGljIGludCBYaUdNaXNjQ2xvc2VEaXNwbGF5KERpc3BsYXkqLCBYRXh0Q29k
ZXMqKTsKPiArIAo+ICsgc3RhdGljIFhFeHRlbnNpb25Ib29rcyB4aWdtaXNjX2V4dGVuc2lvbl9o
b29rcyA9IHsKPiArICAgICBOVUxMLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBj
cmVhdGVfZ2MgKi8KPiArZGlmZiAtLWdpdCBhL3NyYy92aWRlby9YZXh0L1hpbmVyYW1hL1hpbmVy
YW1hLmMgYi9zcmMvdmlkZW8vWGV4dC9YaW5lcmFtYS9YaW5lcmFtYS5jCj4gK2luZGV4IDRmZjQy
ZWJmLi41N2Y2NGI5YyAxMDA2NDQKPiArLS0tIGEvc3JjL3ZpZGVvL1hleHQvWGluZXJhbWEvWGlu
ZXJhbWEuYwo+ICsrKysgYi9zcmMvdmlkZW8vWGV4dC9YaW5lcmFtYS9YaW5lcmFtYS5jCj4gK0BA
IC01MCw3ICs1MCw4IEBAIHN0YXRpYyAvKiBjb25zdCAqLyBjaGFyICpwYW5vcmFtaVhfZXh0ZW5z
aW9uX25hbWUgPSBQQU5PUkFNSVhfUFJPVE9DT0xfTkFNRTsKPiArICNkZWZpbmUgUGFub3JhbWlY
U2ltcGxlQ2hlY2tFeHRlbnNpb24oZHB5LGkpIFwKPiArICAgWGV4dFNpbXBsZUNoZWNrRXh0ZW5z
aW9uIChkcHksIGksIHBhbm9yYW1pWF9leHRlbnNpb25fbmFtZSkKPiArIAo+ICstc3RhdGljIGlu
dCBjbG9zZV9kaXNwbGF5KCk7Cj4gKytzdGF0aWMgaW50IGNsb3NlX2Rpc3BsYXkoRGlzcGxheSos
IFhFeHRDb2RlcyopOwo+ICsrCj4gKyBzdGF0aWMgLyogY29uc3QgKi8gWEV4dGVuc2lvbkhvb2tz
IHBhbm9yYW1pWF9leHRlbnNpb25faG9va3MgPSB7Cj4gKyAgICAgTlVMTCwJCQkJLyogY3JlYXRl
X2djICovCj4gKyAgICAgTlVMTCwJCQkJLyogY29weV9nYyAqLwo+ICtkaWZmIC0tZ2l0IGEvc3Jj
L3ZpZGVvL1hleHQvWHYvWHYuYyBiL3NyYy92aWRlby9YZXh0L1h2L1h2LmMKPiAraW5kZXggNzE0
N2I5ZTguLmMyNTRhMWRjIDEwMDY0NAo+ICstLS0gYS9zcmMvdmlkZW8vWGV4dC9Ydi9Ydi5jCj4g
KysrKyBiL3NyYy92aWRlby9YZXh0L1h2L1h2LmMKPiArQEAgLTYzLDkgKzYzLDkgQEAgc3RhdGlj
IGNoYXIgKnh2X2V4dGVuc2lvbl9uYW1lID0gWHZOYW1lOwo+ICsgI2RlZmluZSBYdkNoZWNrRXh0
ZW5zaW9uKGRweSwgaSwgdmFsKSBcCj4gKyAgIFhleHRDaGVja0V4dGVuc2lvbihkcHksIGksIHh2
X2V4dGVuc2lvbl9uYW1lLCB2YWwpCj4gKyAKPiArLXN0YXRpYyBjaGFyICp4dl9lcnJvcl9zdHJp
bmcoKTsKPiArLXN0YXRpYyBpbnQgeHZfY2xvc2VfZGlzcGxheSgpOwo+ICstc3RhdGljIEJvb2wg
eHZfd2lyZV90b19ldmVudCgpOwo+ICsrc3RhdGljIGNoYXIgKnh2X2Vycm9yX3N0cmluZyhEaXNw
bGF5KiwgaW50LCBYRXh0Q29kZXMqLCBjaGFyKiwgaW50KTsKPiArK3N0YXRpYyBpbnQgeHZfY2xv
c2VfZGlzcGxheShEaXNwbGF5KiwgWEV4dENvZGVzKik7Cj4gKytzdGF0aWMgQm9vbCB4dl93aXJl
X3RvX2V2ZW50KERpc3BsYXkqLCBYRXZlbnQqLCB4RXZlbnQqKTsKPiArIAo+ICsgc3RhdGljIFhF
eHRlbnNpb25Ib29rcyB4dl9leHRlbnNpb25faG9va3MgPSB7Cj4gKyAgICAgTlVMTCwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLyogY3JlYXRlX2djICovCj4gKy0tIAo+ICsyLjUwLjEK
PiArCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
