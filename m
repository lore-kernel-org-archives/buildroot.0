Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF07CC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 08:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4522D608F6;
	Wed, 28 Feb 2024 08:08:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qVnQ0kmFvrqk; Wed, 28 Feb 2024 08:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B43260906
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B43260906;
	Wed, 28 Feb 2024 08:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 394221BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 08:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25F79608F6
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 08:07:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16nDIiLexDJY for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 08:07:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E52B605AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E52B605AF
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E52B605AF
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 08:07:56 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso4852737276.0
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 00:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709107675; x=1709712475;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8TsXpT1n4COCOFy2uYf5fOu4HC8b+TXaUDBuH4s5ak=;
 b=c7+QXm6ie9pkGeWL6VVRc8QOhfP750HsO4sA9Jj5fcwQiX39SOsfhTklVNgvLi+LQs
 vNXJK091X1dPVVEzjTO4k0IapOoXTb6lKnmk3XtraCEzELSPnqNyKOEa0R6E5fwUicTA
 +NKLdafLNgXZDW5FJPYmnKD+G0m+gNIu2Uk0zswJBsMMK7EdG+i6eCQFNLZIPzC0rj9B
 K7szh21KyWfWjE17KmeVrdUE7Gp+ZoeXlDje91K/GM2NS0oXXZfjjwGReFOpVWFNMojc
 MgmhAyBkaEiBuOqjKDPf5iJhLI7lmCfhs+JXyVwaziP5FgUfpK1YXqyQbZLCK58j0XqR
 3Niw==
X-Gm-Message-State: AOJu0Yy0ILdjmG5BpeecsKa9PT+XskkV0uoGg0NYMjiXiEtpJUOop6TW
 wdENVuELs4dqaG12el5ZuJ7TD9ipJJP+2hRAQbq/5k4FZFqoHPOFQ85g7U4pWvXVK0LCkfM//Gp
 V+q58+pT0WyKgMSLnFmmQq/on+p9mEHMXamP8ig==
X-Google-Smtp-Source: AGHT+IGTYoEnXFTCKsNaMQc47ZlC4VMT5A2mPEGYjtnY5SOKhvMVfZugrtx6YFn6LT9n8i4Xe+k/6p9x/oDculSp2P0=
X-Received: by 2002:a25:8692:0:b0:dc6:d7de:5b29 with SMTP id
 z18-20020a258692000000b00dc6d7de5b29mr1821840ybk.10.1709107675140; Wed, 28
 Feb 2024 00:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
 <066a576a350d384c6547dc27b55e75c8044ed9e8.camel@gmail.com>
In-Reply-To: <066a576a350d384c6547dc27b55e75c8044ed9e8.camel@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 28 Feb 2024 09:07:44 +0100
Message-ID: <CABGWkvpMckL866WfOGeE2B_nsEWyPrjtEacgbO_gKqX9BPuW2A@mail.gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709107675; x=1709712475;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8TsXpT1n4COCOFy2uYf5fOu4HC8b+TXaUDBuH4s5ak=;
 b=bQZCgX9+kBDpFkRHuxcqkwG+Ev0QdkiRmZmXLtOQ77Dfi2K4qTJecq3ofnxZelzHaO
 5qqQOpumofFhoHEYFow6WIWpSe1Jnmb7YfsKb4APjiglLdA0+96aloM2rJaKzKePK3g2
 anTpbUD7hOxsQKGuwY2L6u0HYONgd/gMVh3yA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bQZCgX9+
Subject: Re: [Buildroot] [PATCH v7 00/17] Add support for AM62x-SK HS-FS
 devices
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGFuZGVyLAoKT24gV2VkLCBGZWIgMjgsIDIwMjQgYXQgMTowNuKAr0FNIEFsZXhhbmRl
ciBTdmVyZGxpbgo8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxs
byBEYXJpbywgUm9tYWluIQo+Cj4gT24gVHVlLCAyMDI0LTAyLTI3IGF0IDE3OjMwICswMTAwLCBE
YXJpbyBCaW5hY2NoaSB3cm90ZToKPiA+IFRoZSBTSy1BTTYyQi1QMSBpcyB0aGUgbmV3ZXN0IHZl
cnNpb24gb2YgU0stQU02MiB3aGljaCBpbmNsdWRlcwo+ID4gaGlnaC1zZWN1cml0eSBmaWVsZC1z
ZWN1cmFibGUgKEhTLUZTKSBzaWxpY29uIHRvIG9wdGlvbmFsbHkgY3VzdG9taXplIGtleXMKPiA+
IGFuZCBlbmNyeXB0aW9uIGZvciBzZWN1cml0eSBhcHBsaWNhdGlvbnMuCj4gPiBUaGlzIHJlcXVp
cmVzIGVuYWJsaW5nIHRoZSBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTX0ZT
IG9wdGlvbiwKPiA+IHdoaWNoLCBob3dldmVyLCB3YXMgYnVnZ3kuIFRoaXMgc2VyaWVzIGZpeGVz
IHRoZSBlcnJvcnMgYW5kIGJ1bXBzIHRoZSBMaW51eAo+ID4ga2VybmVsIGFuZCBVLUJvb3QgcmVx
dWlyZWQgZm9yIHN1Y2ggYSBuZXcgZGV2aWNlLgo+ID4KPiA+IERhcmlvIEJpbmFjY2hpICgxNyk6
Cj4gPiAgIGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnOiBmaXggQlIyX1RBUkdFVF9PUFRF
RV9PU19QTEFURk9STQo+ID4gICAgIHNldHRpbmcKPiA+ICAgY29uZmlncy90aV9hbTY0eF9za19k
ZWZjb25maWc6IGZpeCBCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNCj4gPiAgICAgc2V0dGlu
Zwo+ID4gICBjb25maWdzL3RpX2FtNjJ4X3NrX2RlZmNvbmZpZzogZXhwbGljaXRseSBzZXQgdGhl
IHRpLWszLXI1LWxvYWRlcgo+ID4gICAgIHZlcnNpb24KPiA+ICAgY29uZmlncy90aV9hbTY0eF9z
a19kZWZjb25maWc6IGV4cGxpY2l0bHkgc2V0IHRoZSB0aS1rMy1yNS1sb2FkZXIKPiA+ICAgICB2
ZXJzaW9uCj4gPiAgIGJvb3QvdGktazMtcjUtbG9hZGVyOiBidW1wIHRvIHZlcnNpb24gMjAyNC4w
MQo+ID4gICBwYWNrYWdlL3B5dGhvbi1hdHRyczogYWRkIGhvc3QgdmFyaWFudAo+ID4gICBwYWNr
YWdlL3B5dGhvbi1ycGRzLXB5OiBhZGQgaG9zdCB2YXJpYW50Cj4gPiAgIHBhY2thZ2UvcHl0aG9u
LXJlZmVyZW5jaW5nOiBhZGQgaG9zdCB2YXJpYW50Cj4gPiAgIHBhY2thZ2UvcHl0aG9uLWpzb25z
Y2hlbWEtc3BlY2lmaWNhdGlvbnM6IGFkZCBob3N0IHZhcmlhbnQKPiA+ICAgcGFja2FnZS9weXRo
b24tanNvbnNjaGVtYTogYWRkIGhvc3QgdmFyaWFudAo+ID4gICBib290L3RpLWszLXI1LWxvYWRl
cjogc2V0IGJpbm1hbiBlbnZpcm9ubWVudAo+ID4gICBib290L3Vib290OiBhZGQgQlIyX1RBUkdF
VF9VQk9PVF9VU0VfQklOTUFOIG9wdGlvbgo+ID4gICBwYWNrYWdlL3RpLWszOiBtb3ZlIFRJX0sz
X3tTRUNUWVBFLFNPQ30gb3V0IG9mIHRoZSBpbWFnZS1nZW4gc2NvcGUKPiA+ICAgcGFja2FnZS90
aS1rMzogZGlzYWJsZSBIUy1GUyBmb3IgQU02NSBTT0MKPiA+ICAgYm9vdC90aS1rMy90aS1rMy1y
NS1sb2FkZXI6IGluc3RhbGwgdGlib290My5iaW4KPiA+ICAgY29uZmlncy90aV9hbTYyeF9za19k
ZWZjb25maWc6IGJ1bXAgVS1Cb290IHZlcnNpb24gdG8gMjAyNC4wMQo+ID4gICBjb25maWdzL3Rp
X2FtNjJ4X3NrX2RlZmNvbmZpZzogYnVtcCBMaW51eCB2ZXJzaW9uIHRvIDYuNi4xNwo+Cj4gSSdt
IHNvcnJ5IGZvciBtaXNsZWFkaW5nIHlvdSB3aXRoIHRoZSByZXN1bHRzIHdpdGggdjYuCj4gSSd2
ZSBidWlsdCB2NyBzZXJpZXMgZm9yIEdQIGFuZCBpdCBydW5zIGZpbmUgb24gU0stQU02MiAoR1Ap
Lgo+IFNlZW1zIEkndmUgbWVzc2VkIHVwIGVpdGhlciBib290IGRpcCBzd2l0Y2hlcyBpbml0aWFs
bHkgb3IgdGhlIHNlcmlhbAo+IGNvbnNvbGUuIFRoYW5rcyBmb3IgeW91ciBlZmZvcnRzIQoKTmlj
ZSEKVGhhbmsgeW91IGZvciB5b3VyIHRlc3RzLgoKVGhhbmtzIGFuZCByZWdhcmRzLApEYXJpbwoK
Pgo+IFRlc3RlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21h
aWwuY29tPgo+Cj4gLS0KPiBBbGV4YW5kZXIgU3ZlcmRsaW4uCj4KCgotLSAKCkRhcmlvIEJpbmFj
Y2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFt
YXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBW
ZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20K
Cnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
