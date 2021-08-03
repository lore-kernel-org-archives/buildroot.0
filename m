Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF97C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:39:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C0861103
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6C0861103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DB426070C;
	Tue,  3 Aug 2021 16:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lalfGWiZq6Db; Tue,  3 Aug 2021 16:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B25A16066A;
	Tue,  3 Aug 2021 16:39:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 382DC1BF868
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3426940248
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zt6xV5W9RWZW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 16:39:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5F9E40171
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 16:39:17 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id u13so3938729lje.5
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=itwRnRip1LxpFB304rsXhM9wpKZEUs+denXNQiglD80=;
 b=qlyHfJrj42xhNEiu4dWqSRuGk20YfowM7zfyYFb9oX/jAqYEH7kgL1p+gWraTLG29T
 tH4frQghziKrJkjLitS/eAHaFZ7WenuOAnxnDIK5Ngid8ECAm6Zs0PTB4mAY1oahnQHl
 asnCcenmCTzGo7SiRF4dXGSYI5yql1IjFyoYF2LfvMt6YsU8ueOmvaxO7mzaYaD55Al0
 I8v0GY6m/3kcHOJjvbzELyybsvT8sfg60wtBdF4dyefjWfNykl+DgWp2hMBIjPcPInPK
 +ifgxPLGBnyJ8JEwsrh9Q0Fph5NPYk/0xjd1tqS4rXGCRmo0vkVGBMcP/LT1MKKiSmZd
 j6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=itwRnRip1LxpFB304rsXhM9wpKZEUs+denXNQiglD80=;
 b=ReO0NYOVsvv45m6of/Pllva9ve3gMzbja9Qa/rlG0fSJ9eCpn5Eki56WgcU5xCVyP9
 XZvLOx6h23+J59sPhPikxNqV8mXJQdbmM8LxKzUVknW+aEpa42JfEhXPw2W1rq0YHMj+
 /rtjii32jHMoc/u32MuJCGLZgmkklPhPgTjIDNB23cmrIGM85Q3Bzirz1xWujcsvw+Jg
 wMbMAVTIVUSJ6oWERNTvkKXCI9j78Vb5Tz4otFvu8QMyxJPhRafhjOD6jlMul4YN4yc/
 zzgrtzKjnLRAeCpIKO30inLHcbL1eA43/YUfRFk4+tQR0LibVrYrwXitzxcp5Z9iONFa
 mdvw==
X-Gm-Message-State: AOAM532Zdb9ZBjaJMC0MzRIQo0aS1VurXueKvMHuZWX+LnrW0Bj1HsPQ
 lv6pkEXhiy0DJDdO2BuWdcN8r8xqu/0O7Db2qFHvXzToqwYsGg==
X-Google-Smtp-Source: ABdhPJy+RX2ZiWW/1mpXgD7cakyKOgNWCb4zFSQybYpDtgIByxZltpu0G17FYZ4yoKS1WzxApV9yzszFBvUFzf1gZTw=
X-Received: by 2002:a2e:9843:: with SMTP id e3mr14823114ljj.498.1628008755528; 
 Tue, 03 Aug 2021 09:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210802093458.1531166-1-fontaine.fabrice@gmail.com>
 <80b79e25-f27a-d86f-d592-854974e81425@mind.be>
In-Reply-To: <80b79e25-f27a-d86f-d592-854974e81425@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 3 Aug 2021 18:39:03 +0200
Message-ID: <CAPi7W81hkiynsYuWPyuw7ZXuVEA88wbqKsCEWp18XJSoppmRpA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with ftp
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Antoine Tenart <atenart@kernel.org>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgbWFyLiAzIGFvw7t0IDIwMjEgw6AgMTg6MDgsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAbWluZC5iZT4gYSDDqWNyaXQgOgo+Cj4KPgo+IE9uIDAyLzA4LzIwMjEgMTE6MzQsIEZhYnJp
Y2UgRm9udGFpbmUgd3JvdGU6Cj4gPiBGaXggYnVpbGQgZmFpbHVyZSByYWlzZWQgc2luY2UgY29t
bWl0Cj4gPiA2MWE0N2JiMTAzN2FjMjA3NzJmNGUwMTA2YWFiOTU2YWRmZmVlZTEyCj4gPgo+ID4g
Rml4ZXM6Cj4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9iZGUz
NGQ4MWEwNGI1ZWE5NjcyMmRjNTYyNDkwODlkY2U3ZTY1Yjc0Cj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4KPiAgQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPgo+ICBXaGF0J3MgdGhlIHVwc3RyZWFtIHN0YXR1cyBv
ZiB0aGUgcGF0Y2g/Ckkgc2VudCBhIFBSOiBodHRwczovL2dpdGh1Yi5jb20vU0VMaW51eFByb2pl
Y3QvcmVmcG9saWN5L3B1bGwvMzk5Cj4KPiAgUmVnYXJkcywKPiAgQXJub3V0Cj4KPiA+IC0tLQo+
ID4gIC4uLmVzLXNlcnZpY2VzLWZ0cC10ZS1tYWtlLXNzaC1vcHRpb25hbC5wYXRjaCB8IDQ0ICsr
KysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3JlZnBvbGljeS8wMDA0LXBvbGljeS1tb2R1
bGVzLXNlcnZpY2VzLWZ0cC10ZS1tYWtlLXNzaC1vcHRpb25hbC5wYXRjaAo+ID4KPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3JlZnBvbGljeS8wMDA0LXBvbGljeS1tb2R1bGVzLXNlcnZpY2VzLWZ0
cC10ZS1tYWtlLXNzaC1vcHRpb25hbC5wYXRjaCBiL3BhY2thZ2UvcmVmcG9saWN5LzAwMDQtcG9s
aWN5LW1vZHVsZXMtc2VydmljZXMtZnRwLXRlLW1ha2Utc3NoLW9wdGlvbmFsLnBhdGNoCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uOTI2OWM3YWZmOAo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS9yZWZwb2xpY3kvMDAwNC1wb2xpY3ktbW9k
dWxlcy1zZXJ2aWNlcy1mdHAtdGUtbWFrZS1zc2gtb3B0aW9uYWwucGF0Y2gKPiA+IEBAIC0wLDAg
KzEsNDQgQEAKPiA+ICtGcm9tIGYyNmQ0YmMxYjJhN2I3ODFjNjc4OTFjYjNiZjQ1NzljNjU4MmQ2
MzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiArRnJvbTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiArRGF0ZTogRnJpLCAzMCBKdWwgMjAyMSAy
Mjo0MDoyMCArMDIwMAo+ID4gK1N1YmplY3Q6IFtQQVRDSF0gcG9saWN5L21vZHVsZXMvc2Vydmlj
ZXMvZnRwLnRlOiBtYWtlIHNzaCBvcHRpb25hbAo+ID4gKwo+ID4gK01ha2Ugc3NoIG9wdGlvbmFs
IHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZToKPiA+ICsKPiA+ICsgQ29tcGls
aW5nIHRhcmdldGVkIHBvbGljeS4zMAo+ID4gKyBlbnYgTERfTElCUkFSWV9QQVRIPSIvaG9tZS9m
YWJyaWNlL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWI6L2hvbWUvZmFicmljZS9idWlsZHJvb3Qv
b3V0cHV0L2hvc3QvdXNyL2xpYiIgL2hvbWUvZmFicmljZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3Qv
dXNyL2Jpbi9jaGVja3BvbGljeSAtYyAzMCAtVSBkZW55IC1TIC1PIC1FIHBvbGljeS5jb25mIC1v
IHBvbGljeS4zMAo+ID4gKyBwb2xpY3kvbW9kdWxlcy9zZXJ2aWNlcy9mdHAudGU6NDg0OkVSUk9S
ICd0eXBlIHNzaF9ob21lX3QgaXMgbm90IHdpdGhpbiBzY29wZScgYXQgdG9rZW4gJzsnIG9uIGxp
bmUgOTIwNTE6Cj4gPiArICAgICBhbGxvdyBzZnRwZF90IHNzaF9ob21lX3Q6ZGlyIHsgb3BlbiBy
ZWFkIGdldGF0dHIgbG9jayBzZWFyY2ggaW9jdGwgYWRkX25hbWUgcmVtb3ZlX25hbWUgd3JpdGUg
fTsKPiA+ICsgI2xpbmUgNDg0Cj4gPiArIGNoZWNrcG9saWN5OiAgZXJyb3IocykgZW5jb3VudGVy
ZWQgd2hpbGUgcGFyc2luZyBjb25maWd1cmF0aW9uCj4gPiArCj4gPiArU2lnbmVkLW9mZi1ieTog
RmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gPiArLS0tCj4g
PiArIHBvbGljeS9tb2R1bGVzL3NlcnZpY2VzL2Z0cC50ZSB8IDEwICsrKysrKy0tLS0KPiA+ICsg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ICsKPiA+
ICtkaWZmIC0tZ2l0IGEvcG9saWN5L21vZHVsZXMvc2VydmljZXMvZnRwLnRlIGIvcG9saWN5L21v
ZHVsZXMvc2VydmljZXMvZnRwLnRlCj4gPiAraW5kZXggMGQ4NGRhNzFjZi4uNTY4NmIyMjU4MSAx
MDA2NDQKPiA+ICstLS0gYS9wb2xpY3kvbW9kdWxlcy9zZXJ2aWNlcy9mdHAudGUKPiA+ICsrKysg
Yi9wb2xpY3kvbW9kdWxlcy9zZXJ2aWNlcy9mdHAudGUKPiA+ICtAQCAtNDgxLDEwICs0ODEsNiBA
QCB0dW5hYmxlX3BvbGljeShgc2Z0cGRfZnVsbF9hY2Nlc3MnLGAKPiA+ICsgICAgIGZpbGVzX21h
bmFnZV9ub25fYXV0aF9maWxlcyhzZnRwZF90KQo+ID4gKyAnKQo+ID4gKwo+ID4gKy10dW5hYmxl
X3BvbGljeShgc2Z0cGRfd3JpdGVfc3NoX2hvbWUnLGAKPiA+ICstICAgIHNzaF9tYW5hZ2VfaG9t
ZV9maWxlcyhzZnRwZF90KQo+ID4gKy0nKQo+ID4gKy0KPiA+ICsgdHVuYWJsZV9wb2xpY3koYHVz
ZV9zYW1iYV9ob21lX2RpcnMnLGAKPiA+ICsgICAgIGZzX2xpc3RfY2lmcyhzZnRwZF90KQo+ID4g
KyAgICAgZnNfcmVhZF9jaWZzX2ZpbGVzKHNmdHBkX3QpCj4gPiArQEAgLTQ5NiwzICs0OTIsOSBA
QCB0dW5hYmxlX3BvbGljeShgdXNlX25mc19ob21lX2RpcnMnLGAKPiA+ICsgICAgIGZzX3JlYWRf
bmZzX2ZpbGVzKHNmdHBkX3QpCj4gPiArICAgICBmc19yZWFkX25mc19zeW1saW5rcyhmdHBkX3Qp
Cj4gPiArICcpCj4gPiArKwo+ID4gKytvcHRpb25hbF9wb2xpY3koYAo+ID4gKysgICAgdHVuYWJs
ZV9wb2xpY3koYHNmdHBkX3dyaXRlX3NzaF9ob21lJyxgCj4gPiArKyAgICAgICAgICAgIHNzaF9t
YW5hZ2VfaG9tZV9maWxlcyhzZnRwZF90KQo+ID4gKysgICAgJykKPiA+ICsrJykKPiA+CkJlc3Qg
UmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0
cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
