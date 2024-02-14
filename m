Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B342C48BC3
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 17:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D126417D3;
	Wed, 14 Feb 2024 17:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXBegbobD_XJ; Wed, 14 Feb 2024 17:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED499417CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED499417CF;
	Wed, 14 Feb 2024 17:03:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1CC01BF315
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 17:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF1A182451
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 17:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juLCFOsWxL7h for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 17:03:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 90E2A82444
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E2A82444
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 90E2A82444
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 17:03:37 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d107900457so29298931fa.1
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 09:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707930216; x=1708535016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1p92FxdZ4aXL7FtDGXIh4FUlq+HxNdE9yrUnj6/RA0Q=;
 b=FQwkoa6IzR1bzbllN2IgmZAJv7YmO/jNKNuMWfSwHkjLevclMQH2N937GVXw56dnrq
 kMlbNE5lLhTC8NHIAWG7ii4AhynYOsA8QC4jvcxWEyFl7WkllQH8ZgxQWRwicZaxBvSJ
 huvj3wuBR8i8iZJdOhk3ir5WyjAMH/Hnn/q3k/vg3TM4/takSc9547fI84NIWDmJCu5Z
 6VMaNV+hbkleJjCAmBLHgBqb2OtY2MYgv3xOGoa/QIHLdK9G+iiEEhjN6PKxVlHQVy+H
 mRCj0YOKOlCAUEaQFVoYrrnLxyTxex5DktSLn9bXPW4esE/DCHDqkY08OianzIP3dQDP
 ZLFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFU87SupKwnMiouKbtZxNHwlo14i6Nm1EZq6Nftt1fVtgf5T3OTPMdXqv1u+UIvhtycBwCFC/LwGxF7yCc3b1V01pc3IFCTg==
X-Gm-Message-State: AOJu0YwMrIIwrDp3iNY6SzG93jM+p3iSAtf8OFjhu60uZcPsaUdblsI7
 A7i+B9IthfLT62JerH7MSwLphs+pc1u0SVXFvhJL+/kTQyM/2Rg5yCC0QbGg6uGVwvKP0Qv0Yj7
 5OOa7CxYz
X-Google-Smtp-Source: AGHT+IFkgk17WyyAuqQPmco8tnMN2Njsco7ZIRsBgguThVpn16BJt9GQRdxPKDFG1M+8Qed2kVCQhw==
X-Received: by 2002:a2e:97c5:0:b0:2d1:1d21:1481 with SMTP id
 m5-20020a2e97c5000000b002d11d211481mr1445834ljj.4.1707930215538; 
 Wed, 14 Feb 2024 09:03:35 -0800 (PST)
Received: from [192.168.178.20] (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c028100b0041069adbd87sm2484667wmk.21.2024.02.14.09.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 09:03:34 -0800 (PST)
Message-ID: <c12099d9-fa4f-4f8f-96b7-dcdfc3b8c3d1@mind.be>
Date: Wed, 14 Feb 2024 18:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-26-james.hilliard1@gmail.com>
In-Reply-To: <20240213211512.3918044-26-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707930216; x=1708535016; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1p92FxdZ4aXL7FtDGXIh4FUlq+HxNdE9yrUnj6/RA0Q=;
 b=ZyABPdFycGDBxPihOPvD4TP6UTegJkqgWkFJKqlLl6aNbSFL5IFkG3n3QGVjHpe4iC
 tVPlaVQI0ceZ8fMQ8lRI4oJPeSB/VCbyvItQs3DSuNG9NRDc5p60hctu5o08axvg0YBz
 g5QcpLl706vqoJwPF6sq/fUZmVSqklu6zDMIcUlsX2g4j5QUOefbFwQZBe6N0HAJF4FY
 4ReI+8A1NdQe64BV+PgOhwLhCQDBkc859stKmwfDUqyTNlw2w1/GgGvFj7fGNus5xozb
 oxz1DsvddRHeCYNF7ijLcqjquEujRQbHhP/77cOydivM8aNl4Lduk+5Wf2Tsw9pE3HoQ
 z7/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZyABPdFy
Subject: Re: [Buildroot] [PATCH v8 26/26] package/pkg-python.mk: migrate
 setuptools to pep517
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyLzEzLzI0IDIyOjE1LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPHNuaXA+Cgo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3B5dGhvbi1wc3ljb3BnMi9weXRob24tcHN5Y29wZzIubWsgYi9wYWNr
YWdlL3B5dGhvbi1wc3ljb3BnMi9weXRob24tcHN5Y29wZzIubWsKPiBpbmRleCAwMTQ5YjhkMTg1
Li4xYjMzYjc1MDVkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXBzeWNvcGcyL3B5dGhv
bi1wc3ljb3BnMi5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXBzeWNvcGcyL3B5dGhvbi1wc3lj
b3BnMi5tawo+IEBAIC0xMyw3ICsxMyw4IEBAIFBZVEhPTl9QU1lDT1BHMl9MSUNFTlNFX0ZJTEVT
ID0gTElDRU5TRQo+ICAgUFlUSE9OX1BTWUNPUEcyX0RFUEVOREVOQ0lFUyA9IHBvc3RncmVzcWwK
PiAgICMgRm9yY2UgcHN5Y29wZzIgdG8gdXNlIHRoZSBCdWlsZHJvb3QgcHJvdmlkZWQgcG9zdGdy
ZXNxbCB2ZXJzaW9uCj4gICAjIGluc3RlYWQgb2YgdGhlIG9uZSBmcm9tIHRoZSBob3N0IG1hY2hp
bmUKPiAtUFlUSE9OX1BTWUNPUEcyX0JVSUxEX09QVFMgPSBidWlsZF9leHQgLS1wZy1jb25maWc9
JChTVEFHSU5HX0RJUikvdXNyL2Jpbi9wZ19jb25maWcKPiAtUFlUSE9OX1BTWUNPUEcyX0lOU1RB
TExfVEFSR0VUX09QVFMgPSBidWlsZF9leHQgLS1wZy1jb25maWc9JChTVEFHSU5HX0RJUikvdXNy
L2Jpbi9wZ19jb25maWcKPiArUFlUSE9OX1BTWUNPUEcyX0JVSUxEX09QVFMgPSBcCj4gKwktQy0t
YnVpbGQtb3B0aW9uPWJ1aWxkX2V4dCBcCj4gKwktQy0tYnVpbGQtb3B0aW9uPS0tcGctY29uZmln
PSQoU1RBR0lOR19ESVIpL3Vzci9iaW4vcGdfY29uZmlnCj4gICAKPiAgICQoZXZhbCAkKHB5dGhv
bi1wYWNrYWdlKSkKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcHltdXBkZi9weXRob24t
cHltdXBkZi5tayBiL3BhY2thZ2UvcHl0aG9uLXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsKPiBp
bmRleCA2MzljZTBlMDBlLi44ODI1ODY4ZmI1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9u
LXB5bXVwZGYvcHl0aG9uLXB5bXVwZGYubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1weW11cGRm
L3B5dGhvbi1weW11cGRmLm1rCj4gQEAgLTEzLDYgKzEzLDcgQEAgUFlUSE9OX1BZTVVQREZfTElD
RU5TRSA9IEFHUEwtMy4wKwo+ICAgUFlUSE9OX1BZTVVQREZfTElDRU5TRV9GSUxFUyA9IENPUFlJ
TkcKPiAgICMgTm8gbGljZW5zZSBmaWxlIGluY2x1ZGVkIGluIHBpcCwgYnV0IGl0J3MgcHJlc2Vu
dCBvbiBnaXRodWIKPiAgIFBZVEhPTl9QWU1VUERGX0RFUEVOREVOQ0lFUyA9IGZyZWV0eXBlIGhv
c3Qtc3dpZyBtdXBkZiB6bGliCj4gK1BZVEhPTl9QWU1VUERGX0JVSUxEX09QVFMgPSAtLXNraXAt
ZGVwZW5kZW5jeS1jaGVjawoKSSB0ZXN0ZWQgcHl0aG9uLXB5bXVwZGYgKG9ubHkpIG9uIG15IHNp
ZGU6IGFwYXJ0IGZyb20gYSBydW50aW1lIGlzc3VlIGNvbXBsZXRlbHkgdW5yZWxhdGVkIHRvIHRo
aXMgc2VyaWVzICh0aGF0IEknbSBnb2luZyB0byBmaXggaW4gYSBuZXcgc2VyaWVzKSwgaXQgcnVu
cyBmaW5lLgpVc2luZyAnLS1za2lwLWRlcGVuZGVuY3ktY2hlY2snIG1ha2VzIHNlbnNlIHRvIG1l
LCBhcyB0aGUgcHlwcm9qZWN0LnRvbWwgYW55d2F5IGNvbnRhaW5zIG9ubHkgaG9zdCBkZXBlbmRl
bmNpZXMgdGhhdCB3ZSBhbHJlYWR5IGluc3RhbGxlZCBpbiBhbm90aGVyIHdheSAoZS5nLiBzd2ln
KS4KU28gaW4gb3RoZXIgd29yZHM6IHRoaXMgcGFydCBsb29rcyBnb29kIHRvIG1lIQoKVGVzdGVk
LWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CgoocGxlYXNl
IG5vdGUgdGhhdCBJIGhhdmVuJ3QgdGVzdGVkIGFueSBvZiB0aGUgb3RoZXIgcGFja2FnZXMgY2hh
bmdlZCBpbiB0aGlzIHBhdGNoKQoKPiAgIAo+ICAgUFlUSE9OX1BZTVVQREZfRU5WID0gQ0ZMQUdT
PSItSSQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlL211cGRmIC1JJChTVEFHSU5HX0RJUikvdXNy
L2luY2x1ZGUvZnJlZXR5cGUyIgo+ICAgCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXB5
em1xL3B5dGhvbi1weXptcS5tayBiL3BhY2thZ2UvcHl0aG9uLXB5em1xL3B5dGhvbi1weXptcS5t
awo+IGluZGV4IGYxNDQ0YjkxMjQuLjQ4YTI5OGIyMjEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9w
eXRob24tcHl6bXEvcHl0aG9uLXB5em1xLm1rCj4gKysrIGIvcGFja2FnZS9weXRob24tcHl6bXEv
cHl0aG9uLXB5em1xLm1rCj4gQEAgLTExLDcgKzExLDcgQEAgUFlUSE9OX1BZWk1RX0xJQ0VOU0Ug
PSBMR1BMLTMuMCssIEJTRC0zLUNsYXVzZSwgQXBhY2hlLTIuMAo+ICAgIyBBcGFjaGUgbGljZW5z
ZSBvbmx5IG9ubGluZTogaHR0cDovL3d3dy5hcGFjaGUub3JnL2xpY2Vuc2VzL0xJQ0VOU0UtMi4w
Cj4gICBQWVRIT05fUFlaTVFfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UuTEVTU0VSIExJQ0VOU0Uu
QlNECj4gICBQWVRIT05fUFlaTVFfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiAtUFlUSE9OX1BZ
Wk1RX0JVSUxEX09QVFMgPSAtLXptcT0kKFNUQUdJTkdfRElSKS91c3IKPiArUFlUSE9OX1BZWk1R
X0JVSUxEX09QVFMgPSAtQy0tYnVpbGQtb3B0aW9uPS0tem1xPSQoU1RBR0lOR19ESVIpL3Vzcgo+
ICAgUFlUSE9OX1BZWk1RX0RFUEVOREVOQ0lFUyA9IFwKPiAgIAlob3N0LXB5dGhvbi1jeXRob24g
XAo+ICAgCWhvc3QtcHl0aG9uLXBhY2thZ2luZyBcCj4gQEAgLTI3LDcgKzI3LDcgQEAgZW5kZWYK
PiAgIFBZVEhPTl9QWVpNUV9QT1NUX1BBVENIX0hPT0tTICs9IFBZVEhPTl9QWVpNUV9QQVRDSF9a
RVJPTVFfVkVSU0lPTgo+ICAgCj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX1pFUk9NUV9EUkFGVFMp
LHkpCj4gLVBZVEhPTl9QWVpNUV9CVUlMRF9PUFRTICs9IC0tZW5hYmxlLWRyYWZ0cwo+ICtQWVRI
T05fUFlaTVFfQlVJTERfT1BUUyArPSAtQy0tYnVpbGQtb3B0aW9uPS0tZW5hYmxlLWRyYWZ0cwo+
ICAgZW5kaWYKPiAgIAo+ICAgJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzLXNjbS1naXQtYXJjaGl2ZS9weXRob24tc2V0dXB0
b29scy1zY20tZ2l0LWFyY2hpdmUubWsgYi9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzLXNjbS1n
aXQtYXJjaGl2ZS9weXRob24tc2V0dXB0b29scy1zY20tZ2l0LWFyY2hpdmUubWsKPiBpbmRleCAx
NTMzNDM3ODhiLi45NWNmYTAyNWIzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXNldHVw
dG9vbHMtc2NtLWdpdC1hcmNoaXZlL3B5dGhvbi1zZXR1cHRvb2xzLXNjbS1naXQtYXJjaGl2ZS5t
awo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMtc2NtLWdpdC1hcmNoaXZlL3B5dGhv
bi1zZXR1cHRvb2xzLXNjbS1naXQtYXJjaGl2ZS5tawo+IEBAIC0xMSw1ICsxMSw2IEBAIFBZVEhP
Tl9TRVRVUFRPT0xTX1NDTV9HSVRfQVJDSElWRV9TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+ICAg
UFlUSE9OX1NFVFVQVE9PTFNfU0NNX0dJVF9BUkNISVZFX0xJQ0VOU0UgPSBNSVQKPiAgIFBZVEhP
Tl9TRVRVUFRPT0xTX1NDTV9HSVRfQVJDSElWRV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICAg
SE9TVF9QWVRIT05fU0VUVVBUT09MU19TQ01fR0lUX0FSQ0hJVkVfREVQRU5ERU5DSUVTID0gaG9z
dC1weXRob24tc2V0dXB0b29scy1zY20KPiArSE9TVF9QWVRIT05fU0VUVVBUT09MU19TQ01fR0lU
X0FSQ0hJVkVfQlVJTERfT1BUUyA9IC0tc2tpcC1kZXBlbmRlbmN5LWNoZWNrCj4gICAKPiAgICQo
ZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhv
bi11dmxvb3AvcHl0aG9uLXV2bG9vcC5tayBiL3BhY2thZ2UvcHl0aG9uLXV2bG9vcC9weXRob24t
dXZsb29wLm1rCj4gaW5kZXggMjg1ODg0YTJiYi4uYWFlYWIyODA1ZiAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3B5dGhvbi11dmxvb3AvcHl0aG9uLXV2bG9vcC5tawo+ICsrKyBiL3BhY2thZ2UvcHl0
aG9uLXV2bG9vcC9weXRob24tdXZsb29wLm1rCj4gQEAgLTEwLDggKzEwLDExIEBAIFBZVEhPTl9V
VkxPT1BfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy85Yy8x
Ni83MjhjYzVkZGUzNjhlCj4gICBQWVRIT05fVVZMT09QX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xz
Cj4gICBQWVRIT05fVVZMT09QX0xJQ0VOU0UgPSBBcGFjaGUtMi4wLCBNSVQKPiAgIFBZVEhPTl9V
VkxPT1BfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UtQVBBQ0hFIExJQ0VOU0UtTUlUCj4gLVBZVEhP
Tl9VVkxPT1BfQlVJTERfT1BUUyA9IGJ1aWxkX2V4dCAtLWlucGxhY2UgLS11c2Utc3lzdGVtLWxp
YnV2Cj4gLVBZVEhPTl9VVkxPT1BfSU5TVEFMTF9UQVJHRVRfT1BUUyA9IGJ1aWxkX2V4dCAtLWlu
cGxhY2UgLS11c2Utc3lzdGVtLWxpYnV2Cj4gICBQWVRIT05fVVZMT09QX0RFUEVOREVOQ0lFUyA9
IGxpYnV2Cj4gK1BZVEhPTl9VVkxPT1BfQlVJTERfT1BUUyA9IFwKPiArCS0tc2tpcC1kZXBlbmRl
bmN5LWNoZWNrIFwKPiArCS1DLS1idWlsZC1vcHRpb249YnVpbGRfZXh0IFwKPiArCS1DLS1idWls
ZC1vcHRpb249LS1pbnBsYWNlIFwKPiArCS1DLS1idWlsZC1vcHRpb249LS11c2Utc3lzdGVtLWxp
YnV2Cj4gICAKPiAgICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9weXRob24td3NhY2NlbC9weXRob24td3NhY2NlbC5tayBiL3BhY2thZ2UvcHl0aG9uLXdz
YWNjZWwvcHl0aG9uLXdzYWNjZWwubWsKPiBpbmRleCAxZjYzYWE1YzQwLi43Y2NiMDMzMjU2IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXdzYWNjZWwvcHl0aG9uLXdzYWNjZWwubWsKPiAr
KysgYi9wYWNrYWdlL3B5dGhvbi13c2FjY2VsL3B5dGhvbi13c2FjY2VsLm1rCj4gQEAgLTEwLDUg
KzEwLDYgQEAgUFlUSE9OX1dTQUNDRUxfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVk
Lm9yZy9wYWNrYWdlcy85NC8yOC80MWMwZTcxMWI1MzgKPiAgIFBZVEhPTl9XU0FDQ0VMX0xJQ0VO
U0UgPSBBcGFjaGUtMi4wCj4gICBQWVRIT05fV1NBQ0NFTF9MSUNFTlNFX0ZJTEVTID0gTElDRU5T
RQo+ICAgUFlUSE9OX1dTQUNDRUxfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiArUFlUSE9OX1dT
QUNDRUxfQlVJTERfT1BUUyA9IC0tc2tpcC1kZXBlbmRlbmN5LWNoZWNrCj4gICAKPiAgICQoZXZh
bCAkKHB5dGhvbi1wYWNrYWdlKSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
