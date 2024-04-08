Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3413C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 21:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62B0640543;
	Mon,  8 Apr 2024 21:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXgrsZSk0Pti; Mon,  8 Apr 2024 21:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B57D405FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B57D405FC;
	Mon,  8 Apr 2024 21:38:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D71F1BF2A6
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5617B407FA
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 21:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwvu6T0LPsN6 for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 21:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F2E140707
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F2E140707
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F2E140707
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 21:38:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-343b92e54f5so3776649f8f.0
 for <buildroot@buildroot.org>; Mon, 08 Apr 2024 14:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712612290; x=1713217090;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=daqwrtVd+WBkDBV1cGW3HiOu1kpkCAp9plDrM1aPn3M=;
 b=Ssr2qJmO9npgeO/kuFeGYHNb97dMjiiJINCe/OiC3MA+kiv971rY2fNf4GW4B9FPOA
 YMQTkynNFTs/KGxRk80HUexipg2Y64tp98V2Bv6aAyo8h+DdKvcMCn1aZaVOOCobQ7Tx
 taHp3stRl0V9/g9sPn5WBnszH+BaJjiKfvvA8qDFNnCB4efs1ozGs3zNa+2BEljopD9V
 oNkCiUvGquP3/K6j3G6FIG3d6jobeZsUEIBHzkuQfKRxONQcuXf0pd+cswG+B5jNp7rm
 O6JRQCNRXEHgtO++tzMNtwk4l1nxD9mNSN8TJdc64qyVt02r1zFJySZ7diJMjV8UBmCY
 4dEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGd0jVnPlZPNIC5wPhxMcjCZTNyqX07uBes5j/y2dGA4FcZ1Vf8WEZ8Q4/IY/nh2OrBZDftgR3G3JbFH2cjWJuvkKhv6ni7g==
X-Gm-Message-State: AOJu0YwRfJ7K/VQHguH++XqetsYeMpDCOYDNCjY0KGVbNYatjXCODgmm
 o3ANfJIV8Hm//AYn4AVJasNiJilMtg3y8PAgUX+MbtY8ktuQECUn
X-Google-Smtp-Source: AGHT+IG2DOtshKfuoUSvC3SI1wnIpftoUJ59xOkSiRysIHlq5o2zu/AlPvhjOuJJY1kEHEbHqb9oKg==
X-Received: by 2002:a5d:6a43:0:b0:343:93dc:6255 with SMTP id
 t3-20020a5d6a43000000b0034393dc6255mr6311062wrw.27.1712612289878; 
 Mon, 08 Apr 2024 14:38:09 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 dr20-20020a5d5f94000000b0033ea499c645sm10040923wrb.4.2024.04.08.14.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 14:38:09 -0700 (PDT)
Date: Mon, 8 Apr 2024 23:38:07 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240408213807.GA44146@pevik>
References: <20240403121807.2087547-1-robimarko@gmail.com>
 <20240408223621.39b37892@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408223621.39b37892@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712612290; x=1713217090; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=daqwrtVd+WBkDBV1cGW3HiOu1kpkCAp9plDrM1aPn3M=;
 b=Udh7N0iVy3Hj3R8W/2WAYtXZKAO7jmSv6S9JziD+RrGGUhjAscxP4VyKIOqDYkfBq8
 yD4BTSi0iZmiO4JdR81gTH5DjDne0EI62SrDqsZ8PF51VBOvl6K8IrjVm6QbKF5ZRnIU
 CJ5/6/YcZVg+TPsAq3RKL4PhNqrHyx8twXP6OyxrtmQdaHOPRtiAlrxOgf6j8Ooo8bMj
 TNbAf3lQwswu2epz8tgkmvLtxYngqdQ2azfosFfjWpkUa2l8G/52DaXPUMG2lHKhEcAR
 XVGOb46tKYf1lsGDQ8lj2M4BUvwpQvZMUYqNTQhMceneBWe9ITRq5PcvZKRudS9l89yu
 /xpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Udh7N0iV
Subject: Re: [Buildroot] [PATCH 1/1] kconfig/lxdialog: fix check() with GCC14
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Robert Marko <robimarko@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9iZXJ0LCBUaG9tYXMsCgo+IEhlbGxvIFJvYmVydCwKCj4gT24gV2VkLCAgMyBBcHIgMjAy
NCAxNDoxODowNyArMDIwMAo+IFJvYmVydCBNYXJrbyA8cm9iaW1hcmtvQGdtYWlsLmNvbT4gd3Jv
dGU6Cgo+ID4gR0NDMTQgbm93IHRyZWF0cyBpbXBsaWNpdCBpbnQgdHlwZXMgYXMgZXJyb3Igc28g
d2hlbiBjaGVjaygpIGZyb20KPiA+IGNoZWNrLWx4ZGlhbG9nLnNoIGlzIGNhbGxlZCB0byBjaGVj
ayB3aGV0aGVyIHdlIGNhbiBsaW5rIGFnYWluc3QgbmN1cnNlcwo+ID4gaXQgd2lsbCBmYWlsIHNp
bGVudGx5IGFuZCB0aGUgaGVscCB0ZXh0IGluZGljYXRpbmcgdG8gaW5zdGFsbCBuY3Vyc2VzIGlz
Cj4gPiBwcmludGVkLgoKPiA+IEhvd2V2ZXIsIHRoaXMgaXMgbm90IGR1ZSB0byBtaXNzaW5nIG5j
dXJzZXMgYnV0IG9uY2UgdGhlIHN0ZGVyciByZWRpcmVjdAo+ID4gdG8gL2Rldi9udWxsIGlzIHJl
bW92ZWQgd2UgY2FuIHNlZSB0aGUgcm9vdCBjYXVzZToKPiA+IDxzdGRpbj46MjoxOiBlcnJvcjog
cmV0dXJuIHR5cGUgZGVmYXVsdHMgdG8g4oCYaW504oCZIFstV2ltcGxpY2l0LWludF0KCj4gPiBT
bywgaW4gb3JkZXIgZm9yIG1lbnVjb25maWcgdG8gd29yayB3aXRoIEdDQzE0IGxldHMganVzdCBz
cGVjaWZ5IHRoZQo+ID4gcmV0dXJuIHR5cGUgb2YgbWFpbigpIGFzIGludC4KCj4gPiBTaWduZWQt
b2ZmLWJ5OiBSb2JlcnQgTWFya28gPHJvYmltYXJrb0BnbWFpbC5jb20+Cgo+IFRoYW5rcyBhIGxv
dCBmb3IgdGhlIHBhdGNoLiBIb3dldmVyLCBtYWtpbmcgY2hhbmdlcyBpbiBzdXBwb3J0L2tjb25m
aWcvCj4gaW4gQnVpbGRyb290IHJlcXVpcmVzIGEgYml0IG1vcmUgY2FyZS4gSW5kZWVkLCB0aGlz
IGNvZGUgaXMgdGFrZW4gZnJvbQo+IHRoZSBMaW51eCBrZXJuZWwgY29kZSwgYW5kIHdlIHRyeSB0
byBrZWVwIGEgd2VsbC1kZWZpbmVkIGxpc3Qgb2YKPiBjaGFuZ2VzIG9uIHRvcCBvZiB0aGUgb3Jp
Z2luYWwgY29kZSBmcm9tIHRoZSBrZXJuZWwuCgo+IEFzIGV4cGxhaW5lZCBpbiBzdXBwb3J0L2tj
b25maWcvUkVBRE1FLmJ1aWxkcm9vdCwgdGhlIGN1cnJlbnQgY29kZSBpbgo+IHN1cHBvcnQva2Nv
bmZpZy8gaXMgdGFrZW4gZnJvbSBMaW51eCA0LjE3LXJjMiwgb24gdG9wIG9mIHdoaWNoIHRoZQo+
IHBhdGNoZXMgaW4gc3VwcG9ydC9rY29uZmlnL3BhdGNoZXMvIGhhdmUgYmVlbiBhcHBsaWVkLgoK
SSdtIHNvcnJ5IGZvciBhIHdyb25nIHJldmlldywgSSBjb21wbGV0ZWx5IGZvcmdldCBCdWlsZHJv
b3QgdXNlcyBwYXRjaGVzCmFsc28gZm9yIGtjb25maWcuCgo+IFNvIGZyb20gdGhpcywgeW91IGhh
dmUgdHdvIG9wdGlvbnM6Cgo+ICgxKSBBZGQgYSBuZXcgcGF0Y2ggaW4gc3VwcG9ydC9rY29uZmln
L3BhdGNoZXMvIHdoaWNoIGltcGxlbWVudHMgdGhlCj4gICAgIGNoYW5nZSB5b3UgbmVlZCBmb3Ig
R0NDMTQgY29tcGF0aWJpbGl0eQoKPiAoMikgVXBkYXRlIHRoZSBjb2RlIGluIHN1cHBvcnQva2Nv
bmZpZy8gdG8gdGhlIGxhdGVzdCBjb2RlIGF2YWlsYWJsZSBpbgo+ICAgICB0aGUgTGludXgga2Vy
bmVsIHNjcmlwdHMva2NvbmZpZyBkaXJlY3RvcnksIHJlYmFzZSBvdXIgcGF0Y2hlcywgYW5kCj4g
ICAgIHZlcmlmeSBpdCBhbGwgd29ya3MuCgo+IE9idmlvdXNseSwgKDEpIGlzIHRoZSBlYXNpZXN0
IHBhdGguICgyKSBpcyBuaWNlciBsb25nIHRlcm0sIGFzIHdlCj4gYmVuZWZpdCBmcm9tIGFsbCBu
ZXcgZmVhdHVyZXMvZml4ZXMgYWRkZWQgYnkgdGhlIExpbnV4IGtlcm5lbAo+IGRldmVsb3BlcnMu
IFR1cm5zIG91dCB0aGF0IGluIHRoZSB1cHN0cmVhbSBrZXJuZWwsIHRoZQo+IGNoZWNrLWx4ZGlh
bG9nLnNoIHNjcmlwdCBoYXMgYmVlbiByZW1vdmVkIGFuZCByZXBsYWNlZCBieSBzb21ldGhpbmcK
PiBkaWZmZXJlbnQsIHdoaWNoIG5vIGxvbmdlciBoYXMgdGhpcyBtYWluKCkgZnVuY3Rpb24gZGVm
aW5pdGlvbi4KCkZZSSBJIGdhdmUgdXAga2NvbmZpZyB1cGRhdGUgYWZ0ZXIgYmlnIHJld3JpdGVz
IGluIHRoZSBMaW51eCBrZXJuZWwKbWFkZSBieSBNYXNhaGlybyBZYW1hZGEgKHRoZSBuZXcga2J1
aWxkIGFuZCBrY29uZmlnIG1haW50YWluZXIpLCBiZWNhdXNlIHRoZQpjb2RlIGNoYW5nZXMgd2Vy
ZSBxdWl0ZSBiaWcgYnV0IGtjb25maWcgaW4gQnVpbGRyb290IGlzIElNSE8gbm90IG1pc3Npbmcg
YW55CnNpZ25pZmljYW50IHVzYWJpbGl0eSBmdW5jdGlvbi4gQnV0IEkgY2FuIGJlIHdyb25nLCBU
aG9tYXMgbGV0IG1lIGtub3cgaWYgeW91Cm1pc3Mgc29tZXRoaW5nIHNpZ25pZmljYW50IHdoaWNo
IHdvdWxkIGp1c3RpZnkgdGhlIHVwZGF0ZS4gT2J2aW91c2x5IHdlIHdvdWxkCmdldCBzb21lIGZp
eGVzLCBidXQgYWxzbyBtYWpvciByZXdyaXRlLCB3aGljaCB3b3VsZCBsaWtlbHkgcmVxdWlyZSBj
aGFuZ2VzIGluCm90aGVyIHBhcnRzIG9mIEJ1aWxkcm9vdC4KCmNoZWNrLWx4ZGlhbG9nLnNoIHdh
cyByZW1vdmVkIGluIDFjNWFmNWNmOTMwOCAoImtjb25maWc6IHJlZmFjdG9yIG5jdXJzZXMKcGFj
a2FnZSBjaGVja3MgZm9yIGJ1aWxkaW5nIG1jb25mIGFuZCBuY29uZiIpIGluIHY0LjE4LCBidXQg
bWFqb3IgcmV3cml0ZSBjb21lCmluIDQuMTkgYW5kIDUuMCArIGtidWlsZCB1cGRhdGVzIGluIDUu
MSwgY2hhbmdlcyBjb250aW51ZSBpbiA1LjEwLCA1LjEzLCBsYXRlcgpmaXhlcyBpbiA2Lngga2Vy
bmVscy4uLgoKU29tZSBvZiB0aGVzZSBjaGFuZ2VzIG1vdmVkIHN0b3JpbmcgdG9vbGNoYWluIGNh
cGFiaWxpdGllcyBpbiAuY29uZmlnICh3aGlsZQpCdWlsZHJvb3QgdXNlcyBkb2VzIHNvbWV0aGlu
ZyBzaW1pbGFyLCBJJ20gbm90IHN1cmUgd2hldGhlciBrZXJuZWwgZnVuY3Rpb25hbGl0eQpjb3Vs
ZCBiZSB1c2VkIHdpdGhvdXQgYmlnIGNoYW5nZXMgaW4gQnVpbGRyb290KS4KCktpbmQgcmVnYXJk
cywKUGV0cgoKPiBDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgYXQgaW1wbGVtZW50aW5nIGVpdGhlciAo
MSkgb3IgKDIpID8KCj4gVGhhbmtzIGEgbG90IQoKPiBUaG9tYXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
