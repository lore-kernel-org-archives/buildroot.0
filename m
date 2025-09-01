Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F29CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 13:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C7CC41282;
	Mon,  1 Sep 2025 13:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gCLrer_VnBW; Mon,  1 Sep 2025 13:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3509412C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3509412C9;
	Mon,  1 Sep 2025 13:18:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ED784D2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBED060A6E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nguduJAaSAVS for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 13:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2B25607DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2B25607DD
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2B25607DD
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 13:18:46 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e96e892081eso3353931276.3
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 06:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756732725; x=1757337525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0LkKL4QsqJc4y6afAdfDBhpPPMkX2+g6Qn2fxZYqHk=;
 b=sBUsw681TyXklKnMqrm93zoFumrWDKBR6OfRW1CuHtnJB+rDlnaH0GyIbFEPuTao5r
 pX/k+whFi9ESN4kW90HsWhQoeANUq6wRt2O+xHQN1iFwn1RidcVzUaPSqAcYVSBznZBZ
 0GsACKrmN7lH34COBJ+95sYgwlKsJLF0MMeQXd5bJnzYSmteo4S75giqPAeBBLCbzEml
 h6iqOZEKpu0HSeIfY6dIyu2WEzi6ZqHenyZHZ6+XD1wx7fc2//gFTYEJf7+ZtxwgYXuh
 80h8FYL0uCh9wVcJDTTJuRfsMSUB7+9UdB7BGJ32xxL9zQbib9hx90KLBkyxbOT0TKoX
 EWOg==
X-Gm-Message-State: AOJu0YxpFXr88gGbWuvdShZtHDOg/TpvHvmUIpCr5hs3JQV0hfC90mig
 R6kJhLwvkCV2ywFBkq4IcCB2HbFel3VjNIiZYNP2XDRzkPW7GUCv19B4UFsJYAWuiX7WcPs6cAU
 Gy6sdwzBGpmqkOE8qSgtiD90w0GlM+NXc6K5sHjfZdg==
X-Gm-Gg: ASbGnctAdPW9PEtekk0T5a6A5wxblqXCS5OFVtlPzJ5zjRtV15S4ja+Le6Kf7di+7E8
 9aB6lYbghim5ZI3xDtgfRQz7pAKZXanT+jqzANoNGbzK2EqYBAU3ceCDt92DzdPFKA9TwjdmbuN
 LRMLnmUt9XxzEcsj9fuaubN5bx9W85zfwKhh0rNOj0Lt7F+79EF2AstEx2hzVdeEgzx/TzBvMJF
 4nH
X-Google-Smtp-Source: AGHT+IHsDy/LO2eatX4FGVKaiKesGB/FiHQUt177xxZoYqp4Leee1x5mZ4aBV6v3uFNk9Gs2SxqZ1VcuEWkSJPUj6Sk=
X-Received: by 2002:a05:6902:728:b0:e97:7f7:434c with SMTP id
 3f1490d57ef6-e98a5839e5dmr7481793276.44.1756732725319; Mon, 01 Sep 2025
 06:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
 <dda8aca0-2c2c-40bc-922f-a8f613aca52f@bootlin.com>
 <52c037ee-ec2c-4c20-bfcc-3ee892db71af@bootlin.com>
In-Reply-To: <52c037ee-ec2c-4c20-bfcc-3ee892db71af@bootlin.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 1 Sep 2025 15:18:33 +0200
X-Gm-Features: Ac12FXwc3vN4u1Aj8Huu8oRCngKhHK5BoO1LcLIy4e5IO_L1gZmanoEMGIgQQ9M
Message-ID: <CABGWkvqH6ndiVLGwDx4iY5YbDgSuLdLM2N_Cx60akfXEW9znvA@mail.gmail.com>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: buildroot@buildroot.org, 
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 linux-amarula@amarulasolutions.com, 
 "Giuseppe D'Angelo" <giuseppe.dangelo@kdab.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756732725; x=1757337525;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0LkKL4QsqJc4y6afAdfDBhpPPMkX2+g6Qn2fxZYqHk=;
 b=fp5MV0qXdiLO6IpnEPuS8xQfaRL2ZVNeo1PObfR5z6EljdLedHpn7Wq6ssr8MIimm7
 IFbDY3fNzSHYZB8WvI7bGYR41Aqa0cj/IL/oBfn6tqmssQnezlB59U2+CXu9sTwBfHIB
 pty5/Z/gEM37tGGWXQMclGArBnOFlb0ktTJyM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fp5MV0qX
Subject: Re: [Buildroot] [RFC v3 0/5] Support qmake for Qt6
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

SGkgUmljaGFyZCwKCk9uIE1vbiwgU2VwIDEsIDIwMjUgYXQgMjoyNuKAr1BNIFJpY2hhcmQgR0VO
T1VECjxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBMZSAwMS8wOS8yMDI1
IMOgIDEwOjAzLCBSaWNoYXJkIEdFTk9VRCBhIMOpY3JpdCA6Cj4gPiBMZSAxNC8wOC8yMDI1IMOg
IDE3OjMyLCBEYXJpbyBCaW5hY2NoaSBhIMOpY3JpdCA6Cj4gPj4gVGhlIHNlcmllcyBzdXBwb3J0
cyBxbWFrZSBmb3IgcXQ2Lgo+ID4gVGhpcyBpcyBncmVhdCB0byBoYXZlIHRoaXMgbW92aW5nIGZv
cndhcmQuCj4gPgo+ID4gVGhhbmtzIGZvciB0aGlzIGpvYiEKPiA+Cj4KPiBJJ3ZlIHRlc3RlZCB0
aGF0IG9uIGEgY2xpZW50J3MgcHJvamVjdCB0aGF0IHdhcyBwcmV2aW91c2x5IHVzaW5nIFF0NSBx
bWFrZS4KPiBCdWlsZHJvb3QgKDIwMjUuMDIuNSksIGFybSB0b29sY2hhaW4sIGJ1aWxkIGFuZCBy
ZWxvY2F0ZSBzZGsuCj4gVGhlIHByb2plY3QgdXNlcyByZWN1cnNpdmUgcW1ha2UsIGl0IHdvcmtz
IGxpa2UgYSBjaGFybS4KClRoYW5rcyBhIGxvdCBmb3IgeW91ciB0ZXN0LgoKSSBzdGlsbCBuZWVk
IHRvIGFkZHJlc3Mgc29tZSBvZiBUaG9tYXPigJkgY29tbWVudHMgaW4gdGhlIHJldmlldzoKCmh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTA4
MTQxNTMyNTkuNjgyMi0yLWRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tLwoKSW4g
cGFydGljdWxhciB0aGUgcG9pbnQ6CgoiJChRVDZCQVNFX0VHTEZTX0RFVklDRSkgZG9lc24ndCBz
ZWVtIHRvIGJlIGRlZmluZWQgYW55d2hlcmUsIHNvIEkgaGF2ZQpzb21lIGRvdWJ0cyB0aGF0IHRo
aXMgaXMgZG9pbmcgc29tZXRoaW5nIHVzZWZ1bC4iCgpJIGRpZCBzb21lIHRlc3RzLCBidXQgdGhl
IGxhc3QgZmV3IGRheXMgaGF2ZSBiZWVuIHF1aXRlIGJ1c3ksIHNvIEkKY291bGRu4oCZdCBtb3Zl
IGZvcndhcmQgd2l0aCB0aGUgc2VyaWVzLgpJIHBsYW4gdG8gcmVwbHkgdG8gVGhvbWFz4oCZIHJl
dmlldyBhbmQgc2VuZCBhIHY0IGVpdGhlciB0b2RheSBvciB0b21vcnJvdy4KClRoYW5rcyBhbmQg
cmVnYXJkcywKRGFyaW8KCgo+Cj4gVGVzdGVkLWJ5OiBSaWNoYXJkIEdFTk9VRCA8cmljaGFyZC5n
ZW5vdWRAYm9vdGxpbi5jb20+Cj4KPiA+Pgo+ID4+IEFzIHN0YXRlZCBpbiBodHRwczovL2RvYy5x
dC5pby9xdC02L3F0Ni1idWlsZHN5c3RlbS5odG1sOgo+ID4+Cj4gPj4gICAgIlRoaXMgb25seSBh
ZmZlY3RzIHVzZXJzIHRoYXQgd2FudCB0byBidWlsZCBRdCBmcm9tIHNvdXJjZXMuCj4gPj4gICAg
IFlvdSBjYW4gc3RpbGwgdXNlIHFtYWtlIGFzIGEgYnVpbGQgdG9vbCBmb3IgeW91ciBhcHBsaWNh
dGlvbnMuIgo+ID4+Cj4gPj4gVGhpcyBzZXJpZXMgcmV2aXZlcyBhbiBvbGRlciBwYXRjaCB0aGF0
IGV4cG9ydGVkIHFtYWtlIGZvciBRdDYsCj4gPj4gYXBwbHlpbmcgYSBtaW5pbWFsIGZpeC4gSXQg
ZXh0ZW5kcyBwa2ctcW1ha2UgdG8gc3VwcG9ydCBRdDYgYW5kIHVzZXMKPiA+PiBxd3QgYW5kIGN1
dGVrZXlib2FyZCBhcyB0ZXN0IGNhc2VzIHRvIHZhbGlkYXRlIHRoZSBjaGFuZ2VzLgo+ID4+Cj4g
Pj4gVGhlIHNlcmllcyBpcyBtYXJrZWQgYXMgUkZDIGJlY2F1c2UgaGFyZGNvZGluZyB0aGUgUXQ1
IGFuZCBRdDYgdmVyc2lvbgo+ID4+IG51bWJlcnMgaW4gcGtnLXFtYWtlIGlzIG5vdCBpZGVhbCwg
ZXZlbiBpZiB0aGUgUXQ1IHZlcnNpb25zIHdlcmUKPiA+PiBhbHJlYWR5IGhhcmRjb2RlZC4KPiA+
Pgo+ID4+IEFuIGFsdGVybmF0aXZlIGFwcHJvYWNoIGNvdWxkIGJlIHRvIGFkZCBhIEJSMl9QQUNL
QUdFX1FUezUsNn0KPiA+PiBfVkVSU0lPTl9WQUxVRQo+ID4+IG9wdGlvbiwgYnV0IHRoaXMgY2Fu
IGJlIGRpc2N1c3NlZCBkdXJpbmcgcmV2aWV3Lgo+ID4+Cj4gPj4gRGFyaW8gQmluYWNjaGkgKDQp
Ogo+ID4+ICAgIHBhY2thZ2UvcXd0OiBidW1wIHRvIHZlcnNpb24gNi4zLjAKPiA+PiAgICBwYWNr
YWdlL3BrZy1xbWFrZTogc3VwcG9ydCBRdDYKPiA+PiAgICBwYWNrYWdlL3F3dDogZW5hYmxlIGJ1
aWxkIHdpdGggUXQ2Cj4gPj4gICAgcGFja2FnZS9jdXRla2V5Ym9hcmQ6IGVuYWJsZSBidWlsZCB3
aXRoIFF0Ngo+ID4+Cj4gPj4gSmVzc2UgVmFuIEdhdmVyZSAoMSk6Cj4gPj4gICAgcGFja2FnZS9x
dDY6IEFkZCBxbWFrZSBmdW5jdGlvbmFsaXR5Cj4gPj4KPiA+PiAgIHBhY2thZ2UvY3V0ZWtleWJv
YXJkL0NvbmZpZy5pbiAgICAgICB8IDEzICsrKysrKy0tLS0KPiA+PiAgIHBhY2thZ2UvY3V0ZWtl
eWJvYXJkL2N1dGVrZXlib2FyZC5tayB8ICA2ICsrKystCj4gPj4gICBwYWNrYWdlL3BrZy1xbWFr
ZS5tayAgICAgICAgICAgICAgICAgfCAyMSArKysrKysrKysrKystLS0tCj4gPj4gICBwYWNrYWdl
L3F0Ni9xdDYubWsgICAgICAgICAgICAgICAgICAgfCAxOCArKysrKysrKysrKysrKwo+ID4+ICAg
cGFja2FnZS9xdDYvcXQ2YmFzZS9xbWFrZS5jb25mLmluICAgIHwgMzYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ID4+ICAgcGFja2FnZS9xdDYvcXQ2YmFzZS9xcGxhdGZvcm1kZWZzLmgg
IHwgIDEgKwo+ID4+ICAgcGFja2FnZS9xdDYvcXQ2YmFzZS9xdC5jb25mLmluICAgICAgIHwgIDcg
KysrKysrCj4gPj4gICBwYWNrYWdlL3F0Ni9xdDZiYXNlL3F0NmJhc2UubWsgICAgICAgfCAxOCAr
KysrKysrKysrKysrKwo+ID4+ICAgcGFja2FnZS9xd3QvQ29uZmlnLmluICAgICAgICAgICAgICAg
IHwgMjIgKysrKysrKysrKy0tLS0tLS0KPiA+PiAgIHBhY2thZ2UvcXd0L3F3dC5oYXNoICAgICAg
ICAgICAgICAgICB8ICA4ICsrKy0tLS0KPiA+PiAgIHBhY2thZ2UvcXd0L3F3dC5tayAgICAgICAg
ICAgICAgICAgICB8ICA2ICsrKystCj4gPj4gICAxMSBmaWxlcyBjaGFuZ2VkLCAxMzIgaW5zZXJ0
aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9xdDYvcXQ2YmFzZS9xbWFrZS5jb25mLmluCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9xdDYvcXQ2YmFzZS9xcGxhdGZvcm1kZWZzLmgKPiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3F0Ni9xdDZiYXNlL3F0LmNvbmYuaW4KPiA+Pgo+ID4KPgo+Cj4gLS0KPiBSaWNo
YXJkIEdlbm91ZCwgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcKPiBodHRwczovL2Jvb3RsaW4uY29tCgoKCi0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBF
bWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlv
bnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQu
ICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFz
b2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
