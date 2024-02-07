Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC10C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 20:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12501410D7;
	Wed,  7 Feb 2024 20:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exmlWqGwBWa2; Wed,  7 Feb 2024 20:11:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1640C41EA3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1640C41EA3;
	Wed,  7 Feb 2024 20:11:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF59B1BF599
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 20:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB73A41EA3
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 20:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v7HtKfHkIO4L for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 20:11:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F2A9410D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F2A9410D7
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F2A9410D7
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 20:11:53 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dc6df28315fso977268276.3
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 12:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707336712; x=1707941512;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1avMc34Po04k6KmJ4UTpP0pzVeX6eYF0dYwv+2R2b8=;
 b=eLCmW+B+NshSFFSazGrABQSzbEIyRoFypm0t3IpX/Epirrhbi/Rms645LZDvqMp7TV
 APHVcVEWAuYuBt5oMpV8XUsbmtsubwdEX+P7J+vltTXSZy+58I0dOOgZEt0gRvN3314n
 JSSPQSnApj2rMLhh4u+L965UuggrmFYyJRfS5BBpShEYUAaHjh7WpFcQrgP9RXbU1eyf
 t+ATZjiABHlACZOjo29bI8GzCNjGxOO4BD4O0a65VRHujBPalu2agR76SpbrCuV5G53B
 0V5UfFfdUtrRhmke0SSCcA2o4imenSu6pAcjHne7keeCPLUmaHkA6pmRzYbE+sm2ruIr
 HRRg==
X-Gm-Message-State: AOJu0YxNPqcvFzKS/PeLiiPV5nPj1C/YvCLOvfWAL0so5Gw4JZkISUl8
 w4KfVANAhknPv0ZL9dmQXPewFB12J33/MWz0XBYXOYKcb80KchPQc5x+Tns5BsE4/5Nu3dBmwMN
 yFEl+DpExyS5nyeWBozSQ13aZudKjvz4hjY3+Fg==
X-Google-Smtp-Source: AGHT+IF+BpEYbpbn2JwQk+lW2X0QPQIU8bNYdQ2Gu9yKtefXNNGB/PyKN6xQdktQa0OrhuNl+Mn3zira9kAXg4BAbvs=
X-Received: by 2002:a25:d0c5:0:b0:dc6:d2d9:3096 with SMTP id
 h188-20020a25d0c5000000b00dc6d2d93096mr6349744ybg.37.1707336712479; Wed, 07
 Feb 2024 12:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20231129172852.1684628-1-dario.binacchi@amarulasolutions.com>
 <20240207195612.7ea08e54@windsurf>
In-Reply-To: <20240207195612.7ea08e54@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 7 Feb 2024 21:11:41 +0100
Message-ID: <CABGWkvqnA4fW1ryHjRgW1Cf9Zo0LNX2tH65kLo5z1REAme8J6A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707336712; x=1707941512;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1avMc34Po04k6KmJ4UTpP0pzVeX6eYF0dYwv+2R2b8=;
 b=DvQFFYxKkhYKnb8Ny+Cph/w2bb+0wpAVx2UuiuUn9xnVE7PFPx/1HoBPHkWDVh0eRv
 p31lQQUgt5aY9nE4XxChof/71dN//lHoC2766fN2BHtS3QPtpj/fa5Jf6O62Nl9j9TWx
 uMLam4D+AiZmTwOL7VZ4Kq03VzO0Mga1P95Us=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DvQFFYxK
Subject: Re: [Buildroot] [PATCH 1/1] boot/ti-k3-r5-loader: add support for
 patch files and URLs
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gV2VkLCBGZWIgNywgMjAyNCBhdCA3OjU24oCvUE0gVGhvbWFzIFBldGF6
em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDI5
IE5vdiAyMDIzIDE4OjI4OjUyICswMTAwCj4gRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hp
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPgo+ID4gVGhlIHBhdGNoIGFkZHMgc3VwcG9y
dCBmb3IgVVJMcyB1c2luZyBzaW1pbGFyIGNvZGUgYXMgZm91bmQKPiA+IGluIGxpbnV4L2xpbnV4
Lm1rIGFuZCB1Ym9vdC91Ym9vdC5tay4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+ICBi
b290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gICAgICAgICAgfCAxMSArKysrKysrKysrKwo+
ID4gIGJvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayB8IDE4ICsrKysrKysr
KysrKysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQo+Cj4gVGhh
bmtzIGEgbG90IGZvciB5b3VyIHByb3Bvc2FsLCBidXQgd2Ugbm8gbG9uZ2VyIGFkZCBwYWNrYWdl
LXNwZWNpZmljCj4gb3B0aW9ucyB0byBhcHBseSBwYXRjaGVzLCBhcyBCUjJfR0xPQkFMX1BBVENI
X0RJUiBhbGxvd3MgdG8gcGF0Y2ggYWxsCj4gcGFja2FnZXMuIFdlIGRvIGhhdmUgb3B0aW9ucyB0
aGF0IGV4aXN0IGZvciBsaW51eCBhbmQgdS1ib290IGluZGVlZCwKPiBiZWNhdXNlIHRoZXkgcHJl
ZGF0ZSBCUjJfR0xPQkFMX1BBVENIX0RJUiwgYW5kIHdlIG5lZWQgdG8ga2VlcCB0aGVtIGZvcgo+
IGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5LiBCdXQgd2UgZG8gbm90IGludHJvZHVjZSBzdWNoIG9w
dGlvbnMgZm9yIG5ldwo+IHBhY2thZ2VzLiBGb3IgdGhlIGV4YW1wbGUsIHRoZSBhcm0tdHJ1c3Rl
ZC1maXJtd2FyZSBoYXMgbm8gY3VzdG9tIHBhdGNoCj4gb3B0aW9uLCBiZWNhdXNlIEJSMl9HTE9C
QUxfUEFUQ0hfRElSIGNhbi9zaG91bGQgYmUgdXNlZCBpbnN0ZWFkLgoKVGhhbmsgeW91IGZvciB5
b3VyIGV4cGxhbmF0aW9ucy4KCkJlc3QgcmVnYXJkcywKCkRhcmlvCj4KPiBCZXN0IHJlZ2FyZHMs
Cj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgo+IEVtYmVk
ZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgoK
Ci0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAs
IDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFy
dWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
