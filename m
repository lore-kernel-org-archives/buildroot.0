Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA153C433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:54:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F62360F12
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F62360F12
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53FA440775;
	Tue, 12 Oct 2021 20:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnN2LeRrKvRS; Tue, 12 Oct 2021 20:54:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFFCF40753;
	Tue, 12 Oct 2021 20:54:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 717191BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6137E607F6
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3SWqVfP1iW6 for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:54:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A873605C1
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:54:41 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g8so1216531edt.7
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GE3MMao8BtS+zVGvXtmaGwzcuQppSmwBQQ2XCYZ5K8o=;
 b=GgBrerZAKzmsTCltAiDMywpnGYGbeT/GcK++JLN+bwezaNTBXnvDArRKu4kqJdVv+R
 LuKhtYmLUlc7MJetAbl9gmbdfcvuj1gsnZqCejttqGI3FDJLfwJl1bGcleoJh3XSf3Ly
 zVaWdrUi2LRxIRQ9wat8lujsHSsomPfok6CXQ1Snf+C7zkPRGfq1oS33mMD1imR00cHo
 Zx4xVxoqgf/BQa5vVgHnjqUFlUa8PhcDMkl/TiHqn+gaCIldIaAF9O/K7rdkPRz5lj5M
 h749XORdQOvDGXQq0hZ3Y37KPKCcDSOOEIboqq/oVJ+wHt5mpCfBL3Aur53uC6/+uxVZ
 ceLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GE3MMao8BtS+zVGvXtmaGwzcuQppSmwBQQ2XCYZ5K8o=;
 b=10ZZeQfveQ5iVekQxp5QzBWX4ElERGJ22nKSm4P4Aa2OAxyv2wJU9Psypopf0rfWsb
 7ElRnvTc4/fCmvRicsU/1aSGO2tf8TDfcAeYIhoHvIUQC+2CVC9uiQijdsj8y6YIkfQn
 GmILnb55MWbmE7ne1Kdc4/f0CTks/3u8D9B4gb6+0vT/IgSH4el7yio0IxSHWOCmAHD1
 3ZnD+jsFkddCYf26Sm4M0UPU4bUZgUZ/vA9GSn652wVdLDput7Wu9c5hWoEk5lPrtUpP
 byO60YvTa3f8j3jQ0oHld6BEHTZboYlL4d21MwfXArZmqEfMLA8dmnjqTJzLF9Lwbyvz
 c0Iw==
X-Gm-Message-State: AOAM531QRlyok1VJHw3AOrHSjoDUAs97EV9HmNoTfZdOosmCThGb/TnT
 6+FgtydvmtrXuau9tPj+HPGUeQ==
X-Google-Smtp-Source: ABdhPJxs/qlXdVhIM3YhO6OVd3G4F6alV877AFFV+xl3LPwXHGgfFJ4Eyuzwu2IDeawTDYN+PAsOhw==
X-Received: by 2002:a50:d8cf:: with SMTP id y15mr3084598edj.66.1634072079626; 
 Tue, 12 Oct 2021 13:54:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id s7sm3993448edw.67.2021.10.12.13.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 13:54:39 -0700 (PDT)
Message-ID: <a1bddc03-d51d-3991-9c70-fe960b688e61@mind.be>
Date: Tue, 12 Oct 2021 22:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20211006203823.2740442-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211006203823.2740442-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] support/testing: fix
 python_flask_expect_python
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8xMC8yMDIxIDIyOjM4LCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IENvbW1pdCBlNmVl
MDdmNDFhMmIgKHBhY2thZ2UvcHl0aG9uLWZsYXNrLWV4cGVjdHMtanNvbjogbmV3IHBhY2thZ2Up
Cj4gYWRkZWQgYSBub24tZnVuY3Rpb25hbCB0ZXN0IGNhc2UgdGhhdCwgYXMgbm90aWNlZCBieSBF
ZGdhciwgZmFpbHMgd2l0aDoKPiAKPiAgICAgIEFzc2VydGlvbkVycm9yOiAnJXtodHRwX2NvZGV9
JyAhPSAnMjAwJwo+IAo+IFRoYXQncyBiZWNhdXNlIHRoZSAlIHNpZ24gaXMgc2VsZi1lc2NhcGVk
LCDDoC1sYSBDLCBpbiB0aGUgZmlyc3QgcGFydAo+IG9mIHRoZSBjb21tYW5kLCBwcm9iYWJseSB0
byBhdm9pZCBpdHMgYmVpbmcgJS1mb3JtYXR0ZWQuIEJ1dCBvbmx5IHRoZQo+IHNlY29uZCBwYXJ0
IG9mIHRoZSBjb21tYW5kIGlzICUtZm9ybWF0dGVkLCBzbyB3ZSBkbyBub3QgbmVlZCB0bwo+IHNl
bGYtZXNjYXBlICUgaW4gdGhlIGZpcnN0IHBhcnQuCj4gCj4gQWRkaXRpb25hbGx5LCBzaW5jZSBl
YjNlZTMwNzhhNzYgKHN1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weToKPiBwcmV2ZW50
IHRoZSBjb21tYW5kcyBmcm9tIHdyYXBwaW5nKSwgd2Ugbm8gbG9uZ2VyIG5lZWQgdG8gcGxheSB0
cmlja3MKPiB3aXRoIGNvbW1hbmRzIHRoYXQgYXJlIHRvbyBsb25nIHRvIGZpdCBvbiB0aGUgZmly
c3QgbGluZSBvZiB0aGUgc2hlbGwKPiBwcm9tcHQuCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFubiBF
LiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gQ2M6IFRob21hcyBQZXRhenpvbmkg
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gQ2M6IEVkZ2FyIEJvbmV0IDxib25ldEBn
cmVub2JsZS5jbnJzLmZyPgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRz
LAogIEFybm91dAoKPiAtLS0KPiAgIC4uLi90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRo
b25fZmxhc2tfZXhwZWN0c19qc29uLnB5ICAgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2ZsYXNrX2V4cGVjdHNfanNvbi5weSBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2ZsYXNrX2V4cGVjdHNf
anNvbi5weQo+IGluZGV4IGI3MzI2ZjVkOWUuLjU1NzZjYmEyYjQgMTAwNjQ0Cj4gLS0tIGEvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fZmxhc2tfZXhwZWN0c19qc29u
LnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fZmxh
c2tfZXhwZWN0c19qc29uLnB5Cj4gQEAgLTE3LDExICsxNywxMSBAQCBjbGFzcyBUZXN0UHl0aG9u
UHkzRmxhc2tFeHBlY3RzSnNvbihUZXN0UHl0aG9uUGFja2FnZUJhc2UpOgo+ICAgICAgIHRpbWVv
dXQgPSA2MAo+ICAgCj4gICAgICAgZGVmIHRyeV9qc29uKHNlbGYsIHBheWxvYWQsIGV4cGVjdHMp
Ogo+IC0gICAgICAgIGNtZCA9ICIiImN1cmwgLXMgLW8gL2Rldi9udWxsIC13ICIlJXtodHRwX2Nv
ZGV9XFxuIiAtWCBQT1NUICIiIgo+ICsgICAgICAgIGNtZCA9ICIiImN1cmwgLXMgLW8gL2Rldi9u
dWxsIC13ICIle2h0dHBfY29kZX1cXG4iIC1YIFBPU1QgIiIiCj4gICAgICAgICAgIGNtZCArPSAi
IiItSCAiQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi9qc29uIiAtZCAnJXMnIGh0dHA6Ly8xMjcu
MC4wLjE6NTAwMCIiIiAlIHBheWxvYWQKPiAgICAgICAgICAgb3V0cHV0LCBleGl0X2NvZGUgPSBz
ZWxmLmVtdWxhdG9yLnJ1bihjbWQsIHRpbWVvdXQ9c2VsZi50aW1lb3V0KQo+ICAgICAgICAgICBz
ZWxmLmFzc2VydEVxdWFsKGV4aXRfY29kZSwgMCkKPiAtICAgICAgICBzZWxmLmFzc2VydEVxdWFs
KG91dHB1dFstMV0sIHN0cihleHBlY3RzKSkKPiArICAgICAgICBzZWxmLmFzc2VydEVxdWFsKG91
dHB1dFswXSwgc3RyKGV4cGVjdHMpKQo+ICAgCj4gICAgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+
ICAgICAgICAgICBzZWxmLmxvZ2luKCkKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
