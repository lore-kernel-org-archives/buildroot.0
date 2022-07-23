Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4EEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFB8940A59;
	Sat, 23 Jul 2022 16:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB8940A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eoi7m5EeN7Lk; Sat, 23 Jul 2022 16:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 199B240AA4;
	Sat, 23 Jul 2022 16:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 199B240AA4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EA1A1BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0788442415
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0788442415
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsZLvXLNeTPW for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:52:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 323CA418A9
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 323CA418A9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:52:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bu1so10314870wrb.9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VUprF95gOoYud57uH0G1hbYss54xq22C3r75Jyimazg=;
 b=fjqYJs5VZyYVI4en4SAZ8Oey1iGc1IQDQv+uWRxVM+r/tOrgE7ik9Mj5h62PNOxgDB
 ArriRJ02EXmmkR3F3M2xt8JFOSmldHVgrJfye8PGn3BLYdOVyje/C+B/HN1TPTSf21E8
 fMOdEkJbUCB87TOQigerlM1yuCMtXfqJ8cYfpOCyrz0p/1mZqIy9900HN0wu1HfG3Dg6
 +rHZMnWLdvroJRTLL97vo5DAKejDrS47hRrjG9Yc9x2YDIJzhPrbMRGH21zY249teACZ
 77xBbOF9EbcwZzvaLKTncjNt7ccZTY9tKfdq4ebMC/uFjncaYP2N6QwO5iXNMrgRHLj8
 T5iw==
X-Gm-Message-State: AJIora+PbB/ifqCEZpvS7a8pGFM54NFMuF1MQUTKXopXxCrXtpyMxxmz
 j2K0aQutYEdMAUI3zyvJxkUqxw==
X-Google-Smtp-Source: AGRyM1uHJSXi9MeB4FQIgykq+VDFIX3XomHds2EoEbbjs8D51x4wiNVI9ViVhn5AHKcEYzE2xgkHew==
X-Received: by 2002:a05:6000:1861:b0:21d:b353:6016 with SMTP id
 d1-20020a056000186100b0021db3536016mr3211337wri.198.1658595134354; 
 Sat, 23 Jul 2022 09:52:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a5d430f000000b0021b5861eaf7sm7463116wrq.3.2022.07.23.09.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:52:13 -0700 (PDT)
Message-ID: <f45f08c3-be5d-971b-1a24-6cd00029c73a@mind.be>
Date: Sat, 23 Jul 2022 18:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: =?UTF-8?Q?Andr=c3=a9_Zwing?= <nerv@dawncrow.de>, buildroot@buildroot.org
References: <20220607141036.246843-1-nerv@dawncrow.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220607141036.246843-1-nerv@dawncrow.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VUprF95gOoYud57uH0G1hbYss54xq22C3r75Jyimazg=;
 b=WsfvcNc+qDgvebgTnsaP9tkqn+jQmJXAvVPKy8JCd1x9SOg3hcrpx7KuU/i2CUQBCi
 EQD/aOw1L4XGODDehi3MHXJRDVkNfdPDlSOH1rO5Bp1nSL3IdF5Bt633oOWcguVsgqhy
 Oj1qjPpHE9uewOEVS4yfNnflg0oLGBG5+Vf4uu4QF7gFsCu4IaIG6lyUPoF/gVDIwl/8
 8eZZUO5oIdqnaC35S5MPdv4LIgBo8s2eM4XA0+rxJIxA31wWQaSiS//Pmg6idiyNecJz
 afz+WvuhAsy06XoA9x9k7wDP0hlKFvp2HXwmMu6QCYCB9VxUC+DRZC6Uz/ERhf3Pyurv
 3Ajg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WsfvcNc+
Subject: Re: [Buildroot] [PATCH] package/openal: bump to version 1.22.0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wNi8yMDIyIDE2OjEwLCBBbmRyw6kgWndpbmcgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgoKICBBcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAtLS0KPiAgIHBhY2thZ2Uvb3BlbmFsL29w
ZW5hbC5oYXNoIHwgMiArLQo+ICAgcGFja2FnZS9vcGVuYWwvb3BlbmFsLm1rICAgfCAyICstCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuYWwvb3BlbmFsLmhhc2ggYi9wYWNrYWdlL29wZW5hbC9v
cGVuYWwuaGFzaAo+IGluZGV4IDNmMWE1NzRlM2UuLmVhZTc4YjA1ODIgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9vcGVuYWwvb3BlbmFsLmhhc2gKPiArKysgYi9wYWNrYWdlL29wZW5hbC9vcGVuYWwu
aGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2
ICA4YWMxN2U0ZTNiMzJjMWFmM2Q1NTA4YWNmZmZiODM4NjQwNjY5YjQyNzQ2MDZiNzg5MmFhNzk2
Y2E5ZDc0NjdmICBvcGVuYWwtMS4yMS4xLnRhci5nego+ICtzaGEyNTYgIDgxNDgzMWE4MDEzZDcz
NjVkZmQxOTE3YjI3ZjFmYjZlNzIzZjNiZTNmZTFjNmE3ZmY0NTE2NDI1ZDgzOTJmNjggIG9wZW5h
bC0xLjIyLjAudGFyLmd6Cj4gICBzaGEyNTYgIGQ4MDhjZTIxN2U1YjYxMTg1NGRhNjIyYjU3ZWMy
OWZlNTQ1NTg0YzQ4YmM1MzUyZmFlNzJhNGI2ZTUwNzRhMTUgIENPUFlJTkcKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9vcGVuYWwvb3BlbmFsLm1rIGIvcGFja2FnZS9vcGVuYWwvb3BlbmFsLm1rCj4g
aW5kZXggYTg3OGU0ODQ3Zi4uM2Q2MjQxMzljMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL29wZW5h
bC9vcGVuYWwubWsKPiArKysgYi9wYWNrYWdlL29wZW5hbC9vcGVuYWwubWsKPiBAQCAtNCw3ICs0
LDcgQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtT1BFTkFMX1ZF
UlNJT04gPSAxLjIxLjEKPiArT1BFTkFMX1ZFUlNJT04gPSAxLjIyLjAKPiAgIE9QRU5BTF9TSVRF
ID0gJChjYWxsIGdpdGh1YixrY2F0LG9wZW5hbC1zb2Z0LCQoT1BFTkFMX1ZFUlNJT04pKQo+ICAg
T1BFTkFMX0xJQ0VOU0UgPSBMR1BMLTIuMCsKPiAgIE9QRU5BTF9MSUNFTlNFX0ZJTEVTID0gQ09Q
WUlORwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
