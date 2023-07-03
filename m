Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E94FC001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 17:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A688A40C94;
	Mon,  3 Jul 2023 17:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A688A40C94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6P7f7GqzqoNt; Mon,  3 Jul 2023 17:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E63FE405DF;
	Mon,  3 Jul 2023 17:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E63FE405DF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55DE01BF86C
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 17:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ED0A405DF
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 17:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ED0A405DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6r_7EV4izO7 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 17:51:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB2F340280
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB2F340280
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 17:51:33 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so142905966b.0
 for <buildroot@buildroot.org>; Mon, 03 Jul 2023 10:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688406692; x=1690998692;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AxqPNzvS2y26UIZKWZaapw0BsQYlyqYSsnckIq/4xUY=;
 b=ZWSYK5MDwSOgXU2ctAbB5nZet1E7GsilmtTQnKmD5MhD0TOHJf9oOJIeZEpkbC11PD
 2CoBNGsABMd/tgafQJ2WkRb57mHfPbjTQqXR7Pm/ja1iCpasabMhaUt7tkA8m9CLX8T5
 HPgvIbN7MQ6hexWgS8/AYlkL1bs1+0HmLjxHduUJoqnuE3smYODIh6tcHbgDRLHPdgrj
 yke+Z6apKTfNehO4tpO0xfHV0ezvNvdHsIsKOXNJUly9EpzOwSiTP+2757j7s9/szjqi
 5bMEmJzxS10ftVj32pxt8etpwwhQhzG5Z3wkvCwDRTurcw6ufzvVQ074ZOCA3tgeP2M7
 adEQ==
X-Gm-Message-State: AC+VfDwfrwbB1glurmtyNOPb6ONj8u3oUPeON2D5gwDySIYgs6VmcUsr
 0GjTaN4kKOaexftTALOxEeBqxA==
X-Google-Smtp-Source: APBJJlH2SoG+KdQcETRJ+gWcharprvXgImtM2JiZQj6KBU8NGbRsr75+yduEKX+HjmPdk4A31Zfj1w==
X-Received: by 2002:a17:906:b313:b0:992:ba2c:2e0d with SMTP id
 n19-20020a170906b31300b00992ba2c2e0dmr8548838ejz.68.1688406691837; 
 Mon, 03 Jul 2023 10:51:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 xa10-20020a170907b9ca00b00988955f7b5esm12298553ejc.157.2023.07.03.10.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 10:51:31 -0700 (PDT)
Message-ID: <d8abf6ce-9237-2d54-4fc9-e3dee1c1bdc1@mind.be>
Date: Mon, 3 Jul 2023 19:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20230703091001.12573-1-sebastien.szymanski@armadeus.com>
In-Reply-To: <20230703091001.12573-1-sebastien.szymanski@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688406692; x=1690998692;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AxqPNzvS2y26UIZKWZaapw0BsQYlyqYSsnckIq/4xUY=;
 b=S4CIbY5/9wvQ8c/4oQG4htPR2pzVVnkac5g4m5MIc5jynpXKR6CbUgogvyQ8p9Ww/b
 tSak6yKICtJSq8poEeFbzrC6Rq5+oMoiIjSlYGP5Yy0zDVQouyIQyevdT0P7FOGwCkVN
 Tk2YR7PuTYdmsZBxBFwgmnAw/wQOT73pKCNzWaF53zxZeszpAPm1XLpTOuXHthMG56hD
 n4RrxwTa2x4wWxlhMHcC9KNdEDG8MQeM6OPiDeI0gizpXqHhIxfb2DfZgk8lCsHls7H6
 fKk5pSUe0wODebQSUGRc6uFIJzOrdLpJhiVshY9L/qi2pHjcLabpnPzqf4Y7OLjOrfY2
 erRg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S4CIbY5/
Subject: Re: [Buildroot] [PATCH 1/1] package/pkgconf: fix broken URL
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wNy8yMDIzIDExOjEwLCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBSZWxl
YXNlIHRhcmJhbGwgbG9jYXRpb24gaGFzIGNoYW5nZWQgWzFdLCB1cGRhdGUgUEtHQ09ORl9TSVRF
Lgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcGtnY29uZi9wa2djb25mL2NvbW1pdC80Mzdj
MmEzMjE4YmZjYjFjYWU3ZmEzOGE0Y2NkMGNiMjk1NzVmZjA3Cj4gCj4gU2lnbmVkLW9mZi1ieTog
U8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgoK
ICBJIGhhZCB0aGUgc2FtZSBjb21taXQsIGJ1dCBJIGZvcmdvdCB0byBwcmVzcyBlbnRlciBhZnRl
ciBnaXQgc2VuZC1lbWFpbCA6LU8KCiAgSSBoYWQgYSBzbGlnaHRseSBtb3JlIGV4dGVuc2l2ZSBz
byBJIGNvcGllZCB0aGF0IGFuZCBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRz
LAogIEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2UvcGtnY29uZi9wa2djb25mLm1rIHwgMiArLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcGtnY29uZi9wa2djb25mLm1rIGIvcGFja2FnZS9wa2djb25mL3Br
Z2NvbmYubWsKPiBpbmRleCBlOTU4N2ZhZTZiMmMuLjFkNzNiNjkxZTE3MyAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3BrZ2NvbmYvcGtnY29uZi5tawo+ICsrKyBiL3BhY2thZ2UvcGtnY29uZi9wa2dj
b25mLm1rCj4gQEAgLTUsNyArNSw3IEBACj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAg
Cj4gICBQS0dDT05GX1ZFUlNJT04gPSAxLjYuMwo+IC1QS0dDT05GX1NJVEUgPSBodHRwczovL2Rp
c3RmaWxlcy5kZXJlZmVyZW5jZWQub3JnL3BrZ2NvbmYKPiArUEtHQ09ORl9TSVRFID0gaHR0cHM6
Ly9kaXN0ZmlsZXMuYXJpYWRuZS5zcGFjZS9wa2djb25mCj4gICBQS0dDT05GX1NPVVJDRSA9IHBr
Z2NvbmYtJChQS0dDT05GX1ZFUlNJT04pLnRhci54ego+ICAgUEtHQ09ORl9MSUNFTlNFID0gcGtn
Y29uZiBsaWNlbnNlCj4gICBQS0dDT05GX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
