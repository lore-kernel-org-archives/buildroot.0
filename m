Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832CBC4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 14:04:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3510660F35
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 14:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3510660F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB910600BB;
	Tue, 10 Aug 2021 14:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9Hc9tRtKGal; Tue, 10 Aug 2021 14:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 633C660609;
	Tue, 10 Aug 2021 14:04:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED88C1BF5A0
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 14:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD35282726
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 14:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CBCWLabOZHf5 for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 14:04:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 227E781C21
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 14:04:22 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z2so24972138lft.1
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q6uz4NBBnixb8UlSnhWRn4hdCj3FSGpClmBwSMwpDPM=;
 b=orF/hV5RnXNoRYSnPcxB5RkxQqtJcN1AekWggERtuoHVB5pg5XU2h1w79k03nc50xr
 ivNAgIL6A9j6VFXpzu/whhNs8BrwksDQ72ROufZD66WUGbZgnY23dgE6aVU/FURluFb7
 lLkgfaMRGOa0V0cSdfWVI/2UU4De1i3hs/TOxwWwO7wALO99p4e8hbmiFx1ez0dXgY6O
 3Aw6T2P++q7Bn+HU645u0n2D6ha1Y1svvjTCgB46248nM5/0os8JboRVmQZnSMq62Ex2
 jpJO7cMDVUIy0nBc7/OPib/NBynCeVwM7gpcq8kqFiuKH2EKU8hWwa/9m2LAb602h7Rw
 TW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q6uz4NBBnixb8UlSnhWRn4hdCj3FSGpClmBwSMwpDPM=;
 b=fMfjLEMlO3aomemA9jam5Wfy76+avsctpxEUClJK4HCBnHBszAJmPgD/uflAJXO0i0
 WYOpbVSjRBGSdxqelUID6exb+IUV4hs30eiIUOOJRPzwYmCjrDk0MaOaqXaMMc9yQRTl
 e/EM4S9eLCABGEzwyHOJT1w2IqhrGZyght3w/zdVp7a84je6WZq/t+BASgnFbtYFP89Y
 lM8CFE2vEthV5M+stQc1AerKUb1hCLW/WDihAR/Tv8LWrNC/8xiLTJ8aWwLmqILyg0ik
 WexgmZTUtDdvqiVosZwBYlLC9jmEbCb8N2al0d4YLAVcrHd2f73x7Z31PScnl7Urnqwx
 9q1Q==
X-Gm-Message-State: AOAM5335uaCIEpbueuMju5tn78PbTrzIp9GYei/DnwSFREi1i/Pjfl21
 fbER4dSQXbdntHwz1IpH67lvNzAPNG7FFg==
X-Google-Smtp-Source: ABdhPJxU6XRAbKQTU9eTbU4+J97ixNO4PvVxJR1DjXSWGMSn0DN+shPhoCVaAdlZ6SY0/Wb4FvzykQ==
X-Received: by 2002:ac2:4568:: with SMTP id k8mr4148763lfm.489.1628604259959; 
 Tue, 10 Aug 2021 07:04:19 -0700 (PDT)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id x34sm517972lfa.265.2021.08.10.07.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 07:04:19 -0700 (PDT)
To: Baruch Siach <baruch@tkos.co.il>
References: <20210810131236.18022-1-zajec5@gmail.com> <87y299flfs.fsf@tarshish>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <a85a8171-7afd-5af2-aed6-a7f561471fca@gmail.com>
Date: Tue, 10 Aug 2021 16:04:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87y299flfs.fsf@tarshish>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] board/broadcom: add support for Northstar
 platform devices
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
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gMTAuMDguMjAyMSAxNjowMSwgQmFydWNoIFNpYWNoIHdyb3RlOgo+IG9uIFR1ZSwgQXVnIDEw
IDIwMjEsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxy
YWZhbEBtaWxlY2tpLnBsPgo+Pgo+PiBCcm9hZGNvbSBOb3J0aHN0YXIgZmFtaWx5IG9mIFNvQ3Mg
aXMgbW9zdCBjb21tb25seSB1c2VkIGZvciBob21lCj4+IHJvdXRlcnMuIEl0J3MgYW4gQVJNIHBs
YXRmb3JtIHdpdGggQ29ydGV4LUE5IENQVShzKS4KPj4KPj4gQWxsIGtub3duIE5vcnRoc3RhciBk
ZXZpY2VzIGNvbWUgd2l0aCBDRkUgYm9vdGxvYWRlciB3aGljaCBhbG1vc3QgYWx3YXlzCj4+IGV4
cGVjdHMgYSBUUlggZmlybXdhcmUgZm9ybWF0ICh3aXRoIGV4Y2VwdGlvbiBmb3IgdGhlIEQtTGlu
aykuIFNvbWUKPj4gdmVuZG9ycyAobGlrZSBMdXh1bCBhbmQgTmV0Z2Vhcikgd3JhcCBUUlggaW4g
dGhlaXIgb3duIGNvbnRhaW5lcnMuCj4+Cj4+IEZvciBhYm92ZSByZWFzb24gYSBwbGFpbiBrZXJu
ZWwgYW5kIHJvb3RmcyBhcmUgdXNlbGVzcyBmb3IgZmxhc2hpbmcKPj4gcHVycG9zZXMuIENGRSBy
ZXF1aXJlcyBUUlgoLWxpa2UpIGZvcm1hdCBhbmQgdGhlcmUgaXNuJ3QgYW55IENGRQo+PiByZXBs
YWNlbWVudC4gQW5vdGhlciBpc3N1ZSBpcyBsYWNrIGZvciBEVFMgc3VwcG9ydCBpbiBDRkUuCj4+
IFRoYXQncyB3aHkgZm9yIHRoaXMgYm9hcmQgdGhlcmUgaXMgcG9zdC1pbWFnZSBzY3JpcHQgYnVp
bGRpbmcgZGV2aWNlCj4+IHNwZWNpZmljIGltYWdlcy4gSXQgdGFrZXMgY2FyZSBvZiBhcHBlbmRp
bmcgRFRCIHRvIHRoZSBrZXJuZWwgYW5kCj4+IHB1dHRpbmcgZXZlcnl0aGluZyBpbiBhIFRSWCBp
bWFnZS4KPj4KPj4gS2VybmVsIGNvbmZpZyB3YXMgYWRqdXN0ZWQgdG8gcHJvdmlkZSBtaW5pbWFs
IHN1cHBvcnQgYWxsIG9uLVNvQyBibG9ja3MKPj4gKGxpa2UgRXRoZXJuZXQsIHN3aXRjaCwgVVNC
LCBQQ0llKS4gRm9yIHJvb3RmcyB0aGlzIGJvYXJkcyBhZGRzIG5ldHdvcmsKPj4gY29uZmlnIHRo
YXQgc2V0dXBzIGludGVyZmFjZXMgbWFraW5nIGRldmljZSBhY2Nlc3NpYmxlIG92ZXIgdGhlIG5l
dHdvcmsuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNr
aS5wbD4KPj4gLS0tCj4gCj4gW21ldGEtcGF0Y2ggdGV4dCBnb2VzIGhlcmVdCj4gCj4+ICsrKyBi
L2JvYXJkL2Jyb2FkY29tL25zL3Bvc3QtaW1hZ2Uuc2gKPj4gQEAgLTAsMCArMSw0MyBAQAo+PiAr
IyEvYmluL3NoCj4+ICsKPj4gKyMgJDE6IGltYWdlcyBkaXJlY3RvcnkgcGF0aAo+PiArIyAkMjog
ZGV2aWNlIGR0cyBmaWxlbmFtZQo+PiArIyAkMzogYm9hcmQgaWQKPj4gK2J1aWxkX2x4bCgpIHsK
Pj4gKwlsb2NhbCBpbWFnZXM9IiQxIgo+PiArCWxvY2FsIGRldmljZT0iJDIiCj4+ICsJbG9jYWwg
Ym9hcmQ9IiQzIgo+PiArCj4+ICsJbHptYS1hbG9uZSBlICRpbWFnZXMvekltYWdlLiRkZXZpY2Ug
JGltYWdlcy96SW1hZ2UuJGRldmljZS5sem1hIC1kMTYKPj4gKwlybSAtZiAkaW1hZ2VzL3pJbWFn
ZS4kZGV2aWNlCj4+ICsJJEhPU1RfRElSL2Jpbi9vdHJ4IGNyZWF0ZSAkaW1hZ2VzLyRkZXZpY2Uu
dHJ4IC1mICRpbWFnZXMvekltYWdlLiRkZXZpY2UubHptYQo+PiArCXJtIC1mICRpbWFnZXMveklt
YWdlLiRkZXZpY2UubHptYQo+PiArCSRIT1NUX0RJUi9iaW4vbHhsZncgY3JlYXRlICRpbWFnZXMv
JGRldmljZS5seGwgLWkgJGltYWdlcy8kZGV2aWNlLnRyeCAtYiAiJGJvYXJkIgo+PiArfQo+PiAr
Cj4+ICsjICQxOiBpbWFnZXMgZGlyZWN0b3J5IHBhdGgKPj4gKyMgJDI6IGRldmljZSBkdHMgZmls
ZW5hbWUKPj4gK2J1aWxkX3RyeCgpIHsKPj4gKwlsb2NhbCBpbWFnZXM9IiQxIgo+PiArCWxvY2Fs
IGRldmljZT0iJDIiCj4+ICsKPj4gKwlsem1hLWFsb25lIGUgJGltYWdlcy96SW1hZ2UuJGRldmlj
ZSAkaW1hZ2VzL3pJbWFnZS4kZGV2aWNlLmx6bWEgLWQxNgo+PiArCXJtIC1mICRpbWFnZXMveklt
YWdlLiRkZXZpY2UKPj4gKwkkSE9TVF9ESVIvYmluL290cnggY3JlYXRlICRpbWFnZXMvJGRldmlj
ZS50cnggLWYgJGltYWdlcy96SW1hZ2UuJGRldmljZS5sem1hCj4gCj4gSXMgdGhpcyB1dGlsaXR5
IHBhcnQgb2YgdGhlIGZpcm13YXJlLXV0aWxzIGhvc3QgcGFja2FnZT8gSSBzZWUgdGhhdAo+IGRl
ZmNvbmZpZyBzZWxlY3RzIEJSMl9QQUNLQUdFX0hPU1RfRklSTVdBUkVfVVRJTFMgd2hpY2ggaXMg
bm90IGluCj4gY3VycmVudCBCdWlsZHJvb3QgbWFzdGVyLiBTbyB0aGlzIHBhdGNoIGRlcGVuZHMg
b24gdGhlIHBhdGNoCj4gInBhY2thZ2UvZmlybXdhcmUtdXRpbHM6IGFkZCBwYWNrYWdlIjoKPiAK
PiAgICBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyMTA4MDkxNDQxNDQuMzAxMDUtMS16YWplYzVAZ21haWwuY29tLwo+IAo+IFlvdSBzaG91bGQg
bWVudGlvbnMgdGhhdCBpbiB0aGUgbWV0YS1wYXRjaCBwYXJ0IG9mIHRoZSBlbWFpbCAoc2VlCj4g
YWJvdmUpLgoKVGhhdCdzIGNvcnJlY3QsIHNvcnJ5IGZvciBub3QgZGVzY3JpYmluZyB0aGF0IGRl
cGVuZGVuY3kuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0
cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
