Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65931CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF83440A03;
	Tue,  3 Sep 2024 18:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pxuloj8C3DtJ; Tue,  3 Sep 2024 18:36:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92E4E40A02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92E4E40A02;
	Tue,  3 Sep 2024 18:36:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF3641BF59C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAEDB80E61
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxcAsdV6_n8v for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:36:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B210280E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B210280E60
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B210280E60
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:36:36 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f50966c478so60421311fa.1
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 11:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725388594; x=1725993394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSXY3KUYwcilX+woDoiOUApIbNy+vtUjphi89YFcpyI=;
 b=UvAoCkOzvSHCZ9GIdvKTQN2rpUGVCiXUys23SzeQrE7EkqEl8ay9BMg3K1xTnqe7uk
 LXreTy4fIqPQQ7Zv7K1mS7yOSUazO0eHYb5orMZ/o+ARGaWRFFKE/HwSs0f+aLXcjlgW
 GCEPtgNFHW57XAOWJLMDcItRkGr0+KJdC1FuQ8sALLCTYqm0/JE9GWhK1yRsIMIgKly6
 mjCaGgfU3YkjZO2FzhHOHJ6BetAkEOejgru2u4t369UaT8be0bwdFHhjBbkXylEILdFS
 0WE8Sja1bNwjEpTOQaL5HU1X6+wpuoOx+H+lR6SvQ8EaNe4N0YDOajcJGgXnBjqVL2gE
 FRRQ==
X-Gm-Message-State: AOJu0Yz89UOI7AkO+fnjzs6TITWny2qGzN80MiX1shZow1wR3avwHImG
 8GfCPUHnM4MyRWcX2jhUTYUsqITARTtQgTSeaefLWEVK2Lf9kub5ggpK3RvlDp1FS6BxQd0bW8n
 QksuHsHitd+ncCUR7DjUfN4N7Yd8=
X-Google-Smtp-Source: AGHT+IHIVU3AZHSdgWYu5ZjpuFa9MMAIfruC2Ez87DGErkgtyySH0icqbZ99Ddd3UTFI1uneDxvLGpkzjxkwts/doWk=
X-Received: by 2002:a05:651c:b08:b0:2f3:e2fd:aede with SMTP id
 38308e7fff4ca-2f61e0a50fdmr100165651fa.31.1725388593902; Tue, 03 Sep 2024
 11:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240901194422.383895-1-ju.o@free.fr>
In-Reply-To: <20240901194422.383895-1-ju.o@free.fr>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 3 Sep 2024 15:36:22 -0300
Message-ID: <CAOMZO5CuBNUnyUpM=ThVUnXMWXc0w4WYX7EUL=mcHa+ko2c4jg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725388594; x=1725993394; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSXY3KUYwcilX+woDoiOUApIbNy+vtUjphi89YFcpyI=;
 b=PFePzXSjJEehoc/u6J8LX5gZQchUSZCj7n8WTWzlv34pKBdH7U6d2fsFn0jllsZzHb
 oKgl1rybStWDGfE8V6E5f5dx2iouMLdox/cMnDiSsrkJdY043wAEiO5cA5c4NG2a6STt
 6QDYGlzcOGobDQg5lqXB976WniTrjrHzsdiNmv5HUkJdRaV3ll1SdK7wvH/Bi5b51AGN
 rFq/aM7rdh39b21J3EdG7f8ptdxLr0iMTOP+0KaBesrSJvokk4D8WYwISqL507HRkVsX
 FLJ4qohnZSdUSsvRWQH8oKZtyZDJqQCoDcE4zwHs4vtxKIrmS8tysY3M7M+rAbUCP8ZI
 SNKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PFePzXSj
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mqevk: bump TF-A,
 U-Boot and Linux Kernel version
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

SGkgSnVsaWVuLAoKT24gU3VuLCBTZXAgMSwgMjAyNCBhdCA0OjQ04oCvUE0gSnVsaWVuIE9saXZh
aW4gPGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4KPiBUaGUgaW14OG1xZXZrX2RlZmNvbmZpZyBpcyBm
YWlsaW5nIHRvIGJ1aWxkIHRoZSBhcm0tdHJ1c3RlZC1maXJtd2FyZQo+IHBhY2thZ2UsIHdpdGgg
dGhlIGVycm9yIG1lc3NhZ2U6Cj4KPiAgICAgcGxhdC9pbXgvaW14OG0vaGFiLmM6IEluIGZ1bmN0
aW9uICdpbXhfaGFiX2hhbmRsZXInOgo+ICAgICBwbGF0L2lteC9pbXg4bS9oYWIuYzo2NTo1Nzog
ZXJyb3I6IGFycmF5IHN1YnNjcmlwdCAwIGlzIG91dHNpZGUgYXJyYXkgYm91bmRzIG9mICd1aW50
MzJfdFswXScge2FrYSAndW5zaWduZWQgaW50W10nfSBbLVdlcnJvcj1hcnJheS1ib3VuZHM9XQo+
ICAgICAgICA2NSB8ICNkZWZpbmUgSEFCX1JWVF9DSEVDS19UQVJHRVRfQVJNNjQgICAgICAoKHVu
c2lnbmVkIGxvbmcpKih1aW50MzJfdCAqKShIQUJfUlZUX0JBU0UgKyAweDE4KSkKPiAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPgo+IFRoaXMgaXMgaGFwcGVu
aW5nIHNpbmNlIGNvbW1pdCBkYzBmNzIxICJwYWNrYWdlL2djYzogc3dpdGNoIHRvIDEzLngKPiBh
cyBkZWZhdWx0Ii4KPgo+IFRoaXMgY29tbWl0IGZpeGVzIHRoaXMgYnVpbGQgZmFpbHVyZSBieSB1
cGRhdGluZyB0aGUgVEYtQSwgVS1Cb290IGFuZAo+IExpbnV4IEtlcm5lbC4gTm90ZTogdGhpcyBp
bXg4bXFldmtfZGVmY29uZmlnIHVzZXMgdGhlIHVwc3RyZWFtIEtlcm5lbAo+IChpbiBjb250cmFz
dCBvZiB0aGUgZnJlZXNjYWxlX2lteDhtcWV2a19kZWZjb25maWcgd2hpY2ggaXMgdXNpbmcgdGhl
IE5YUAo+IEJTUCBLZXJuZWwgdmVyc2lvbikuCj4KPiBBbHNvLCB0aGlzIG5ldyB1Ym9vdCB2ZXJz
aW9uIG5lZWRzIGdudXRscyBhbmQgb3BlbnNzbCwgc28gdGhlCj4gY29ycmVzcG9uZGluZyBvcHRp
b25zIGFyZSBhZGRlZCB0byB0aGUgZGVmY29uZmlnLgo+Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy83NjkxNzAxNDExCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKVGhhbmtzIGZvciB0aGUg
Zml4OgoKUmV2aWV3ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KCkF0
IHNvbWUgcG9pbnQsIEkgd2lsbCB0cnkgdG8gc3dpdGNoIHRvIFUtQm9vdCBhbmQgVEYtQSBtYWlu
bGluZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
