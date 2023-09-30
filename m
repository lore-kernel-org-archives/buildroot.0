Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B820E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C132682345;
	Sat, 30 Sep 2023 13:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C132682345
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPPWhBFmcQ1A; Sat, 30 Sep 2023 13:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E072E83CF8;
	Sat, 30 Sep 2023 13:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E072E83CF8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 108161BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED77E60E7C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED77E60E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Df_vIwdjdoib for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:48:21 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB4FF60E09
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB4FF60E09
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-406618d0991so11992055e9.2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 06:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696081699; x=1696686499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CchdBp+2lRjxtqUPeQB14j5PtlXChoywcyGR3MmT6uo=;
 b=iGu/5qfAAzm+cg+RSA/hewdf1x1Ksi6aPpA0wk6GjYAttrZI7R+jF7+0W9y8kKXfdS
 bInAraMoXDlhYFUUklGRRwmrBNAAFL9fKqdch8rzE4Kyhnfnud3gLXdaU5nr3KwsyriP
 QxUzkDrzMeNcHm/hfev6HONtQLziKqskTsNfjRZir11x+HkCpP+elMfWAFcbl9Wrnl+W
 zMt2m/+rKudo0DPau76SIvTVyevphO4vt76hxCwdv9B8Ukt81z8R3HzVEntj8upDTzZ3
 oW1AJTiAlNLTBjSc+g1INZM8MAzk4bLtc3aCuGH8dNMVV8JfrbF8EcVtBdNHl8Q8LSO4
 8uiQ==
X-Gm-Message-State: AOJu0YzImbDoSQFTVvK+az0alnee2oKfkKzoqPy4zEImoWpc7wH2bd/F
 pdb85JwdLls7FY51xkBzEUWcOg==
X-Google-Smtp-Source: AGHT+IFo4LrVGUsfcdBi76meGZ1mczsopxfFtin7kJl9hg+KDoIsRiPde8AH6GyPZ8AdYCWz6IbkAg==
X-Received: by 2002:a05:600c:2948:b0:405:3f06:c07e with SMTP id
 n8-20020a05600c294800b004053f06c07emr5853026wmd.15.1696081698715; 
 Sat, 30 Sep 2023 06:48:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6?
 (2a01cb0404ad0b000ca75da681015ca6.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a05600c224600b00403b63e87f2sm3452254wmm.32.2023.09.30.06.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 06:48:18 -0700 (PDT)
Message-ID: <84355820-ddf7-0d0a-1a02-d7d6ac8f3d69@smile.fr>
Date: Sat, 30 Sep 2023 15:48:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: fr, en-US
To: Peter Korsgaard <peter@korsgaard.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20230911210917.1114974-1-romain.naour@gmail.com>
 <87edigg4hb.fsf@48ers.dk>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <87edigg4hb.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696081699; x=1696686499;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CchdBp+2lRjxtqUPeQB14j5PtlXChoywcyGR3MmT6uo=;
 b=BDNbRfI5imo7uSEDQoQZDnSUMsirQw1K0dMvw2WRc+hBMcGlYhHLGRGvxLUWCBU+ig
 EoSfSj1E59P5Ej47bSPCfxBHxQoB6hIEDgqsN/D1yUjdGv0GfqjpGwIoxyUyVpA+ro16
 2Abf+JuztmZBeNs0ZAmq+Vm0vl+JLUE/qfMWOS06PeQPGyIi2swDjQN7saEl+K6xmS4k
 3hjbzryyqkltr3sLt6J/tr04nwld7XCqr1f9WsDdNCuaRWL4diUWyubnI3PKnYHWQTNZ
 VsZICWX/G/Y08r92oWxH9gRflAb0m4EWLjhZ0DWPbwgmeXH0wBUo7sR3KHQBwutzTYiS
 73OA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=BDNbRfI5
Subject: Re: [Buildroot] [PATCH 1/2] package/{glibc,
 localedef}: bump to version
 2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSAyOS8wOS8yMDIzIMOgIDIxOjMyLCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPj4+Pj4+ICJSb21haW4iID09IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdt
YWlsLmNvbT4gd3JpdGVzOgo+IAo+ICA+IEVuYWJsZSBtYXRodmVjIGV4cGxpY2l0ZWx5IG9uIGFh
cmNoNjQoYmUpIHNpbmNlIGl0J3Mgbm93IGVuYWJsZWQgYnkKPiAgPiBkZWZhdWx0IFsxXS4gYWFy
Y2g2NCBtYXRodmVjIHJlcXVpcmVzIGF0IGdjYy0xMCBidXQgQnVpbGRyb290IGFscmVhZHkKPiAg
PiBwcm92aWRlIGdjYy0xMSBhcyBtaW5pbXVtIHZlcnNpb24uCj4gCj4gID4gRG9uJ3QgdXNlIC0t
ZW5hYmxlLWZvcnRpZnktc291cmNlIGZvciBub3cgaW4gb3JkZXIgdG8ga2VlcCBvcmlnaW5hbAo+
ICA+IGJlaGF2aW9yIHdoaWxlIGRvaW5nIHRoZSBnbGliYyB2ZXJzaW9uIGJ1bXAgKGFuZCBiZWNh
dXNlIHNvbWUKPiAgPiBhcmNoaXRlY3R1cmUgZG9lc24ndCBzdXBwb3J0IHdlbGwgZm9ydGlyeS1z
b3VyY2UsIGkuZSBNaWNyb2JsYXplKS4KPiAgPiBQb3N0cG9uZSB0aGlzIGNoYW5nZSB0byBhIGZv
bGxvdyB1cCBjb21taXQuCj4gCj4gID4gS2VlcCB0aGUgImRlcHJlY2F0ZWQiIGxpYmNyeXB0IGVu
YWJsZWQganVzdCBpbiBjYXNlIGlmIHNvbWUKPiAgPiBhcHBsaWNhdGlvbiBhcmUgbm90IHlldCBy
ZWFkeSB0byB1c2UgYW4gYWx0ZXJuYXRpdmUgc3VjaCBhcyBsaWJ4Y3J5cHQuCj4gCj4gID4gU2Vj
dXJpdHkgcmVsYXRlZCBjaGFuZ2VzOgo+IAo+ICA+ICAgQ1ZFLTIwMjMtMjUxMzk6IFdoZW4gdGhl
IHByaW50ZiBmYW1pbHkgb2YgZnVuY3Rpb25zIGlzIGNhbGxlZCB3aXRoIGEKPiAgPiAgIGZvcm1h
dCBzcGVjaWZpZXIgdGhhdCB1c2VzIGFuIDxhcG9zdHJvcGhlPiAoZW5hYmxlIGdyb3VwaW5nKSBh
bmQgYQo+ICA+ICAgbWluaW11bSB3aWR0aCBzcGVjaWZpZXIsIHRoZSByZXN1bHRpbmcgb3V0cHV0
IGNvdWxkIGJlIGxhcmdlciB0aGFuCj4gID4gICByZWFzb25hYmx5IGV4cGVjdGVkIGJ5IGEgY2Fs
bGVyIHRoYXQgY29tcHV0ZWQgYSB0aWdodCBib3VuZCBvbiB0aGUKPiAgPiAgIGJ1ZmZlciBzaXpl
LiAgVGhlIHJlc3VsdGluZyBsYXJnZXIgdGhhbiBleHBlY3RlZCBvdXRwdXQgY291bGQgcmVzdWx0
Cj4gID4gICBpbiBhIGJ1ZmZlciBvdmVyZmxvdyBpbiB0aGUgcHJpbnRmIGZhbWlseSBvZiBmdW5j
dGlvbnMuCj4gCj4gSXQgd291bGQgaGF2ZSBiZWVuIGhhbmR5IHRvIGZpcnN0IGJ1bXAgdG8gdGhl
IDIuMzcueCB2ZXJzaW9uIGZpeGluZyB0aGlzCj4gaXNzdWUgZm9yIGVhc3kgYmFja3BvcnRpbmcs
IGJ1dCBPSyAtIEkgd2lsbCBkbyBpdCBzZXBhcmF0ZWx5LgoKUHJldmlvdXMgR2xpYmMgcmVsZWFz
ZSBhcmUgc3RpbGwgbWFpbnRhaW5lZCBzbyB3ZSBwcm9iYWJseSBoYXZlIHRvIHNlbmQgcGF0Y2hl
cwpkaXJlY3RseSBmb3IgQnVpbGRyb290IHN0YWJsZSByZWxlYXNlLgoKQmVzdCByZWdhcmRzLApS
b21haW4KCgo+IAo+ICA+IFNlZToKPiAgPiBodHRwczovL2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9o
dG1sL2luZm8tZ251LzIwMjMtMDcvbXNnMDAwMTAuaHRtbAo+IAo+ICA+IFJ1bnRpbWUgdGVzdGVk
IHdpdGggUWVtdSBvbiBHaXRsYWItY2k6Cj4gID4gaHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9i
dWlsZHJvb3QvLS9waXBlbGluZXMvOTk4NDM1MjAzCj4gID4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvdG9vbGNoYWlucy1idWlsZGVyLy0vcGlwZWxpbmVzLzk5ODkyNjAyOAo+IAo+
ICA+IFsxXSBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1nbGliYy5naXQ7YT1jb21taXQ7
aD1jZDk0MzI2YTEzMjZjNGUzZjFlZTdhOGQwYTE2MWNjMGJkY2FmMDdlCj4gCj4gID4gU2lnbmVk
LW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IAo+IENvbW1p
dHRlZCwgdGhhbmtzLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
