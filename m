Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66695C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 16:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 313D560624;
	Wed, 17 Apr 2024 16:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgHTaZY9hY1l; Wed, 17 Apr 2024 16:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE8F6062D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE8F6062D;
	Wed, 17 Apr 2024 16:29:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5641BF29F
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 16:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4CA736062D
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 16:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Urn-S672ugxE for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 16:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07E8160624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07E8160624
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07E8160624
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 16:29:51 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a526d381d2fso182916466b.0
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 09:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713371390; x=1713976190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1NydZM/VwEJR686GHXooA1nEvBtX+v2+yiGPChSPsks=;
 b=nbABmINxgsze8V2W5d+Cgql44vCmRwJaMZyxEwuWmQdY7bSNgTnun0kfml/UHC0GxT
 sMWI7I/lyrflNiXEbc6qAzs2wjK5qfyIieSGQ2lNwnKV63jGFXY3d3x6IWl0w5ByV+MK
 pjIfbk62oayaxKkOXnyDBTw/WvL3S5CsgMx7sRpDHLLBx1YtOWd34m3m/uMf1gJ9SVup
 PGIg4magiUjw3aC4+6xFti8S0tdzca4NHCluVNG10f8i/WZVAfJMUCkIBPeQVBDBqkT/
 +icYy/tK4Raqtpajk/CuVUqRImUV7hvPGp9yWU+NuRLcJO/2dPyfjQL/N/MGvi1GV41B
 TWqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnuyR/CEbc6Rkq+k/k+Azz48OBVPIPvjDbqA6Kv7mz253tBrHy1T0rFTTQGzSaEqzbRsGEq7UcTeojIjCkxsIhgtbPMMt6ag==
X-Gm-Message-State: AOJu0YzWZQV2IVL5u9mUsheclO7CAtwRz4xBvlKIRjBCP/znXHRhNWKC
 roc+Tvdpecxcsy0PH7N3mvkUethlGrUog+t3IhdkUbFUCni1DNJ91oZqxMfgppvT9Jqh0cDjnZj
 YLsT43XdGsdeGIBeVXJ/prbD/rxY8lVe2/MEWkw==
X-Google-Smtp-Source: AGHT+IGIQC2+VLiS5/bP4LkXQO8wgOlaIoYliRGR/9tKko0ZhdZ9X222PuiM7xfJV5Wr3bxbs4O6LCZk2MQKPeiA5ZY=
X-Received: by 2002:a17:907:985:b0:a51:b49e:473e with SMTP id
 bf5-20020a170907098500b00a51b49e473emr5433884ejc.19.1713371389746; Wed, 17
 Apr 2024 09:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
In-Reply-To: <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 17 Apr 2024 18:29:38 +0200
Message-ID: <CAOf5uwmQBtHf9w7vjxyxDjFuaQj=uv4a0OpLHJ1MNg5V3PjNwQ@mail.gmail.com>
To: DTrustee <dterry_engineer@yahoo.com>, 
 Andrea Calabrese <andrea.calabrese@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713371390; x=1713976190;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1NydZM/VwEJR686GHXooA1nEvBtX+v2+yiGPChSPsks=;
 b=FwrUQ8SBRiv2k1cTcVZBmw+90K3wqtbVNBoYKLMKeuqUhILJfyqcXGL8w0kuWBCk8r
 OdZetLFconv2s4uhSCa4nSIKUPWQzYHH0k3ZhYPtjR/6UaXi4rqgy9505mo+cVXSFsH/
 mwfxcQ7kAL1VzEqWpnZp6PKwRlaIH+7ApyQ/I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FwrUQ8SB
Subject: Re: [Buildroot] Problem with device tree
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkKCk9uIFdlZCwgQXByIDE3LCAyMDI0IGF0IDY6MjXigK9QTSBEVHJ1c3RlZSB2aWEgYnVpbGRy
b290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBJIGtub3cgeW91IGFyZSBh
bGwgYnVzeSwgZG9uJ3QgbWVhbiB0byBidWcgYW55b25lIGJ1dCBJIGNhbm5vdCBnZXQKPiBidWls
ZHJvb3QgdG8gbWFrZSB3aXRob3V0IGVycm9ycy4gSSBoYXZlIG5vIGlkZWEgd2h5ICJvcGVyYXRv
ciAnPCcgaGFzCj4gbm8gbGVmdCBvcGVyYW5kIiBpcyBnZW5lcmF0ZWQgb3Igd2hpY2ggaW5jbHVk
ZSBmaWxlIGlzIHRoZSBjYXVzZS4gSQo+IHRydWx5IGFwcHJlY2lhdGUgeW91ciBoZWxwLiBJcyB0
aGVyZSBkb2N1bWVudGF0aW9uIHRoYXQgd2Fsa3MgdGhyb3VnaAo+IHRoZSBidWlsZCBwcm9jZXNz
PyBJIGhhdmUgbG9va2VkIGF0IHRoZSBCb290bGluIHRyYWluaW5nIGJ1dCBpdCBpcwo+IHNldmVy
YWwgeWVhcnMgb2xkIG5vdyBhbmQgb3V0IG9mIGRhdGUuCgpZb3UgYXJlIHRyeWluZyB0byBidWls
ZCBhIHVib290IGJvYXJkIHRoYXQgaGFzIG5vdCBpbmNsdWRlIG9mIHRoZQpLY29uZmlnIG9mIGl0
LiAgSSB0aGluayB0aGF0IHlvdQpoYXZlIGp1c3QgYSBicm9rZW4gdWJvb3QuIFdoYXQgY29uZmln
dXJhdGlvbiBvciBib2FyZCBhcmUgeW91IGJ1aWxkaW5nPwoKTWljaGFlbAoKCj4KPiBCdWlsZGxv
ZyBpcwo+Cj4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vRXF0NnppOWEKPgo+IGNvbmZpZyBpcwo+Cj4g
aHR0cHM6Ly9wYXN0ZWJpbi5jb20vOFAyaEI5dVkKPgo+IGJ1aWxkcm9vdCAyMDI0LjAyLjEKPgo+
IEhhdmUgYSBCbGVzc2VkIGRheSEKPgo+IERvbgo+Cj4KPgo+IE9uIDQvOS8yNCA0OjU5IFBNLCBH
aXVsaW8gQmVuZXR0aSB3cm90ZToKPiA+IEhpIERvbiwKPiA+Cj4gPiBPbiAwOS8wNC8yNCAyMzoy
MywgRG9uIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gPj4gVGhpcyBpcyBteSBmaXJzdCB0aW1lIHVz
aW5nIGJ1aWxkcm9vdC4gRm9sbG93aW5nIHRoZSBpbnN0cnVjdGlvbnMgb2YKPiA+PiBib290bGlu
LmNvbS9kb2MvdHJhaW5pbmcvYnVpbGRyb290L2J1aWxkcm9vdC1sYWJzLnBkZiwgYnVpbGRpbmcg
Zm9yCj4gPj4gQmVhZ2xlYm9uZSBCbGFjayB0aG91Z2ggbm90IHRoZSB3aXJlbGVzcyBvZiB0aGUg
dHJhaW5pbmcgcGRmLiBVbmRlcgo+ID4+IEtlcm5lbCAtIHNlbGVjdGVkIGRldmljZSB0cmVlIGJs
b2IgYW5kIGluLXRyZWUgZGV2aWNlIHRyZWUgbmFtZSBJIHB1dAo+ID4+IGFtMzM1eC1ib25lYmxh
Y2suIEhvd2V2ZXIgSSBnZXQKPiA+Pgo+ID4+IERldmljZSBUcmVlIFNvdXJjZSAoYXJjaC9hcm0v
ZHRzL2FtMzM1eC0uZHRiKSBpcyBub3QgY29ycmVjdGx5Cj4gPj4gc3BlY2lmaWVkLgo+ID4+IFBs
ZWFzZSBkZWZpbmUgJ0NPTkZJR19ERUZBVUxUX0RFVklDRV9UUkVFJwo+ID4+IG9yIGJ1aWxkIHdp
dGggJ0RFVklDRV9UUkVFPTxkZXZpY2VfdHJlZT4nIGFyZ3VtZW50Cj4gPj4KPiA+PiBXaGF0IGRv
ZXMgaXQgd2FudD8gU29tZXRoaW5nIGlzIG1pc3NpbmcgYnV0IEkgZG9uJ3Qga25vdyB3aGF0Lgo+
ID4KPiA+IFN0YXJ0aW5nIGZyb20gIExpbnV4IHZlcnNpb24gNi41WzBdIHlvdSBoYXZlIHRvIHNw
ZWNpZnkgdGhlCj4gPiBtYW51ZmFjdHVyZXIgZm9sZGVyIHRvbyBjb21wYXJlZCB0byBwcmV2aW91
cyB2ZXJzaW9ucyhpLmUuIDYuNFsxXSkuIFNvCj4gPiBpZiB5b3UncmUgdXNpbmcgYSBrZXJuZWwg
bmV3ZXIgdGhhbiA2LjUgeW91IGhhdmUgdG8gc3BlY2lmeSBzb21ldGhpbmcKPiA+IGxpa2U6Cj4g
PiBhcmNoL2FybS9kdHMvdGkvb21hcC9hbTMzNXgtLmR0Ygo+ID4KPiA+IEhvcGUgdGhpcyBoZWxw
cy4KPiA+Cj4gPiBbMF06IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUtcmMx
L3NvdXJjZS9hcmNoL2FybS9ib290L2R0cwo+ID4gWzFdOiBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ni40LjE2L3NvdXJjZS9hcmNoL2FybS9ib290L2R0cwo+ID4KPiA+IEJlc3Qg
cmVnYXJkcwo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgoKCi0t
IApNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkKQ28tRm91bmRlciAmIENoaWVmIEV4ZWN1dGl2
ZSBPZmZpY2VyCk0uICszOSAzNDcgOTEzIDIxNzAKbWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpBbWFydWxhIFNvbHV0aW9ucyBC
VgpKb29wIEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MClQuICszMSAoMCk4
NSAxMTEgOTE3MgppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5hbWFydWxhc29sdXRpb25z
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
