Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5D1C54798
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B893C4021F;
	Tue, 27 Feb 2024 16:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2WFAQln5tBBy; Tue, 27 Feb 2024 16:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1770405FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1770405FF;
	Tue, 27 Feb 2024 16:40:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0805F1BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 007E781299
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d2zzQQKCJnDY for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:40:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D5E881282
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D5E881282
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D5E881282
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:40:23 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-dc6d24737d7so3945868276.0
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709052023; x=1709656823;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TuY/Bm6Xz+x7XH1KVXwZZ03cnETXENWNxB50MFxQRH8=;
 b=Et7O2PrrZQlc2fiVZi/5hUgWBFJDTIb2UORDpYVBoS3pkLBqBqzXDd+s3FkR2dmIKI
 iWPXJqcOZjjVwlLcGJ6YxFQ4Ro4z3NK1xH0qC20+22vxzusPnQzjy9+QnOshr4F1mF/4
 OGpsnWW2+36wvKGkdZYazskF0WFwebHJIDqpSu3xxBhJsOhIqGv9AmGBh47dGW18QwrI
 nEdsX7Rw2IP/iL2wK/XJZP6sv9TQ/8XO/EzLq1c+3oNG/pK1OTdlX2/4cwio6ajG7as/
 spBatvfki/Dpcmq4xLne+E1X+MNRvRKH6KMYES8ug0EX/BG/lEXJiVw5vklfL1YeKR7f
 y8Eg==
X-Gm-Message-State: AOJu0YzfnhmeOYFMqtOhftNveu00ueIYPEklEODo7QXQx45av6iepw08
 3Ym+UO+mLXVuNBx3CONSRyk5zn0CXqD/SqiqqaGGI0UN+5dEZf8U4LQ/4SnUF9jhHXNElHhwF8Y
 /x1KtifAGD44OYATT/SLVtSDy7Ezh/RHWTB7VTQ==
X-Google-Smtp-Source: AGHT+IEuVbDGGlJVXT6ylyt4WFEhZJLGzhxIkBcIhtWt1T2L16e4mppGuilLtJNhhWk+vahQ9Hrs2BN8S2FXODkXVT8=
X-Received: by 2002:a25:af51:0:b0:dc7:48d7:9ed8 with SMTP id
 c17-20020a25af51000000b00dc748d79ed8mr2796239ybj.20.1709052022927; Tue, 27
 Feb 2024 08:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
 <20240224205654.1546744-17-dario.binacchi@amarulasolutions.com>
 <383a2418-fa99-44f6-935c-8423cf9c22b3@smile.fr>
In-Reply-To: <383a2418-fa99-44f6-935c-8423cf9c22b3@smile.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Feb 2024 17:40:12 +0100
Message-ID: <CABGWkvr8UBGB=z9QWwdZxjHQ53E0gjXRp9oK0PUTmwo3Vas28g@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709052023; x=1709656823;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TuY/Bm6Xz+x7XH1KVXwZZ03cnETXENWNxB50MFxQRH8=;
 b=Xz0fcwvjhSAmyWIF+gQvCGcN6ZH4GKQ4x1Oq2qwp/hcEFA41K2iia4wG7erg47qmND
 2JYRtwTSnWgOYtFHvpY6KaFjP4rLwXT0P0ehoEIGr1YHxLSIssynJk7P4blJ8qmJnLTk
 HI4pVgNDt+lEYF6bjc9hCytBwgtFDS/w3yJg0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Xz0fcwvj
Subject: Re: [Buildroot] [PATCH v6 16/16] configs/ti_am62x_sk_defconfig:
 bump Linux version to 6.6.17
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gU3VuLCBGZWIgMjUsIDIwMjQgYXQgNTo0M+KAr1BNIFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIERhcmlvLAo+Cj4gTGUg
MjQvMDIvMjAyNCDDoCAyMTo1NiwgRGFyaW8gQmluYWNjaGkgYSDDqWNyaXQgOgo+ID4gVGVzdGVk
IG9uIFNLLUFNNjJCLVAxLgo+Cj4gWW91IGNvdWxkIGNvbXBsZXRlIHlvdXIgc2VyaWVzIGJ5IHVw
ZGF0aW5nIHRoZSB0aV9hbTY0eF9za19kZWZjb25maWcgdG9vIGFuZAo+IHJlbW92ZSB0aS1rMy1p
bWFnZS1nZW4uCgpJIHByZWZlcnJlZCB0byBzdWJtaXQgdmVyc2lvbiA3IHdpdGhvdXQgdGhlIHBh
dGNoZXMgZm9yIHVwZGF0aW5nIHRoZQp0aV9hbTY0eF9za19kZWZjb25maWcgYW5kIHRoZSByZW1v
dmFsIG9mIHRoZSB0aS1rMy1pbWFnZS1nZW4gcGFja2FnZS4KVGhpcyBpcyBiZWNhdXNlIEkgZG8g
bm90IGhhdmUgdGhlIGFtNjR4X3NrIGJvYXJkIHRvIHRlc3QgdGhlIGNoYW5nZXMKb24uIEhvd2V2
ZXIsIEkgYW0gYXZhaWxhYmxlIHRvIHN1Ym1pdCBhIHNlcGFyYXRlIHNlcmllcyBmb3IgYXBwbHlp
bmcKdGhlIGNoYW5nZXMgdG8gdGlfYW02NHhfc2tfZGVmY29uZmlnIGlmIHRoZXJlIGlzIHNvbWVv
bmUgd2hvIGNhbiB0ZXN0CnRoZSBjb25maWd1cmF0aW9uIGZvciBtZS4KUGxlYXNlIGxldCBtZSBr
bm93LgoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoKPgo+IEV4Y2VwdCBmb3IgbWlub3IgaW1w
cm92ZW1lbnQsIHRoaXMgc2VyaWVzIGlzIG9rIGZvciBtZS4KPgo+IEJlc3QgcmVnYXJkcywKPiBS
b21haW4KPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5h
Y2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+Cj4gPiAtLS0KPiA+Cj4gPiBDaGFuZ2VzIGlu
IHY1Ogo+ID4gLSBCdW1wIHRvIDYuNi4xNyBmcm9tIDYuNi4xCj4gPiAtIFVwZGF0ZSBjb21taXQg
bWVzc2FnZQo+ID4KPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiAtIEFkZCBCUjJfUEFDS0FHRV9IT1NU
X0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNiB0byB0aV9hbTYyeF9za19kZWZjb25maWcuCj4gPgo+
ID4gbm8gY2hhbmdlcyBzaW5jZSB2MQo+ID4KPiA+ICBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNv
bmZpZyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29u
ZmlnIGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiA+IGluZGV4IDQ4NGY5ZmViOGM2
MS4uOGM5NjJiNGE5NDk0IDEwMDY0NAo+ID4gLS0tIGEvY29uZmlncy90aV9hbTYyeF9za19kZWZj
b25maWcKPiA+ICsrKyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4gPiBAQCAtMSwx
MSArMSwxMSBAQAo+ID4gIEJSMl9hYXJjaDY0PXkKPiA+IC1CUjJfUEFDS0FHRV9IT1NUX0xJTlVY
X0hFQURFUlNfQ1VTVE9NXzZfND15Cj4gPiArQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJT
X0NVU1RPTV82XzY9eQo+ID4gIEJSMl9ST09URlNfUE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL3Rp
L2FtNjJ4LXNrL3Bvc3QtYnVpbGQuc2giCj4gPiAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQ
VD0iYm9hcmQvdGkvYW02Mngtc2svcG9zdC1pbWFnZS5zaCIKPiA+ICBCUjJfUk9PVEZTX1BPU1Rf
U0NSSVBUX0FSR1M9Ii1jIHR0eVMyLDExNTIwMG44IC1yIC9kZXYvbW1jYmxrMXAyIC14IGVhcmx5
Y29uPW5zMTY1NTBhLG1taW8zMiwweDAyODAwMDAwIgo+ID4gIEJSMl9MSU5VWF9LRVJORUw9eQo+
ID4gIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+ID4gLUJSMl9MSU5VWF9LRVJO
RUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuNC4xNiIKPiA+ICtCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjYuMTciCj4gPiAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJD
SF9ERUZBVUxUX0NPTkZJRz15Cj4gPiAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4g
PiAgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9InRpL2szLWFtNjI1LXNrIgo+CgoK
LS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFy
aW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwg
MzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1
bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
