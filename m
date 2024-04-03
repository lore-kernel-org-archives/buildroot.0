Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF94CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 16:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AA4B41740;
	Wed,  3 Apr 2024 16:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFxWsXIOc7jT; Wed,  3 Apr 2024 16:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D8154173B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D8154173B;
	Wed,  3 Apr 2024 16:28:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED6411BF424
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 16:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA04860652
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 16:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8lDQhXY1piD for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 16:28:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8C0F605C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C0F605C5
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8C0F605C5
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 16:28:32 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a4e60a64abcso197902266b.1
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 09:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712161711; x=1712766511;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EwlsNJmPs9L5T3GLfb5bGX3efFhygRRI9wOgxj++zQE=;
 b=DT/XzmblqdMpR8gL0N9NmN6a+h5U4w/DqYCObj6Af9gHPpXcyx5BKFSTY+IBbmkRSo
 cf3nYdfJI8AB+APKSrpOKlxA26c+gujk3hkzpOt5psrbohFtO/8GnQzJ2Lw4Dhe58FNS
 XHg2juYVT4V/0iwllXhrVIOZEJdEyvWl5kfYy6FZ4vqzT/IxYAagp5G4tqgkc8gSyoF5
 c8+rZNlmpb4P+tzkau80kqK0xPtEmBEO/jKzH9vcIdYkCBewS+FRO6jFdTQoGoTyqmmJ
 t0gk00u8cQtpaFLGgHTGS1V+fQYtVKI4Xq7rhmwwKVC8FgA21WtqWZxsC3kmOvhPK3pn
 cKNw==
X-Gm-Message-State: AOJu0YysqrKWsXOM2HjLy2D/ZipF6wIsN6Mw55k7S2Pim2YK7aWAc6iG
 qZLt36WBp++gHAfOHgwT4fsR47js8wkedzoLWBHMLyMpSOz/pBpjL9gsyUFV
X-Google-Smtp-Source: AGHT+IF07wnCw1+vXWSs7k/g0WRqofPllK02Naz9QKjrFEdThHTwmzan3A8tQut+V1U5AWHr8y8T2g==
X-Received: by 2002:a17:906:f584:b0:a4e:a2b3:f28d with SMTP id
 cm4-20020a170906f58400b00a4ea2b3f28dmr2564886ejd.13.1712161710325; 
 Wed, 03 Apr 2024 09:28:30 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 eo12-20020a056402530c00b00568afb0e731sm8013973edb.63.2024.04.03.09.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 09:28:29 -0700 (PDT)
Date: Wed, 3 Apr 2024 18:28:27 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Robert Marko <robimarko@gmail.com>
Message-ID: <20240403162827.GA462745@pevik>
References: <20240403121807.2087547-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403121807.2087547-1-robimarko@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712161711; x=1712766511; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EwlsNJmPs9L5T3GLfb5bGX3efFhygRRI9wOgxj++zQE=;
 b=Uer2NGsYN49I9vctzVSoV+W0n2S7BMx+i9JsW2Qw2/RZjYwe0AEJgaXDHbP78avMVV
 R63FzNTWgcFpafSExZUg8WamyIucpOvHZ7SVGXCca5AZ2g7eAHZKscLlGQLMukkDz/ao
 623KY8AsZ5fEI4+6wngxfFv8+t14JyRihqoiFbQD+cB0qsMGJeSq+kN/YVZ5EsZCVvU9
 odja+DlIzD8U3bPWed/DtuBBnzTDZ7kRBeI7AeDgCeIipFzWwewHr/a+8s2HdiP3jFHB
 /a+lSd4C3zSn7zoIButli8LMBZ1Tl0ceGNuAZGguFo2nM4FhsNC9CD1hKdS57gr+P3FA
 itGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Uer2NGsY
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9iZXJ0LAoKPiBHQ0MxNCBub3cgdHJlYXRzIGltcGxpY2l0IGludCB0eXBlcyBhcyBlcnJv
ciBzbyB3aGVuIGNoZWNrKCkgZnJvbQo+IGNoZWNrLWx4ZGlhbG9nLnNoIGlzIGNhbGxlZCB0byBj
aGVjayB3aGV0aGVyIHdlIGNhbiBsaW5rIGFnYWluc3QgbmN1cnNlcwo+IGl0IHdpbGwgZmFpbCBz
aWxlbnRseSBhbmQgdGhlIGhlbHAgdGV4dCBpbmRpY2F0aW5nIHRvIGluc3RhbGwgbmN1cnNlcyBp
cwo+IHByaW50ZWQuCgo+IEhvd2V2ZXIsIHRoaXMgaXMgbm90IGR1ZSB0byBtaXNzaW5nIG5jdXJz
ZXMgYnV0IG9uY2UgdGhlIHN0ZGVyciByZWRpcmVjdAo+IHRvIC9kZXYvbnVsbCBpcyByZW1vdmVk
IHdlIGNhbiBzZWUgdGhlIHJvb3QgY2F1c2U6Cj4gPHN0ZGluPjoyOjE6IGVycm9yOiByZXR1cm4g
dHlwZSBkZWZhdWx0cyB0byDigJhpbnTigJkgWy1XaW1wbGljaXQtaW50XQoKPiBTbywgaW4gb3Jk
ZXIgZm9yIG1lbnVjb25maWcgdG8gd29yayB3aXRoIEdDQzE0IGxldHMganVzdCBzcGVjaWZ5IHRo
ZQo+IHJldHVybiB0eXBlIG9mIG1haW4oKSBhcyBpbnQuCgpHb29kIGNhdGNoLiBOb3Qgb25seSBn
Y2MtMTQsIGJ1dCBhbHNvIGNsYW5nLTE2IGZhaWxzIGR1ZSAtV2ltcGxpY2l0LWludC4KKGNsYW5n
LTE0IHdhcyBvaykuCgpSZXZpZXdlZC1ieTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5j
b20+ClRlc3RlZC1ieTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+CgpLaW5kIHJl
Z2FyZHMsClBldHIKCj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IE1hcmtvIDxyb2JpbWFya29AZ21h
aWwuY29tPgo+IC0tLQo+ICBzdXBwb3J0L2tjb25maWcvbHhkaWFsb2cvY2hlY2stbHhkaWFsb2cu
c2ggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9n
LnNoIGIvc3VwcG9ydC9rY29uZmlnL2x4ZGlhbG9nL2NoZWNrLWx4ZGlhbG9nLnNoCj4gaW5kZXgg
MTZjZDlhMzE4Ni4uMjdkNmMzMGE1NyAxMDA3NTUKPiAtLS0gYS9zdXBwb3J0L2tjb25maWcvbHhk
aWFsb2cvY2hlY2stbHhkaWFsb2cuc2gKPiArKysgYi9zdXBwb3J0L2tjb25maWcvbHhkaWFsb2cv
Y2hlY2stbHhkaWFsb2cuc2gKPiBAQCAtNDgsNyArNDgsNyBAQCB0cmFwICJybSAtZiAkdG1wIiAw
IDEgMiAzIDE1Cj4gIGNoZWNrKCkgewo+ICAgICAgICAgICRjYyAteCBjIC0gLW8gJHRtcCAyPi9k
ZXYvbnVsbCA8PCdFT0YnCj4gICNpbmNsdWRlIENVUlNFU19MT0MKPiAtbWFpbigpIHt9Cj4gK2lu
dCBtYWluKCkge30KPiAgRU9GCj4gIAlpZiBbICQ/ICE9IDAgXTsgdGhlbgo+ICAJICAgIGVjaG8g
IiAqKiogVW5hYmxlIHRvIGZpbmQgdGhlIG5jdXJzZXMgbGlicmFyaWVzIG9yIHRoZSIgICAgICAg
MT4mMgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
