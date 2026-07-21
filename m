Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4C1C4452D
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F779608B3;
	Tue, 21 Jul 2026 20:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydvlC_nHDe6o; Tue, 21 Jul 2026 20:42:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98C4A608AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784666559;
	bh=wCTkXWjdJ6dvgpBBE79LR3n2pM8BDiZeUZXNwGtXijA=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=UanKFMCgwpz0tG8fC3qGWeaaqxCIR8rFqWOi7p5lLIAgrsHb5PzW8roMl79JJTTce
	 83OqeUduXBcPRqvSgxvE+374lXcVTZFC/dFj7OPDR+11A0xKRPOGgRkMjC/xppXAMT
	 b6fwyfy7FeX8yT7U4XpK0avZYGI9CruzP98q5E6h0acXT1ZN6B/zIjjbnzrvbLW1Za
	 cKpeVLEFgj2w8b2vHGJF/x/FX6hW1DsrC38gGvpYxCuJNT94966u9vVlDQ2s/wnN/i
	 jo2s5TVqJuDWY2h7X1ylISY1uEJFGbTa2/8qYzKjVaeD+CXg+aMGr2RCSgW1K/CUNQ
	 kCTJCNmT8cTOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98C4A608AC;
	Tue, 21 Jul 2026 20:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 304349E5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ED5A80EC8
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSbWHoAXeukK for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:42:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 485C980EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 485C980EC5
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 485C980EC5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:42:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4954a9e8490so23549485e9.1
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 13:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784666555; x=1785271355;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:reply-to:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=25mvgIHtUcZY55ALGFUImNF4VZ25yixgo+8sNK9FIiI=;
 b=hEhFEsFXStQ9dsYwW1AYoXER7bl8Hg/OaysbdjRJC4CtuGVu8/V/QwRdV2SrHy+BXY
 7FIG8NKgpK7uFtpldIB5AeRfA0tTVfEuxDy/9cI05Tyivj5sW7sAYEfYKUwg9ultLW6P
 oaBQboJ1VxonZFym8JQk+TvIP+l1e1u50OxMmDR61RpHmVEPHMC9sUNNxuCoC/GVzejB
 U8eHbG0KJ5rgwBE0zTzxGtnK/F23yAr8hDnLLjmLGE+1NOSg4qDsKWXEuROe56iRLKIU
 GImU9buYzLVYjvqveZxN4VOf4D6sL+JkcPzcHKoqIfR0KrBFTijOfb0Rg20vMkhjQjlq
 fKQA==
X-Gm-Message-State: AOJu0YwiY4/fWn1+RxUXSoZBwkHo5CeH7W0YJL+mGqMQxNJCBWe5ZPIU
 djB2SBF3E9bXo3hGQnkl21G86GPiXj2CmtIHpn3W+uBUnz6cHqSBqquN
X-Gm-Gg: AfdE7clF97uT6vyUSuwPOfLTnh7yNycUuFO7uztJ12MNMGjV00S0hCkBTTcCV/mq9kA
 4FsRNXOO5ClEnNLo8ry0vm8gJw159CQe/GNCuylgRerd2iZ8pJWA8ax/7hRhh5Hs0nBwDlrLjys
 lCnbd+3vmLIjhED+dD2z6vCQiPBYuojGQR3mnFn8odar9nlHmwdtIvBIMZsgJu0NYfpSmQSoWRp
 WWmr7Rftvlqtto7mshlbwEAD78y6yI/+DpatEIqMpx9SHQlyyDjBK813Mx6v9NKHGLKYB7TYfpQ
 0Z6qXnI4vluof8TP8Q1Cc1PaqYm7Yf2amF7pMQA4+IQnsOMq2q2zAhpL1JcukGJ7ka8QN0gx2vL
 ZMm6cn4ILHD4Mh8UAWgxgqCDS2LyNFJpLH9fvlWEJsI65Okj2gBwjw+DfWqZ50DU/DCF+UioVYQ
 7T1wUVoCk4Gqn3uUgnDkJHhbJf9Zw34u6OAXxcgbI=
X-Received: by 2002:a05:600c:35c5:b0:495:501a:fcf8 with SMTP id
 5b1f17b1804b1-4956a4f6595mr13188185e9.9.1784666555187; 
 Tue, 21 Jul 2026 13:42:35 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a4f25b6sm17882685e9.2.2026.07.21.13.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 13:42:34 -0700 (PDT)
Date: Tue, 21 Jul 2026 22:42:26 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20260721204226.GA23326@pevik>
References: <20260721125337.2537436-1-dario.binacchi@amarulasolutions.com>
 <20260721125337.2537436-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260721125337.2537436-2-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784666555; x=1785271355; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:reply-to:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=25mvgIHtUcZY55ALGFUImNF4VZ25yixgo+8sNK9FIiI=;
 b=jtXXF76/5zMyYSQdP2XfMLsOedc+mfiKvOqH5Lv6uPeyEG81ENTU7aTtfNVGxcFS6B
 P+SGa7b5gwptWhfdY9NK1Kj734KHASENmtZODSOdtueAf6fgA/fhmufPWp7ofEsDydLr
 ghiptAFw5/4zchVkrTOGB0fG4Pp1qPMWla/lKKgc0tTOXP5bF8Ql47XyC0LCmW+ES0si
 fFMOhdKGMwkAdmD49poh5+avVFELnHN4YqlU56bIR+b4a3AFqpN8wxC5/jo8f/d6nqAI
 xkroLYqD1QPMxjLAwhZfErkYKnSMXuhA2crS1I+EkugIdOjyzjW7wxDkPPYQiOGPeiFS
 lpXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jtXXF76/
Subject: Re: [Buildroot] [PATCH v4 2/3] package/util-linux: libuuid needs MMU
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Chen Pei <cp0613@linux.alibaba.com>, Gao Xiang <hsiangkao@aol.com>,
 Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>,
 Bernd Kuhls <bernd@kuhls.net>, Alistair Francis <alistair@alistair23.me>,
 =?iso-8859-2?Q?Jos=E9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Brandon Maier <brandon.maier@collins.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgo+IFdoZW4gYnVpbGRpbmcgdXRpbC1saW51eCB3aXRoIGxpYnV1aWQgZW5hYmxl
ZCBvbiBub01NVSB0YXJnZXRzCj4gKGUuZy4sIGJvb3RsaW4tYXJtdjdtLXVjbGliYyBvciBib290
bGluLW02OGstNTIwOC11Y2xpYmMpLCB0aGUgYnVpbGQKPiBmYWlscyB3aXRoIHRoZSBmb2xsb3dp
bmcgZXJyb3I6Cgo+IGxpYnV1aWQvc3JjL2dlbl91dWlkLmM6IEluIGZ1bmN0aW9uIOKAmHV1aWRf
Z2VuZXJhdGVfdGltZV9nZW5lcmlj4oCZOgo+IGxpYnV1aWQvc3JjL2dlbl91dWlkLmM6NjI5OjE3
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcHRocmVhZF9hdGZv
cmvigJk7IGRpZCB5b3UgbWVhbiDigJhwdGhyZWFkX2pvaW7igJk/IFstV2ltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQo+ICAgNjI5IHwgICAgICAgICAgICAgICAgIHB0aHJlYWRfYXRmb3Jr
KE5VTEwsIE5VTEwsIHJlc2V0X3V1aWRkX2NhY2hlKTsKPiAgICAgICB8ICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fgo+ICAgICAgIHwgICAgICAgICAgICAgICAgIHB0aHJlYWRfam9pbgoK
PiBUaGlzIGhhcHBlbnMgYmVjYXVzZSBwdGhyZWFkX2F0Zm9yaygpIGlzIG5vdCBhdmFpbGFibGUg
b24gbm9NTVUKPiBjb25maWd1cmF0aW9ucyBhcyByZXBvcnRlZCBieSBjb21taXQgNTlmZTc1NDdh
NDk1ICgicGFja2FnZS9saWJjYXAtbmc6Cj4gZGlzYWJsZSBwdGhyZWFkIHN1cHBvcnQgb24gbm9t
bXUiKS4KCj4gRml4IHRoaXMgYnkgYWRkaW5nIGEgZGVwZW5kZW5jeSBvbiBCUjJfVVNFX01NVSB0
byBsaWJ1dWlkLiBBcyBhCj4gY29uc2VxdWVuY2UsIGFsc28gcHJvcGFnYXRlIHRoZSBCUjJfVVNF
X01NVSBkZXBlbmRlbmN5IHRvIGFsbCBwYWNrYWdlcwo+IHNlbGVjdGluZyBCUjJfUEFDS0FHRV9V
VElMX0xJTlVYX0xJQlVVSUQgdG8gcHJldmVudCAidW5tZXQgZGlyZWN0Cj4gZGVwZW5kZW5jaWVz
IiBLY29uZmlnIGVycm9ycy4KCkxHVE0uCgpSZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8cGV0ci52
b3JlbEBnbWFpbC5jb20+CgpLaW5kIHJlZ2FyZHMsClBldHIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
