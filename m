Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26305C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 07:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C09F881B04;
	Wed,  6 Apr 2022 07:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UiE3zaF5UAqI; Wed,  6 Apr 2022 07:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEE4081AD1;
	Wed,  6 Apr 2022 07:10:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B2CE1BF2F2
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 07:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5631F610AB
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 07:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXPGwCXjfyp8 for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 07:10:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAFE660EC0
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 07:10:47 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id q129so1549324oif.4
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZS75oWeFcSw5XkscTR2kLtLF0pAvYkvADveYF5kve6U=;
 b=po6SwLoZIS1oPqu45OB5+R94fHawBq0FKeOQPzNi6U7Hdw/FhxwYZl6DZoqi0lZNML
 DU15k7s4gRxurWsWgf7/hx5Z3eJiiKcA0Ve/0y/gIGE+L4n3+qUAA6n46XOtECOTNqs/
 sh6/G/6nN6oEFkRIXZWLd8kwsEJmSesdGMFqOzpq56wy7QC7w49BMekOwo5jgUX2dPwP
 Ln3JYPxFSYiNGCHLDTvEu7HfeJ6pudI6X4vsR5d/ZXvlpoCATIKDuBMgpJYvaXSq6P23
 Mmks8kMDoimFM2LOrI6fOG/5mbQ91V5DwX+heC4UsMJ0DKdghjycfKScv3S0RWnQmiSE
 QpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZS75oWeFcSw5XkscTR2kLtLF0pAvYkvADveYF5kve6U=;
 b=dpp4CJVR3TuJajzffgUgKX4bueklE/fnmke+EqqX/MJKnAwoF1XCxjCbHHutNpnDV4
 83UhXJX+3mN/vyGAuV6q9JPOFMIH81KZ57UG4ADDWNyXme/6DAwqeWK4/Nax34VgqjUj
 Wsb6w3FKFkkP8XL0Cp1R3hD+idezCGSjzafWdu3hn2IzQtldMoeTITxj1q5nCcJc+vAs
 J7SI9/5kvgA39DdG7nc54FUVrwLurFG6oPI4udL9c0l4Peda2eL2IK9pcWbVZcMg3GH8
 MQz5AE+DKVLLopPPWA0Hbcnp8dQLp5Bp16ueM8iCO29Lqv3xAQb07djOaoTaK01YPM07
 Ivmg==
X-Gm-Message-State: AOAM530rWFvoU29Gx4osvSm0fnqeL7/djWeS3Q8b1yxgBjBNkP0Olfe8
 0wMxR0HzTh8GlEGUHK4KqTP5zKFK2LjebkhXsaY=
X-Google-Smtp-Source: ABdhPJxUaj1LBC1qaGY4zslmRzHF6t/PjJ2/+1Y1OTszt0Cx5ZYWCPxc834lxCDTv0wOBdcvngtzvk0HYoVoWZ2aQPw=
X-Received: by 2002:aca:f1d5:0:b0:2ec:eaab:eb9b with SMTP id
 p204-20020acaf1d5000000b002eceaabeb9bmr2924800oih.228.1649229046688; Wed, 06
 Apr 2022 00:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <DU0P251MB0779CD19DBCAA7F149788B41E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <CAPi7W83fzfin6_1KXV8BTy=AmcguoAK86mm4bFRrviFHBKmPbw@mail.gmail.com>
 <DU0P251MB07793F7BF68D17755B50F5F1E3E49@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
 <20220405181815.5dd6d85e@gmx.net>
 <GV1P251MB0771B70C2179F1A7FEFD76FBE3E79@GV1P251MB0771.EURP251.PROD.OUTLOOK.COM>
In-Reply-To: <GV1P251MB0771B70C2179F1A7FEFD76FBE3E79@GV1P251MB0771.EURP251.PROD.OUTLOOK.COM>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 6 Apr 2022 09:08:58 +0200
Message-ID: <CAPi7W81e46JtetOtwT-RX8sJzVmEL_YMZrp89KBn1GCGrJfbyg@mail.gmail.com>
To: Tim Hammer <Tim.Hammer@orolia.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: use internal bind
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWVyLiA2IGF2ci4gMjAyMiDDoCAwMzo1OCwgVGltIEhhbW1lciA8VGltLkhhbW1lckBvcm9s
aWEuY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBUdWUsIEFwciAwNSwgMjAyMiBhdCAwNjoxODoxNVBN
ICswMjAwLCBQZXRlciBTZWlkZXJlciB3cm90ZToKPiA+IEhlbGxvIFRpbSwKPiA+Cj4gPiBPbiBU
dWUsIDUgQXByIDIwMjIgMTI6MTU6MTQgKzAwMDAsIFRpbSBIYW1tZXIgPFRpbS5IYW1tZXJAb3Jv
bGlhLmNvbT4gd3JvdGU6Cj4gPgo+ID4gPiBPbiBUdWUsIEFwciAwNSwgMjAyMiBhdCAwODoxOTow
OEFNICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+ID4gPiA+IERlYXIgVGltLAo+ID4g
PiA+Cj4gPiA+ID4gTGUgbWFyLiA1IGF2ci4gMjAyMiDDoCAwNTo1NCwgVGltIEhhbW1lciA8VGlt
LkhhbW1lckBvcm9saWEuY29tPiBhIMOpY3JpdCA6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gU3Vu
LCBBcHIgMDMsIDIwMjIgYXQgMTI6MDM6MThQTSArMDIwMCwgRmFicmljZSBGb250YWluZSB3cm90
ZToKPiA+ID4gPiA+ID4gVXNlIGludGVybmFsIGJpbmQgYXMgZGhjcCBkb2Vzbid0IGJ1aWxkIHNp
bmNlIGJ1bXAgb2YgYmluZCB0byB2ZXJzaW9uCj4gPiA+ID4gPiA+IDkuMTYuMjYgaW4gY29tbWl0
IDhhZGVhZWM4YWZhY2JjNjgwZWRlYmFlOTE1MjRmNjE0NDkyNmFjOTIgYW5kIHVwc3RyZWFtCj4g
PiA+ID4gPiA+IGRvZXNuJ3QgcGxhbiB0byBmaXggaXQgYW55IHRpbWUgc29vbjoKPiA+ID4gPiA+
ID4gaHR0cHM6Ly9naXRsYWIuaXNjLm9yZy9pc2MtcHJvamVjdHMvZGhjcC8tL2lzc3Vlcy8yMzMj
bm90ZV8yNzY4ODMKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC4uL2luY2x1ZGVzL2RoY3BkLmg6OTEsCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgZnJv
bSBjdHJhY2UuYzoyOToKPiA+ID4gPiA+ID4gLi4vaW5jbHVkZXMvb21hcGlwL2lzY2xpYi5oOjUx
OjEwOiBmYXRhbCBlcnJvcjogaXNjL2Jvb2xlYW4uaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eQo+ID4gPiA+ID4gPiAgICA1MSB8ICNpbmNsdWRlIDxpc2MvYm9vbGVhbi5oPgo+ID4gPiA+ID4g
PiAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiAgIC4uLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgIyB1c2UgbGlidG9vbC1lbmFibGVkIGNv
bmZpZ3VyZS5hYwo+ID4gPiA+ID4gPiAgZGVmaW5lIERIQ1BfTElCVE9PTF9BVVRPUkVDT05GCj4g
PiA+ID4gPiA+IEBAIC0yMSwxMSArMjMsMTIgQEAgREhDUF9DT05GX0VOViA9IFwKPiA+ID4gPiA+
ID4gICAgICAgQ1BQRkxBR1M9Jy1EX1BBVEhfREhDUERfQ09ORj1cIi9ldGMvZGhjcC9kaGNwZC5j
b25mXCIgXAo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgIC1EX1BBVEhfREhDTElFTlRfQ09ORj1c
Ii9ldGMvZGhjcC9kaGNsaWVudC5jb25mXCInIFwKPiA+ID4gPiA+ID4gICAgICAgQ0ZMQUdTPSck
KFRBUkdFVF9DRkxBR1MpIC1ESVNDX0NIRUNLX05PTkU9MScKPiA+ID4gPiA+ID4gK0RIQ1BfQklO
RF9FWFRSQV9DT05GSUcgPSBCVUlMRF9DQz0nJChUQVJHRVRfQ0MpJwo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4KPiA+ID4gPiA+IFRoZSBvbmx5IHBsYWNlIEJVSUxEX0NDIGlzIHVzZWQgaW4gdGhlIGJ1
bmRsZWQgYmluZC05LjExIGlzIHRvIGJ1aWxkIGxpYi9kbnMvZ2VuLCB3aGljaCBuZWVkcyB0byBy
dW4gb24gdGhlIGhvc3QuCj4gPiA+ID4gPiBTbyB0aGlzIHNob3VsZCBiZSB0aGUgaG9zdCBjb21w
aWxlciwgbm90IHRoZSB0YXJnZXQuCj4gPiA+ID4gPiBJIGRvIG5vdCBrbm93IHRoZSBiZXN0L2Nv
cnJlY3Qgd2F5IHRvIGluZGljYXRlIHRoaXMuIFRvIGdldCBwYXN0IHRoZSBpc3N1ZSBJIGNoYW5n
ZWQgaXQgdG8gJy91c3IvYmluL2djYycuLi4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcyBmb3Igc3Bv
dHRpbmcgdGhpcywgSSBiYXNpY2FsbHkgY29weS9wYXN0ZWQgd2hhdCB3YXMgZG9uZSBpbiBiaW5k
Lm1rLgo+ID4gPiA+IFRoZSBjb3JyZWN0IHdheSB0byBkbyB0aGlzIGlzIHRvIHVzZSAkKEhPU1Rf
Q0MpIGluc3RlYWQgb2YgJChUQVJHRVRfQ0MpLgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRoaXMgaXMg
d2h5IEkgc2FpZCBJIGRvIG5vdCBrbm93IHRoZSBjb3JyZWN0IHdheS0gd2hlbiBJIHVzZSAkKEhP
U1RfQ0MpLCBJIGdldAo+ID4gPiAgICAgID4+PiBkaGNwIDQuNC4yLVAxIEJ1aWxkaW5nCj4gPiA+
ICAgICAgUEFUSD0iL2hvbWUvdGhhbW1lci9QdWJsaWMvYnVpbGRyb290L1RFU1QvaG9zdC9iaW46
L2hvbWUvdGhhbW1lci9QdWJsaWMvYnVpbGRyb290L1RFU1QvaG9zdC9zYmluOi9ob21lL3RoYW1t
ZXIvLmxvY2FsL2JpbjovaG9tZS90aGFtbWVyL2JpbjovdXNyL2xvY2FsL3NiaW46L3Vzci9sb2Nh
bC9iaW46L3Vzci9zYmluOi91c3IvYmluOi9zYmluOi9iaW46L3Vzci9nYW1lczovdXNyL2xvY2Fs
L2dhbWVzOi9zbmFwL2Jpbjovb3B0L2FsdGVyYS9uaW9zMmVkcy9iaW4vZ251L0gteDg2XzY0LXBj
LWxpbnV4LWdudS9iaW46L29wdC9hbHRlcmEvbmlvczJlZHMvc2RrMi9iaW46L29wdC9hbHRlcmEv
bmlvczJlZHMvYmluOi9vcHQvYWx0ZXJhL3F1YXJ0dXMvYmluOi9vcHQvYWx0ZXJhL3F1YXJ0dXMv
c29wY19idWlsZGVyL2JpbiIgIC91c3IvYmluL21ha2UgLWoxICAtQyAvaG9tZS90aGFtbWVyL1B1
YmxpYy9idWlsZHJvb3QvVEVTVC9idWlsZC9kaGNwLTQuNC4yLVAxLwo+ID4gPiAgICAgIE1ha2lu
ZyBhbGwgaW4gLi9iaW5kCj4gPiA+ICAgICAgQ29uZmlndXJpbmcgQklORCBsaWJyYXJpZXMgZm9y
IERIQ1AuCj4gPiA+ICAgICAgY29uZmlndXJlOiBXQVJOSU5HOiB1c2luZyBjcm9zcyB0b29scyBu
b3QgcHJlZml4ZWQgd2l0aCBob3N0IHRyaXBsZXQKPiA+ID4gICAgICBjb25maWd1cmU6IGVycm9y
OiBCVUlMRF9DQyBub3Qgc2V0Cj4gPiA+ICAgICAgbWFrZVszXTogKioqIFtNYWtlZmlsZTo0Mjog
YmluZDFdIEVycm9yIDEKPiA+ID4KPiA+ID4KPiA+ID4gPiBIb3dldmVyLCBJIGFzc3VtZSB0aGF0
IEJVSUxEX0NDIGFuZCBCVUlMRF9DRkxBR1MgaW4gYmluZC5tayBzaG91bGQKPiA+ID4gPiBhbHNv
IGJlIHVwZGF0ZWQ/Cj4gPiA+Cj4gPiA+IEkgZG8gbm90IGhhdmUgdGhlIGlzc3VlIGJ1aWxkaW5n
IGJpbmQgKDkuMTYuMjYpLCB0aGVyZSBsaWIvZG5zL01ha2VmaWxlLmluIHNlZW1zIHRvIGJlIGJl
dHRlciB3cml0dGVuOgo+ID4gPgo+ID4gPiAgICAgIGdlbjogZ2VuLmMKPiA+ID4gICAgICR7SE9T
VENDfSAke0hPU1RfQ0ZMQUdTfSAtSSR7dG9wX3NyY2Rpcn0vbGliL2lzYy9pbmNsdWRlIFwKPiA+
ID4gICAgICR7SE9TVF9MREZMQUdTfSAtbyAkQCAke3NyY2Rpcn0vZ2VuLmMKPiA+ID4KPiA+ID4g
UGVyaGFwcyB3ZSBzaG91bGQgYmUgcGF0Y2hpbmcgdGhhdCBmaWxlIGluc3RlYWQgb2YgdGhlIGNv
bmZpZz8KPiA+Cj4gPiBTZWUgaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvdHJl
ZS9wYWNrYWdlL2JpbmQvMDAwMS1jcm9zcy5wYXRjaAo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBQZXRl
cgo+ID4KPgo+IFllcywgdGhhdCByZWluZm9yY2VzIG15IHRoaW5raW5nLiBVbmZvcnR1bmF0ZWx5
LCB0aGUgYnVuZGxlZCBiaW5kIGlzIG5vdCB1bnppcHBlZCB1bnRpbCB0aGUgYnVpbGQgc3RlcAo+
IGFuZCBJIGhhdmUgbm90IGZpZ3VyZWQgb3V0IGEgZ29vZCB3YXkgdG8gZ2V0IHRoaXMgZGlmZiBp
biBwbGFjZS4KPiBQZXJoYXBzIHNvbWVvbmUgd2l0aCBtb3JlIGV4cGVyaWVuY2UgY2FuIHNlZSB0
aGUgc29sdXRpb24gdGhhdCBpcyBlbHVkaW5nIG1lPwoKTXkgYmFkLCBJIG1hZGUgYSB0eXBvIGlu
IG15IGZpcnN0IG1haWwsIHlvdSBzaG91bGQgdXNlICQoSE9TVENDKSBhbmQKbm90ICQoSE9TVF9D
QykuClBhdGNoaW5nIGJpbmQgaXMgbm90IG5lZWRlZC4KSSBjYW4gc2VuZCB0aGUgcGF0Y2ggb3Ig
bGV0IHlvdSBoYW5kbGUgaXQuCgo+Cj4gLlRpbQo+IFRpbSBELiBIYW1tZXIKPiB0aW0uaGFtbWVy
QG9yb2xpYS5jb20KPgo+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IENvdWxkIHlvdSBzZW5kIHRo
b3NlIHR3byBwYXRjaGVzIChkaGNwIGFuZCBiaW5kKSB0byB0aGUgYnVpbGRyb290Cj4gPiA+ID4g
bWFpbGluZyBvciBkbyB5b3UgcHJlZmVyIHRoYXQgSSBzZW5kIHRoZW0/Cj4gPiA+ID4KPiA+ID4K
PiA+ID4gSSBjYW4gdHJ5IG91dCBteSBvdGhlciB0aG91Z2h0IGFuZCBzZW5kIHRoYXQgaW4gYSB3
aGlsZSAoaWYgaXQgc2VlbXMgdG8gd29yaykuCj4gPiA+Cj4gPiA+ID4gPiAuLi4KPiA+ID4gPiA+
Cj4gPiA+ID4KPiA+ID4gPiBCZXN0IFJlZ2FyZHMsCj4gPiA+ID4gRmFicmljZQo+ID4gPgo+ID4g
PiAuVGltCj4gPiA+IFRpbSBELiBIYW1tZXIKPiA+ID4gdGltLmhhbW1lckBvcm9saWEuY29tCj4g
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+
ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
CkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
