Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBF6CD1284
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EFED60C2D;
	Wed, 10 Apr 2024 21:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vI6SgcwdJcqI; Wed, 10 Apr 2024 21:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B20D605CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B20D605CC;
	Wed, 10 Apr 2024 21:38:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A12351BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E6AC605AF
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYkaU0SxRq9h for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:38:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B81D9605AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B81D9605AC
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B81D9605AC
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:38:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41550858cabso49513225e9.2
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 14:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712785115; x=1713389915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JAMd/NYeSdPSFLYyMXfXYtoj+kJwNtbOj/ozxEswjN8=;
 b=A6nEldf+IH5EbLdoDl5PnUr+O1oZr0FvDj7harex7CVgnbYZpdSzNUULmoqyHGOimh
 iTM+AM3wwL1w/Dr3j17Jj3Udy8k4PFuLdAXJ+k01lU16USA5dQAYAR8Hq7/azg2g50x+
 g9dNydJcZcYWlgE3XvAxf7H9F+Z2S0tkcZCyk5kiz4S2RP/MRANVvQ9q8VqUFgj3HusJ
 zTbt8dQVa7TklI+FPdShZhTnWSuZgQX3zSgxfJAe+EAB0+/zC6McfdF9HczHh+R/hjT0
 AkZ8iktUQBtxS5rqGIhjJEEeJvekPTovOWlDYWYpGy8ds+n2fh64bFUFz3DEF1bSudQQ
 F/PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7bJtydhHgiHfXrT7kz4WvbKv0RyPOcdy2s+5EIT/b91QbCzoc/zVpSOTN8zeAPl0fzE1PhMkLOn2lRhtmC9X7xdOmSnH//w==
X-Gm-Message-State: AOJu0YwNZG70b8F+7JvunN8LjzpTKESABp9UYmMojxs+31JVTegk08uD
 oqEYn1qOxrdSSsSl1juxONGWN2+GrnMURybmuj/ncd5K+m8g7k66ULOZpwsyKX3eqJtNY++ZPot
 o
X-Google-Smtp-Source: AGHT+IELwYpHJVELX/NbsmJY87FYtPxoUM6V8DxiZQs2xmJJh0h2XtPnxkZYddfGLnmq6bsD5j62Bg==
X-Received: by 2002:a05:600c:3509:b0:416:1d6d:dc6d with SMTP id
 h9-20020a05600c350900b004161d6ddc6dmr2665104wmq.40.1712785114611; 
 Wed, 10 Apr 2024 14:38:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c359200b0041674bf7d4csm3487491wmq.48.2024.04.10.14.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 14:38:34 -0700 (PDT)
Message-ID: <bbb129b8-077f-44e2-b30e-4e5ca33ed7e6@smile.fr>
Date: Wed, 10 Apr 2024 23:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Dannenberg <dannenberg@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, buildroot@buildroot.org
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <58478029-3c92-497e-bb31-4a1f1119afd4@mind.be>
 <1ec8e03b-f5b7-41cf-bfe4-17f99a871e93@mind.be>
 <0ea49f2c-fe1e-4a44-aaf8-90120ef6f9fd@smile.fr>
 <CABGWkvrVr-AY-huV-tijtt48eYtB4nSQ==gZ1VvnWy4SSyYXyQ@mail.gmail.com>
 <20240410080006.GA1545957@theia> <20240410082429.r2qhdb7uaqbr2ukk@dasso>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240410082429.r2qhdb7uaqbr2ukk@dasso>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712785115; x=1713389915;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JAMd/NYeSdPSFLYyMXfXYtoj+kJwNtbOj/ozxEswjN8=;
 b=B/Yk/m5Jgt2d2HS4ryfx2vpntq5fIS616MkMTf1Hu3T6GDET9rZzNtB8U52dgqqoWG
 0pjpgRi9csEJR9dfzHSgTh5TGpFCLdYFeSqYSnUzcmiEZjWIz5QTrBlkvJ85eTj525N7
 mq+4l6irWffIroPPCnQv+qyfUALkHPXCPaC9APk1zpP7SOCnZzKOEjmIK1T561TUphX4
 hPeCtCt0HlFU4nJxERnYGixBFpE6G0t7wPbOZGryI+Au3FHDmrxqmHd/adpxOim4yrfg
 DtLXBs3B6H3+tljR/H5zgl/oEiTrRndp5Cd0DTnwJcjRQOqUm9NyWE6xHkCvH+e1VelE
 C/iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=B/Yk/m5J
Subject: Re: [Buildroot] [PATCH v12 00/16] Add support for AM62x-SK HS-FS
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcywgR2VybywgRGFyaW8sIEFsbCwKCkxlIDEwLzA0LzIwMjQgw6AgMTA6MjQsIEFu
ZHJlYXMgRGFubmVuYmVyZyB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gR2VybywgRGFyaW8s
Cj4gCj4gT24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMTA6MDA6MDZBTSArMDIwMCwgR2VybyBTY2h3
w6RyaWNrZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAw
OTozNDoxNkFNICswMjAwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPj4+IEhpIFJvbWFpbiwgQWxs
Cj4+Pgo+Pj4gT24gVHVlLCBBcHIgOSwgMjAyNCBhdCAxMToxN+KAr1BNIFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPj4+Pgo+Pj4+IEhlbGxvIEFybm91dCwgQWxs
LAo+PiBbLi4uXQo+Pj4+Cj4+Pj4gVGhhbmtzLCB0aGUgc2VyaWVzIGlzIG1lcmdlZC4KPj4+Pgo+
Pj4+IFRoYW5rcyB0byBEYXJpbyBhbmQgTWljaGFlbCBmb3IgdGhlIGluaXRpYWwgd29yayBvbiB0
aGUgSFMtRlMgdG9waWMhCj4+Pj4KPj4+PiBUaGUgaW5pdGlhbCBzZXJpZXMgc2hvd2VkIHRoYXQg
aXQgd2FzIG5lY2Vzc2FyeSB0byByZXdvcmsgaGVhdmlseSB0aGUgVEkgSzMgU29DCj4+Pj4gcmVs
YXRlZCBwYWNrYWdlcyBpbiBCdWlsZHJvb3QuIFRoaXMgd2FzIHRoZSBvcHBvcnRpbml0eSB0byBh
bnRpY2lwYXRlIG9uIHRoZQo+Pj4+IGFkZGl0aW9uIG9mIG5ldyBUSSBLMyBTb0Mgc3VwcG9ydC4K
Pj4+Pgo+Pj4+IFRoYW5rcyB0byBBbmRyZWFzIGFuZCBCcnlhbiBmcm9tIFRJIGZvciB0aGUgcmV2
aWV3IGFuZCBmaW5lIGRldGFpbHMgYWJvdXQgVEkgSzMKPj4+PiBTb0MgZmFtaWxseSBhbmQgdGhl
IHJ1bnRpbWUgdGVzdGluZy4KPj4+Pgo+Pj4+IFRoYW5rcyB0byBhbGwgdGVzdGVycyBhbmQgcmV2
aWV3ZXJzLgo+Pj4KPj4+IEkgdGhpbmsgbXkgdHdvIHBhdGNoZXMgZm9yIHZlcnNpb24gMTAgd2Vy
ZSB1bHRpbWF0ZWx5IGxvc3Q6Cj4+Pgo+Pj4gW3YxMCwwNS8xMl0gcGFja2FnZS90aS1rMzogZGlz
YWJsZSBIUy1GUyBmb3IgQU02NSBTT0MKPj4+IFt2MTAsMDQvMTJdIHBhY2thZ2UvdGktazM6IG1v
dmUgVElfSzNfe1NFQ1RZUEUsIFNPQ30gb3V0IG9mIHRoZSBpbWFnZS1nZW4gc2NvcGUKPj4+Cj4+
PiBTcGVjaWZpY2FsbHksIHBhdGNoIDQgaXMgbmVjZXNzYXJ5IGZvciB0aGUgcHJvcGVyIGNyZWF0
aW9uIG9mIHRoZQo+Pj4gaW1hZ2UuIEhhcyB2ZXJzaW9uIDEyIGFjdHVhbGx5IGJlZW4gdGVzdGVk
IGJ5IGFueW9uZT8KPj4+IEkgY2FuIGFzc3VyZSB5b3UgdmVyc2lvbiAxMCBoYXMgYmVlbi4KPj4+
Cj4+PiBBZGRpdGlvbmFsbHksIGl0IHNlZW1zIHRoYXQgcGF0Y2gKPj4+IFt2MTAsMDIvMTJdIGJv
b3QvdGktazMtcjUtbG9hZGVyOiBzZXQgYmlubWFuIGVudmlyb25tZW50Cj4+PiBoYXMgYmVlbiBp
bmNvcnBvcmF0ZWQgaW50byB5b3VyIHBhdGNoICJib290L3RpLWszLXI1LWxvYWRlcjogcmVtb3Zl
Cj4+PiBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfQklOTUFOIgo+Pj4gYW5kIEkgZG9u
J3QgdW5kZXJzdGFuZCB3aHkuCj4+Pgo+Pj4gVGhhbmtzIGFuZCByZWdhcmRzLAo+Pj4gRGFyaW8K
Pj4KPj4gSGkgRGFyaW8sCj4+Cj4+IEkgY2FuIGNvbmZpcm0gdGhhdCBzb21ldGhpbmcgaXMgYW1p
c3MsIG1heWJlIGl0IHdvdWxkIGhhdmUgYmVlbiBiZXR0ZXIKPj4gdG8gYXdhaXQgbW9yZSB0ZXN0
cyB3aXRoIHBhdGNoIFYxMi4KPiAKPiBJIGp1c3QgdGVzdGVkIHRvcC1vZi1tYXN0ZXIgdy9vIGFu
eSBhZGRpdGlvbmFsIHBhdGNoZXMgb24gU0stQU02MiAod2l0aAo+IEdQIHNpbGljb24pIGFuZCBT
Sy1BTTYyQiAocHJvZHVjdGlvbiBib2FyZCwgd2l0aCBIUy1GUyBzaWxpY29uKSBhbmQgaXQKPiB3
b3JrZWQgbGlrZSBhIGNoYW1wLiBIZXJlJ3MgdGhlIGJlZ2lubmluZyBvZiB0aGUgYm9vdCB1c2lu
ZyBTSy1BTTYyLi4uCj4gCj4gPC4uLnNuaXAuLi4+Cj4gVS1Cb290IFNQTCAyMDI0LjAxIChBcHIg
MDkgMjAyNCAtIDIwOjExOjMwIC0wNTAwKQo+IFNZU0ZXIEFCSTogMy4xIChmaXJtd2FyZSByZXYg
MHgwMDA4ICc4LjYuNC0tdjA4LjA2LjA0IChDaGlsbCBDYXB5YmFyJykKPiBTUEwgaW5pdGlhbCBz
dGFjayB1c2FnZTogMTMzNjggYnl0ZXMKPiBUcnlpbmcgdG8gYm9vdCBmcm9tIE1NQzIKPiBBdXRo
ZW50aWNhdGlvbiBwYXNzZWQKPiBBdXRoZW50aWNhdGlvbiBwYXNzZWQKPiBBdXRoZW50aWNhdGlv
biBwYXNzZWQKPiBBdXRoZW50aWNhdGlvbiBwYXNzZWQKPiBBdXRoZW50aWNhdGlvbiBwYXNzZWQK
PiBTdGFydGluZyBBVEYgb24gQVJNNjQgY29yZS4uLgo+IAo+IE5PVElDRTogIEJMMzE6IHYyLjco
cmVsZWFzZSk6djIuNwo+IE5PVElDRTogIEJMMzE6IEJ1aWx0IDogMjA6MDg6MTYsIEFwciAgOSAy
MDI0Cj4gSS9UQzoKPiBJL1RDOiBPUC1URUUgdmVyc2lvbjogVW5rbm93bl80LjAgKGdjYyB2ZXJz
aW9uIDEyLjMuMCAoQnVpbGRyb290Cj4gMjAyNC4wMi00MTYtZ2QwMWUxM2M0ZDQpKSAjMSBXZWQg
QXByIDEwIDAxOjA4OjE0IFVUQyAyMDI0IGFhcmNoNjQKPiBJL1RDOiBXQVJOSU5HOiBUaGlzIE9Q
LVRFRSBjb25maWd1cmF0aW9uIG1pZ2h0IGJlIGluc2VjdXJlIQo+IEkvVEM6IFdBUk5JTkc6IFBs
ZWFzZSBjaGVjawo+IGh0dHBzOi8vb3B0ZWUucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2FyY2hp
dGVjdHVyZS9wb3J0aW5nX2d1aWRlbGluZXMuaHRtbAo+IEkvVEM6IFByaW1hcnkgQ1BVIGluaXRp
YWxpemluZwo+IEkvVEM6IFNZU0ZXIEFCSTogMy4xIChmaXJtd2FyZSByZXYgMHgwMDA4ICc4LjYu
NC0tdjA4LjA2LjA0IChDaGlsbAo+IENhcHliYXInKQo+IEkvVEM6IEhVSyBJbml0aWFsaXplZAo+
IEkvVEM6IEFjdGl2YXRlZCBTQTJVTCBkZXZpY2UKPiBJL1RDOiBFbmFibGVkIGZpcmV3YWxscyBm
b3IgU0EyVUwgVFJORyBkZXZpY2UKPiBJL1RDOiBTQTJVTCBUUk5HIGluaXRpYWxpemVkCj4gSS9U
QzogU0EyVUwgRHJpdmVycyBpbml0aWFsaXplZAo+IEkvVEM6IFByaW1hcnkgQ1BVIHN3aXRjaGlu
ZyB0byBub3JtYWwgd29ybGQgYm9vdAo+IAo+IFUtQm9vdCBTUEwgMjAyNC4wMSAoQXByIDA5IDIw
MjQgLSAyMDoxMTo0OCAtMDUwMCkKPiBTWVNGVyBBQkk6IDMuMSAoZmlybXdhcmUgcmV2IDB4MDAw
OCAnOC42LjQtLXYwOC4wNi4wNCAoQ2hpbGwgQ2FweWJhcicpCj4gU1BMIGluaXRpYWwgc3RhY2sg
dXNhZ2U6IDE4NzIgYnl0ZXMKPiBUcnlpbmcgdG8gYm9vdCBmcm9tIE1NQzIKPiBBdXRoZW50aWNh
dGlvbiBwYXNzZWQKPiBBdXRoZW50aWNhdGlvbiBwYXNzZWQKPiAKPiAKPiBVLUJvb3QgMjAyNC4w
MSAoQXByIDA5IDIwMjQgLSAyMDoxMTo0OCAtMDUwMCkKPiAKPiBTb0M6ICAgQU02MlggU1IxLjAg
SFMtRlMKPiBNb2RlbDogVGV4YXMgSW5zdHJ1bWVudHMgQU02MjUgU0sKPiBEUkFNOiAgMiBHaUIK
PiBDb3JlOiAgNTYgZGV2aWNlcywgMjMgdWNsYXNzZXMsIGRldmljZXRyZWU6IHNlcGFyYXRlCj4g
TU1DOiAgIG1tY0BmYTEwMDAwOiAwLCBtbWNAZmEwMDAwMDogMQo+IExvYWRpbmcgRW52aXJvbm1l
bnQgZnJvbSBub3doZXJlLi4uIE9LCj4gSW46ICAgIHNlcmlhbEAyODAwMDAwCj4gT3V0OiAgIHNl
cmlhbEAyODAwMDAwCj4gRXJyOiAgIHNlcmlhbEAyODAwMDAwCj4gTmV0OiAgIGV0aDA6IGV0aGVy
bmV0QDgwMDAwMDBwb3J0QDEKPiBIaXQgYW55IGtleSB0byBzdG9wIGF1dG9ib290OiAgMAo+IDwu
Li5zbmlwLi4uPgo+IAo+IAo+PiBBdCBsZWFzdCBteSBjdXJyZW50IHRlc3Qgb2YgdGlfYW02Mnhf
c2tfZGVmY29uZmlnIG9uIG1hc3RlciBmYWlsZWQgdG8gYm9vdDoKPj4KPj4gICBVLUJvb3QgU1BM
IDIwMjQuMDEgKEFwciAxMCAyMDI0IC0gMDk6MzI6MTcgKzAyMDApCj4+ICAgazNfc3lzdGVtX2Nv
bnRyb2xsZXIgc3lzY3RybGVyOiBrM19zeXNjdHJsZXJfc3RhcnQ6IEJvb3QgTm90aWZpY2F0aW9u
IHJlc3BvbnNlIGZhaWxlZC4gcmV0ID0gLTExMAo+PiAgIEZpcm13YXJlIGluaXQgZmFpbGVkIG9u
IHJwcm9jICgtMTEwKQo+Pgo+PiAgIHJlc2V0dGluZyAuLi4KPj4KPj4gSSB0ZXN0ZWQgd2l0aCBB
TTYyeCBTSyBFVk0gRTMuIEknbGwgdHJ5IHRvIGFwcGx5IHlvdXIgdHdvIG1pc3NpbmcKPj4gcGF0
Y2hlcyBhbmQgdGVzdCBhZ2Fpbi4KPiAKPiBBcmUgeW91IHVzaW5nIGEgYm9hcmQgd2l0aCBQQ0Ig
cmV2aXNpb24gJ1BST0MxMTRFMyc/IElmIHNvIHRoaXMgYm9hcmQgaXMKPiBrbm93biBhcyAnVGhp
cmQgcHJvdG90eXBlLCBlYXJseSByZWxlYXNlIHJldmlzaW9uIG9mIHRoZSBBTTYyeCBTSyBFVk0n
Cj4gYW5kIHNob3VsZCBoYXZlIEdQIHNpbGljb24uIFdoaWNoIG1lYW5zIHlvdSBtdXN0IGhhdmUg
cmUtYWRkZWQuLi4KPiAKPiBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9USUJPT1QzX0JJTj0i
dGlib290My1hbTYyeC1ncC1ldm0uYmluCj4gCj4gLi4udG8geW91ciAuY29uZmlnPwo+IAo+IEkg
ZG9uJ3QgaGF2ZSBhIFBST0MxMTRFMyBib2FyZCBidXQgdGhlIGJvYXJkIEkgdXNlZCB0byB0ZXN0
IHRoZSBHUAo+IHZhcmlhbnQgdG9kYXkgaXMgYSBQUk9DMTE0RTIsIGFuZCBpdCB3b3JrZWQuIEJ1
dCBuZWl0aGVyIG9mIHRob3NlIGJvYXJkcwo+IGlzIGNvbnNpZGVyZWQgInByb2R1Y3Rpb24iLgo+
IAo+IEFsc28ganVzdCBmb3IgcmVmZXJuY2UsIGFuIFNLLUFNNjIgUENCIHJldmlzaW9uIGhpc3Rv
cnkgY2FuIGJlIGZvdW5kIGluCj4gVGFibGUgMS0xIGluIHRoZSBBTTYyeCBTSyBFVk0gVXNlcidz
IEd1aWRlIFsxXS4KClRoYW5rcyBmb3IgdGhlIGFkZGl0aW9uYWwgdGVzdGluZyBBbmRyZWFzIQoK
R2VybywgaWYgeW91IGFyZSB1c2luZyBhbiBlYXJseSBoYXJkd2FyZSByZXZpc2lvbiBvZiB0aGUg
U0stQU02MiB5b3UgbXVzdCByZS1hZGQ6CgogIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1RJ
Qk9PVDNfQklOPSJ0aWJvb3QzLWFtNjJ4LWdwLWV2bS5iaW4iCgpJIGFkZGVkIGEgbmV3IGNvbW1l
bnQgaW4gYm9hcmQvdGkvYW02Mngtc2svcmVhZG1lLnR4dCBbMV0gdGhhdCByZWZlciB0byB0aGUg
VEkKRTJFIGZvcnVtIHBvc3QgWzJdLgoKWzFdCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL2JvYXJkL3RpL2FtNjJ4LXNrL3JlYWRtZS50eHQ/
cmVmX3R5cGU9aGVhZHMmcGxhaW49MSNMMjAKClsyXQpodHRwczovL2UyZS50aS5jb20vc3VwcG9y
dC9wcm9jZXNzb3JzLWdyb3VwL3Byb2Nlc3NvcnMvZi9wcm9jZXNzb3JzLWZvcnVtLzEyMTA0NDMv
ZmFxLWFtNjI1LWdlbmVyYXRpbmctc2l0YXJhLWFtNjJ4LWFtNjJheC1hbTY0eC1ncC1kZXZpY2Ut
Ym9vdGFibGUtbW1jLXNkLWNhcmQtaW1hZ2VzLXVzaW5nLXNkay12OC02LWFuZC15b2N0bwoKQmVz
dCByZWdhcmRzLApSb21haW4KCj4gCj4gCj4gLS0KPiBBbmRyZWFzIERhbm5lbmJlcmcKPiBUZXhh
cyBJbnN0cnVtZW50cyBJbmMKPiAKPiAKPiBbMV0gaHR0cHM6Ly93d3cudGkuY29tL2xpdC9wZGYv
c3BydWo0MCAKPiAKPiAKPiAKPiAKPj4gQmVzdCwKPj4gR2Vybwo+Pgo+Pj4+IEJlc3QgcmVnYXJk
cywKPj4+PiBSb21haW4KPj4+Pgo+PiBbLi4uXQo+Pgo+PiAtLSAKPj4KPj4KPj4KPj4g4oCT4oCT
4oCTCj4+Cj4+Cj4+IGdyYW5kY2VudHJpeCBHbWJIIHwgQSBWb2RhZm9uZSBDb21wYW55wqDCt8Kg
SG9sem1hcmt0IDHCoMK3wqA1MDY3NiAKPj4gKkNvbG9nbmUqwqB8wqBQaG9lbml4c2Vlc3RyYXNz
ZSAxOMKgwrfCoDQ0MjYzICpEb3J0bXVuZCrCoMK3wqBHZXJtYW55Cj4+IHzCoGluIAo+PiA8aHR0
cHM6Ly93d3cubGlua2VkaW4uY29tL2NvbXBhbnkvZ3JhbmRjZW50cml4PiB8IHBob25lOiArNDkt
MjIxLTY3Ny04NjAtMCAKPj4gfMKgZW1haWw6IGhlbGxvQGdyYW5kY2VudHJpeC5uZXQgPG1haWx0
bzpoZWxsb0BncmFuZGNlbnRyaXgubmV0Pgo+Pgo+Pgo+PiBncmFuZGNlbnRyaXggY2FyZXMgYWJv
dXTCoHByaXZhY3kgCj4+IDxodHRwczovL2dyYW5kY2VudHJpeC5uZXQvZGUvcGFnZXMvcHJpdmFj
eW1haWwvPgo+Pgo+PiBBbXRzZ2VyaWNodCBLw7ZsbiB8IEhSQiDCoAo+PiA3MDExOSB8IEdlc2No
w6RmdHNmw7xocmVyOiBNLiBLcsO2bWVyLMKgIFIuIEjDpG5lbCB8IFVTdC4tSWROci46IERFMjY2
MzMzOTY5Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
