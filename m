Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28D8C3DA50
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29E6140974;
	Fri, 12 Jul 2024 13:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJoloXaYC4y1; Fri, 12 Jul 2024 13:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734B541983
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 734B541983;
	Fri, 12 Jul 2024 13:47:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5261BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43C9784637
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0wa0Q3QMorl for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B12928418E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12928418E
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B12928418E
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:47:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so1961840f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 06:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720792040; x=1721396840;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=by6BeOND9pnyavTx9E0VWPPqBOd4SazSefcW0nUhKUU=;
 b=Ih81gyo2nQ9kTO+vHBIqyNeuvbmrcPQzfyvkmYMG9QgiiNV5G9GKV4qXzM0wwjTdsB
 4MUUH7VrZEnoRy1Vk9j2ayTMQgw8XXHJB569gsR+MvGHRnxQrc0sBK0SHYgEZprpYqYs
 PEqnC8tLc+8VteFsOEzggMh2h47y6QvvYfpxzmi5/EjSjJ6xf8np/CgpRHrXtrOPEXpM
 TO79iS7Til4yZtW+DzBHJ4dLZw3k8q0Nr016Nyp6haeUhmxNyCeHN6AbUEdeISZXg3RJ
 YHyLBiIZfUkQnHwHPHfGbJpRU66TyLVYBPKlMbLj2o7MbY+cRxtSghs1deOXpxZTP7+q
 bf7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjwyZfdoZ/z11FmPC7TA6cR58SZ9omM0D+4XHafmH/yvR9kN5MIaupdc5WdUt6noPgBJjPvPdHfvN2TEd5lABBHE/5/zniiw==
X-Gm-Message-State: AOJu0YwCZNZn8p7SpN1ayV6lX58c/l5iXdnuG6pZihRLqf3e2AspccJT
 pNzCVUxk9csP+vDRRZgoUVaVl0vaoIa80O2eXGmpWAeVRJk958kG9t6TQOMEbz8=
X-Google-Smtp-Source: AGHT+IFdjd5MiGrWUT3SSpGj4zm0Xzre2chQ59UuL+49xmWS4zaRGPUlv/f9vB2lqvIv8Ik6JUn7Fg==
X-Received: by 2002:adf:f84d:0:b0:360:9d2a:fe05 with SMTP id
 ffacd0b85a97d-36804ea059fmr1940174f8f.13.1720792040511; 
 Fri, 12 Jul 2024 06:47:20 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89113sm10188926f8f.56.2024.07.12.06.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 06:47:20 -0700 (PDT)
Message-ID: <0a900dea-cd2a-4f3c-a1d7-0e1123d39edf@smile.fr>
Date: Fri, 12 Jul 2024 15:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
References: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
 <20240524-loongarch64-v1-3-d24078d79cd5@flygoat.com>
Content-Language: fr
In-Reply-To: <20240524-loongarch64-v1-3-d24078d79cd5@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720792040; x=1721396840; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=by6BeOND9pnyavTx9E0VWPPqBOd4SazSefcW0nUhKUU=;
 b=nL8+uyPNEFpym2Oji+FzCRHGh2h8DHtZHdkKEjAz1mdnYcxW7tMd5VP0ua6UJ+sPjj
 jSWUhfxHUnMbpvXuCtPcmFqRqjqvnUDHF8XjLB1oneeQVYj8Iu3ykIWjfDmg/aDDg0Ia
 Y1CCM4RAjRPl5VsODu4dyrNCULfuv6riZOqHM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=nL8+uyPN
Subject: Re: [Buildroot] [PATCH RESEND 3/7] arch: Introduce LoongArch64
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmlheHVuLAoKTGUgMjQvMDUvMjAyNCDDoCAyMTozNiwgSmlheHVuIFlhbmcgYSDDqWNy
aXTCoDoKPiBJbnRyb2R1Y2UgTG9vbmdBcmNoNjQgYXQgYXJjaGl0ZWN0dXJlIGxldmVsLgo+IAo+
IENvbmZpZy5pbi5sb29uZ2FyY2ggaXMgcHJlcGFyZWQgZm9yIHBvc3NpYmxlIGxvb25nYXJjaDMy
Cj4gZW5hYmxlbWVudCBpbiBmdXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmlheHVuIFlhbmcg
PGppYXh1bi55YW5nQGZseWdvYXQuY29tPgo+IC0tLQo+ICBhcmNoL0NvbmZpZy5pbiAgICAgICAg
ICAgfCAgMTMgKysrKysKPiAgYXJjaC9Db25maWcuaW4ubG9vbmdhcmNoIHwgMTI3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTQwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4gYi9h
cmNoL0NvbmZpZy5pbgo+IGluZGV4IGNjOTAyNDQ2YmZkOS4uNTA0ODA4ZmNiY2U0IDEwMDY0NAo+
IC0tLSBhL2FyY2gvQ29uZmlnLmluCj4gKysrIGIvYXJjaC9Db25maWcuaW4KPiBAQCAtNzcsNiAr
NzcsMTUgQEAgY29uZmlnIEJSMl9pMzg2Cj4gIAkgIEludGVsIGkzODYgYXJjaGl0ZWN0dXJlIGNv
bXBhdGlibGUgbWljcm9wcm9jZXNzb3IKPiAgCSAgaHR0cDovL2VuLndpa2lwZWRpYS5vcmcvd2lr
aS9JMzg2Cj4gIAo+ICtjb25maWcgQlIyX2xvb25nYXJjaDY0Cj4gKwlib29sICJMb29uZ0FyY2g2
NCIKPiArCXNlbGVjdCBCUjJfVVNFX01NVQo+ICsJc2VsZWN0IEJSMl9BUkNIX0lTXzY0CgpzZWxl
Y3QgQlIyX0FSQ0hfSEFTX05PX1RPT0xDSEFJTl9CVUlMRFJPT1Qgc2luY2UgdGhlcmUgaXMgbm8g
aW50ZXJuYWwgdG9vbGNoYWluCnN1cHBvcnQgeWV0IGluIEJ1aWxkcm9vdC4KCj4gKwloZWxwCj4g
KwkgIExvb25nQXJjaDY0IGlzIGEgIGlzIGEgNjQtYml0IGFyY2hpdGVjdHVyZSBkZXZlbG9wZWQg
YnkgTG9vbmdzb24uCj4gKwkgIGh0dHA6Ly93d3cubG9vbmdzb24uY24vCj4gKwkgIGh0dHBzOi8v
ZW4ud2lraXBlZGlhLm9yZy93aWtpL0xvb25nc29uCgpUaGUgaGVscCB0ZXh0IGlzIHRvbyBsb25n
LCBwbGVhc2UgY2hlY2sgdGhlIGNvZGluZyBzdHlsZSB3aXRoIHV0aWxzL2NoZWNrLXBhY2thZ2Uu
Cgo+ICsKPiAgY29uZmlnIEJSMl9tNjhrCj4gIAlib29sICJtNjhrIgo+ICAJIyBNTVUgc3VwcG9y
dCBpcyBzZXQgYnkgdGhlIHN1YmFyY2hpdGVjdHVyZSBmaWxlLCBhcmNoL0NvbmZpZy5pbi5tNjhr
Cj4gQEAgLTM4MCw2ICszODksMTAgQEAgaWYgQlIyX2FybSB8fCBCUjJfYXJtZWIgfHwgQlIyX2Fh
cmNoNjQgfHwgQlIyX2FhcmNoNjRfYmUKPiAgc291cmNlICJhcmNoL0NvbmZpZy5pbi5hcm0iCj4g
IGVuZGlmCj4gIAo+ICtpZiBCUjJfbG9vbmdhcmNoNjQKPiArc291cmNlICJhcmNoL0NvbmZpZy5p
bi5sb29uZ2FyY2giCj4gK2VuZGlmCj4gKwo+ICBpZiBCUjJfbTY4awo+ICBzb3VyY2UgImFyY2gv
Q29uZmlnLmluLm02OGsiCj4gIGVuZGlmCj4gZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmluLmxv
b25nYXJjaCBiL2FyY2gvQ29uZmlnLmluLmxvb25nYXJjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mNWQ3NjdhOWQ4N2QKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvYXJjaC9Db25maWcuaW4ubG9vbmdhcmNoCj4gQEAgLTAsMCArMSwxMjcgQEAKPiArIyBMb29u
Z0FyY2ggQ1BVCj4gKwo+ICtjaG9pY2UKPiArCXByb21wdCAiVGFyZ2V0IEFyY2hpdGVjdHVyZSBW
YXJpYW50Igo+ICsJZGVmYXVsdCBCUjJfbG9vbmdhcmNoNjRfZ2VuZXJpYwo+ICsKPiArY29uZmln
IEJSMl9sb29uZ2FyY2g2NF9nZW5lcmljCj4gKwlib29sICJHZW5lcmljIExvb25nQXJjaCA2NC1i
aXQiCj4gKwlkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4gKwlzZWxlY3QgQlIyX0FSQ0hfTkVF
RFNfR0NDX0FUX0xFQVNUXzEyCj4gKwloZWxwCj4gKwkgIEdlbmVyaWMgTG9vbmdBcmNoIDY0LWJp
dCBwcm9jZXNzb3IuCj4gKwo+ICtjb25maWcgQlIyX2xvb25nYXJjaDY0X3YxXzAKPiArCWJvb2wg
Ikxvb25nQXJjaDY0IElTQSB2ZXJzaW9uIDEuMCIKPiArCWRlcGVuZHMgb24gQlIyX0FSQ0hfSVNf
NjQKPiArCXNlbGVjdCBCUjJfQVJDSF9ORUVEU19HQ0NfQVRfTEVBU1RfMTMKPiArCWhlbHAKPiAr
CSAgTG9vbmdBcmNoNjQgSVNBIHZlcnNpb24gMS4wIHByb2Nlc3Nvci4KPiArCj4gK2NvbmZpZyBC
UjJfbG9vbmdhcmNoNjRfdjFfMQo+ICsJYm9vbCAiTG9vbmdBcmNoNjQgSVNBIHZlcnNpb24gMS4x
Igo+ICsJZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NAo+ICsJc2VsZWN0IEJSMl9BUkNIX05FRURT
X0dDQ19BVF9MRUFTVF8xMwo+ICsJaGVscAo+ICsJICBMb29uZ0FyY2g2NCBJU0EgdmVyc2lvbiAx
LjEgcHJvY2Vzc29yLgoKQWRkIGEgbmV3IGxpbmUgaGVyZSBmb3IgS2NvbmZpZyBoZWxwIHRleHQg
cmVuZGVyaW5nLgoKPiArZW5kY2hvaWNlCj4gKwo+ICtjaG9pY2UKPiArCXByb21wdCAiRlBVIFR5
cGUiCj4gKwlkZWZhdWx0IEJSMl9MT09OR0FSQ0hfRlBVXzY0Cj4gKwo+ICtjb25maWcgQlIyX0xP
T05HQVJDSF9GUFVfNjQKPiArCWJvb2wgIjY0Igo+ICsJaGVscAo+ICsJICBBbGxvdyB0aGUgdXNl
IG9mIGhhcmR3YXJlIGZsb2F0aW5nLXBvaW50IGluc3RydWN0aW9ucyBmb3IgMzItYml0Cj4gKwkg
IGFuZCA2NC1iaXQgb3BlcmF0aW9ucy4KPiArCj4gK2NvbmZpZyBCUjJfTE9PTkdBUkNIX0ZQVV8z
Mgo+ICsJYm9vbCAiMzIiCj4gKwloZWxwCj4gKwkgIEFsbG93IHRoZSB1c2Ugb2YgaGFyZHdhcmUg
ZmxvYXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zIGZvciAzMi1iaXQKPiArCSAgb3BlcmF0aW9ucyBv
bmx5Lgo+ICsKPiArY29uZmlnIEJSMl9MT09OR0FSQ0hfRlBVX05PTkUKPiArCWJvb2wgIm5vbmUi
Cj4gKwloZWxwCj4gKwkgIFByZXZlbnQgdGhlIHVzZSBvZiBoYXJkd2FyZSBmbG9hdGluZy1wb2lu
dCBpbnN0cnVjdGlvbnMuCgpBZGQgYSBuZXcgbGluZSBoZXJlIGZvciBLY29uZmlnIGhlbHAgdGV4
dCByZW5kZXJpbmcuCgo+ICtlbmRjaG9pY2UKPiArCj4gK2Nob2ljZQo+ICsJcHJvbXB0ICJTSU1E
IFR5cGUiCj4gKwlkZWZhdWx0IEJSMl9MT09OR0FSQ0hfU0lNRF9OT05FCj4gKwo+ICtjb25maWcg
QlIyX0xPT05HQVJDSF9TSU1EX05PTkUKPiArCWJvb2wgIm5vbmUiCj4gKwloZWxwCj4gKwkgIFBy
ZXZlbnQgdGhlIHVzZSBvZiBoYXJkd2FyZSBTSU1EIGluc3RydWN0aW9ucy4KPiArCj4gK2NvbmZp
ZyBCUjJfTE9PTkdBUkNIX1NJTURfTFNYCj4gKwlib29sICJMU1giCj4gKwloZWxwCj4gKwkgIEVu
YWJsZSBnZW5lcmF0aW5nIGluc3RydWN0aW9ucyBmcm9tIHRoZSAxMjgtYml0IExvb25nQXJjaCBT
SU1ECj4gKwkgIEV4dGVuc2lvbiAoTFNYKS4KPiArCj4gK2NvbmZpZyBCUjJfTE9PTkdBUkNIX1NJ
TURfTEFTWAo+ICsJYm9vbCAiTEFTWCIKPiArCWhlbHAKPiArCSAgRW5hYmxlIGdlbmVyYXRpbmcg
aW5zdHJ1Y3Rpb25zIGZyb20gdGhlIDI1Ni1iaXQgTG9vbmdBcmNoIEFkdmFuY2VkCj4gKwkgIFNJ
TUQgRXh0ZW5zaW9uIChMQVNYKSBhbmQgdGhlIDEyOC1iaXQgTG9vbmdBcmNoIFNJTUQgRXh0ZW5z
aW9uIChMU1gpLgoKQWRkIGEgbmV3IGxpbmUgaGVyZSBmb3IgS2NvbmZpZyBoZWxwIHRleHQgcmVu
ZGVyaW5nLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICtlbmRjaG9pY2UKPiArCj4gK2Nob2lj
ZQo+ICsJcHJvbXB0ICJUYXJnZXQgQUJJIgo+ICsJZGVmYXVsdCBCUjJfTE9PTkdBUkNIX0FCSV9M
UDY0RCBpZiBCUjJfQVJDSF9JU182NCAmJiBCUjJfTE9PTkdBUkNIX0ZQVV82NAo+ICsJZGVmYXVs
dCBCUjJfTE9PTkdBUkNIX0FCSV9MUDY0RiBpZiBCUjJfQVJDSF9JU182NCAmJiBCUjJfTE9PTkdB
UkNIX0ZQVV8zMgo+ICsJZGVmYXVsdCBCUjJfTE9PTkdBUkNIX0FCSV9MUDY0UyBpZiBCUjJfQVJD
SF9JU182NCAmJiBCUjJfTE9PTkdBUkNIX1NJTURfTk9ORQo+ICsKPiArY29uZmlnIEJSMl9MT09O
R0FSQ0hfQUJJX0xQNjRECj4gKwlib29sICJscDY0ZCIKPiArCWRlcGVuZHMgb24gQlIyX0FSQ0hf
SVNfNjQKPiArCWRlcGVuZHMgb24gQlIyX0xPT05HQVJDSF9GUFVfNjQKPiArCj4gK2NvbmZpZyBC
UjJfTE9PTkdBUkNIX0FCSV9MUDY0Rgo+ICsJYm9vbCAibHA2NGYiCj4gKwlkZXBlbmRzIG9uIEJS
Ml9BUkNIX0lTXzY0Cj4gKwlkZXBlbmRzIG9uIEJSMl9MT09OR0FSQ0hfRlBVXzY0IHx8IEJSMl9M
T09OR0FSQ0hfRlBVXzMyCj4gKwo+ICtjb25maWcgQlIyX0xPT05HQVJDSF9BQklfTFA2NFMKPiAr
CWJvb2wgImxwNjRkIgo+ICsJZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NAo+ICtlbmRjaG9pY2UK
PiArCj4gK2NvbmZpZyBCUjJfQVJDSAo+ICsJZGVmYXVsdCAibG9vbmdhcmNoNjQiIGlmIEJSMl9B
UkNIX0lTXzY0Cj4gKwo+ICtjb25maWcgQlIyX05PUk1BTElaRURfQVJDSAo+ICsJZGVmYXVsdCAi
bG9vbmdhcmNoIgo+ICsKPiArY29uZmlnIEJSMl9FTkRJQU4KPiArCWRlZmF1bHQgIkxJVFRMRSIK
PiArCj4gK2NvbmZpZyBCUjJfR0NDX1RBUkdFVF9BUkNICj4gKwlkZWZhdWx0ICJsb29uZ2FyY2g2
NCIgaWYgQlIyX2xvb25nYXJjaDY0X2dlbmVyaWMKPiArCWRlZmF1bHQgImxhNjR2MS4wIiBpZiBC
UjJfbG9vbmdhcmNoNjRfdjFfMAo+ICsJZGVmYXVsdCAibGE2NHYxLjEiIGlmIEJSMl9sb29uZ2Fy
Y2g2NF92MV8xCj4gKwo+ICtjb25maWcgQlIyX0dDQ19UQVJHRVRfRlBVCj4gKwlkZWZhdWx0ICI2
NCIgaWYgQlIyX0xPT05HQVJDSF9GUFVfNjQKPiArCWRlZmF1bHQgIjMyIiBpZiBCUjJfTE9PTkdB
UkNIX0ZQVV8zMgo+ICsJZGVmYXVsdCAibm9uZSIgaWYgQlIyX0xPT05HQVJDSF9GUFVfTk9ORQo+
ICsKPiArY29uZmlnIEJSMl9HQ0NfVEFSR0VUX1NJTUQKPiArCWRlZmF1bHQgImxhc3giIGlmIEJS
Ml9MT09OR0FSQ0hfU0lNRF9MQVNYCj4gKwlkZWZhdWx0ICJsc3giIGlmIEJSMl9MT09OR0FSQ0hf
U0lNRF9MU1gKPiArCWRlZmF1bHQgIm5vbmUiIGlmIEJSMl9MT09OR0FSQ0hfRlBVX05PTkUKPiAr
Cj4gK2NvbmZpZyBCUjJfR0NDX1RBUkdFVF9BQkkKPiArCWRlZmF1bHQgImxwNjRkIiBpZiBCUjJf
TE9PTkdBUkNIX0FCSV9MUDY0RAo+ICsJZGVmYXVsdCAibHA2NGYiIGlmIEJSMl9MT09OR0FSQ0hf
QUJJX0xQNjRGCj4gKwlkZWZhdWx0ICJscDY0cyIgaWYgQlIyX0xPT05HQVJDSF9BQklfTFA2NFMK
PiArCj4gK2NvbmZpZyBCUjJfUkVBREVMRl9BUkNIX05BTUUKPiArCWRlZmF1bHQgIkxvb25nQXJj
aCIKPiArCj4gKyMgdmltOiBmdD1rY29uZmlnCj4gKyMgLSotIG1vZGU6a2NvbmZpZzsgLSotCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
