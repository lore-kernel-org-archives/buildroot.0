Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D4CD13590
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 02:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC44E607A7;
	Mon, 28 Oct 2024 02:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-7gCnftdQi6; Mon, 28 Oct 2024 02:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5939607B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5939607B4;
	Mon, 28 Oct 2024 02:57:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F9314EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 02:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FDA8405A3
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 02:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-OW4DqwmXUD for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 02:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a31; helo=mail-vk1-xa31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C404740595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C404740595
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C404740595
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 02:57:44 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-50d479aef64so1166959e0c.0
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730084263; x=1730689063;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1pDIWAb2+UPQDc1yciLPgvkIMuQNkscF1fykw2HGkU=;
 b=jZt3ccVva3CZLQRiLJWC5jhETUz65c7MSbQClmZ52+XgflenjWeESOHRowNl9w8w2p
 jhT+Kl2SZMSD5XKQuQvcLz5M+241EKXwg+u5cp9GzAvEgHYtvLiRSsu8t74lV0fYq4Pp
 AqY8yx6EQE1WL1pw4/7XF8mSAMrutUs2vRzP8+D/vDYeFHd19+lL49E5xPIW1PpK2NA7
 dvVIuFmFybXRTh0UylM7jczbYeRayRFasnRgac3mg9eYJLV7Zl6ZSHQYgNAib/AsxO+p
 ZiUXckSqpP+copctcJb8mR6eDM6xSGkAxzUQW7V3I9XejeD0uTEonoC1PzTVWv0N6G07
 Ehng==
X-Gm-Message-State: AOJu0YzumRIsRwXFz+Ap7eypjRYtt+S2A+azVnCxqWl0B+73DMPTSn/o
 5e0fQeGgrdxdbGzWPhP4X10B+6SB8JDkJ6eTRvUdjAe7xcCgMqPKWtteyu+Po2PiMtAWwSulxhc
 ws+IfzhxzwLDI13hIPPI4TN2n4nQ=
X-Google-Smtp-Source: AGHT+IHU1B1vOSDFNTZv9QLoN/ystaMIEbuip0XGK7imdYPK+ugn3h/tHlHMPuqezrQj/WeKHW2Vl87HVUIzfjOcFZs=
X-Received: by 2002:a05:6122:1ad5:b0:50a:36ab:c788 with SMTP id
 71dfb90a1353d-51014ff5f55mr3657856e0c.3.1730084263335; Sun, 27 Oct 2024
 19:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
 <20241026162759.0100482f@windsurf>
In-Reply-To: <20241026162759.0100482f@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Oct 2024 20:57:32 -0600
Message-ID: <CADvTj4poUTwYNeVK63EkZHKyYZ9BWAnVMNv9jOxcd-0guH+wAQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 Asaf Kahlon <asafka7@gmail.com>, Julien Olivain <ju.o@free.fr>, 
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, 
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730084263; x=1730689063; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s1pDIWAb2+UPQDc1yciLPgvkIMuQNkscF1fykw2HGkU=;
 b=NK1ylneQ3NPqT4Dpyu4GObFzs/mtiKx5U5ojlLAbNjBeKuGNxcP3z3UnbaGGk53ZZn
 CfliarVQYFZI6cYe3WLOg/ZVGuIjFtT9p1yKPolARq9LBidii+vJ1s/sHPWHVhE4jESV
 2IsXNA8zZ1IbxgpPR8dk8PMA201tSBzFuyWUqgCwFLxp79BN64C4iNhMGFLSROQRv//a
 qyL503xg4l6Y2uI307lQojsNj5rQ1pi524j/iJWOEQKglcCpGhdA+8CNSZx5OiDxesSE
 WI/bpxlcxoE54blIM4zmi3F9uqLdeOscWnaMc0rPNfRpQGDDYwiR7m9K2gL7xrScRpYX
 BZhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NK1ylneQ
Subject: Re: [Buildroot] [PATCH v2 1/3] package/{python-}protobuf: bump to
 version 28.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

T24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgODoyOOKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyMyBTZXAgMjAyNCAy
MDozOToxNyAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gTWlncmF0ZSBwcm90b2J1ZiBidWlsZCBmcm9tIGF1dG90b29scyB0byBj
bWFrZS4KPiA+Cj4gPiBNaWdyYXRlIHByb3RvYnVmLXB5dGhvbiB0byB1c2UgcHlwaSBzb3VyY2Vz
IHdoaWNoIGFyZSBub3cgcmVxdWlyZWQKPiA+IGZvciBzZXR1cC5weSBidWlsZHM6Cj4gPiBodHRw
czovL2dpdGh1Yi5jb20vcHJvdG9jb2xidWZmZXJzL3Byb3RvYnVmL3RyZWUvdjI4LjEvcHl0aG9u
I2J1aWxkaW5nLWZyb20tc2V0dXBweQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxp
YXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+Cj4gSGVyZSwgdGhpcyBicmVha3MgdGhl
IGJ1aWxkIG9mIGhvc3QtcHJvdG9idWYtYywgYXMgc3VjaDoKPgo+ID4+PiBob3N0LXByb3RvYnVm
LWMgMS41LjAgQnVpbGRpbmcKPiBHSVRfRElSPS4gUEFUSD0iL2hvbWUvdGhvbWFzL3Byb2pldHMv
YnVpbGRyb290L291dHB1dC9ob3N0L2JpbjovaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qv
b3V0cHV0L2hvc3Qvc2JpbjovaG9tZS90aG9tYXMvc3lzL2JpbjovaG9tZS90aG9tYXMvLmdlbS9y
dWJ5LzIuMS4wL2JpbjovdXNyL2xvY2FsL2JpbjovdXNyL2xvY2FsL3NiaW46L3Vzci9iaW46L3Vz
ci9zYmluOi9ob21lL3Rob21hcy8ucnZtL2JpbjovaG9tZS90aG9tYXMvLmxvY2FsL2JpbjovaG9t
ZS90aG9tYXMvcHJvamV0cy9naXQtd3JhcHBlcnM6L2hvbWUvdGhvbWFzL2Jvb3RsaW4vZ2l0L2Jp
bi8iIFBLR19DT05GSUc9Ii9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9vdC9vdXRwdXQvaG9z
dC9iaW4vcGtnLWNvbmZpZyIgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iLyIgUEtHX0NPTkZJR19B
TExPV19TWVNURU1fQ0ZMQUdTPTEgUEtHX0NPTkZJR19BTExPV19TWVNURU1fTElCUz0xIFBLR19D
T05GSUdfTElCRElSPSIvaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2hvc3Qv
bGliL3BrZ2NvbmZpZzovaG9tZS90aG9tYXMvcHJvamV0cy9idWlsZHJvb3Qvb3V0cHV0L2hvc3Qv
c2hhcmUvcGtnY29uZmlnIiAgL3Vzci9iaW4vbWFrZSAtajEgICAtQyAvaG9tZS90aG9tYXMvcHJv
amV0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtcHJvdG9idWYtYy0xLjUuMC8KPiBtYWtl
WzFdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9vdC9v
dXRwdXQvYnVpbGQvaG9zdC1wcm90b2J1Zi1jLTEuNS4wJwo+ICAgR0VOICAgICAgcHJvdG9idWYt
Yy9wcm90b2J1Zi1jLnBiLmNjCj4gICBDWFggICAgICBwcm90b2MtYy9wcm90b2NfZ2VuX2MtY19i
eXRlc19maWVsZC5vCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHByb3RvYy1jL2NfYnl0ZXNfZmll
bGQuY2M6NjQ6Cj4gLi9wcm90b2MtYy9jX2hlbHBlcnMuaDogSW4gZnVuY3Rpb24g4oCYaW50IGdv
b2dsZTo6cHJvdG9idWY6OmNvbXBpbGVyOjpjOjpGaWVsZFN5bnRheChjb25zdCBnb29nbGU6OnBy
b3RvYnVmOjpGaWVsZERlc2NyaXB0b3IqKeKAmToKPiAuL3Byb3RvYy1jL2NfaGVscGVycy5oOjE3
OTo0NjogZXJyb3I6IOKAmGNsYXNzIGdvb2dsZTo6cHJvdG9idWY6OkZpbGVEZXNjcmlwdG9yTGVn
YWN54oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYc3ludGF44oCZCj4gICAxNzkgfCAgIHJldHVy
biBGaWxlRGVzY3JpcHRvckxlZ2FjeShmaWVsZC0+ZmlsZSgpKS5zeW50YXgoKSA9PSBGaWxlRGVz
Y3JpcHRvckxlZ2FjeTo6U1lOVEFYX1BST1RPMyA/IDMgOiAyOwo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+Cj4gLi9wcm90b2MtYy9j
X2hlbHBlcnMuaDoxNzk6ODA6IGVycm9yOiDigJhTWU5UQVhfUFJPVE8z4oCZIGlzIG5vdCBhIG1l
bWJlciBvZiDigJhnb29nbGU6OnByb3RvYnVmOjpGaWxlRGVzY3JpcHRvckxlZ2FjeeKAmQo+ICAg
MTc5IHwgICByZXR1cm4gRmlsZURlc2NyaXB0b3JMZWdhY3koZmllbGQtPmZpbGUoKSkuc3ludGF4
KCkgPT0gRmlsZURlc2NyaXB0b3JMZWdhY3k6OlNZTlRBWF9QUk9UTzMgPyAzIDogMjsKPiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+Cj4gbWFrZVsxXTogKioqIFtN
YWtlZmlsZToxNTY3OiBwcm90b2MtYy9wcm90b2NfZ2VuX2MtY19ieXRlc19maWVsZC5vXSBFcnJv
ciAxCj4gbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy9ob21lL3Rob21hcy9wcm9qZXRzL2J1
aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1wcm90b2J1Zi1jLTEuNS4wJwo+IG1ha2U6ICoqKiBb
cGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyODk6IC9ob21lL3Rob21hcy9wcm9qZXRzL2J1aWxkcm9v
dC9vdXRwdXQvYnVpbGQvaG9zdC1wcm90b2J1Zi1jLTEuNS4wLy5zdGFtcF9idWlsdF0gRXJyb3Ig
Mgo+Cj4gVGhpcyBpcyBvbiBhIEZlZG9yYSAzOSBzeXN0ZW0sIGdjYyAxMy54Lgo+Cj4gQ291bGQg
eW91IGhhdmUgYSBsb29rPyBBbHNvIE1pY2hhZWwgTm9zdGhvZmYgcmVwb3J0ZWQgYSBzZXBhcmF0
ZQo+ICh3ZWlyZCkgcGtnLWNvbmZpZyBpc3N1ZS4KClllYWgsIHRoZXJlJ3MgYSBwZW5kaW5nIFBS
IHRoYXQgYXBwZWFyIHRvIGZpeCB0aGlzOgpodHRwczovL2dpdGh1Yi5jb20vcHJvdG9idWYtYy9w
cm90b2J1Zi1jL3B1bGwvNzExCgpTaG91bGQgYmUgZml4ZWQgaW4gdjM6Cmh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDEwMjgwMjU0MTAuNjIx
NTgtNC1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKPgo+IFRoYW5rcyEKPgo+IFRob21hcwo+
IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
