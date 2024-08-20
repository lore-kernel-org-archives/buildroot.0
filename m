Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D57BC531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 18:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7C0A60765;
	Tue, 20 Aug 2024 18:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOBYmyG5D9rT; Tue, 20 Aug 2024 18:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B63F560AB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B63F560AB7;
	Tue, 20 Aug 2024 18:47:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29C751BF575
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 18:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1640F8126B
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 18:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NW_uMG7SsOmR for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 18:47:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F18FB81271
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F18FB81271
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F18FB81271
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 18:47:21 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-dff1ccdc17bso6476051276.0
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 11:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724179641; x=1724784441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p1/oPUbGV7Y0fyV7KWF+9bxqwIxznVR2P82qofJmMuI=;
 b=IEfk3LlqzS4weWpaK+gD62NuZTXmHgUZ+cAAVnlloppAYh90UjRAbXP/MRMXnRrDir
 lrRp501h2yJZIziQdU+Vf9gGQ+rZ8XV9QFeYYU5iNckL6zbbjNiHX9Z4PfG15o78T+lx
 CfOEgmU3dLI3yEcnp+pbXPibKoTUBvPMs3JDZOH0sR6m2xvR1/4Ji8BIsUVqoJxkn2q1
 AKI4J/Qh3zTZMDvZYTpZt8m0IhNWzVmFDq1RUtsDoB/fItnxxr3hY1Gl0UUTO7zUnF0D
 vfkYrxS9W8w66HBA2Ck/OhqAL8T60rkhufm+pPq+b01rPKHB3jG9HWHGbOzHjnuRoTlP
 6Qbw==
X-Gm-Message-State: AOJu0YzSIGNF53rur8YcbqY0ky3cps0dfKxTptg6upzAMPRrFwY9ScmT
 xkT+vxibotrfpNFy0pGfyVLwrnzTN1IsFFDBFCLcb2K2SoeaYBMBQhp7LM49vKMdko5KhlYLwxA
 xmMwRyjhxSccPHDp445YjvqB3jYvV3/HISu262YEnpf7WsHtfkruSOQ==
X-Google-Smtp-Source: AGHT+IHur+TxoALM9yRK24czs3Q4ohey/qsCuQj3icyfBD7VwVqamlhTu2ZoV8FyBoOgvdFpM8ZOhsV9DyGL9M9sIgc=
X-Received: by 2002:a05:6902:2b8b:b0:e0b:92a3:fd93 with SMTP id
 3f1490d57ef6-e166554e9c6mr237700276.54.1724179640686; Tue, 20 Aug 2024
 11:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
 <20240803224527.1a93f941@windsurf>
In-Reply-To: <20240803224527.1a93f941@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 20 Aug 2024 20:47:09 +0200
Message-ID: <CABGWkvr-7ms+bSE5R+h7ocUDmFS-XFXaZs453mkfNbBo3D7StQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724179640; x=1724784440;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1/oPUbGV7Y0fyV7KWF+9bxqwIxznVR2P82qofJmMuI=;
 b=HWgBIzFo7RHACkly9SH+VQgcndAAsf0FneiWVAp1yY3vkAm8Cgau2SHwQjy+PqoUWv
 /2mhEvSTRu7xBs91D2KviiB11+8cv9loSm3EGIJ41OvTv5Ey0xESiBc5UgczKXM2lcFA
 zJgtW7VqSj+FgQFAtI5+rhQI9VDt/DV5PJMIc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HWgBIzFo
Subject: Re: [Buildroot] [PATCH 0/3] tinit and stm32f746_disco_sd_defconfig
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKSSBhcG9sb2dpemUgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlLgoKT24g
U2F0LCBBdWcgMywgMjAyNCBhdCAxMDo0NeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gRGFyaW8sCj4KPiBPbiBTYXQs
ICAzIEF1ZyAyMDI0IDE3OjU1OjE0ICswMjAwCj4gRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFj
Y2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKPgo+ID4gVGhpcyBzZXJpZXMgaXMgaW5z
cGlyZWQgYnkgcmVhZGluZyB0aGUgZm9sbG93aW5nIHRvcGljOgo+ID4KPiA+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIzMDIwNjIzMDIwMy43MGUyZGJkOEB3aW5kc3VyZi9U
Cj4gPgo+ID4gU3RhcnRpbmcgZnJvbSB0aGF0IHBhdGNoLCBhbmQgZm9sbG93aW5nIFRob21hcyBQ
ZXRhenpvbmkncyBzdWdnZXN0aW9ucwo+ID4gcmVnYXJkaW5nIHRoZSBwb3NzaWJpbGl0eSBvZiB1
c2luZyBhIHNpbmdsZSBtaW5pbWFsIHNjcmlwdCB3aXRob3V0Cj4gPiBkdXBsaWNhdGluZyBpdCB3
aXRoaW4gQnVpbGRyb290LCBJIGRldmVsb3BlZCB0aGVzZSB0aHJlZSBwYXRjaGVzLgo+ID4gTWVh
bndoaWxlLCB0aGUgY29uZmlndXJhdGlvbiBmb3IgdGhlIHN0bTMyZjc0Nl9kaXNjbyBib2FyZCB3
YXMgdXNlZnVsCj4gPiBmb3IgZGV2ZWxvcGluZyB0aGUgZGlzcGxheSBzdXBwb3J0IGZvciB0aGUg
Ym9hcmQsIHdoaWNoIHdhcyBsYXRlcgo+ID4gbWVyZ2VkIGludG8gTGludXguCj4gPgo+ID4gRGFy
aW8gQmluYWNjaGkgKDMpOgo+ID4gICBwYWNrYWdlL3Rpbml0OiBuZXcgcGFja2FnZQo+ID4gICBj
b25maWdzL3N0bTMyZjc0Nl9kaXNjb19zZF9kZWZjb25maWc6IG5ldyBkZWZjb25maWcKPiA+ICAg
Ym9hcmQvY2FuYWFuL2syMTAtc29jOiB1c2UgdGluaXQgYXMgTGludXggaW5pdCBwcm9jZXNzCj4K
PiBGcm9tIGEgaGlnaC1sZXZlbCBwb2ludCBvZiB2aWV3LCBJIHRoaW5rIGl0IGxvb2tzIGZpbmUs
IHRob3VnaCBJJ2QKPiByZWFsbHkgbGlrZSB0byBoYXZlIHNvbWUgb3BpbmlvbiBmcm9tIHNvbWUg
b2YgdGhlIG90aGVyIG1haW50YWluZXJzIG9uCj4gdGhpcy4KPgo+IE1heWJlIHNvbWUgY29tbWVu
dHM6Cj4KPiAtIEkgZG9uJ3QgcmVhbGx5IHRoaW5rIGl0J3Mgc3VwZXIgdXNlZnVsIHRvIGhhdmUg
YSBHaXRodWIgcHJvamVjdCBmb3IKPiAgIHRpbml0LiBUaGUgc2NyaXB0IGNvdWxkIGp1c3QgYXMg
d2VsbCBiZSBpbnNpZGUgcGFja2FnZS90aW5pdAo+Cj4gLSBTaG91bGQgaXQgYmUgbmFtZWQgdGlu
eWluaXQgaW5zdGVhZCBvZiB0aW5pdCwganVzdCB0byBtYWtlIHRoaW5ncwo+ICAgY2xlYXI/CgpJ
IHdpbGwgcmVuYW1lIGl0IGluIHYyLgoKPgo+IC0gSSBiZWxpZXZlIHlvdSBzaG91bGQgZHJvcCBl
bnRpcmVseSB0aGUgbG9nbyB0aGluZyBpbiB0aW5pdCwgd2UgZG9uJ3QKPiAgIGhhdmUgc3VjaCAi
bG9nb3MiIGluIGFueSBvdGhlciBCdWlsZHJvb3QgZGVmY29uZmlnLCBzbyBJIGRvbid0IHNlZQo+
ICAgd2h5IHdlIHdvdWxkIGhhdmUgb25lIGZvciB0aG9zZSBzdXBlciBzbWFsbCBub01NVSBkZWZj
b25maWdzLiBUaGlzCj4gICB3b3VsZCBhbGxvdyB0byBnZXQgcmlkIG9mIHRpbnktc2V0dXAuc2gg
c3R1ZmYuCgpJIGltcGxlbWVudGVkIHRoZSBsb2dvIG1hbmFnZW1lbnQgb25seSB0byBlbnN1cmUg
dGhhdCB0aGUgcGF0Y2gKImJvYXJkL2NhbmFhbi9rMjEwLXNvYzogdXNlIHRpbml0IGFzIExpbnV4
IGluaXQgcHJvY2VzcyIgd2FzIGJhY2t3YXJkCmNvbXBhdGlibGUuClRoZSBwcmV2aW91cyBzY3Jp
cHQgaW5jbHVkZWQgdGhlIExpbnV4IGxvZ28uIEJ1dCBpZiB0aGlzIGlzIG5vdCBhbgppc3N1ZSwg
SSBhZ3JlZSB3aXRoIHlvdQogdGhhdCBpdCdzIGJldHRlciB0byBhZG9wdCBhIHNpbXBsZXIgYXBw
cm9hY2guCgo+Cj4gPiAgLi4uL3N0bTMyZjc0Ni1kaXNjby9idXN5Ym94LXRpbnkuY29uZmlnICAg
ICAgIHwgMjMwICsrKysrKysrKysrKysrKysrKwo+Cj4gV2h5IGRvIHdlIG5lZWQgYSBidXN5Ym94
LXRpbnkuY29uZmlnPyBXZSBhbHJlYWR5IGhhdmUKPiBwYWNrYWdlL2J1c3lib3gvYnVzeWJveC1t
aW5pbWFsLmNvbmZpZy4gSG93IGRpZmZlcmVudCBhcmUgdGhleT8KCkkgdGhpbmsgdGhpcyBpcyBh
IGNvbmZpZ3VyYXRpb24gSSB1c2VkIGZvciB1cHN0cmVhbWluZyB0aGUgTGludXgKZGlzcGxheSBk
cml2ZXIuCkkgd2lsbCByZW1vdmUgaXQgYW5kIHVzZSB0aGUgYnVzeWJveC1taW5pbWFsLmNvbmZp
Zy4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKPiAt
LQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9v
dGxpbi5jb20KCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERl
dmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBD
YW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMx
MAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
