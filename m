Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CF3E87834
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 922E7605CE;
	Tue,  3 Feb 2026 14:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHmMdn2HAaWV; Tue,  3 Feb 2026 14:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A92605D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770129198;
	bh=EL8T+dM39gLTgwvZ1cVwwYOWCmMInQfKDBaHZguqAtg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=HsYQiQnpdMCh59TLi10ALubajyY8kakWN911DHAWagGYJw4/CrlYaxC13YtVkXDQU
	 tZu5d4pFIDd+pr0H6vadEzQR1y4h2BZnsox8kf/x9YLmkB6b6jEyq8yDU2mtDpxpod
	 UA6lnyme7RzODG0W0N1oGaGiEiwFR6vG+2kdMiiZKPr/+ruhzwbJprc6a2LYreRyOD
	 gRnB6TvRFl0UwV+sABWoEsEYRgPobA/bwE3KZXGmcVTV6Zc2W/JhCxhq/yK8VknaCT
	 irS3sc/viYKM/S0ndpNJ8DNOqj+yu5+YVVttLeYF2ZpMrd4fTkfq/lvsnH4sa54Yf7
	 hxzGcEvsc6Xaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4A92605D2;
	Tue,  3 Feb 2026 14:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4895F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 971FB605D2
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqqhxbbjx-w6 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:33:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95330605CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95330605CE
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95330605CE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:33:15 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so76340795e9.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 06:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770129193; x=1770733993;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IpwzEEw+wkoy8ajXBApkpnzzVsqeTSrWlT5PEoABvqU=;
 b=fGxMw44Rp4ikQ0QInsOACL6VKqvqdltX/QoSdb41MVcG6LRxzaHJJTz1yfLdDnBkgd
 v9YBnUDFI1cMDlkFlpY80Q/jPH/6JgRDIwX8+Q7gHFCXUiz6Ti/26NJUAc1TeaUVNXjo
 ZlaY0iYmszbGy5X6gHaTZckQR1TLeUUrNonHtrEXfuutgYnQvxWMtnYozk5eDBKrYa9Z
 Kf7eucrkUGbVY2J0zevpc7FneQuJSADp/yWnvyN8j4QX3/y+yh1xUgC6P6W54xIZR5/R
 Xkr1HTZpjFXO6kec/nt2kGuzDHYpB6MXXKlI51zvxkelF2KnM0354WXQ2UAjWYvPxP45
 E+NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH8UvzIyGUTx74tkxeqRP1B/F46q121iZ6O5WrcmAbX3JP5QOsNFCqIr9iPa6n6mY7ajc4vo99YJM=@buildroot.org
X-Gm-Message-State: AOJu0YyGj93V5GRd7dmWs6F88h42mNAkFjYx8wpQa0EsPc19RSfW6oRA
 aSoovIwxw5CxwEVZHpBDrYZI8iLHr8d5mYTW3RUKPuOwuQB0HD3tKnM8WMJay7ARprQ=
X-Gm-Gg: AZuq6aKIQMn8daL6/9CID9pMFXezkbas7jCr9lJELu8LiblDGR0+seevuyg+je7QHEG
 zLkvQ6LCI9lUeNC/EEYZH+JHNPu2DlBb9r799RWe/FDsXHmXmzI11KPFwx+AvX505+onXcaLJJM
 WeSTIbt0c5FlnECUp/FeWT2G8mekRmY55HocjIgENEMQzspw1cH5E/jRZI6UerQu7OrwkYXBQ4m
 nxHLTxa2/1Zy9sNisDiO8m5dLTDvvu4RpAQuXGcvhgLBqCOp1ax90r8Fgtg/C2iV8Ikz2yjeYSv
 DJye856FEd22JyYuWZEh88sFCjZwMLbfF6jmvvTkJCEagofrV2CYg7V97NvvPXpoV+9N6zwWWa7
 HsO2efrWB2oAjIUpaGp31EublI4W8gT4S7J8ejdBvCS1SE869VbRbe/fhNtmxhrSIX2l7LOBPl8
 0EYmZM/Vpo4f5qqZN2jFBoxp1UJRgPqADfdATGvutxrXjx0ZfaZF3p
X-Received: by 2002:a05:600c:8a0a:20b0:482:f564:d60f with SMTP id
 5b1f17b1804b1-482f564d64amr97737215e9.15.1770129193476; 
 Tue, 03 Feb 2026 06:33:13 -0800 (PST)
Received: from [172.16.2.208] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482e04d168bsm120175505e9.6.2026.02.03.06.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 06:33:13 -0800 (PST)
Message-ID: <70296fed-d693-4b74-878e-6ea9516d2e13@smile.fr>
Date: Tue, 3 Feb 2026 15:33:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot Notifications <buildroot.notifications@gmail.com>,
 buildroot@buildroot.org
References: <69798de3.050a0220.10c4f0.eab1@mx.google.com>
Content-Language: fr, en-US
In-Reply-To: <69798de3.050a0220.10c4f0.eab1@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770129193; x=1770733993; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IpwzEEw+wkoy8ajXBApkpnzzVsqeTSrWlT5PEoABvqU=;
 b=2PqoyjxMfpEciakPNx5UB+3TwyriSfr5EcOV2y0p6JIvIG6HDFno0kAkdnO9UbAA6z
 RsrsiVIt7VWprgJQk1mVkRkOZSfyHtFrfNNwHuK2L8Y+oUusFvd6xH5PCV3TU2IqQNSP
 xvex18vNt7SvoRY3RlNeQBF9MM7pCnzm436uo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=2PqoyjxM
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-01-27
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

SGkgQWxsLAoKTGUgMjgvMDEvMjAyNiDDoCAwNToxNywgQnVpbGRyb290IE5vdGlmaWNhdGlvbnMg
YSDDqWNyaXTCoDoKPiBIZWxsbywKPiAKPiAKPiBHaXRsYWIgQ0kgcmVzdWx0cyBmb3IgMjAyNi0w
MS0yNwo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gCj4gRGV0YWlsIG9mIHJ1
bnRpbWUtdGVzdCBmYWlsdXJlcyBmb3IgbWFzdGVyCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gICAgICAgICAgICAgIHJ1bnRpbWUtdGVzdCB8ICAgICAg
ICAgICAgICAgICAgICAgICAgbGluayB0byB0aGUgam9iICAgICAgICAgICAgICAgICAgICAgICAg
fCBvcnBoPwo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0KCj4gICBU
ZXN0Tm9kZUpTTW9kdWxlSG9zdFNyYyB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2pvYnMvMTI4NTc0MTM3NjYgfCAgICAgIAo+ICAgVGVzdE5vZGVKU01vZHVs
ZUhvc3RCaW4gfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9q
b2JzLzEyODU3NDEzNzY1IHwgICAgICAKPiAgICAgICAgICAgVGVzdE5vZGVKU0Jhc2ljIHwgaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjg1NzQxMzc2
NCB8ICAgICAgCgpJJ20gbm90IHN1cmUgd2hhdCdzIGdvaW5nIG9uIGJ1dCB0aGUgY29tcGlsZXIg
Z290IGtpbGxlZCBieSB0aGUgc3lzdGVtOgoKICBhcm0tbGludXgtZysrLmJyX3JlYWw6IGZhdGFs
IGVycm9yOiBLaWxsZWQgc2lnbmFsIHRlcm1pbmF0ZWQgcHJvZ3JhbSBjYzFwbHVzCgoocmVwcm9k
dWNlZCBsb2NhbGx5KQoKQmVzdCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
