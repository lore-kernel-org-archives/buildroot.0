Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CCCC0015E
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 12:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD2183F08;
	Fri, 11 Aug 2023 12:13:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD2183F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-HsXgr1QuSv; Fri, 11 Aug 2023 12:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4495483BEE;
	Fri, 11 Aug 2023 12:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4495483BEE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1191BF2C6
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 12:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21CF74088F
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 12:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21CF74088F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNn0ONHVSP_v for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 12:13:21 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3AFA4087A
 for <buildroot@uclibc.org>; Fri, 11 Aug 2023 12:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3AFA4087A
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3178dd771ceso1756659f8f.2
 for <buildroot@uclibc.org>; Fri, 11 Aug 2023 05:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691755998; x=1692360798;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YeLNPbCzqC+30LHfCnzbDrfw79Wfq6UZMPalbipc9nY=;
 b=KhdsdzkROSf+rrKiu71/xj4h0DXILvrJxzSsdw5G2wwkN6FRTZOLt16BQ/3Eo3cUvf
 EGFN2NYWZfU81N5YbM3wsK7nWel9R8u1mMqltFP0mmAbSkkeGzFpoQkZVrDM4/vHOVhI
 JCRjAfJM4U6jCAOqQL7d1uEm/yMGoTCDiGiOzX63ZbdPJLOL3hFHloBeIvRVkhxIrPrZ
 fQxNkjS/yB+NMcu/D/lW6TW/zzKWzg85TaguDpf6WU3MskmbI0CWY0AxQ8YtDsn/Peah
 malwXje/auONIGhUvNa+movbvirCctWSq+pCiIgjgUiz0J/YOOstMI03+gfDRTJUA9Du
 jxvg==
X-Gm-Message-State: AOJu0YzRe0XKKV81zlqwG5TKMku757+Tx7KtkO2Kt5pPhL/cHkQCk4JU
 2YGXDf+lw+1m0dfJZ7tYkpWdng==
X-Google-Smtp-Source: AGHT+IGsqCpw5PZT+sQXBw3wuC2hbEkFdOfyW3kDe4aWI3MeSeEzI/jqw8TnKi3vy8jEAF6tizxQBw==
X-Received: by 2002:a5d:4391:0:b0:317:6175:95fd with SMTP id
 i17-20020a5d4391000000b00317617595fdmr1301091wrq.43.1691755998408; 
 Fri, 11 Aug 2023 05:13:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a5d6507000000b003143b14848dsm5171983wru.102.2023.08.11.05.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 05:13:18 -0700 (PDT)
Message-ID: <0b7f60af-f156-1356-545c-23617c8dd140@smile.fr>
Date: Fri, 11 Aug 2023 14:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org
References: <20230722073533.3072853-1-bernd@kuhls.net>
 <20230722232314.683b6431@windsurf>
 <6f65d64b-61e4-c574-1c6d-075beec80025__2330.9377183736$1691097798$gmane$org@gmail.com>
 <pan$106c1$18469599$69744288$a02c39bc@ID-313208.user.individual.net>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <pan$106c1$18469599$69744288$a02c39bc@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1691755998; x=1692360798;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YeLNPbCzqC+30LHfCnzbDrfw79Wfq6UZMPalbipc9nY=;
 b=MmLLaBlitA6AdkuKJmUO+CsK5AgE0pwrw0aHG0fJOlU1oxuYEFCjuO4pbG5QnWhBn4
 pvwjh1CGBpk7qRerjv+lKGOoJdHmsD60TQbLe15yeT9VmkWcZzcIWUKMwjdEp44zesj5
 OR5+RtcUJ/JXUzcYqT5rajdfXbp75+QrqfRULvKQo04eX42gXniGJsDHn3hzrhp8bXv+
 nPI89RSeOhpe2+8AAeHMWfhWX6sqoo10FdVMyLvD4KqztqhTdMW2wtA5vJag7tlou8Vn
 d1wSZJwVxIqNlNGZxfBDnGv+TS8CHB4MKLbmLUP1KkzhUm9z/PJwP2I/VoMwMZsvVJar
 7ulQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=MmLLaBli
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 1.2.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsCgpMZSAwNC8wOC8yMDIzIMOgIDE3OjMyLCBCZXJuZCBLdWhscyBhIMOpY3JpdMKg
Ogo+IEFtIFRodSwgMyBBdWcgMjAyMyAyMzoyMjoxMyArMDIwMCBzY2hyaWViIFJvbWFpbiBOYW91
cjoKPiAKPj4gVGhpcyBtZXNvbiB2ZXJzaW9uIGJ1bXAgaW50cm9kdWNlIGEgcmVncmVzc2lvbiB3
aGlsZSBidWlsZGluZyBob3N0LXFlbXUKPj4gb24gc29tZSBob3N0Ogo+Pgo+PiBob3N0L2xpYi9s
aWJnaW8tMi4wLnNvOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBnX21vZHVsZV9vcGVuX2Z1bGwn
Cj4+IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwo+IAo+IEhpIFJv
bWFpbiwKPiAKPiBteSBtYWNoaW5lLCBydW5uaW5nIERlYmlhbiBCb29rd29ybSwgZG9lcyBub3Qg
YmVsb25nIHRvICJzb21lIGhvc3QiIHNpbmNlIAo+IEkgY2FuIG5vdCByZXByb2R1Y2UgdGhlIGJ1
aWxkIGVycm9yIHdpdGggdGhpcyBkZWZjb25maWc6Cj4gCj4gQlIyX1BFUl9QQUNLQUdFX0RJUkVD
VE9SSUVTPXkKPiBCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eQo+IAo+IENhbiB5b3UgcHJvdmlkZSBt
b3JlIGluZm9ybWF0aW9ucz8KClNvcnJ5IGZvciB0aGUgbGFjayBvZiBpbmZvcm1hdGlvbiBhYm91
dCAic29tZSBob3N0IiBidXQgSSBkaWRuJ3Qga25vdyB3aHkgdGhlCmVycm9yIG9jY3VycmUgb25s
eSBvbiBzb21lIHNwZWNpZmljIGhvc3QuCgpJIGRpZCBhIGdpdCBiaXNlY3Qgb24gbWVzb24gYW5k
IGZpbmQgdGhlIGZpcnN0IGJhZCBjb21taXQgWzFdLgoKV2l0aCB0aGlzIGNvbW1pdCBhcHBsaWVk
LCB0aGUgbmluamEgYnVpbGQgZmlsZQooYnVpbGQvaG9zdC1xZW11LTguMC4zL2J1aWxkL2J1aWxk
Lm5pbmphKSB1c2VzIHBhdGhzIHJlcG9ydGVkIGJ5ICJnY2MKLS1wcmludC1zZWFyY2gtZGlycyIg
YmVmb3JlIHNlYXJjaGluZyBsaWJyYXJpZXMgaW4gaG9zdCBkaXJlY3RvcnkgKHdoZXJlCmhvc3Qt
cWVtdSBpcyBzdXBwb3NlZCB0byBmaW5kIGxpYmdpby0yLjAuc28pLgoKTElOS19BUkdTID0gLUwv
dXNyL2xpYi9nY2MveDg2XzY0LWxpbnV4LWdudS8xMAogICAgICAgICAgICAtTC91c3IvbGliL2dj
Yy94ODZfNjQtbGludXgtZ251LzEwLy4uLy4uLy4uL3g4Nl82NC1saW51eC1nbnUKICAgICAgICAg
ICAgLUwvdXNyL2xpYi94ODZfNjQtbGludXgtZ251CiAgICAgICAgICAgIC1ML3Vzci9saWIvZ2Nj
L3g4Nl82NC1saW51eC1nbnUvMTAvLi4vLi4vLi4vLi4vbGliCiAgICAgICAgICAgIC1ML3Vzci9s
aWIgLUwvbGliL3g4Nl82NC1saW51eC1nbnUKICAgICAgICAgICAgLUwvbGliLy4uL2xpYgogICAg
ICAgICAgICAtTC91c3IvbGliLy4uL2xpYgogICAgICAgICAgICAtTC91c3IvbGliL2djYy94ODZf
NjQtbGludXgtZ251LzEwLy4uLy4uLy4uIC1ML2xpYgogICAgICAgICAgICBbLi4uXQoKSXQgc2Vl
bXMgYSByZWFsIG1lc29uIGlzc3VlIHNpbmNlIHFlbXUgZGV0ZWN0IGFuZCB3YW50IHRvIHVzZSB0
aGUgbGliZ2xpYjIKcHJvdmlkZWQgYnkgQnVpbGRyb290ICgyLjc2LjEpIGZyb20gaG9zdCBkaXJl
Y3RvcnkuLi4KCmJ1dCBzaW5jZSBsaWJnbGliMi1kZXYgb2xkZXIgdGhhbiB0aGUgb25lIHByb3Zp
ZGVkIGJ5IEJ1aWxkcm9vdCBpcyBpbnN0YWxsZWQgaW4KIi91c3IvbGliL3g4Nl82NC1saW51eC1n
bnUiIGl0IHRyeSB0byBsaW5rIHdpdGggaXQgYW5kIGZhaWwgc2luY2UgdGhpcyB2ZXJzaW9uCmRv
ZXNuJ3QgcHJvdmlkZSBnX21vZHVsZV9vcGVuX2Z1bGwgc3ltYm9sLgoKWy4uLl0vaG9zdC9saWIv
bGliZ2lvLTIuMC5zby4wLjc2MDAuMQovdXNyL2xpYi94ODZfNjQtbGludXgtZ251L2xpYmdpby0y
LjAuc28uMC42NjAwLjgKClsxXQpodHRwczovL2dpdGh1Yi5jb20vbWVzb25idWlsZC9tZXNvbi9j
b21taXQvNTljZmJmNjhlMDBhYTc3NGE5ODY4MTAxZjQyM2JkNjYyOTM4YzE1ZAoKSSdtIG5vdCBz
dXJlIHlldCBob3cgdG8gZml4IG9yIHdvcmthcm91bmQgdGhpcyBpc3N1ZSwgaGVscCB3ZWxjb21l
IQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFJlZ2FyZHMsIEJlcm5kCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
