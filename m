Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02776EB107E
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 21:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CFD660DCA;
	Tue, 10 Mar 2026 21:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7jEi9PFgR_f; Tue, 10 Mar 2026 21:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C429C60E30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773179587;
	bh=iO90NlUYvxdT9vZ9X+A4bxMaX00lct9WCM7jmGMBz74=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hPPbfe0jvN8pXHe2+HwAbjks06ONbbTF5gmM9fF4yB+iWzkmbi3zKJh4UU2AQrQ06
	 IH1T3qC65zLKXp4x9tu5mc0I7jtqpXbe08r8O2wJ9NOdyaZsYMzhMW2HgfeutFZbmp
	 nz8miBvhvPQ2fMb1ECHyTjTwjoCURAtWIWmGr16p2D9rQolXBH7HVHFvgdCvg4o7Bq
	 ABGCPFAM+9CEpID64BgwOfAhPWlWYYlqdo7mPzbgPzY5ehMnyOErZnfBATkmUMDmFR
	 Q+fSiPhi1oTcjxk8iBxETG8OpLS8D+Iln5LXLSOMyOK5ABOHVRXMZ0C+AIjGwdExEL
	 ypvvM5Oh/Rixg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C429C60E30;
	Tue, 10 Mar 2026 21:53:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0066433A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 21:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA1C6408AF
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 21:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fe6eQqIq-j8E for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 21:53:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E346B408A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E346B408A8
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E346B408A8
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 21:53:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439cd6b09f8so4947654f8f.3
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 14:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773179584; x=1773784384;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qkpwd74yVWBi/y/dl+Oy8yiiSHWGZ+HuvIT3VKtgZH0=;
 b=w5xa7JqdRNl6HwHobbZlzNF3DNT5HdzRfKYYR3GPNBBLpSIUCFHc54P+jnA0pT9/VA
 An0LnngmLclNND7lZzIlHg+q8vx0R4NxU+atGt5X0GyAR+DHC93vOBWSL2ooLe7v+Hb0
 cEZ+V88wC4OfcLNuFBoXwGb0ml2ObJH+7VlTggFlknVYXj3lEFb56T6Gq6daJIsGK2g8
 Dr2bMFplHF5Nk1mbAKx8LlniqV4eLpgTSZUrvVpfNExNA7zhfihzkfv2P1+Wrw2S7KCi
 NfX4JsrcelXqE9f9gld6HUIdMmNo8mS5VzBxQNY/eg/BSGpu43uZfBN25JC0IzWHgKev
 nz5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt7LGv3bmysbIGgzue/SuuJzUDOw6r9j/kbvUZWiLkuF65lZNhbNb+UVpsVNhbwXkm5ai+jXT5qEw=@buildroot.org
X-Gm-Message-State: AOJu0YyyXqRNa/arX2dle0LCOTIYj5sHQA8HbCN53seFIFFxxueLLJ1/
 Y41ZhqediNTOMESs80yyBIVdwQIB5LZZsM6TV0A3kDFqAgCitkaXQjMFCdpr1316y5g=
X-Gm-Gg: ATEYQzyjhEMsVwObAkQOYZtD1+pqh0H1Exzw4k+2AT2ojQWAlK0mOrOA//LN8lVLNen
 qD2GnxCEL+Gq6TbZUQhKOSPBC74TPRoDOUZkxIJhv5L/b2FHSTENUhVYWmDljukkCXa+RDVZBrZ
 0HRk0RAClm3wXvxXw+ZCjNE+X7Y606A6KUZazVImSYnbdPEXVm3uq8pPu5lKXdT8F9Nqpw3nMAf
 gb/xQqDYkt00VnndihDZr9vqQhjnapL1Lh0IcqQ8WE39L2dgvp/l49nMqcaGwDC9ARc6PXLntW1
 YqC7lf3VmKIl6yXHTx7Dw6qoPLvPgbw9KquleXs2bm2UDeUushZDgoRMFyph70xa/5T1WOxRB2+
 JaU6Bk6G8nFh/n3KL30N6iygLkBrPZvgndhZkC45mfmxM2/wZkiOb0cvAQUVfRmrcNvGUeIoiI6
 WxM6c7iTxtT+g/ExhxEVopnlU9O4pzyJTEhhUiZe6cuYKsVjFrGp5pqyp7ioYl604+WWjfKnMki
 39C2wu7zBzhqareFucOuqdAqUAqFaaPlMjf/jyXLV4sIo1R8SyTuAom52Yu9U/pkA==
X-Received: by 2002:a05:6000:2486:b0:439:c9e0:83a5 with SMTP id
 ffacd0b85a97d-439f8440ee7mr700404f8f.54.1773179583675; 
 Tue, 10 Mar 2026 14:53:03 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81a0239sm1186736f8f.10.2026.03.10.14.53.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 14:53:03 -0700 (PDT)
Message-ID: <37fab77c-8ff6-4bdf-8546-ea194ee478ef@smile.fr>
Date: Tue, 10 Mar 2026 22:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
 <20260225105537.1420002-2-alex.bennee@linaro.org>
Content-Language: fr
In-Reply-To: <20260225105537.1420002-2-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773179584; x=1773784384; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qkpwd74yVWBi/y/dl+Oy8yiiSHWGZ+HuvIT3VKtgZH0=;
 b=M3/g1qSx72uNHVx8SHXbwhiz8DfixdvFMB0y3zM6l31bc2KfsYZVt8hEn18XoZbPf2
 kWPdPzQHpSj4SlA6TVV2xshIU2xBd0F1JriKFrcVuhUVn6E51ZmomOyIFinxn5C0RDPc
 kH+HeBe1Fvgq/RfsjK+GJ0+W0NMLxgssI8YJA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=M3/g1qSx
Subject: Re: [Buildroot] [PATCH v6 1/6] toolchain/external: allow installing
 of libc utils
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

SGVsbG8gQWxleCwgQWxsLAoKTGUgMjUvMDIvMjAyNiDDoCAxMTo1NSwgQWxleCBCZW5uw6llIGEg
w6ljcml0wqA6Cj4gRm9yIGJ1aWxkcm9vdCdzIG93biB0b29scyB3ZSBoYXZlIEJSMl9QQUNLQUdF
X0dMSUJDX1VUSUxTIChhbmQgc2ltaWxhcgo+IGZvciB1bGliYykuIEFzIHdlIG5lZWQgdGhlIHRv
b2xzIGZvciBzb21ldGhpbmdzIHdlIHNob3VsZCBhbHNvIHN1cHBvcnQKPiB0aGlzIGZvciBleHRl
cm5hbCB0b29sY2hhaW5zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5i
ZW5uZWVAbGluYXJvLm9yZz4KPiAtLS0KPiAgdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9D
b25maWcuaW4gICAgICAgIHwgIDcgKysrKysrCj4gIC4uLi9wa2ctdG9vbGNoYWluLWV4dGVybmFs
Lm1rICAgICAgICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBj
aGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xjaGFpbi90b29s
Y2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmluIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9D
b25maWcuaW4KPiBpbmRleCA4MzEzODdiYzRlLi5lNzlkYWZhMzY1IDEwMDY0NAo+IC0tLSBhL3Rv
b2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvQ29uZmlnLmluCj4gKysrIGIvdG9vbGNoYWluL3Rv
b2xjaGFpbi1leHRlcm5hbC9Db25maWcuaW4KPiBAQCAtMTI1LDQgKzEyNSwxMSBAQCBjb25maWcg
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9HREJfU0VSVkVSX0NPUFkKPiAgCSAgQ29weSB0aGUgZ2Ri
c2VydmVyIHByb3ZpZGVkIGJ5IHRoZSBleHRlcm5hbCB0b29sY2hhaW4gdG8gdGhlCj4gIAkgIHRh
cmdldC4KPiAgCj4gK2NvbmZpZyBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJQkNfVVRJTFNfQ09Q
WQo+ICsJYm9vbCAiSW5zdGFsbCBsaWJjIHV0aWxpdGllcyIKPiArCWRlcGVuZHMgb24gQlIyX1RP
T0xDSEFJTl9FWFRFUk5BTAoKZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0dMSUJD
Cgo+ICsJaGVscAo+ICsJICBFbmFibGluZyB0aGlzIG9wdGlvbiB3aWxsIGNvbXBpbGUgYW5kIGlu
c3RhbGwgdGhlIGdldGNvbmYsCgpTaW5jZSBpdHMgYW4gZXh0ZXJuYWwgdG9vbGNoYWluLCBub3Ro
aW5nIGlzIGFjdHVhbGx5IGJ1aWx0LCBqdXN0IGltcG9ydGVkIGludG8KQnVpbGRyb290LgoKPiAr
CSAgbGRkIGFuZCBsb2NhbGUgZ2liYyB1dGlsaXRpZXMgZm9yIHRoZSB0YXJnZXQuICAgICAgICAg
ICAgICAgICAgICAgICAgIF5eXl4KICAgICAgICAgICAgICAgICAgICAgICAgIGdsaWJjCgpTaW5j
ZSBpdCdzIGJhc2VkIG9uIEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxTLCB0aGlzIG9wdGlvbiBzaG91
bGQgb25seSBhcHBlYXIgd2hlbgphIGdsaWJjIGJhc2VkIGV4dGVybmFsIHRvb2xjaGFpbiBpcyBz
ZWxlY3RlZC4KCklmIHlvdSB3YW50IHRvIG1ha2UgdGhpcyBvcHRpb24gYXZhaWxhYmxlIGZvciBt
dXNsIGFuZCB1Q2xpYmMtbmcgdG9vbGNoYWluIHdlCmhhdmUgdG8gdGFrZSBjYXJlIHRoYXQ6Cgog
IC0gZ2V0Y29uZiBpcyBub3QgYXZhaWJsZSB3aXRoIG11c2wgdG9vbGNoYWlucwogIC0gbG9jYWxl
cyBpcyBvcHRpb25hbCB3aXRoIHVDbGliYy1uZyB0b29sY2hhaW5zCiAgLSBsZGQgc2NyaXB0IGlz
IHNwZWNpZmljIHRvIGdsaWJjCiAgLSB1Q2xpYmMtbmcgc29tZXRpbWUgInByZXRlbmQiIHRvIGJl
IGdsaWJjIGxvb2thbGlrZQoKSSdtIGZpbmUgaWYgd2Ugb25seSBkbyB0aGF0IGZvciBnbGliYyB0
b29sY2hhaW4gZm9yIG5vdyAoaW4gb3JkZXIgdG8gbW92ZQpmb3J3YXJkIG9uIEtWTSB0b3BpYykK
CldlIGFscmVhZHkgaGF2ZSBhbiBvcHRpb24gQlIyX1RPT0xDSEFJTl9HTElCQ19HQ09OVl9MSUJT
X0NPUFkgdGhhdCBpcyBnbGliYwpzcGVjaWZpYy4KCj4gKwo+ICBlbmRpZiAjIEJSMl9UT09MQ0hB
SU5fRVhURVJOQUwKPiBkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9w
a2ctdG9vbGNoYWluLWV4dGVybmFsLm1rIGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRlcm5hbC9w
a2ctdG9vbGNoYWluLWV4dGVybmFsLm1rCj4gaW5kZXggMjcwY2Y4MTRlZC4uYjg0YWJiNjEwNiAx
MDA2NDQKPiAtLS0gYS90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29sY2hhaW4t
ZXh0ZXJuYWwubWsKPiArKysgYi90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3BrZy10b29s
Y2hhaW4tZXh0ZXJuYWwubWsKPiBAQCAtNDQ2LDYgKzQ0NiwyOSBAQCBkZWZpbmUgVE9PTENIQUlO
X0VYVEVSTkFMX0lOU1RBTExfVEFSR0VUX0dEQlNFUlZFUgo+ICBlbmRlZgo+ICBlbmRpZgo+ICAK
PiAraWZlcSAoJChCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJQkNfVVRJTFNfQ09QWSkseSkKPiAr
ZGVmaW5lIFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX1RBUkdFVF9MSUJDX1VUSUxTCj4gKwkk
KFEpJChjYWxsIE1FU1NBR0UsIkNvcHlpbmcgbGliYyB1dGlscyIpCj4gKwkkKFEpQVJDSF9TWVNS
T09UX0RJUj0iJChjYWxsIHRvb2xjaGFpbl9maW5kX3N5c3Jvb3QsJChUT09MQ0hBSU5fRVhURVJO
QUxfQ0MpICQoVE9PTENIQUlOX0VYVEVSTkFMX0NGTEFHUykpIiA7IFwKPiArCXV0aWxzX2ZvdW5k
PTAgOyBcCj4gKwlmb3IgZCBpbiAkJHtBUkNIX1NZU1JPT1RfRElSfSBcCj4gKwkgICAgICAgICAk
JHtBUkNIX1NZU1JPT1RfRElSfS91c3IgXAo+ICsJCSAkKFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNU
QUxMX0RJUik7IGRvIFwKPiArCQlpZiB0ZXN0IC1mICQke2R9L2Jpbi9nZXRjb25mIDsgdGhlbiBc
Cj4gKwkJCWZvciBmIGluIGdldGNvbmYgbGRkIGxvY2FsZTsgZG8gXAoKSXQgcHJvYmFibHkgYmV0
dGVyIHRvIGRvIHRoZSBmb3IgbG9vcCBmb3IgZWFjaCB0b29scyBhbmQgdGVzdCBvbmUgYnkgb25l
IGlmIHRoZXkKYXJlIGF2YWlsYWJsZSBvdGhlcndpc2UgZXJyb3Igb3V0LiBDdXN0b20gdG9vbGNo
YWlucyBjb250ZW50IG1heSBiZSBzdXJwcmlzaW5nLgoKQlIyX1BBQ0tBR0VfR0xJQkNfVVRJTFMg
YWxzbyBoYW5kbGUgJ2xkY29uZmlnJyBjb3B5IHRvIHNiaW4uIChJZiB3ZSB3YW50IHRvIGhhdmUK
c29tZXRoaW5nIHNpbWlsYXIpLgoKPiArCQkJCWluc3RhbGwgLW0gMDc1NSAtRCAkJHtkfS9iaW4v
JCR7Zn0gJChUQVJHRVRfRElSKS91c3IvYmluIDsgXAo+ICsJCQlkb25lIDsgXAo+ICsJCQl1dGls
c19mb3VuZD0xIDsgXAo+ICsJCQlicmVhayA7IFwKPiArCQlmaSA7IFwKPiArCWRvbmUgOyBcCj4g
KwlpZiBbICQke3V0aWxzX2ZvdW5kfSAtZXEgMCBdIDsgdGhlbiBcCj4gKwkJZWNobyAiQ291bGQg
bm90IGZpbmQgbGliYyB1dGlscyBpbiBleHRlcm5hbCB0b29sY2hhaW4iIDsgXAoKSXQgd291bGQg
YmUgYmV0dGVyIHRvIGVycm9yIG91dCB3aXRoIHRoZSBtaXNzaW5nIHRvb2wgaW5zdGVhZC4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgoKPiArCQlleGl0IDEgOyBcCj4gKwlmaQo+ICtlbmRlZgo+ICtl
bmRpZgo+ICsKPiAgZGVmaW5lIFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNUQUxMX1NZU1JPT1RfTElC
Uwo+ICAJJChRKVNZU1JPT1RfRElSPSIkKGNhbGwgdG9vbGNoYWluX2ZpbmRfc3lzcm9vdCwkKFRP
T0xDSEFJTl9FWFRFUk5BTF9DQykpIiA7IFwKPiAgCUFSQ0hfU1lTUk9PVF9ESVI9IiQoY2FsbCB0
b29sY2hhaW5fZmluZF9zeXNyb290LCQoVE9PTENIQUlOX0VYVEVSTkFMX0NDKSAkKFRPT0xDSEFJ
Tl9FWFRFUk5BTF9DRkxBR1MpKSIgOyBcCj4gQEAgLTYyNyw2ICs2NTAsNyBAQCBlbmRlZgo+ICBk
ZWZpbmUgJCgyKV9JTlNUQUxMX1RBUkdFVF9DTURTCj4gIAkkJChUT09MQ0hBSU5fRVhURVJOQUxf
Q1JFQVRFX1RBUkdFVF9MSUJfU1lNTElOSykKPiAgCSQkKFRPT0xDSEFJTl9FWFRFUk5BTF9JTlNU
QUxMX1RBUkdFVF9MSUJTKQo+ICsJJCQoVE9PTENIQUlOX0VYVEVSTkFMX0lOU1RBTExfVEFSR0VU
X0xJQkNfVVRJTFMpCj4gIAkkJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9UQVJHRVRfR0RC
U0VSVkVSKQo+ICAJJCQoVE9PTENIQUlOX0VYVEVSTkFMX0ZJWFVQX1VDTElCQ05HX0xEU08pCj4g
IAkkJChUT09MQ0hBSU5fRVhURVJOQUxfSU5TVEFMTF9UQVJHRVRfTEREKQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
