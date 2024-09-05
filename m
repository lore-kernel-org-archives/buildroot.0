Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32086CD4F54
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 06:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9CA640612;
	Thu,  5 Sep 2024 06:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48TLYFS6MlFH; Thu,  5 Sep 2024 06:10:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A38D540607
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A38D540607;
	Thu,  5 Sep 2024 06:10:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86D901BF2B9
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 06:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7116B40BE2
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 06:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlN-HwXpYaFP for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 06:10:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3DBA40BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3DBA40BC1
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3DBA40BC1
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 06:10:07 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e1d22ecf2a6so491100276.1
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 23:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725516606; x=1726121406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIT+JoMdwgNkik+VYlUHcH1FB/POrcR4o9Lg2ve5eDU=;
 b=hY6PObXt6+Xz24pI85yAsevhKuLAJtHgoCmt4Ax7ZXwqpYRu/FC1eDXobWucpOk1Wj
 +vCe6qiyiFUVrDrMqP1ZSBgjo9nDQYl1XjGUaZaWdeV/FP8R3kgBAV6mOvbL5yAQVtTw
 Ft9natv7Tpgcb1hQqyMxeKA/DsagZW/MXLPav4+drXbLJGY30YgcUYWC+TfH6YQUCIGT
 qpiZ4v5Xa8Xmab4MlqaGhOD7NolIKoVAyhsaKGYmrYTx6zpiJ+Yg66M9sc7Mq+TgrO57
 /dfLltXSuSCn6PxcB7wXOm8oj6afzXC2lvPu32t2/yaOjy58orszoD3PffqCLdcSScVg
 Aclw==
X-Gm-Message-State: AOJu0YwthmUiRwfNxU0agUcTNW63UYmNY3ys61bOBHP8U7mpSWREeOZR
 GcbJcBUvoHsOxCP2C5DkX5KAa/sxAeFuKJwdXgd0DuGMBndWInJBzyoMVluOpL5tr5/U8PTm222
 5MJBbJbaEdINgKt/+FKUKMjobOLgxBWV/zY+E1A==
X-Google-Smtp-Source: AGHT+IGIqoL4Dn7W8bveZ+ABPQYkjIkaQCOHC9teNZ/vXBruC/EvovkScNYL+bxcRTsxefJtN101Bde4MwPBAPgVGhU=
X-Received: by 2002:a05:6902:1244:b0:e16:4dc7:aad8 with SMTP id
 3f1490d57ef6-e1a79fe77c4mr24308920276.11.1725516606432; Wed, 04 Sep 2024
 23:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240904174021.2670289-1-dario.binacchi@amarulasolutions.com>
 <ZtikL2bVIPqtvgJA@landeda>
In-Reply-To: <ZtikL2bVIPqtvgJA@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 5 Sep 2024 08:09:55 +0200
Message-ID: <CABGWkvqUodd2xpSpELk+_SbwuPrcpgiMfjWPsGDdWTme7_L=EQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725516606; x=1726121406;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIT+JoMdwgNkik+VYlUHcH1FB/POrcR4o9Lg2ve5eDU=;
 b=CGyQenl9fCRmPtbK0zVmrKWuoXk9ZTwpRCIOmHmC3juiU3fP2JcmR25NA0Fr0uzd9I
 3GrMzupqDw/NmiKFRwQi15ejagWZO1pGOndUXbOT7bd/JdcDg3muuuN0S55t/Lg4+7gV
 ykj3Cpgf/8/WGIE8n0hRrKeYCBL/XWxkfZ7J0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=CGyQenl9
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ipmitool: download
 enterprise-numbers versioned
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFdlZCwgU2VwIDQsIDIwMjQgYXQgODoxN+KAr1BNIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IERhcmlvLCBBbGwsCj4KPiBUaGFu
a3MgZm9yIHlvdXIgcGVyc2lzdGVtY2UgaW4gZml4aW5nIHRoaXMgaXNzdWUhIDotKQo+Cj4gT24g
MjAyNC0wOS0wNCAxOTo0MCArMDIwMCwgRGFyaW8gQmluYWNjaGkgc3Bha2UgdGh1c2x5Ogo+ID4g
VGhlIHByZXZpb3VzIGRlZmF1bHQgVVJMIHVzZWQgZm9yIHRoZSBQRU4gcmVnaXN0cnkgd2FzIG5v
dCBzdGFibGUgYW5kCj4gPiBjb3VsZCBjaGFuZ2UgYXQgYW55IHRpbWUsIG1ha2luZyBpdCB1bmFj
Y2VwdGFibGUgdG8gaGF2ZSB0byB1cGRhdGUgaXRzCj4gPiBoYXNoIGV2ZXJ5IHRpbWUuIEZvbGxv
d2luZyB0aGUgc3VnZ2VzdGlvbnMgcHJvdmlkZWQgYnkgVGhvbWFzIFBldGF6em9uaSwKPiA+IHRo
ZSBmaWxlIGlzIG5vdyBkb3dubG9hZGVkIGZyb20gYSBHaXRIdWIgcmVwb3NpdG9yeSwgd2hpY2gg
bWVhbnMgaXQgaXMKPiA+IHZlcnNpb25lZC4KPiBbLS1TTklQLS1dCj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9pcG1pdG9vbC9Db25maWcuaW4gYi9wYWNrYWdlL2lwbWl0b29sL0NvbmZpZy5pbgo+
ID4gaW5kZXggOTUxNmZmODU5NmQzLi43ODNiZDI2Mzc1NmUgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNr
YWdlL2lwbWl0b29sL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9pcG1pdG9vbC9Db25maWcu
aW4KPiA+IEBAIC0xMSw3ICsxMSw3IEBAIGlmIEJSMl9QQUNLQUdFX0lQTUlUT09MCj4gPgo+ID4g
IGNvbmZpZyBCUjJfUEFDS0FHRV9JUE1JVE9PTF9QRU5fUkVHX1VSSQo+ID4gICAgICAgc3RyaW5n
ICJJQU5BIFBFTiByZWdpc3RyeSBVUkwgb3IgcGF0aCIKPiA+IC0gICAgIGRlZmF1bHQgImh0dHBz
Oi8vd3d3LmlhbmEub3JnL2Fzc2lnbm1lbnRzL2VudGVycHJpc2UtbnVtYmVycy50eHQiCj4gPiAr
ICAgICBkZWZhdWx0ICJodHRwczovL2dpdGh1Yi5jb20vbGFyc2VnZ2VydC9pYW5hLWFzc2lnbm1l
bnRzL3Jhdy82ZWFmNTVjMWMyNDk0MWRiMjU0NmRhMjQyMDI5Y2VlYWJhM2Y5ZGZjL2VudGVycHJp
c2UtbnVtYmVycy9lbnRlcnByaXNlLW51bWJlcnMiCj4KPiBUaGF0J3MgdW5mb3J0dW5hdGVseSBu
b3QgZW5vdWdoLCBzZWUgYmVsb3cuLi4KPgo+ID4gICAgICAgaGVscAo+ID4gICAgICAgICBFbnRl
ciBhbiBVUkwgb3IgYSBmaWxlIHBhdGggdG8gdGhlIFBFTiByZWdpc3RyeSB0byB1c2UuCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaXBtaXRvb2wvaXBtaXRvb2wuaGFzaCBiL3BhY2thZ2Uv
aXBtaXRvb2wvaXBtaXRvb2wuaGFzaAo+ID4gaW5kZXggYzNiMjk4ZTNiYTVkLi5mMmU5MWVmOTAw
MGQgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2lwbWl0b29sL2lwbWl0b29sLmhhc2gKPiA+ICsr
KyBiL3BhY2thZ2UvaXBtaXRvb2wvaXBtaXRvb2wuaGFzaAo+ID4gQEAgLTEsMyArMSw0IEBACj4g
PiAgIyBMb2NhbGx5IGNvbXB1dGVkOgo+ID4gIHNoYTI1NiAgNDhiMDEwZTdiY2RmOTNlNGU0YjZl
NDNjNTNjN2Y2MGFhNjg3M2Q1NzRjYmQ0NWE4ZDg2ZmE3YWFlZWJhZmY5YyAgaXBtaXRvb2wtMV84
XzE5LnRhci5nego+ID4gIHNoYTI1NiAgYjdlMjM4MmE4YmU0M2I1ZjZjYjA5MmYyZDJiZGExNjNi
ZjFhMTkzOGJlOTMwMGY4MjFhODQ1Y2JjZDUzNWY1NiAgQ09QWUlORwo+ID4gK3NoYTI1NiAgNDVl
Y2EzY2FkYWRkOGE4MjczNmQ4M2IxMzAxMDZkYTIyY2Q0OWEzNGQyODdjOWM0YzdmMTBkZmZiNDU3
OWY0ZiAgZW50ZXJwcmlzZS1udW1iZXJzCj4KPiBJbmRlZWQsIHRoZSBmaWxlbmFtZSBpdHNlbGYg
aXMgc3RpbGwgdW52ZXJzaW9uZWQsIHNvIHdoZW4gd2UgdXBkYXRlIHRoZQo+IHZlcnNpb24gaW4g
dGhlIFVSTCwgdGhlIGxvY2FsIGZpbGUgd291bGQgbm90IGNoYW5nZSBuYW1lLCBhbmQgdGh1cwo+
IHRoYXQnZCBjYXVzZSB0aGUgc2FtZSBpc3N1ZXMgSSBleHBsYWluZWQgZWFybGllci4KClllcywg
eW91J3JlIHJpZ2h0LCB3ZSBmYWxsIGludG8gdGhlIGNhc2VzIHlvdSBkZXNjcmliZWQgdG8gbWUg
ZWFybGllci4KCj4KPiBJIHRyaWVkIGEgZmV3IGhhY2tzLCBub3RhYmx5IHRoZSBpbmZhbW91cyBH
RVQgcGFyYW1ldGVycywgbGlrZToKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9sYXJzZWdnZXJ0L2lh
bmEtYXNzaWdubWVudHMvcmF3LzZlYWZbLi4uXWVudGVycHJpc2UtbnVtYmVycy9lbnRlcnByaXNl
LW51bWJlcnMmcGF0aD1mb28vZW50ZXJwcmlzZS1udW1iZXJzLTZlYWZbLi4uXS50eHQKPgo+IGFu
ZCB2YXJpb3VzIHZhcmlhbnRzIG9mIHRoYXQsIGJ1dCB0byBub3QgYXZhaWwuLi4gU28sIHVubGVz
cyB5b3UgY2FuCj4gY29tZSB1cCB3aXRoIGEgd2F5IHRvIGhhY2sgYSB2ZXJpb25lZCBmaWxlbmFt
ZSBpbiB0aGUgVVJMLCB3ZSdsbCBoYXZlIHRvCj4gaW50cm9kdWNlIGEgZGVkaWNhdGVkIHBhY2th
Z2UuLi4gOi0vCgpBRkFJSywgYWRkaW5nIHRoZSBwYWNrYWdlIGlzIHByb2JhYmx5IHRoZSBjbGVh
bmVzdCBzb2x1dGlvbi4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4KPiBSZWdhcmRzLAo+
IFlhbm4gRS4gTU9SSU4uCj4KPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4KPiAtLQo+IC4tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQg
fCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFgg
IEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpT
ZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEg
U29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8s
IElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5h
bWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
