Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA7CC54E41
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D489C402B2;
	Sun,  3 Mar 2024 09:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPyEAiUOA3qZ; Sun,  3 Mar 2024 09:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C37764024C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37764024C;
	Sun,  3 Mar 2024 09:54:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 188BF1BF57B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1252040090
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RvR49Z5ALWgi for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:54:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E751740660
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E751740660
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E751740660
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:54:20 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-dc74435c428so3802526276.2
 for <buildroot@buildroot.org>; Sun, 03 Mar 2024 01:54:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709459660; x=1710064460;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFFgT0q20tde5Pa6PrOvTvROVhl6jaIhV91ffxbe844=;
 b=dnI9Yj8xrkARxlzBsEAaZmI76btdtd3/CYZRIjbIUOHLfQ1dYEqpLfAz9ktohxUXIO
 jrJiCaF6QuJa/FecVdVNDTSUycoDv8932xtdDfF8fw2Y23Ee3Iv0wBaTsOfsdQuhfIq6
 k6yhnvSbgrtk01TvrX8DxLxBj2XkYZQOv07kRRTFdRbbeAknRVHZFVPXrP+mKN7+mOQq
 LGivw4a057hMGTA5TpI2q4gxCuVUxB/zjSIbR9QjZtdIFfXBRc9zCuN3Qgzbb6BGGzHa
 nNgFK4//0FYbJezuB/TObO8sN0ne44Iy/dApPqrvk8DgqjqDJr+FIVSI4hJQ+KnLa9Rs
 Kc8A==
X-Gm-Message-State: AOJu0YyIjX2okuu/kv/v0UB+suFgDyKa5rMsK05vNjA19lU2Umhj7Gm9
 MM3hn8Kv7uu4c8IhdbJGsTuW3EgDH74iqpfykLIPt7KpNytSD0UWLZUYTHf34TUSDd0qv26z6Ou
 svhwzl+YsRLjnWToX7/kBI7ks3vNXdR2Gu/1y2Q==
X-Google-Smtp-Source: AGHT+IGe96dKx4A9GDLxSxprKTh0x6keit7ON1NDyGJBax0HHCjBot/xriOFxk1qZ9RChBb5B5GecQAk/YtqiOmEie8=
X-Received: by 2002:a81:5f86:0:b0:5ff:c4b9:be5f with SMTP id
 t128-20020a815f86000000b005ffc4b9be5fmr6572415ywb.47.1709459659758; Sun, 03
 Mar 2024 01:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
 <20240301133620.3547430-16-dario.binacchi@amarulasolutions.com>
 <d7921628-c7ad-4de1-b131-dd0b895200c5@smile.fr>
In-Reply-To: <d7921628-c7ad-4de1-b131-dd0b895200c5@smile.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 3 Mar 2024 10:54:09 +0100
Message-ID: <CABGWkvoW80Lr0Y_8yn0S5TxvBjcHrPvdhOK4Rt4qxhNx0JwzJg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709459660; x=1710064460;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFFgT0q20tde5Pa6PrOvTvROVhl6jaIhV91ffxbe844=;
 b=ez3wInQQOy3el1thHXiHadjaN7N0mZvJwj7bcCY1X2eE4TPtR8myxd69Pp9+Tlywti
 kBbb2oZ+Qo4du9aRD+WcMgygEtH6XCaR7wsu0IxbafFTfvlf8TQ95FKM1E0ICe9Parsm
 l0hDnNYocuOwcujFaxIsValKUqwiNjI5mslkg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ez3wInQQ
Subject: Re: [Buildroot] [PATCH v8 15/23] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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

SGVsbG8gUm9tYWluLAoKT24gU3VuLCBNYXIgMywgMjAyNCBhdCAxMjowM+KAr0FNIFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIERhcmlvLAo+Cj4g
TGUgMDEvMDMvMjAyNCDDoCAxNDozNiwgRGFyaW8gQmluYWNjaGkgYSDDqWNyaXQgOgo+ID4gUmVj
ZW50IHZlcnNpb25zIG9mIFUtQm9vdCBhcmUgY2FwYWJsZSBvZiBidWlsZGluZyB0aWJvb3QzLmJp
biB1c2luZwo+ID4gQmlubWFuLiBJbiB0aGlzIGNhc2UsIGxldCdzIGNvcHkgaXQgdG8gdGhlIGJp
bmFyaWVzIGRpcmVjdG9yeS4KPiA+Cj4gPiBUaGUgdXNlIG9mIGBmaW5kJyBjb21tYW5kIGlzIGp1
c3RpZmllZCBieSB0aGUgbmVlZCB0byB1c2UgYSByZWdleAo+ID4gZXhwcmVzc2lvbiB0byBzZWxl
Y3QgdGhlIGNvcnJlY3QgZmlsZS4gVGhpcyBpcyBub3QgcG9zc2libGUgd2l0aCBhCj4gPiBzaW1w
bGUgYGNwJyBjb21tYW5kLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxk
YXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+Cj4gPiAtLS0KPiA+Cj4gPiBD
aGFuZ2VzIGluIHY4Ogo+ID4gLSBVc2UgdGhlIGBmaW5kJyBjb21tYW5kIGluIHBpcGUgd2l0aCB0
aGUgYGNwJyBjb21tYW5kLgo+ID4KPiA+IENoYW5nZXMgaW4gdjY6Cj4gPiAtIFJlcGxhY2UgYGZp
bmQnIGNvbW1hbmQgd2l0aCBgY3AnIG9uZS4KPiA+Cj4gPiBDaGFuZ2VzIGluIHY1Ogo+ID4gLSBS
ZXBsYWNlIHRpYm9vdDMtKi0kKFRJX0szX1I1X0xPQURFUl9TRUNUWVBFKS0qLmJpbiB3aXRoCj4g
PiAgIHRpYm9vdDMtJChUSV9LM19SNV9MT0FERVJfU09DKS0kKFRJX0szX1I1X0xPQURFUl9TRUNU
WVBFKS0qLmJpbgo+ID4KPiA+IEFkZGVkIGluIHY0Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFy
aW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gLS0t
Cj4gPiAgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIHwgNCArKysrCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9i
b290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxv
YWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+IGluZGV4IGZkYjA1OGYzYjcyYS4uOWEwNWQwMDUw
NjdhIDEwMDY0NAo+ID4gLS0tIGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVy
Lm1rCj4gPiArKysgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+
IEBAIC03MCw4ICs3MCwxMiBAQCBkZWZpbmUgVElfSzNfUjVfTE9BREVSX0JVSUxEX0NNRFMKPiA+
ICAgICAgICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFKSAt
QyAkKEBEKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFX09QVFMpCj4gPiAgZW5kZWYKPiA+Cj4gPiAr
VElfSzNfUjVfTE9BREVSX1NFQ1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfVElf
SzNfU0VDVFlQRSkpCj4gPiArVElfSzNfUjVfTE9BREVSX1NPQyA9ICQoY2FsbCBxc3RyaXAsJChC
UjJfUEFDS0FHRV9USV9LM19TT0MpKQo+ID4gKwo+ID4gIGRlZmluZSBUSV9LM19SNV9MT0FERVJf
SU5TVEFMTF9JTUFHRVNfQ01EUwo+ID4gICAgICAgY3AgJChARCkvc3BsL3UtYm9vdC1zcGwuYmlu
ICQoQklOQVJJRVNfRElSKS9yNS11LWJvb3Qtc3BsLmJpbgo+ID4gKyAgICAgY2QgJChARCk7IGZp
bmQgLi8gLXR5cGUgZiAtcmVnZXggIlwuXC90aWJvb3QzLSQoVElfSzNfUjVfTE9BREVSX1NPQykt
JChUSV9LM19SNV9MT0FERVJfU0VDVFlQRSktW14tXSouLmJpbiIgLWV4ZWMgY3Age30gJChCSU5B
UklFU19ESVIpL3RpYm9vdDMuYmluIFw7Cj4KPiBJIGJlbGlldmUgdGhlcmUgaXMgbWlzc2luZyBz
dGVwIGhlcmUgZm9yIHRoZSBBTTY1IHZhcmlhbnQgKHVzaW5nIHNwbGl0IGJpbmFyeQo+IGJhc2Vk
IEJvb3QgRmxvdykgWzFdLgo+Cj4gV2l0aCB0aGUgdGktazMtaW1hZ2UtZ2VuIHJlbW92YWwsIHdl
IG5lZWQgdG8gY29weSBzeXNmdyouaXRiIGdlbmVyYXRlZCBieSBiaW5tYW4KPiAodGktazMtcjUt
bG9hZGVyKSBvdGhlcndpc2UgdGhlIHN5c3RlbSB3b24ndCBib290Lgo+Cj4gVG9vIGJhZCB0aGF0
IHdlIGRvbid0IGhhdmUgYSBBTTY1IGRlZmNvbmZpZyBmb3IgdGVzdGluZy4KPiBBbmRyZWFzLCBE
byB5b3UgdGhpbmsgeW91IGNhbiBjb250cmlidXRlIGEgbmV3IGRlZmNvbmZpZyBmb3IgdGhlIFRN
RFg2NTRJREtFVk0gPwo+Cj4gT24gbXkgc2lkZSwgSSBoYXZlIGEgcGF0Y2ggc2VyaWVzIGZvciB0
aGUgU0stVERBNFZNIHRoYXQgYWxzbyByZXF1aXJlcwo+IHN5c2Z3Ki5pdGIgYmluYXJ5Lgo+Cj4g
WzFdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtRmVi
cnVhcnkvNjg1NjY2Lmh0bWwKCkNhbiB3ZSwgZm9yIG5vdywgY29uc2lkZXIgdGhpcyBtb2RpZmlj
YXRpb24gdW5uZWNlc3NhcnksIG1lcmdlIHRoZQpzZXJpZXMsIGFuZCBwcm9jZWVkIGxhdGVyCndp
dGggYW55IGZ1cnRoZXIgaW1wcm92ZW1lbnRzPyBFc3BlY2lhbGx5IGNvbnNpZGVyaW5nIHRoYXQg
dGhlcmUgaXNuJ3QKY3VycmVudGx5IGEgY29uZmlndXJhdGlvbgpmb3IgYW02NSBpbiBCdWlsZHJv
b3Q/CgpUaGFua3MgYW5kIHJlZ2FyZHMsCkRhcmlvCgo+Cj4gQmVzdCByZWdhcmRzLAo+IFJvbWFp
bgo+Cj4KPiA+ICBlbmRlZgo+ID4KPiA+ICAkKGV2YWwgJChrY29uZmlnLXBhY2thZ2UpKQo+CgoK
LS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFy
aW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwg
MzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1
bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
