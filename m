Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EE9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4737541706;
	Sun, 24 Jul 2022 09:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4737541706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqI1EQDu-4ON; Sun, 24 Jul 2022 09:02:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8DD4415E1;
	Sun, 24 Jul 2022 09:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8DD4415E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FCCD1BF314
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A1C884BAD
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A1C884BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WcmP26EPngfP for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:01:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5127884B9B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5127884B9B
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:01:54 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n185so5085433wmn.4
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 02:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lCb6DZFUZUcNzyt1mgetGU678vHtoJrfc4Q2u7YNe2Y=;
 b=7mvmfkICAKfwP6vkFDpyd+MGS+ifnA9QbWcc4MZUIRbD88czYywYyjVZZ0W0f4cUdW
 iGBEsaifkE7fLl2E56hAehwGCc9rx2O8zLBwD7X8qbt1MMv+9KQTYtjpLkrZgLMYV98g
 n2OytB3Fnf6PVMMudAdGt06kr5nYrvfHqz0n4VPwazlUVfpOGyU5sRGnqimTTlW+i5GS
 jkH+ALPPxuuIqJjjlOHLJMMpvLyUNiakVYctwk2uVNbD9mKWoCh7mefI4m2g1NkUcEn4
 IMVkgxv/DC1G30alecNlsu2MvyJcIyoaV4F53xiEirSvwqQmyZ154nHz+7N50vBwV/NN
 7DiA==
X-Gm-Message-State: AJIora/bHG2UwRmE8Y+H4X65Zh6uJA9KU2ApHXcPWOCC+Gv3om4WDIfD
 DplBe38h1v6AhlhqkPJ92u69QQ==
X-Google-Smtp-Source: AGRyM1vo7g96+XzE/QNU6KNzai8wXlQxDPZKDt+49dCT17jDvmWM/7GXkSOLwrbW2WQdnouB0LcCmA==
X-Received: by 2002:a05:600c:1d06:b0:3a3:19ee:6963 with SMTP id
 l6-20020a05600c1d0600b003a319ee6963mr5182277wms.89.1658653312113; 
 Sun, 24 Jul 2022 02:01:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a5d4350000000b0021e4b0aac41sm8838906wrr.24.2022.07.24.02.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 02:01:51 -0700 (PDT)
Message-ID: <0e69c91a-6fb0-05f5-73b7-9f49bea9ee28@smile.fr>
Date: Sun, 24 Jul 2022 11:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Baruch Siach <baruch@tkos.co.il>
References: <cover.1658007000.git.yann.morin.1998@free.fr>
 <e2f23070c85c1d2fcf5ad74c88eae23723d18916.1658007000.git.yann.morin.1998@free.fr>
 <87a698fmnf.fsf@tarshish> <20220717065615.GT2543@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220717065615.GT2543@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lCb6DZFUZUcNzyt1mgetGU678vHtoJrfc4Q2u7YNe2Y=;
 b=n49ySc/FrUxhMd907xvGGAtJkUfFpSDAeimfQS9mQ5/E3aOgKq3ATp9QqzkmsW3uND
 yxohoKx3Gs2brvynV9SXE9bXrYCqVDaam6TuyzxUs0CIag6wkHDnFmGKngkc0SQPkf/I
 VV0//50MJ69GSlDzk6yPZG0tFN19SiTMBXjN8HfKycJrFwJwhUWRJXBDPwn84/7USkBR
 XWj+ZMonpk7CShmKpLNJXhMObAKjvyvOiK854ylQOWpTDrbbxq6rLOJL74LWw82vj9o+
 f9/+Dz7tVD+U6KRxLfjtTlDS66ypT/v4yaF2COXnYbrHkAaAeNtHSQUW/OJ1ufMSPtjN
 ePDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=n49ySc/F
Subject: Re: [Buildroot] [PATCH 1/2] package/rustc: fix target names for
 i586 and i686
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTcvMDcvMjAyMiDDoCAwODo1NiwgWWFubiBFLiBNT1JJTiBhIMOpY3JpdMKgOgo+IEJhcnVj
aCwgQWxsLAo+IAo+IE9uIDIwMjItMDctMTcgMDY6MjEgKzAzMDAsIEJhcnVjaCBTaWFjaCB2aWEg
YnVpbGRyb290IHNwYWtlIHRodXNseToKPj4gT24gU2F0LCBKdWwgMTYgMjAyMiwgWWFubiBFLiBN
T1JJTiB3cm90ZToKPj4+IENvbW1pdCBkNjlkNDBjMDI5ZGMgKHBhY2thZ2UvcnVzdGM6IGFkZCBz
dXBwb3J0IGZvciBUaWVyIDEgYW5kIFRpZXIgMgo+Pj4gcGxhdGZvcm1zKSBtaXNzcGVsbGVkIHRo
ZSBjb25maWcgb3B0aW9ucyBmb3IgaTU4NiBhbmQgaTY4Ni4KPj4+Cj4+PiBUaGV5IGFyZSBCUjJf
aTM4Nl9pNTg2IGFuZCBCUjJfaTM4Nl9pNjg2LCBub3QgQlIyX2k1ODYgb3IgQlIyX2k2ODYuCj4+
Cj4+IFlvdSBtZWFuIEJSMl94ODZfaTU4NiBhbmQgQlIyX3g4Nl9pNjg2LCByaWdodD8gQmVjYXVz
ZSB0aGF0J3Mgd2hhdCB0aGUKPj4gcGF0Y2ggZG9lcy4KPiAKPiBBaGEsIGdvb2QgY2F0Y2gsIHRo
YW5rcyEgOi0pCj4gCj4gIldoeSB3b3VsZCBJIGNvcHktcGFzdGUgdGhlIG9wdGlvbnMgbmFtZXMs
IHRoZXkgYXJlIHNpbXBsZSBlbm91Z2gsIGl0J3MKPiBnb25uYSBiZSBmYXN0ZXIgdG8gdHlwZSB0
aGVtLi4uIiBkaWQgSSB0aGluayB3aGlsZSBmaXhpbmcgdHlwb2VzIGluCj4gc2ltcGxlIHZhcmlh
YmxlIG5hbWVzLiBEb2guLi4KPiAKPiBTbywgSSBkb3VibGUtY2hlY2tlZCwgYW5kIHRoZSBvcHRp
b25zIHJlYWxseSBhcmVuYW1lZCBCUjJfeDg2X2k1ODYgYW5kCj4gQlIyX3g4Nl9pNjg2LiBBbmQg
dGhpcyB0aW1lLCBJIGRpZCBjb3B5LXBhdGUgdGhlbTotKQoKV2l0aCBhbiB1cGRhdGVkIGNvbW1p
dCBsb2c6CgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4g
Cj4+IGJhcnVjaAo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+Cj4+PiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9u
aUBib290bGluLmNvbT4KPj4+IC0tLQo+Pj4gIHBhY2thZ2UvcnVzdGMvQ29uZmlnLmluLmhvc3Qg
fCA4ICsrKystLS0tCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydXN0Yy9Db25maWcuaW4uaG9z
dCBiL3BhY2thZ2UvcnVzdGMvQ29uZmlnLmluLmhvc3QKPj4+IGluZGV4IDI3YzNhM2NkZWIuLmZl
Yzg3MjZhZWUgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL3J1c3RjL0NvbmZpZy5pbi5ob3N0Cj4+
PiArKysgYi9wYWNrYWdlL3J1c3RjL0NvbmZpZy5pbi5ob3N0Cj4+PiBAQCAtMjUsNyArMjUsNyBA
QCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfVElFUjFfUExBVEZPUk1TCj4+
PiAgCSMgYWFyY2g2NC11bmtub3duLWxpbnV4LWdudQo+Pj4gIAlkZWZhdWx0IHkgaWYgQlIyX2Fh
cmNoNjQgJiYgQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDCj4+PiAgCSMgaTY4Ni11bmtub3duLWxp
bnV4LWdudQo+Pj4gLQlkZWZhdWx0IHkgaWYgKEJSMl9pNjg2IHx8IEJSMl94ODZfcGVudGl1bXBy
byB8fCBCUjJfWDg2X0NQVV9IQVNfTU1YKSAmJiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKPj4+
ICsJZGVmYXVsdCB5IGlmIChCUjJfeDg2X2k2ODYgfHwgQlIyX3g4Nl9wZW50aXVtcHJvIHx8IEJS
Ml9YODZfQ1BVX0hBU19NTVgpICYmIEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQwo+Pj4gIAkjIHg4
Nl82NC11bmtub3duLWxpbnV4LWdudQo+Pj4gIAlkZWZhdWx0IHkgaWYgQlIyX3g4Nl82NCAmJiBC
UjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKPj4+ICAKPj4+IEBAIC05MywxMSArOTMsMTEgQEAgY29u
ZmlnIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX1RJRVIyX1BMQVRGT1JNUwo+Pj4gIAkj
IHVzZXJzcGFjZQo+Pj4gIAlkZWZhdWx0IHkgaWYgQlIyX2FybSAmJiBCUjJfQVJNX0NQVV9BUk1W
OEEgJiYgQlIyX0FSTV9FQUJJSEYgJiYgQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wKPj4+ICAJIyBp
NTg2LXVua25vd24tbGludXgtZ251Cj4+PiAtCWRlZmF1bHQgeSBpZiBCUjJfaTU4NiAmJiBCUjJf
VE9PTENIQUlOX1VTRVNfR0xJQkMKPj4+ICsJZGVmYXVsdCB5IGlmIEJSMl94ODZfaTU4NiAmJiBC
UjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKPj4+ICAJIyBpNTg2LXVua25vd24tbGludXgtbXVzbAo+
Pj4gLQlkZWZhdWx0IHkgaWYgQlIyX2k1ODYgJiYgQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wKPj4+
ICsJZGVmYXVsdCB5IGlmIEJSMl94ODZfaTU4NiAmJiBCUjJfVE9PTENIQUlOX1VTRVNfTVVTTAo+
Pj4gIAkjIGk2ODYtdW5rbm93bi1saW51eC1tdXNsCj4+PiAtCWRlZmF1bHQgeSBpZiAoQlIyX2k2
ODYgfHwgQlIyX3g4Nl9wZW50aXVtcHJvIHx8IEJSMl9YODZfQ1BVX0hBU19NTVgpICYmIEJSMl9U
T09MQ0hBSU5fVVNFU19NVVNMCj4+PiArCWRlZmF1bHQgeSBpZiAoQlIyX3g4Nl9pNjg2IHx8IEJS
Ml94ODZfcGVudGl1bXBybyB8fCBCUjJfWDg2X0NQVV9IQVNfTU1YKSAmJiBCUjJfVE9PTENIQUlO
X1VTRVNfTVVTTAo+Pj4gIAkjIG1pcHMtdW5rbm93bi1saW51eC1tdXNsCj4+PiAgCWRlZmF1bHQg
eSBpZiBCUjJfbWlwcyAmJiBCUjJfVE9PTENIQUlOX1VTRVNfTVVTTCAmJiAhQlIyX01JUFNfQ1BV
X01JUFMzMlI2Cj4+PiAgCSMgbWlwczY0LXVua25vd24tbGludXgtbXVzbGFiaTY0Cj4+Cj4+Cj4+
IC0tIAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj4+ID19LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQo+PiAgICAt
IGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3LnRr
b3MuY28uaWwgLQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
