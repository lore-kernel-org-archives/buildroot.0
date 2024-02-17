Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF84C48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 20:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0108A81F09;
	Sat, 17 Feb 2024 20:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7qD0FG_pad3g; Sat, 17 Feb 2024 20:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F3BD81F3B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F3BD81F3B;
	Sat, 17 Feb 2024 20:20:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB0101BF59E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 20:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B581C40720
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 20:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPkhFVYrbO8Y for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 20:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4468F40717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4468F40717
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4468F40717
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 20:20:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33d2b354c72so484269f8f.1
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 12:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708201218; x=1708806018;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+v+n3ZuLSFNp/m72fjCRdG/Kbs0x/ZSw2VpNx9kr684=;
 b=tN6fWcgFS9KhzXSCDeXMm6+4ihi2qdQml6fhMr2c0R8JJriy9kjlctEjWYHohKbBW3
 YdR6JPPm+MDfv9lT0gxPAVkpQ6F0kHUo4KWsl7gIdLPJkIW2Q6Ahv2PnJPfpt5Oks7Qh
 ngFYl2UR919ysij7+Iwht/qfkwJV8FQNBYoSedXDADbIp18G2zJKa8d2ivX/Au6+6EGr
 J+o9kPCal1wm2cXMImrP1yxoQEie7K2Z+5FJ6Wgwq0cFqLUHT1FdG6dglnF1oxqo0PKO
 g76njf2FDwQlR58oWGaFVGRplEpJATTtnh2BrpLj+MU7GdBLr+0I5s0t3kgeIugyGceZ
 dDNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJa6HAoUnjYIIrqAnoE7RV4LdnsRh9szd00g4npuxTXNFXJwgSrvb4RBtR2YsidpMdLTIVSIbcgSElk1MUp/yyLMp3ux2jbw==
X-Gm-Message-State: AOJu0Yy+Hur6DiAaNnqRVwXANqJgKwghhxY1DnT2I4y3bGbIRBMbzzw6
 YfHS2c3Pevogu2wRNhugY7Xt1IDHS7i05mXCstTA2y3hG8hFnOa9
X-Google-Smtp-Source: AGHT+IHqYco61wJuFMQ+/neaYdyKecmBWdxl2saiCMJg6wTCcQ5J0SPV9dXZPEkMrXEgtdpI+HUxog==
X-Received: by 2002:adf:a30e:0:b0:33d:1f21:2dd with SMTP id
 c14-20020adfa30e000000b0033d1f2102ddmr3891988wrb.40.1708201218077; 
 Sat, 17 Feb 2024 12:20:18 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 bw4-20020a0560001f8400b0033d297c9118sm2924910wrb.24.2024.02.17.12.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 12:20:17 -0800 (PST)
Message-ID: <73868728d467604fa82ada93e652c23eca4afaa6.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 buildroot@buildroot.org
Date: Sat, 17 Feb 2024 21:20:22 +0100
In-Reply-To: <20240217160244.1320482-16-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-16-dario.binacchi@amarulasolutions.com>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708201218; x=1708806018; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+v+n3ZuLSFNp/m72fjCRdG/Kbs0x/ZSw2VpNx9kr684=;
 b=B3QFbQlTG9Lcjea7NoQeFine9pQ0JXx/GE66+7M3koXbRTFNz7dWjezYu92NuNW4Xa
 AUPz7+TLRqJ0xlxe3Rzayf5pracluCxYgma4HQQIzfd9qplrqBXD3u1jBGPd0v3MMEbd
 FLjlm3TjcUgte481+6PsQ4IsVVD6ZYHrfjRuzFWF5y/zIhqa0HodaaNY2OAZpbeFAtGX
 OitaXQXxCINnFLlysTxPHfkCXtZDhnvIi/CGGqsdi/dXsR2WwsS0L/bdZ1cvP99W+nVw
 Dk5FtCoxlNycdCkhRpNXmx1n4eqBnVkleZfiBcfz6o4EkJZwhDcLyLi6wp9uweYkomiz
 A4fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B3QFbQlT
Subject: Re: [Buildroot] [PATCH v4 15/20] configs/ti_am62x_sk_defconfig:
 bump U-Boot version to 2024.01
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCAyMDI0LTAyLTE3IGF0IDE3OjAyICswMTAwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToK
PiBUaGUgMjAyNC4wMSB2ZXJzaW9uIG9mIFUtQm9vdCBmb3IgdGhlIGFtNjJ4LXNrIGJvYXJkIGhh
cyBpbnRyb2R1Y2VkIHR3bwo+IG1ham9yIGNoYW5nZXM6Cj4gLSBUaGUgZGV2aWNlIHRyZWUgazMt
YW02MjUtc2suZHRiIGlzIG5vIGxvbmdlciBzZWFyY2hlZCBpbiAvYm9vdCwgYnV0IGluCj4gwqAg
L2Jvb3QvZHRiL3RpLiBIZW5jZSwgdGhlIGRpc2FibGluZyBvZiBCUjJfTElOVVhfS0VSTkVMX0lO
U1RBTExfVEFSR0VUCj4gwqAgYW5kIHRoZSB1c2Ugb2YgZXh0bGludXguY29uZiBmb3IgdGhlIHBy
b3BlciBsb2FkaW5nIG9mIHRoZSBkZXZpY2UgdHJlZS4KPiDCoCBGdXJ0aGVybW9yZSwgdGhlIHBh
cmFtZXRlciBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1Mgd2FzIHVzZWQgdG8KPiDCoCBhdXRv
LWdlbmVyYXRlIHRoZSBleHRsaW51eC5jb25mIGZpbGUgc28gdGhhdCBkZXZlbG9wZXJzIGNhbiBj
aGFuZ2UgdGhlCj4gwqAga2VybmVsIGxvYWRpbmcgb3B0aW9ucyBieSBtb2RpZnlpbmcgdGhlIC5j
b25maWcuCj4gLSBUaGUgdXNlIG9mIGJpbm1hbiBmb3IgYnVpbGRpbmcgaW1hZ2VzLgo+IAo+IFRl
c3RlZCBvbiBTSy1BTTYyQi1QMS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CgpbXQoKPiBAQCAtMjcsMTQgKzI3
LDE1IEBAIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOPXkKPiDCoEJSMl9UQVJHRVRfVElfSzNf
SU1BR0VfR0VOX1NPQ19BTTYyWD15Cj4gwqBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUj15Cj4g
wqBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fVkVSU0lPTj15Cj4gLUJSMl9UQVJH
RVRfVElfSzNfUjVfTE9BREVSX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIyLjEwIgo+ICtCUjJf
VEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNC4wMSIKCklz
IHBhdGNoIDMvMjAgcmVhbGx5IHJlcXVpcmVkIGluIHRoaXMgY2FzZT8KSXMgY3VzdG9tIHZlcnNp
b24gcmVxdWlyZWQgaWYgeW91IHNldCB0aGUgc2FtZSB2ZXJzaW9uIGFzIGRlZmF1bHQgaW4gcGF0
Y2gKNS8yMD8KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
