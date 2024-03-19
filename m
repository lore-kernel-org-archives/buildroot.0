Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050E9C54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 21:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E8E540438;
	Tue, 19 Mar 2024 21:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aRaVtmFytVY; Tue, 19 Mar 2024 21:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3F08405CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3F08405CB;
	Tue, 19 Mar 2024 21:52:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BA861BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76FA3407C6
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 21:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98P60oqPkyQr for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 21:52:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F011407BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F011407BE
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F011407BE
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 21:52:41 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d4541bf57eso82301761fa.2
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 14:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710885158; x=1711489958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3caBEdkRUarWLMGJc4e8e/240lF/SB0/e/XL1hR9i/k=;
 b=U8LI3gMRiLTjLWHl7cnNYXGf4NkMf1Y25EpfcXliQUk5l9ejqNILEeI+LVzVp5VzHj
 D2frcBJu+QdeRbKdVT6a46eoYooColqRKtulRZcvCFjMox07dxp2TnjZxBBmhg2M2BSu
 z+vmj5ufEdSe+ALJ36Rc45Z1hq/VQGVISFoqI5/tLO7xqdJ5wFf1HTT2rs8slxr8RPx8
 YCwU+cXX87DQL+5Wrg6Uhgak0787kZzTt2nNVbUN7q+MUYW/Rid21kCb1DZhh8fQa0zi
 rMrqKvcHV1SOCpr13dBuGzrcyVtNh480WlBhQD9zmB+GcH/zpXOqsFENM8NGRfF9f4DT
 klQg==
X-Gm-Message-State: AOJu0Yyrf9hjAP7SHGBHtCfenv3G2EVBx2dA9G0S3jhsA5Uo8oiu9Jc5
 grP1BUK2efdoWJG7HBQv9F1EazVJDwCeAmjhqLphMLZNTEzLPALC3kWyDBNo9hSzKsiccGQCIXr
 A
X-Google-Smtp-Source: AGHT+IH+72NduBd6UW/rgb00ZhcC0gflf+Fobz4zqe2TZykW+XNHjohzMSEor7V3Tyzn8fq7lAiZtA==
X-Received: by 2002:a2e:95c8:0:b0:2d4:7285:b997 with SMTP id
 y8-20020a2e95c8000000b002d47285b997mr9270026ljh.27.1710885158258; 
 Tue, 19 Mar 2024 14:52:38 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 b10-20020a05651c032a00b002d4a00a1318sm1161219ljp.53.2024.03.19.14.52.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 14:52:37 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so7134990e87.3
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 14:52:37 -0700 (PDT)
X-Received: by 2002:a19:6403:0:b0:513:df00:8ab5 with SMTP id
 y3-20020a196403000000b00513df008ab5mr8000888lfb.27.1710885156875; Tue, 19 Mar
 2024 14:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <893660729815cb737418892a77d27ba089a6cbde.1677568448.git.stefan@agner.ch>
 <20240319215037.8766-1-christian@aperture.us>
In-Reply-To: <20240319215037.8766-1-christian@aperture.us>
Date: Tue, 19 Mar 2024 14:52:25 -0700
X-Gmail-Original-Message-ID: <CA+h8R2p6raJ3KpOU0mP-dTgj=nKxk62o8xutd3HPdf7K+Jpc=Q@mail.gmail.com>
Message-ID: <CA+h8R2p6raJ3KpOU0mP-dTgj=nKxk62o8xutd3HPdf7K+Jpc=Q@mail.gmail.com>
To: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1710885158; x=1711489958; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3caBEdkRUarWLMGJc4e8e/240lF/SB0/e/XL1hR9i/k=;
 b=nvnm76HG6VpMxLmAAPQp52mbfzEc5cO9bPsBV2vId6EaMWafDLvwk4mIGGbkRdoFFe
 qsaQRs6hzSZZYPpyp7D7C1yVFYvNaPutTwM4ZpuLuWUxRfP6ipnjx/kGWOzjrBQw8Jzx
 VuhIlzskziQ+Z1Qxck44ZqSAmm8pD98DbkTTNqQOxPPQHFkD/sWlzW+noEjUWOuufxCT
 Y5eDPt7NJsjUYA62GwY8xf9oNPQZYZ6PUxqbFIR7+22CW94yB48t6blyWiealD0Vy0r8
 czqoCwUDSUq3DHmhnRB7TZst8QI+ksOHEvGxJmg0hOKWBWs/FOMiCMp8g8R+3QRa7UXA
 gA0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=nvnm76HG
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to
 version 2024-03-16 on branch v5.6.4.2
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: giulio.benetti@benettiengineering.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKT24gVHVlLCBNYXIgMTksIDIwMjQgYXQgMjo1MOKAr1BNIENocmlzdGlhbiBTdGV3YXJ0
IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gPiBUaGlzIHZlcnNpb24gYWRkcyBz
dXBwb3J0IHVwIHRvIExpbnV4IHZlcnNpb24gNi44Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEdp
dWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+ID4t
LS0KPiA+IHBhY2thZ2UvcnRsODgxMmF1LWFpcmNyYWNrLW5nL3J0bDg4MTJhdS1haXJjcmFjay1u
Zy5oYXNoIHwgMiArLQo+ID4gcGFja2FnZS9ydGw4ODEyYXUtYWlyY3JhY2stbmcvcnRsODgxMmF1
LWFpcmNyYWNrLW5nLm1rICAgfCAyICstCj4gPiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBbc25pcF0KPiA+Cj4gPiAtc2hhMjU2ICA5Njlm
YTk2YzkwZTE2ZmNhZjhmNmIzMGQ0NTc2YTg0NDZjNzA0MTkzMmJlYTM0YmJmZWE3ZTljOTEwMzhi
ZmU1ICBydGw4ODEyYXUtYWlyY3JhY2stbmctNGE5ODNlNDdkYWZjMDQ4MDE5NDEyMzUwZDM2Mjcw
ODY0ZjZiNWYyZC50YXIuZ3oKPiA+ICtzaGEyNTYgIDc1MmQ5YWU2NzE0MDk2NmVkZGM0NjMyMzhm
ZGUxZjZiODY0NTdkYjIyYTQ1ZjYxYzEzODg2YzMyNDRlYWZmZTEgIHJ0bDg4MTJhdS1haXJjcmFj
ay1uZy1mMjM5NzlmMGQyMGFhZmI1NjNhYzcxYjU2ZmNiYzc0MjY4Yzc5OGMyLnRhci5nego+ID4K
PiA+IFtzbmlwXQo+ID4KPiA+IC1SVEw4ODEyQVVfQUlSQ1JBQ0tfTkdfVkVSU0lPTiA9IDRhOTgz
ZTQ3ZGFmYzA0ODAxOTQxMjM1MGQzNjI3MDg2NGY2YjVmMmQKPiA+ICtSVEw4ODEyQVVfQUlSQ1JB
Q0tfTkdfVkVSU0lPTiA9IGYyMzk3OWYwZDIwYWFmYjU2M2FjNzFiNTZmY2JjNzQyNjhjNzk4YzIK
Pgo+IFRoYW5rcywgZml4ZXMgYnVpbGQgb24gNi44LnguCj4KPiBSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KCgpJIHdhcyB0cnlpbmcgdG8gcmVw
bHkgdG8gYW4gYWxyZWFkeSBzZW50IHBhdGNoOgoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDMxODIwMzUzNy4zNDE1MjMtMS1naXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tLwoKTm90IHN1cmUgaWYgdGhlIHJlcGx5IHdl
bnQgdG8gdGhlIGNvcnJlY3QgbWVzc2FnZSB0aHJlYWQuCgpUcnlpbmcgdG8gaW1wb3J0IGFuZCBz
ZW5kIHJlcGxpZXMgdG8gbWJveCB3aXRoIGdtYWlsIGlzIG5vdCBzbyBlYXN5IQoKVGhhbmtzLApD
aHJpc3RpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
