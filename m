Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E759C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 18:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D827740103;
	Thu, 20 Jun 2024 18:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kleS0tgrwoq; Thu, 20 Jun 2024 18:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7413440584
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7413440584;
	Thu, 20 Jun 2024 18:13:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADD591BF3DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 997FF845A9
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:13:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sq8vG7hRHRIG for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 18:13:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73F5B845A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73F5B845A8
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73F5B845A8
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 18:13:40 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3d35f1dfda2so605866b6e.3
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 11:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718907219; x=1719512019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2PVllDVlSTU3H/HvktHDLLIV23mzUHgidShxtWY/NYA=;
 b=rUyVeOR7bL5ODem9B34Z2K5PPy9pPid2CWUlLiZ8/GMRDrkNuSO1/0YjApv6FAXPlN
 RlL8Msk4SkN/aNeC9ewAvbyggTjN0m0z6NridHCpkWujbpjxaORkItNCOzoC/X20ac+N
 eHT4vhzIkXfpwVqkqvy3x1fURNsCLyik/8PeSsb3DhoRWjiyuQSi1++doLVQ4GnHSgGu
 Gn4kY+LAFBi/1vZARBZDkE/+EvRrOpbZeQ2MgxLUIlG4OgmuKtiXxJ7vXpbIJJRoXkD0
 f7aYC/3FQN08SpUoJOn4d0kd+88muXJkN8w5WV52jdpkAZNA3u/5m2A8jsuibE/ApYQk
 6jFw==
X-Gm-Message-State: AOJu0YxjU2CWOkChCsUO4jpi+paq+Wg9PARDZ6hauRozjA+xlZbDLFQ4
 G7rUAwULW1BskoyPCV+4fAsNEc9hAzGGgnv8YYKwh4pI0Js8KhpZ7mf8smyEqLxK+3MZNYIjPsI
 REc9ENbSPrbGJWUWVHoKtwEJ5dRNR99s8Vdg=
X-Google-Smtp-Source: AGHT+IFXllQPf1/UC93M7GmgnrlEjCJPqz7hAdG71HnwLl9rQa4ruIRR4Cp7txFtd4jRzLG8uWXV0mv6aKZMShWYnMI=
X-Received: by 2002:a05:6808:2187:b0:3d2:236d:6b57 with SMTP id
 5614622812f47-3d51ba1b0ffmr6990814b6e.27.1718907219124; Thu, 20 Jun 2024
 11:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718382114.git.yann.morin.1998@free.fr>
 <185f954c798e7d8e7e1400a8b39abe1b273e849b.1718382114.git.yann.morin.1998@free.fr>
 <CADvTj4p=iYe8wK4UMnvCSmsV02JesvY9BWQDZOfcbV_PeSAkNQ@mail.gmail.com>
 <Zm9KqRyiYxLxVfwy@landeda>
In-Reply-To: <Zm9KqRyiYxLxVfwy@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 20 Jun 2024 12:13:27 -0600
Message-ID: <CADvTj4r+O-RTMRMTSWmhW-Tb1UThcjsRM0mA1=H0DsNM3cGuTg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718907219; x=1719512019; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PVllDVlSTU3H/HvktHDLLIV23mzUHgidShxtWY/NYA=;
 b=X/giZgq9gEs2qK5679tSl/gor4CF0NoM9bxm9Rzh6BhLltOYx3Y0xwZ/lyR45tIKUo
 q9BlDMBdq3vh2YRHNF7h45HWwpHc1lmVG000MM/vH9StTr0SPC66GxdWy6RSQEdFDTlV
 hBcXZDeYehfOvBJvnGuTkzLZbkGorG7C0TuYXEBj787k9aDHbHmo1dttOVpLSlOKIaoC
 3Mg51yRZ3KTeRXWFI/yOv7/7wW0WZIr4KQcFO011Lo/Vn5J7+821u3JGKIiwCmWV17XO
 3XEayvoouU4UKSAMOMDvKN/buVf7WJUBhHmwpf6hMQ0n3y5KBlQzmT8TfEiSGUsX5bFQ
 aqyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X/giZgq9
Subject: Re: [Buildroot] [PATCH 2/6] utils/update-rust: add script to
 automatically update the rust version
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBKdW4gMTYsIDIwMjQgYXQgMjoyN+KAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBUaGFuayB5b3UgZm9y
IHRoZSBpbnRlcmVzdGluZyByZXZpZXcgYW5kIGZvciB0aGUgdGVzdGluZyEgOi0pCj4KPiBPbiAy
MDI0LTA2LTE2IDEyOjE0IC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBP
biBGcmksIEp1biAxNCwgMjAyNCBhdCAxMDoyMuKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiBbLS1TTklQLS1dCj4gPiA+IEFkZCBhIGhlbHBlciBz
Y3JpcHQgdGhhdCBnZW5lcmF0ZXMgdGhlIGhhc2ggZmlsZXMgYXV0b21hdGljYWxseSwgYW5kCj4g
PiA+IGFsc28gaXVwZGF0ZSB0aGUgX1ZFUlNJT04gaW4gdGhlIC5tay4KPiBbLS1TTklQLS1dCj4g
PiA+IGRpZmYgLS1naXQgYS91dGlscy91cGRhdGUtcnVzdCBiL3V0aWxzL3VwZGF0ZS1ydXN0Cj4g
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNzU1Cj4gPiA+IGluZGV4IDAwMDAwMDAwMDAuLjY2ZDkzYjcz
MDAKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi91dGlscy91cGRhdGUtcnVzdAo+ID4g
PiBAQCAtMCwwICsxLDE0NyBAQAo+ID4gPiArIyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwo+ID4gPiAr
Cj4gPiA+ICtpbXBvcnQgYXJncGFyc2UKPiA+ID4gK2ltcG9ydCBvcwo+ID4gPiAraW1wb3J0IHJl
cXVlc3RzCj4gPgo+ID4gVGhpcyBpc24ndCBwYXJ0IG9mIHB5dGhvbidzIHN0YW5kYXJkIGxpYnJh
cnksIGlmIHdlIHdhbnQgdGhpcyB0byB3b3JrIHdpdGhvdXQKPiA+IGluc3RhbGxpbmcgZXh0ZXJu
YWwgcHl0aG9uIHBhY2thZ2VzIHlvdSBzaG91bGQgcHJvYmFibHkgdXNlIHVybGxpYi5yZXF1ZXN0
Cj4gPiBsaWtlIEkgZGlkIGluIG15IG9yaWdpbmFsIHV0aWxpdHkgaW5zdGVhZCBvZiByZXF1ZXN0
czoKPiA+Cj4KPiByZXF1ZXN0cyBpcyB2ZXJ5IHdlbGwta25vd24sIHdpZGVseSBhdmFpbGFibGUs
IGFuZCB2ZXJ5IGVhc3kgdG8gdXNlLgo+IFNvLCBJIGJlbGlldmUgaXQgaXMgYSBnb29kIHRyYWRl
LW9mZiB0byByZXF1aXJlIHRoYXQgcmVxdWVzdHMgYmUKPiBpbnN0YWxsZWQgb24gdGhlIGhvc3Qu
CgpJIGRvbid0IHRoaW5rIHRoZXJlJ3MgcmVhbGx5IGFueSBtZWFuaW5nZnVsIGFkdmFudGFnZSB0
byByZXF1ZXN0cyB2cwp1cmxsaWIucmVxdWVzdC51cmxvcGVuIHdoaWNoIGlzIHBhcnQgb2YgdGhl
IHN0YW5kYXJkIGxpYnJhcnkgZm9yIHRoaXMKcGFydGljdWxhciB1c2UgY2FzZS4KCj4KPiBbLS1T
TklQLS1dCj4gPiA+ICsgICAgdmVyc2lvbl92YXIgPSBvcy5wYXRoLmJhc2VuYW1lKG1rX2ZpbGUp
WzotM10udXBwZXIoKS5yZXBsYWNlKCItIiwgIl8iKSArICJfVkVSU0lPTiIKPiA+IE1pZ2h0IGJl
IGEgbGl0dGxlIGNsZWFuZXIgdG8gdXNlIHBhdGhsaWIgd2hlcmUgcG9zc2libGUuCj4KPiBUaGlz
IGlzIHRoZSBvbmx5IHBsYWNlIHdoZXJlIHdlIGRlYWwgd2l0aCBwYXRocywgYW5kIHVzaW5nIHBh
dGhsaWIgd291bGQKPiBub3QgbWFrZSB0aGF0IGxpbmUgc28gbXVjaCBjbGVhbmVyIEkgYmVsaWV2
ZToKPgo+ICAgICBvcy5wYXRoLmJhc2VuYW1lKG1rX2ZpbGUpWzotM10udXBwZXIoKS5yZXBsYWNl
KCItIiwgIl8iKSArICJfVkVSU0lPTiIKPiAgICAgcGF0aGxpYi5QYXRoKG1rX2ZpbGUpLm5hbWVb
Oi0zXS51cHBlcigpLnJlcGxhY2UoIi0iLCAiXyIpICsgIl9WRVJTSU9OIgo+Cj4gT25lIGNoYXIg
bG9uZ2VyLi4uIDstKQoKcGF0aGxpYi5QYXRoKG1rX2ZpbGUpLnN0ZW0udXBwZXIoKS5yZXBsYWNl
KCItIiwgIl8iKSArICJfVkVSU0lPTiIKCkZvdXIgY2hhcmFjdGVycyBzaG9ydGVyLiA7LSkKCj4K
PiBbLS1TTklQLS1dCj4gPiA+ICsgICAgYXJncyA9IHBhcnNlci5wYXJzZV9hcmdzKCkKPiA+ID4g
KyAgICB1cGRhdGVfbWtfZmlsZSgicGFja2FnZS9ydXN0L3J1c3QubWsiLCBhcmdzLnZlcnNpb24p
Cj4gPiA+ICsgICAgdXBkYXRlX21rX2ZpbGUoInBhY2thZ2UvcnVzdC1iaW4vcnVzdC1iaW4ubWsi
LCBhcmdzLnZlcnNpb24pCj4gPiA+ICsgICAgZ2VuX2hhc2hfZmlsZV9zcmMoInBhY2thZ2UvcnVz
dC9ydXN0Lmhhc2giLCBhcmdzLnZlcnNpb24pCj4gPiA+ICsgICAgZ2VuX2hhc2hfZmlsZV9iaW4o
InBhY2thZ2UvcnVzdC1iaW4vcnVzdC1iaW4uaGFzaCIsIGFyZ3MudmVyc2lvbikKPiA+Cj4gPiBU
aGUgZGVmYXVsdCBwYXRocyBzZXQgaGVyZSBicmVhayBpZiB5b3UgdHJ5IHRvIHJ1biB0aGlzIHNj
cmlwdCBmcm9tIHRoZQo+ID4gc2NyaXB0cyBkaXJlY3RvcnkgZGlyZWN0bHkuIElmIHlvdSBjb21w
dXRlIGFsbCB0aGUgZGVmYXVsdHMgcmVsYXRpdmUgdG8KPiA+IFBhdGgoX19maWxlX18pIHRoZW4g
dGhpcyBzY3JpcHQgY2FuIGJlIHJ1biBmcm9tIGFueSBkaXJlY3RvcnkuCj4KPiBJcyB0aGF0IHJl
YWxseSBpbXBvcnRhbnQgdGhhdCB0aGUgc2NyaXB0IGNhbiBiZSBydW4gZnJvbSBhbnl3aGVyZT8g
SQo+IGRvbid0IHRoaW5rIHNvLiBJIGNhbiBob3dldmVyIGFkZCBhIGNoZWNrIHRoYXQgdGhlIGZp
bGVzIHdlIHdhbnQgdG8KPiBnZW5lcmF0ZSBhbmQgdHdlYWsgZG8gYWxyZWFkeSBleGlzdCwgdGhv
dWdoOyB0aGF0J3MgYSBnb29kIHBvaW50LgoKSSdtIG5vdCBzdXJlLCBidXQgaXQgc2hvdWxkIGJl
IHByZXR0eSBlYXN5IHRvIGltcGxlbWVudCwgbWF5IGFsc28Kd2FudCB0byB1c2UgcGF0aGxpYiB0
eXBlcyBoZXJlLgoKPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+IC0tCj4gLi0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAz
NzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAg
ICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4u
aXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGly
YWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
