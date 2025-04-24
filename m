Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CE7C369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 12:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6654280DF0;
	Thu, 24 Apr 2025 12:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLr-vbFV1I1s; Thu, 24 Apr 2025 12:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9435580D43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9435580D43;
	Thu, 24 Apr 2025 12:02:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59552306
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 12:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AB8280B2A
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 12:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxwRZZJ92vDQ for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 12:02:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8C70C80CFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C70C80CFB
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C70C80CFB
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 12:02:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac339f58631so9613466b.3
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 05:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745496124; x=1746100924;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZKC1t8DEhxc2xGRQhTJrKLPp+TcKTljd7OWG0TBAo9U=;
 b=j+jsk/Z53aM9RmRJx0/EUpRrNg+jeAzQ5rE+rrzKaGrQUI3rJViqVFGeqAOGu7nzHH
 eVbx5GCKvOA0XjkWv/toU1MXIddjCseneVB9JyMPLJqfUOX1GR1ErAPX+CIeRwM/0O1q
 zP0Bp1cC2CahQWGxw+2q/IEtbI65OuEWc3iXVKpNrnMvzooeC63hWs3I/PD0QLg+1Qpi
 SkmUL70pHXrPqYBJz71BPpUF4BykbPUHeVdNH1Kl369yJAqUcGN/Q6ZiiJAadmg9+QYt
 fYDPeViSE+6ErjkCCkOU1ryIv/f1pPzorAbrMyhqooJuz09N4AjFSEzOnl2fanjMLwYO
 CLbg==
X-Gm-Message-State: AOJu0YwLp05v0Q9DWdndj7RuqKSkIRFp4ymgrrt6c/NWJTBcKA/ZaMwX
 6h3B7p2Imflf1PGXCOazQDhbHDzeFjH/oIc1M6nUddtQmqXaZy7r
X-Gm-Gg: ASbGncsz/WHaD4YitiR/Y0CWAF2Y3nARSHFuA+m9nqoxylp4qjQwEcQ5U42++UFMWGV
 lYZmo86ER9UXFID5sQDc3ODlwt3oZGyvXCdx5hgD5LjrYEzK27Z7j/+tAlPn7v064+GLnSRERkr
 +BXdGGRN9PK23HbmsmpI0J6ilDGxvBXwDmDGW1H1uMq+Hcwu3KKHxTuDkJgK+2XTHSQl6wDQHhe
 pNps4pnfvWWIdlfclZqJG2GD2CPalD2JBSwvLJEo0JMeB/7avxsdCSvdOiQ96RRej38uLH4FolM
 X5HWGIo+DxLL+VSbddMD8p7HXCJh
X-Google-Smtp-Source: AGHT+IGvBWfVdDPnfjbz8o2RdxaeKyto4lylwb/WeRzq6Vqbxgt2H7lQHRjn1Hd8GbwOz6gKQ2oM2A==
X-Received: by 2002:a17:907:d1b:b0:acb:1d24:a9e0 with SMTP id
 a640c23a62f3a-ace573b7437mr76767666b.11.1745496123131; 
 Thu, 24 Apr 2025 05:02:03 -0700 (PDT)
Received: from skbuf ([188.25.50.178]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace59c25b4bsm97557066b.140.2025.04.24.05.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 05:02:01 -0700 (PDT)
Date: Thu, 24 Apr 2025 15:01:59 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>,
 Vincent Jardin <vjardin@free.fr>, Julien Olivain <ju.o@free.fr>,
 Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20250424120159.2vjiyfzlrs5zajeo@skbuf>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-17-olteanv@gmail.com>
 <20250422233649.5574293c@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422233649.5574293c@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745496124; x=1746100924; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZKC1t8DEhxc2xGRQhTJrKLPp+TcKTljd7OWG0TBAo9U=;
 b=hyFQiXDcxl3lLbts1Qn/o23GmhXSR/Oh3CGk8C5JUWZjjd3m/kC5KaNCcpaK7y28GV
 Hl7qOMyyCD9KMzTxmm4jvlZ477ICoI30OpoS79HUnrpYyinp7kCn60SF+WK9ByjQOR9E
 KpKuCDDHXfioCqy4o6o94UsfRZmWdHJurvFJSYLs63RNDBSsOSB0OkoDSTKot01Du6UW
 IMua7/0Q7lmzaqlVZcWjVVblquL8Bn4kcC6+KnZL2eJz9qnLNM2gnPFEF2qGKrwbRX0H
 lrMpe6hOdyN6LsaB3W+Io/zY/d1T0dWi241C2HenKqewmPc2XMtnTvOvnDwn0r7ZwTzI
 usrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hyFQiXDc
Subject: Re: [Buildroot] [PATCH v2 16/18] package/qoriq-restool: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gVHVlLCBBcHIgMjIsIDIwMjUgYXQgMTE6MzY6NDlQTSArMDIwMCwgVGhv
bWFzIFBldGF6em9uaSB3cm90ZToKPiBIZWxsbyBWbGFkLAo+IAo+IE9uIEZyaSwgMjggTWFyIDIw
MjUgMjA6MDQ6MjQgKzAyMDAKPiBWbGFkaW1pciBPbHRlYW4gPG9sdGVhbnZAZ21haWwuY29tPiB3
cm90ZToKPiAKPiA+IEludHJvZHVjZSBhIHBhY2thZ2UgZm9yIHRoZSByZXN0b29sIHByb2dyYW0s
IHdoaWNoIHBlcm1pdHMgdGhlIHVzZXIgdG8KPiA+IG1vZGlmeSB0aGUgbmV0d29yayBjb25maWd1
cmF0aW9uIG9mIHRoZSBEUEFBMiBzdWJzeXN0ZW0gYW5kIGNyZWF0ZSBvbmUKPiA+IHRoYXQgaXMg
YWRlcXVhdGUgdG8gdGhlaXIgdXNlIGNhc2UuCj4gPiAKPiA+IFdlIGludGVncmF0ZSB0aGUgbWFz
dGVyIGJyYW5jaCwgd2hpY2ggaXMgdGhlIGxmLTYuMTIuMy0xLjAuMCB0YWcgcGx1cwo+ID4gY29t
bWl0IDE0YTkwNThjNzcyYiAoIm1hbnBhZ2U6IGl0IHNob3VsZCBiZSBvcHRpb25hbCIpLiBJdCB3
YXMgcG9pbnRlZAo+ID4gb3V0IG9uIHByZXZpb3VzIHBhdGNoIHN1Ym1pc3Npb25zIHRoYXQgdGhl
ICJtYWtlIGluc3RhbGwiIHRhcmdldCBhbHNvCj4gPiBjb252ZXJ0cyBtYW4gcGFnZXMgZnJvbSBN
YXJrZG93biB0byBncm9mZiB1c2luZyBwYW5kb2MsIGFuZCBhcGFydCBmcm9tCj4gPiB0aGUgZmFj
dCB0aGF0IEJ1aWxkcm9vdCBkb2Vzbid0IHdhbnQgbWFucGFnZXMsIHBhbmRvYyBpcyBhbHNvIHRv
byBoZWF2eQo+ID4gdG8gZHJhZyBpbnRvIHRoZSBidWlsZCBzeXN0ZW0uIFNvIHRoYXQgZmVlZGJh
Y2sgd2FzIGNvbnNpZGVyZWQgdmFsaWQgYW5kCj4gPiB0aGUgcGF0Y2ggaXMgaW5jbHVkZWQgaGVy
ZSB2aWEgdXBzdHJlYW0uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIE9sdGVhbiA8
b2x0ZWFudkBnbWFpbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogVmluY2VudCBKYXJkaW4gPHZqYXJk
aW5AZnJlZS5mcj4KPiA+IC0tLQo+ID4gdjEtPnYyOiBpbnRlZ3JhdGUgYSBwYXRjaCBmcm9tIFZp
bmNlbnQKPiAKPiBJIHdhbnRlZCB0byBhcHBseSB0aGlzLCBidXQgdW5mb3J0dW5hdGVseSwgdGhl
IEMgY29kZSBmYWlscyBiYWRseSB0bwo+IGNvbXBpbGUgb24gQVJNIDMyLWJpdDoKPiAKPiBtY192
MTAvZnNsX21jX2NtZC5oOjU2OjQyOiBlcnJvcjogcmlnaHQgc2hpZnQgY291bnQgPj0gd2lkdGgg
b2YgdHlwZSBbLVdlcnJvcj1zaGlmdC1jb3VudC1vdmVyZmxvd10KPiAgICA1NiB8ICAgICAgICAg
ICAgICAgICAoKCh+MFVMKSA8PCAobCkpICYgKH4wVUwgPj4gKEJJVFNfUEVSX0xPTkcgLSAxIC0g
KGgpKSkpCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+Cj4gCj4gKGxvdHMgb2Ygc2ltaWxhciBpc3N1ZXMpCj4gCj4gZHBtYWNfY29tbWFuZHMuYzog
SW4gZnVuY3Rpb24g4oCYcHJpbnRfZHBtYWNfY291bnRlcnPigJk6Cj4gZHBtYWNfY29tbWFuZHMu
YzozMzA6MzE6IGVycm9yOiBmb3JtYXQg4oCYJWx14oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlw
ZSDigJhsb25nIHVuc2lnbmVkIGludOKAmSwgYnV0IGFyZ3VtZW50IDMgaGFzIHR5cGUg4oCYdWlu
dDY0X3TigJkge2FrYSDigJhsb25nIGxvbmcgdW5zaWduZWQgaW504oCZfSBbLVdlcnJvcj1mb3Jt
YXQ9XQo+ICAgMzMwIHwgICAgICAgICAgICAgICAgIHByaW50ZigiJXM6ICVsdVxuIiwgZHBhYTJf
bWFjX2NvdW50ZXJzW2ldLm5hbWUsIGNvdW50ZXJfdmFsdWUpOwo+IAo+IFNlZW1zIGxpa2UgaXQn
cyBwcm9iYWJseSBuZXZlciBiZWVuIGJ1aWx0IGZvciAzMi1iaXQgdGFyZ2V0cy4gSWYgeW91Cj4g
b25seSB1c2UgaXQgb24gQVJNNjQsIG9uZSBvcHRpb24gaXMgImRlcGVuZHMgb24gQlIyX2FhcmNo
NjQiLgo+IE90aGVyd2lzZSwgdGhvc2UgaXNzdWVzIG5lZWQgdG8gYmUgYWRkcmVzc2VkLgoKVGhh
bmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dCBhbmQgZm9yIHRoZSByZXZpZXcuCgpJIGhhdmUg
Y3JlYXRlZCBhbiBpbnRlcm5hbCBwdWxsIHJlcXVlc3QgdG8gZml4IDMyLWJpdCByZXN0b29sIGJ1
aWxkcy4KSSB3aWxsIHNlbmQgYW4gdXBkYXRlZCBwdWxsIHJlcXVlc3QgdG8gQnVpbGRyb290IHdo
ZW4gdGhlc2UgcGF0Y2hlcwpiZWNvbWUgYXZhaWxhYmxlIG9uIEdpdGh1Yi4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
