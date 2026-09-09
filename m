Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27705C79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 14:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D797380D8F;
	Wed,  9 Sep 2026 14:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Pjb7E9czRyo; Wed,  9 Sep 2026 14:03:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9753E80DA7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788962613;
	b=Xu0KAFF8TagUBfMCjh5Zs9Ed2nE5zZBZM8bt789gY332clENry6s2KxPE5Or4dIl4Piw
	 iKQg4T8xKTFmoD9b9ABQ18kZkYg6pY1NXxvi9sJK3fgduKMKIh1SUxC3m+knY9/2dSYZU
	 ZcXEoo0j9hlQorR59FAVib0l7DnpB+gQIw0TTaWjqO+BNsrFhKn5OMyRC4xDgN7rLlmBQ
	 7vdmqYZAau375pDoL9/9waHBuHOf/HOav7EbmOX34X935CSRB8tU7OstGFDPCESoFhnvA
	 ic1/t2AlZ5x/rPLMzaqlKiisxD0bsmnJrTcsiSYH7McTIUosLaMLCmJ7IAke5ZxybXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788962613;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d+3wMbI+IvwUo8TmDpalGqUe+hkpiGweh3GDcbQnN8k=;
	b=ShymdnMMwokhl0M3C9OhQnZSFhBjYxg9NuaoKxcE/QYSmtrCUtlGnLlznO3r9O/5u7OZ
	 GWoMI8KF9Py9AIUwbj5Sr5HerdyLLfij8uwrBGH/Lt5iUaJu2tl0vPxIbLE4QNn4VufZT
	 7UsiCsEX0rdUg/mds1rb6LNTszFfGxFrvpjVkfDzj6p4YVeuGWfY7JWlFgq3YQGAgpqEO
	 k8VHEORMjZwSu0hIo+1bTLzZGSQrKJg1LHZFkeRO5Or0K4KGH/FXfHmU50aqH1YWGnX3Q
	 bbxVF8+onYTaE02bPpyRWkaapuRa5JKOTufMHBiEne08VTJazjPlrYUfaAlDCwaCGpg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788962613;
	bh=d+3wMbI+IvwUo8TmDpalGqUe+hkpiGweh3GDcbQnN8k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MOUrZHUIflsnrFNyvqQR3ePw/ZoHbQN2gb14VgTCudwxdQEXoqbq0WOCQwbOxY9L5
	 MSSs6cb7kDneXHmilaKLM33A7zxgVsnauzkrCXF1P18GQrDi1pkAGEiTAyId/4oSW3
	 DdRqE2oBsLv1sdDB9ixzCZS8wBr01VyT6Tk+spIvkOcnZ9VFutmTCfLkqCmDGQx86O
	 Xt+uKElf1r7vFl0/hYbrFPuyE+CwT6S/TZ1tcAkOrQcJXOmKfDwGM7t0V5kj4NoF/h
	 afVkOmCcTFqMUkPqmsGeNnEH/PeNekF/MFLlfs1o36TQTP9Icy9lIam9om0hg1ZpUC
	 yztOshS1TcYlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9753E80DA7;
	Wed,  9 Sep 2026 14:03:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE0253AF
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D41FF40098
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdwMwKJVt7hb for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 14:03:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 73AE040085
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788962610;
 b=XHDlrBKJIz/KA157intjTaTI0L7kJhQESLiv/qFiBgA5Qu3XdglFES0r3gNVBX4HhYLt
 2mQUeloxmii/jGKPD73+vDR6EZ3B+oH4WBQ3E4UR5qR0xjBcYo0OO+nSHTjNpya4cCxF4
 DyXPEpKVJmjWMeVfrs3UjHfk1/pZ5BrT1k1jpRHjMbYe9G+rPFyOG4Ks0SeZXhwNIlpUH
 LuhX6o7zD3M3n4lmUWtNZGqmfYIKRBOVbiD6fnckd8Fdtijc4LofhRyhFGetmXNNTXslv
 GuokeP/rYoRPTrJhEwMfO0QWfpC2ORgo6nJLtvZF+ykPaIGh+vKHeVUW4glDue+hgWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788962610;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=Q2dVfOwMv/xvRiNnrZlf/leMsIIGRZLGNy4cJHMVZQ4=;
 b=PDATx09bqj+gJYFYsdH+qpP3ik32U8Viwm6drhZ772j/OBQthv1tgKf8Zx8QjlcVeOwV
 us8ghdt8iQ09MU3ULzShCFTidvRf0QJXiugLHkNJo/yIyXbQTx3ySqOEXZpHZOC1o8AXu
 gAopcnx46xZSEspXBZDNg4aD4oE0Tg6V4eNIcXt74RmN8Axba8Gxqejx+udLT6uJYV1DU
 HpaWywOjQeFFIlrue1ss88duaQeKCKxKAfGN0JrTn3Uo8Ong0u+6SQnTQy1t0hhNkmcx6
 OD/cDYunbzPIY5ov8qbQr+mIHhect0IFYqX5H2a6BHgLI9vNIWara+LYoPQgbgUHvJA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=qkfFioMd; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73AE040085
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:03:30 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d37b5so6853825e9.2
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 07:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788962608; x=1789567408;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q2dVfOwMv/xvRiNnrZlf/leMsIIGRZLGNy4cJHMVZQ4=;
 b=VlNVi54KwvZVE6HpmwvM5BciHo61TPMYzp+ALabd5rANzcu1tlMBGTYSAt49CUaijk
 ZDuf2mSeai6iUFGAKJpPXYp09ek16BNBQZ2ArQZjTDU2fiGFzuu7Tuwiz0JxwxlenFyH
 aqx2GMOK5DhNaxvgqZ/qibRn1MygDslQZJgv54Vb55g2SXy0TEF60kxvsi6Cz2Y9oXy8
 /KUvm4/qRa8x47vtgrqPSMZQfjTyNHZJ47MqMHBoHeVfC16nZL9K6K4fYolkwtDZxQ4K
 PRoNqoeuNtBTQ/EC54ney+Yy1S5Tvc9fTujOIK92UpFlZk7uIRldvUS9qy4oX/LkDNgN
 b4hA==
X-Forwarded-Encrypted: i=1;
 AKwUvByaeBRro5YL6/Xg85AaOvxBL97/XBu/4dQR6jOCVLyESBC4jiCb/b1jPP4BG4hmSsmhjF4fHYlx9Rc=@buildroot.org
X-Gm-Message-State: AFuF++ko/thxn2iaueFGS1e0EU8x4XK8xPsp2ws/X/wNg1e2bd1IdeyX
 c9jviPEj0eTczFJ9v5VkZgdzTwp7WF/4PWHBVT8XFj+fIKrtaegatZRKoyO1Bh+mS7M=
X-Gm-Gg: AYBFou3IYFaGF/tgPrjAfwW4lV/JtrnkMAU4b/16P4WnaUMaBLlOP/356cD3RjJyubN
 ZuovoN6svaB6khI25pqK8WohrkC3MbOX5jgWFdxSLaYbxNSWd+pBP/EA48NCncynp1NlUrfZA5A
 u1dH4CfSd92lTOLTQc51UsvjXPW1+7uIzexU8wywgZxygvJXjIuQsYa+Zo2sQs8m3jX+MVNDrTL
 XCleAjemZpZrgqutEtVXpkyUq5iheQkYfW5hGbi2MHAX6+yAx2zQ3AZSdX5lTbp5H+cI3ecqNM0
 3KISnc1Gk9n/XNCWWQgyRGerqV6J32GQCS3keV3o6L69VDyUqTMHvnl6hruoXAmLRrcDYnEjuuh
 xg9DiVqBm0vGT7W2/YPLNJhTrQKZrmWdvpQHT/d0zq+SgdlfX0zE2rZR7gYYegla1dXT4ozQpDR
 /wD4m+IYqwpzPzVtZd1YSjuq1o2m0o4qIuTYfoobQ9gXo9EeBtASooA3U/qqAkYHH0kbwJ5m6mJ
 QErNJ3vXj78pmD0kFWoStYIzXycgksuNdO/Itw+iiqwW7AsEyA+JPbOcFO5pKQ=
X-Received: by 2002:a05:600c:698c:b0:49c:edfe:d525 with SMTP id
 5b1f17b1804b1-49d1f35366fmr134244795e9.10.1788962607857; 
 Wed, 09 Sep 2026 07:03:27 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d0656e7bbsm369644985e9.10.2026.09.09.07.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:03:27 -0700 (PDT)
Message-ID: <8d06a89e-15c3-45a0-99fa-3efde4742f2c@smile.fr>
Date: Wed, 9 Sep 2026 16:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
References: <20260906233048.692559-1-bernd@kuhls.net>
 <20260906233048.692559-2-bernd@kuhls.net>
Content-Language: fr
In-Reply-To: <20260906233048.692559-2-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 2/6] package/mesa3d: precomp-compiler does
 not need target llvm
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

TGUgMDcvMDkvMjAyNiDDoCAwMTozMCwgQmVybmQgS3VobHMgYSDDqWNyaXTCoDoKPiBJbnNwaXJl
ZCBieSBhbmQgZml4ZXMKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QvLS93b3JrX2l0ZW1zLzE4MAo+IAo+IFRvIGJ1aWxkIGJpbmFyaWVzIHByb3ZpZGVkIGJ5IHRo
ZSBob3N0LW1lc2EzZCBwYWNrYWdlIHdlIGRvIG5vdCBuZWVkIHRvCj4gYnVpbGQgbGx2bSBwYWNr
YWdlcyBmb3IgdGhlIHRhcmdldCBhcmNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxz
IDxiZXJuZEBrdWhscy5uZXQ+Cj4gLS0tCj4gIHBhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbiB8IDQ2
ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPiAgcGFja2FnZS9tZXNh
M2QvbWVzYTNkLm1rIHwgIDggKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlv
bnMoKyksIDIxIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9D
b25maWcuaW4gYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPiBpbmRleCBjYjg2ZTZhMmE0Li5m
ZWVkNmI2OGZlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+ICsrKyBi
L3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+IEBAIC0yMyw4ICsyMyw3IEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9NRVNBM0RfTkVFRFNfRUxGVVRJTFMKPiAgCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9N
RVNBM0RfTkVFRFNfUFJFQ09NUF9DT01QSUxFUgo+ICAJYm9vbAo+IC0Jc2VsZWN0IEJSMl9QQUNL
QUdFX1NQSVJWX0xMVk1fVFJBTlNMQVRPUgo+IC0Jc2VsZWN0IEJSMl9QQUNLQUdFX1NQSVJWX1RP
T0xTCj4gKwlzZWxlY3QgQlIyX0hPU1RfQ01BS0VfQVRfTEVBU1RfM18yMCAjIGhvc3QtbGx2bQo+
ICAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCj4gIAlib29sICJsbHZtIHN1cHBv
cnQiCj4gQEAgLTE0NywxNSArMTQ2LDE3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfR0FM
TElVTV9EUklWRVJfSTkxNQo+ICAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVN
X0RSSVZFUl9JUklTCj4gIAlib29sICJHYWxsaXVtIGlyaXMgZHJpdmVyIgo+IC0JZGVwZW5kcyBv
biBCUjJfUEFDS0FHRV9NRVNBM0RfTExWTQo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9MTFZN
X0FSQ0hfU1VQUE9SVFMgIyBob3N0LWxsdm0KPiArCWRlcGVuZHMgb24gQlIyX0hPU1RfR0NDX0FU
X0xFQVNUXzcgIyBob3N0LWxsdm0KPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElV
TV9EUklWRVIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfTkVFRFNfUFJFQ09NUF9DT01Q
SUxFUgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9SVVNUSUNMX1NVUFBPUlRFRF9EUklW
RVIKPiAgCWhlbHAKPiAgCSAgTWVzYSBkcml2ZXIgZm9yIGlyaXMtYmFzZWQgSW50ZWwgR1BVcy4K
PiAgCj4gLWNvbW1lbnQgImlyaXMgZHJpdmVyIG5lZWRzIGxsdm0iCj4gLQlkZXBlbmRzIG9uICFC
UjJfUEFDS0FHRV9NRVNBM0RfTExWTQoKVGhpcyByZW1vdmUgbWVzYSBsbHZtIHJ1bnRpbWUgc3Vw
cG9ydCB3aGlsZSBpdCB3YXMgYWRkZWQgd2l0aCB0aGUgYnVtcCB0byAyNS4wLjYKWzFdLiBXZSBu
ZWVkIHRvIGRvdWJsZSBjaGVjayBoZXJlIHRvIG5vdCBpbnRyb2R1Y2UgYW55IHJ1bnRpbWUgaXNz
dWUuCgpUaGVyZSBpcyBhIGNvbmZ1c2lvbiBiZXR3ZWVuIG1lc2EgbGx2bSB0YXJnZXQgc3VwcG9y
dCBhbmQgbGx2bSByZXF1aXJlZCBieSB0aGUKcHJlY29tcC1jb21waWxlci4gQ2FuIHlvdSBhZGQg
eW91ciBhbmFseXNpcyBpbiB0aGUgY29tbWl0IGxvZz8KClsxXQpodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMzE3MjYwZjMzNmI2NWZmMGI0MWE5NTM4
ODJjYjhjY2NiNzg5ZTAxMAoKPiArY29tbWVudCAiaXJpcyBkcml2ZXIgbmVlZHMgaG9zdCBnY2Mg
Pj0gNyIKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTExWTV9BUkNIX1NVUFBPUlRTCj4gKwlk
ZXBlbmRzIG9uICFCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfNwo+ICAKPiAgY29uZmlnIEJSMl9QQUNL
QUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9MSU1BCj4gIAlib29sICJHYWxsaXVtIGxpbWEgZHJp
dmVyIgo+IEBAIC0xODksMTUgKzE5MCwxNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0dB
TExJVU1fRFJJVkVSX05PVVZFQVUKPiAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVN
X0RSSVZFUl9QQU5GUk9TVAo+ICAJYm9vbCAiR2FsbGl1bSBwYW5mcm9zdCBkcml2ZXIiCj4gIAlk
ZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NZTkNfNCB8fCAhQlIyX1BBQ0tBR0VfWE9SRzcg
IyBsaWJ4c2htZmVuY2UKPiAtCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk0KPiAr
CWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTExWTV9BUkNIX1NVUFBPUlRTICMgaG9zdC1sbHZtCj4g
KwlkZXBlbmRzIG9uIEJSMl9IT1NUX0dDQ19BVF9MRUFTVF83ICMgaG9zdC1sbHZtCgpBdCBsZWFz
dCB0aGUgcGFuZnJvc3QgZG9jdW1lbnRhdGlvbiBjb25maXJtIHRoYXQ6CgogICJMTFZNIGlzIHJl
cXVpcmVkIGJ5IFBhbmZyb3N0J3MgY29tcGlsZXJzIGF0IGJ1aWxkIHRpbWUuIgoKaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC8yMDk3MGJjZDk2NTJlYTg3
MjdhMzA3Y2VkOWIzNzJmYWQ0Yjg5OTkxCgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9H
QUxMSVVNX0RSSVZFUgo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9ORUVEU19QUkVDT01Q
X0NPTVBJTEVSCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX1JVU1RJQ0xfU1VQUE9SVEVE
X0RSSVZFUgo+ICAJaGVscAo+ICAJICBNZXNhIGRyaXZlciBmb3IgQVJNIE1hbGkgTWlkZ2FyZCBh
bmQgQmlmcm9zdCBHUFVzLgo+ICAKPiAtY29tbWVudCAicGFuZnJvc3QgZHJpdmVyIG5lZWRzIGxs
dm0iCj4gLQlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9NRVNBM0RfTExWTQo+ICtjb21tZW50ICJw
YW5mcm9zdCBkcml2ZXIgbmVlZHMgaG9zdCBnY2MgPj0gNyIKPiArCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfTExWTV9BUkNIX1NVUFBPUlRTCj4gKwlkZXBlbmRzIG9uICFCUjJfSE9TVF9HQ0NfQVRf
TEVBU1RfNwo+ICAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9S
MzAwCj4gIAlib29sICJHYWxsaXVtIFJhZGVvbiBSMzAwIGRyaXZlciIKPiBAQCAtMzYwLDQ2ICsz
NjMsNDkgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0lNQUdJTkFU
SU9OCj4gIAlib29sICJWdWxrYW4gaW1hZ2luYXRpb24gZHJpdmVyIgo+ICAJZGVwZW5kcyBvbiBC
UjJfYXJtIHx8IEJSMl9hYXJjaDY0Cj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NZ
TkNfNCB8fCAhQlIyX1BBQ0tBR0VfWE9SRzcgIyBsaWJ4c2htZmVuY2UKPiAtCWRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk0KPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTExWTV9B
UkNIX1NVUFBPUlRTICMgaG9zdC1sbHZtCj4gKwlkZXBlbmRzIG9uIEJSMl9IT1NUX0dDQ19BVF9M
RUFTVF83ICMgaG9zdC1sbHZtCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX05FRURTX1BS
RUNPTVBfQ09NUElMRVIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZF
Ugo+ICAJaGVscAo+ICAJICBWdWxrYW4gaW1hZ2luYXRpb24gZHJpdmVyLgo+ICAKPiAtY29tbWVu
dCAiaW1hZ2luYXRpb24gdnVsa2FuIG5lZWRzIGxsdm0iCj4gLQlkZXBlbmRzIG9uICFCUjJfUEFD
S0FHRV9NRVNBM0RfTExWTQo+ICtjb21tZW50ICJpbWFnaW5hdGlvbiB2dWxrYW4gZHJpdmVyIG5l
ZWRzIGhvc3QgZ2NjID49IDciCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xMVk1fQVJDSF9T
VVBQT1JUUwo+ICsJZGVwZW5kcyBvbiAhQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzcKPiAgCj4gIGNv
bmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9JTlRFTAo+ICAJYm9vbCAiVnVs
a2FuIEludGVsIGRyaXZlciIKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180
IHx8ICFCUjJfUEFDS0FHRV9YT1JHNyAjIGxpYnhzaG1mZW5jZQo+ICAJZGVwZW5kcyBvbiBCUjJf
VE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfM18xNyAjIG1lbWZkLmgKPiAgCWRlcGVuZHMgb24g
QlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDICMgaWZ1bmMsIHN0YXRpY19hc3NlcnQKPiAtCWRlcGVu
ZHMgb24gQlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk0KPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0Vf
TExWTV9BUkNIX1NVUFBPUlRTICMgaG9zdC1sbHZtCj4gKwlkZXBlbmRzIG9uIEJSMl9IT1NUX0dD
Q19BVF9MRUFTVF83ICMgaG9zdC1sbHZtCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX05F
RURTX1BSRUNPTVBfQ09NUElMRVIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FO
X0RSSVZFUgo+ICAJaGVscAo+ICAJICBWdWxrYW4gZHJpdmVyIGZvciBJbnRlbCBoYXJkd2FyZSBm
cm9tIEl2eSBCcmlkZ2Ugb253YXJkLgo+ICAKPiAtY29tbWVudCAiaW50ZWwgdnVsa2FuIG5lZWRz
IGxsdm0iCj4gLQlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9NRVNBM0RfTExWTQo+IC0KPiAtY29t
bWVudCAiaW50ZWwgdnVsa2FuIG5lZWRzIGEgZ2xpYmMgdG9vbGNoYWluIHcvIGhlYWRlcnMgPj0g
My4xNyIKPiArY29tbWVudCAiaW50ZWwgdnVsa2FuIGRyaXZlciBuZWVkcyBhIGdsaWJjIHRvb2xj
aGFpbiB3LyBoZWFkZXJzID49IDMuMTcsIGhvc3QgZ2NjID49IDciCj4gIAlkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fSEFTX1NZTkNfNCB8fCAhQlIyX1BBQ0tBR0VfWE9SRzcKPiArCWRlcGVuZHMg
b24gQlIyX1BBQ0tBR0VfTExWTV9BUkNIX1NVUFBPUlRTCj4gIAlkZXBlbmRzIG9uICFCUjJfVE9P
TENIQUlOX0hFQURFUlNfQVRfTEVBU1RfM18xNyB8fCBcCj4gLQkJIUJSMl9UT09MQ0hBSU5fVVNF
U19HTElCQwo+ICsJCSFCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMgfHwgIUJSMl9IT1NUX0dDQ19B
VF9MRUFTVF83Cj4gIAo+ICBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJf
UEFORlJPU1QKPiAgCWJvb2wgIlZ1bGthbiBwYW5mcm9zdCBkcml2ZXIiCj4gIAlkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fSEFTX1NZTkNfNCB8fCAhQlIyX1BBQ0tBR0VfWE9SRzcgIyBsaWJ4c2ht
ZmVuY2UKPiAtCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk0KPiArCWRlcGVuZHMg
b24gQlIyX1BBQ0tBR0VfTExWTV9BUkNIX1NVUFBPUlRTICMgaG9zdC1sbHZtCj4gKwlkZXBlbmRz
IG9uIEJSMl9IT1NUX0dDQ19BVF9MRUFTVF83ICMgaG9zdC1sbHZtCj4gIAlzZWxlY3QgQlIyX1BB
Q0tBR0VfTExWTV9SVFRJIGlmIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCj4gIAlzZWxlY3QgQlIy
X1BBQ0tBR0VfTUVTQTNEX05FRURTX1BSRUNPTVBfQ09NUElMRVIKPiAgCXNlbGVjdCBCUjJfUEFD
S0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUgo+ICAJaGVscAo+ICAJICBWdWxrYW4gcGFuZnJvc3Qg
ZHJpdmVyLgo+ICAKPiAtY29tbWVudCAicGFuZnJvc3QgdnVsa2FuIG5lZWRzIGxsdm0iCj4gLQlk
ZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9NRVNBM0RfTExWTQo+ICtjb21tZW50ICJwYW5mcm9zdCB2
dWxrYW4gZHJpdmVyIG5lZWRzIGhvc3QgZ2NjID49IDciCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX0xMVk1fQVJDSF9TVVBQT1JUUwo+ICsJZGVwZW5kcyBvbiAhQlIyX0hPU1RfR0NDX0FUX0xF
QVNUXzcKPiAgCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9TV1JB
U1QKPiAgCWJvb2wgIlZ1bGthbiBzd3Jhc3QgZHJpdmVyIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L21lc2EzZC9tZXNhM2QubWsgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPiBpbmRleCA4Yzc4
MTY3Njg1Li43NzllYTlmMTExIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5t
awo+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+IEBAIC0xODEsNyArMTgxLDcgQEAg
ZW5kaWYKPiAgCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX05FRURTX1BSRUNPTVBfQ09N
UElMRVIpLHkpCj4gIE1FU0EzRF9DT05GX09QVFMgKz0gLURtZXNhLWNsYz1zeXN0ZW0gLURwcmVj
b21wLWNvbXBpbGVyPXN5c3RlbQo+IC1NRVNBM0RfREVQRU5ERU5DSUVTICs9IGhvc3QtbWVzYTNk
IHNwaXJ2LWxsdm0tdHJhbnNsYXRvciBzcGlydi10b29scwo+ICtNRVNBM0RfREVQRU5ERU5DSUVT
ICs9IGhvc3QtbWVzYTNkCgpJcyBzcGlydi1sbHZtLXRyYW5zbGF0b3Igc3BpcnYtdG9vbHMgbmVl
ZHMgdG8gYmUgYWRkZWQgZWxzZXdoZXJlPwoKc2VlICJ2dWxrYW4gaW50ZWwgbmVlZHMgbGx2bSIK
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9lODkz
YTcwZTEyMzYxYzU3ZDUzYzFjN2VkZDQxZmZiMDg1NTUzZmQyCgo+ICBlbmRpZgo+ICAKPiAgaWZl
cSAoJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUiksKQo+IEBAIC0zNTAsNiArMzUw
LDEyIEBAIEhPU1RfTUVTQTNEX0NPTkZfT1BUUyA9IFwKPiAgCS1EZ2x4PWRpc2FibGVkIFwKPiAg
CS1EdnVsa2FuLWRyaXZlcnM9IiIKPiAgCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTExWTV9SVFRJ
KSx5KQo+ICtIT1NUX01FU0EzRF9DT05GX09QVFMgKz0gLURjcHBfcnR0aT10cnVlCj4gK2Vsc2UK
PiArSE9TVF9NRVNBM0RfQ09ORl9PUFRTICs9IC1EY3BwX3J0dGk9ZmFsc2UKPiArZW5kaWYKPiAr
CgpJcyBpdCByZWxhdGVkIHRvIHByZWNvbS1jb21waWxlciBjaGFuZ2U/CgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gIEhPU1RfTUVTQTNEX0RFUEVOREVOQ0lFUyA9IFwKPiAgCWhvc3QtbGliY2xj
IFwKPiAgCWhvc3QtbGliZHJtIFwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
