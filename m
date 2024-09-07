Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48745EB64CB
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 21:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0894260684;
	Sat,  7 Sep 2024 21:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmWMgmIxQZwT; Sat,  7 Sep 2024 21:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED2AB60644
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED2AB60644;
	Sat,  7 Sep 2024 21:24:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEA3F1BF41F
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9CDB81166
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZF-JCzj1-6H3 for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 21:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C8CC181161
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8CC181161
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8CC181161
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 21:24:35 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-501204753c4so1501325e0c.0
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 14:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725744274; x=1726349074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dcv/j42u+WjpjN0OWpL/2d2lfzniB+Mhb/vyYb4B574=;
 b=H5Q5gsUn4sLcBObAa40FHdBw90FQ2OyuCLMRFdyxTPcAwN1Ps1V436I27CtEKoNx+F
 F1iheTkfX8o3edyQeArJ0A/RB+ANH5S0JyCSl/3vNM2A967h0Hu0muCzDi5SMeSnMwH/
 DxVSJpXVAmQxZeGB3sPOXoUAsu4OaScUG2SFg8HRfURCSF37RASu3Rr/xvlhj7v6+obZ
 9F6hln9vU4UUM5Ej/EmPynwUYzRZqPRaSAAluD0qNWnJOdy7vhmjLMQSgL1IcmI3e9zz
 KWAJQ4pyn2oe/tBh+AEgpL6acbBB5BTupAQ+Zx1LBVJWW6FvY8UoBPJ0vDOLljyy0vMc
 UzfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhFNPFtrArKqctOeqtXNoXcCArw0bykAXlLm4GcRibAaFyZKPj1Hz0wZ86Pe5mrr5XYJAkM7WYZzA=@buildroot.org
X-Gm-Message-State: AOJu0YwVWWSFv0vK1Q4/M9CKmYLGefIWdmPiOXWzOb52E4occq/5exER
 kaspK6re1zlJ+AipaiOXTZXM7f7xb2OdH/r7NfBgijJUC99kXShvBlGfgVQ/AEjsJhp9Qwd+NX5
 k8SczgYK8vbdhDrLnL7Q9p+8uyQxsz6OM
X-Google-Smtp-Source: AGHT+IEHJRkWSHmnYRy0t9jA6yJY9iNjaGqbsbFGUJMkizQ7A5hA8psVtFBwSX8moXa6AKGrQyn+0a6IPAKeyT8uVlI=
X-Received: by 2002:ac5:ce05:0:b0:501:13b1:d2e0 with SMTP id
 71dfb90a1353d-50113b1d768mr7263416e0c.1.1725744273972; Sat, 07 Sep 2024
 14:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240906171152.1922026-1-james.hilliard1@gmail.com>
 <ZtywKuWN1HXJhHjw@landeda> <Zty1_NkUzhsVYTd_@landeda>
 <CADvTj4rPAr0-TyeGsN50XGEhpSyeO95G6VXXCzJLHeH4qmrdPQ@mail.gmail.com>
 <ZtzAOKw5leT7Za7s@landeda>
In-Reply-To: <ZtzAOKw5leT7Za7s@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 7 Sep 2024 15:24:22 -0600
Message-ID: <CADvTj4oucBFosh11yQ15dw1=+EaLE3XgSJ+9iWYsfxDqzJr5PA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725744274; x=1726349074; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dcv/j42u+WjpjN0OWpL/2d2lfzniB+Mhb/vyYb4B574=;
 b=nax8hBnIeYzKa2UnTg3B7JdsZMzk/s9yevRy/R6rgiJ6PVYHYNFPUpUpAClPY5dCAj
 9/S5+RyirPUk7we2Aonku+JFTUgyoCQvUzRTMLYlosIQdJR6/+AObHKLKq10SfeaZ2/X
 j2lCiXQ77eQbdMrxXru96hUmVfFoMx5P/Qpqdrq++DQbshWa/HSm5T102fZIUMjDWkYE
 9qVMfO70wFDPjIkA+1Xg30MlYArYvh+0Cz0fWJXb/QTRarHEHiXTySOCKfR9AtBa2nGk
 8BKJToEf4K5KUJTbyJssZP+m3pyfMtFlj+Ft3CCGZ9zRE3kETSF5PwtLRZT9Oyp4IHtz
 cHgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nax8hBnI
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 43.0.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgNywgMjAyNCBhdCAzOjA24oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gSmFtZXMsIEFsbCwKPgo+IE9uIDIwMjQtMDktMDcg
MTQ6NDkgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+IE9uIFNhdCwgU2Vw
IDcsIDIwMjQgYXQgMjoyMuKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPiB3cm90ZToKPiBbLS1TTklQLS1dCj4gPiA+IE5vLCBJIGhhdmUgbm90IGFwcGxpZWQgaXQs
IGJlY2F1c2UgaXQgaXMgaW5jb3JyZWN0OiB3ZSAqbXVzdCogaGF2ZSBhCj4gPiA+IG1hbmdsZWQg
c291cmNlIGZpbGVuYW1lLCBhcyBleHBsYWluZWQgaW4gYzYxN2ViYmM5NzdkOiB3ZSB3YW50IHRo
ZSBsb2NhbAo+ID4gPiBhcmNoaXZlIHRvIGhhdmUgb3VyIC1jYXJnbzIgcG9zdC12ZXJzaW9uIHN1
ZmZpeCwgc28gdGhhdCB3ZSBhcmUgZnJlZSB0bwo+ID4gPiB1cGRhdGUgb3VyIHZlbmRvcmluZyBj
b2RlIChhbmQgdXBkYXRlIHRoZSBwb3N0LXZlcnNpb24gc3VmZml4KSB3aXRob3V0Cj4gPiA+IGNh
dXNpbmcgY29uZmxpY3RzIGluIHRoZSBmdXR1cmUuCj4gPgo+ID4gT2gsIEkgaGFkIHRha2VuIHRo
ZSAidGhpcyBpcyBhIHN0b3AtZ2FwIG1lYXN1cmUiIHBhcnQgYXMgYW4gaW5kaWNhdGlvbgo+ID4g
dGhhdCB0aGlzIHdhcyBvbmx5IGJlaW5nIGRvbmUgaW4gY2FzZXMgd2hlcmUgaXQgd2FzIG5lZWRl
ZCB0byBwcmV2ZW50Cj4gPiBoYXNoIGNvbmZsaWN0cyhpLmUuIGluIGNhc2VzIHdoZXJlIHRoZXJl
IHdvdWxkIGFjdHVhbGx5IGJlIGEgdmVyc2lvbgo+ID4gY29uZmxpY3QgZHVlIHRvIHRoZSBmaWxl
bmFtZSBub3QgY2hhbmdpbmcgd2hlbiB0aGUgaGFzaCBjaGFuZ2VzKS4KPgo+IEV4YWN0bHkuIE5v
dywgY29uc2lkZXIgdGhlIHNpdHVhdGlvbiBpZiBJIGFwcGx5IHRoaXMgcGF0Y2ggdG9kYXksIGFu
ZAo+IHRvbW9ycm93IHdlIGNoYW5nZSB0aGUgdmVuZHJvaW5nIGNvZGUgaW4gZG93bmxvYWQvY2Fy
Z28tcG9zdC1wcm9jZXNzOgo+IHRoZXJlIHdpbGwgYmUgYSBoYXNoIG1pc21hdGNoIGFnYWluLgo+
Cj4gU08gd2Ugd2FudCB0byBhdm9pZCB0aGF0LCBhbmQgc28gYXJjaGl2ZXMgdGhhdCBhcmUgY2Fy
Z28tdmVuZG9yZWQgbXVzdAo+IGhhdmUgb3VyIHBvc3QtdmVyc2lvbiBzdXNzaWZ4LgoKV2Ugd291
bGQgaGF2ZSB0byB1cGRhdGUgdGhlIGhhc2ggYW5kIGFyY2hpdmUgbmFtZSBlaXRoZXIgd2F5IGhv
d2V2ZXIuCgo+Cj4gWWVzLCB0aGF0IGlzIGEgc3RvcC1nYXAgbWVhc3VyZSAid2hpbGUgd2FpdGlu
ZyBmb3IgYSBnZW5lcmljIHNvbHV0aW9uCj4gdGhhdCB3b3JrcyBpbiBhbGwgY2FzZXMsIG5vdCBq
dXN0IHdpdGggUHlQSSIsIGFuZCB3ZSBkbyBub3QgeWV0IGhhdmUgYQo+IGdlbmVyaWMgc29sdXRp
b24uLi4gOi0vCgpJIGZpZ3VyZWQgd2Ugd2FudGVkIHRvIGp1c3QgcmUtYXBwbHkgdGhlIHN1ZmZp
eCBuYW1pbmcgc3R5bGUgYXMgbmVlZGVkCnJhdGhlciB0aGFuIHByZS1lbXB0aXZlbHkuCgo+Cj4g
PiBTaW5jZSB0aGUgdmVyc2lvbiB1cGRhdGUgd291bGQgcmVzdWx0IGluIHRoZSBwYWNrYWdlIG5v
IGxvbmdlcgo+ID4gY29uZmxpY3RpbmcgSSBoYWQgcmVtb3ZlZCB0aGUgaGFjay4KPgo+IFJpZ2h0
LCBpdCBkb2VzIG5vdCBjb25mbGljdCB0b2RheS4gQnV0IHdpbGwgY29uZmxpY3QgdG9tb3Jyb3cu
IDstKQoKVHJ1ZSwgSSBqdXN0IGFzc3VtZWQgdGhlIGFyY2hpdmUgaGFzaCBjaGFuZ2luZyB3YXMg
bm90IGV4YWN0bHkgZ29pbmcKdG8gYmUgYSBjb21tb24gb2NjdXJyZW5jZSBhbmQgdGhhdCB3ZSBk
aWRuJ3Qgd2FudCB0byBrZWVwIHRoZSBoYWNrCmluIHBsYWNlIGluIGNhc2VzIHdoZW4gd2UgYnVt
cCB0aGUgcGFja2FnZSB2ZXJzaW9uLgoKSXQgZG9lcyBtYWtlIGl0IGVhc2llciB0byB0cmFjayB3
aGljaCBwYWNrYWdlcyBuZWVkIHRvIGhhdmUgaGFzaGVzCnVwZGF0ZWQgaG93ZXZlciBzbyBJIGNh
biBzZWUgd2h5IGl0IG1ha2VzIHNlbnNlIHRvIGtlZXAgaXQuCgo+Cj4gWy0tU05JUC0tXQo+ID4g
PiBJbiB0aGUgKHZlcnkgZmFyKSBmdXR1cmUsIHdlIGFyZSB0aGlua2luZyBhYm91dCBkZWNvcmVs
YXRpbmcgdGhlIGxjb2FsCj4gPiA+IGZpbGVuYW1lIGZyb20gdGhlIHJlbW90ZSBvbmUsIGJ1dCB0
aGlzIGlzIGdvaW5nIHRvIHRha2UgYSBsb3Qgb2YgdGltZSwKPiA+ID4gc28gbWF5YmUgYSBzaG9y
dGVyIHNvbHV0aW9uIHdvdWxkIGJlIGZvciBzY2FuLXB5cGkgdG8gaGFuZGxlIHRoZSBjYXNlCj4g
PiA+IGZvciBwYWNrYWdlcyB0aGF0IG5lZWQgY2FyZ28gdmVuZG9yaW5nIChiYXNpY2FsbHksIHRo
ZSBtYXR1cmluIG9yCj4gPiA+IHNldHVwdG9vbHMtcnVzdCBwYWNrYWdlcykuCj4gPiA+Cj4gPiA+
IENvdWxkIHlvdSBoYXZlIGEgbG9vayBhdCB0aGF0IHRvbywgcGxlYXNlPwo+ID4KPiA+IE9rLCBJ
J2xsIGNoYW5nZSB0aGVzZSB0byBrZWVwIHRoZSBjYXJnbzIgdmVuZG9yIHZlcnNpb24uCj4KPiBU
aGFuayB5b3UhIPCfkY0KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+IC0tCj4gLi0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJl
ZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2
MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18g
ICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9y
aW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25z
cGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
