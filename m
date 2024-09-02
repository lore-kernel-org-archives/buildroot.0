Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92FECA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 17:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 751C2403BF;
	Mon,  2 Sep 2024 17:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aP8VRlM7eJYM; Mon,  2 Sep 2024 17:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C303840142
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C303840142;
	Mon,  2 Sep 2024 17:52:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB7331BF37E
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 17:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D815640142
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 17:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdREk6H7zkYF for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 17:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38AEC40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38AEC40026
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38AEC40026
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 17:52:53 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e1a7d43a226so2928302276.3
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 10:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725299572; x=1725904372;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KoOW4y92sZkyzzEDa2KuGlbBZifVXvZvEgbiD3iM0/c=;
 b=C2NcCrHA3Hhxi0B4AkIrrw72s4MzMsoxPFKRASrnoci1meJtkMsyA6vGQskgsfeDll
 qFsdEu+A1Mpw2q/HmQL6bY6qeo1Y2/kzxFLRsjlKB7j+sfmbQkJpqLy64139mwUFRFux
 SZF9E6itrOs+UjGlM4UsRRdc3rTVElgxwT3myV2zWvLSjEoG5v8P79qQq27FunAJjaF4
 WwTdPFmXxhYZQ8OFZxqQWVt2RmhsxAe2BLL9c8c2x+nMTmQMf547kEdLWzzTRbbJdizn
 M+IqcaNHv8dHOxq26AgcsWPyXENDZmLhFLYdf+7EJxv95venWm+OYYvF77S9i9vjfbA1
 hulg==
X-Gm-Message-State: AOJu0Yxl9FOsvjEBQmCuSYY/TNkUvZ3KjqtzdPIykmwGmBOEmNswBWe5
 XEz0q5LOA0LnKbBZaloFaQRXI2wMrU2UGP7mAqrifFigLMvs9KJQH2mJXBqgpLXtWdfUxAyfZt3
 8EovJKdr4tYVHmKy0iDv/Bee1GD8fZLVMJg3Xgg==
X-Google-Smtp-Source: AGHT+IFDBZIDupLTzJT4tdvw4CzgAdwuqlRaFGoEsDFVwP05F4JO8XDETlXoy8jd2LQAm6sWeM7ErKEz+XgmCg9nSZo=
X-Received: by 2002:a05:6902:1106:b0:e13:d834:604f with SMTP id
 3f1490d57ef6-e1a7a3cf59emr11963791276.50.1725299572138; Mon, 02 Sep 2024
 10:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240901063634.3504315-1-dario.binacchi@amarulasolutions.com>
 <ZtXmlczpG3mqy3im@landeda>
In-Reply-To: <ZtXmlczpG3mqy3im@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 2 Sep 2024 19:52:41 +0200
Message-ID: <CABGWkvoL1NXo8zD=w+qx+TH+CJiS+vtc9SYBgj_Qwx6k8w_XCQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725299572; x=1725904372;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KoOW4y92sZkyzzEDa2KuGlbBZifVXvZvEgbiD3iM0/c=;
 b=GMqoDl/W0alig6maVRNHT9RjBsbwERT3n1reOYv3b332KQw9qmVjxFSmEsVOoE0LP0
 R4XViI7WwXHz5sXvQAyeGtPKqJ3nA2DkIYJoUdTDnrYko7lDxcvwOrNBZZaxlqJ4njz+
 iWyPWp6dFDNUfj8/OCnBClz/zq32xP45sJVtA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GMqoDl/W
Subject: Re: [Buildroot] [PATCH v3 1/2] package/babeld: update URL site
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIE1vbiwgU2VwIDIsIDIwMjQgYXQgNjoyM+KAr1BNIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IERhcmlvLCBBbGwsCj4KPiBPbiAy
MDI0LTA5LTAxIDA4OjM2ICswMjAwLCBEYXJpbyBCaW5hY2NoaSBzcGFrZSB0aHVzbHk6Cj4gPiBB
cyByZXBvcnRlZCBpbiBbMV0sIHZlcnNpb24gMS45LjIgaGFzIGJlZW4gbW92ZWQgdG8gYW5vdGhl
ciBhcmNoaXZlLCBhbmQKPiA+IGl0IGlzIHJlY29tbWVuZGVkIHRvIHVzZSBodHRwczovL2dpdGh1
Yi5jb20vamVjaC9iYWJlbGQgYXMgdGhlIG9mZmljaWFsCj4gPiByZXBvc2l0b3J5Lgo+ID4KPiA+
IEl0IHdhcyBhbHNvIG5lY2Vzc2FyeSB0byBjaGFuZ2UgdGhlIHNoYSBvZiB0aGUgZG93bmxvYWRl
ZCB0YXIuZ3ouCj4KPiBUaGF0IGlzIG5vdCBnb2luZyB0byBiZSBwb3NzaWJsZS4KPgo+IEluZGVl
ZCwgd2UgYWxyZWFkeSBoYXZlIGEgdGFyYmFsbCBjYWNoZWQgZm9yIGJhYmVsZC0xLjkuMiwgYW5k
IG9mIGNvdXJzZQo+IGl0IGlzIHRoZSBvbGQgb25lLCBzbyBpdCBoYXMgdGhlIG9sZCBoYXNoLiBB
bHNvLCBwZW9wbGUgd2lsbCBhbHJlYWR5Cj4gaGF2ZSBhIGxvY2FsIGFyY2hpdmUgb2YgYmFiZWxk
LCBhbHNvIHdpdGggdGhlIG9sZCBoYXNoLgo+Cj4gSWYgd2Ugd2VyZSB0byB1cGRhdGUgdGhlIGhh
c2gsIHRoZW4gbmV3ZXIgdmVyc2lvbiBvZiBCdWlsZHJvb3QgY291bGQgbm90Cj4gdXNlIHRoZSBm
aWxlIGNhY2hlZCBvbiBzLmIubywgYW5kIHBlb3BsZSB3aXRoIGEgbG9jYWwgY2FjaGUgd2lsbCBh
bHNvCj4gaGF2ZSBhbiBpc3N1ZSwgZXNwZWNpYWxseSB0aG9zZSB0aGF0IGRvIG1haW50ZW5hbmNl
IGJldHdlZW4gdmFyaW91cwo+IGJyYW5jaGVzLCBzb21lIHdpdGggb2xkZXIgQnVpbGRyb290cywg
b3RoZXIgd2l0aCBuZXdlciBvbmVzLgo+Cj4gSW4gdGhhdCBzaXR1YXRpb24sIHdlIG5lZWQgdG8g
ZmluZCBhIHdheSBzbyB0aGF0IHRoZSBuZXcgYXJjaGl2ZSBoYXMgYQo+IGRpZmZlcmVudCBuYW1l
LiBUaGVyZSBhcmUgYSBmZXcgb3B0aW9uczoKPgo+ICAgLSB1c2UgYSBnaXQgaGFzaCByYXRoZXIg
dGhhbiBhIHZlcnNpb24KPiAgIC0gdXNlIGEgdHJpY2sgaW4gdGhlIHZlcnNpb24gc3RyaW5nCj4g
ICAtIGNoYW5nZSB0aGUgZG93bmxvYWQgbWVjaGFuaXNtCj4KPiBUaGUgZmlyc3Qgb3B0aW9uIGlz
IG5vdCBuaWNlLCBiZWNhdXNlIHRoZW4gd2UgbG9zZSB0aGUgcG9zc2liaWxpdHkgdG8KPiBoYXZl
IGZvbGxvdyByZWxlYXNlcyBmcm9tIHJlbGVhc2UtbW9uaXRvcmluZy5vcmcKPgo+IFRoZSBzZWNv
bmQgb3B0aW9uIGlzIGFsc28gbm90IHZlcnkgbmljZSwgYmVjYXVzZSB0aGF0IGFsc28gYnJlYWtz
Cj4gcmVsZWFzZS1tb25pdG9yaW5nLm9yZywgYnV0IHdvdWxkIG90aGVyd2lzZSBsb29rIGxpa2U6
Cj4KPiAgICAgIyBXaGVuIGJ1bXBpbmcgdGhlIHZlcnNpb24sIG1vdmUgdGhlIGJhYmVsZC0gcHJl
Zml4IGludG8gdGhlIGdpdGh1YiBtYWNybyBjYWxsCj4gICAgIEJBQkVMRF9WRVJTSU9OID0gYmFi
ZWxkLTEuOS4yCj4gICAgIEJBQkVMRF9TSVRFID0gJChjYWxsIGdpdGh1YixqZWNoLGJhYmVsZCwk
KEJBQkVMRF9WRVJTSU9OKSkKPgo+IEJ1dCBzaW5jZSB3ZSBhcmUgdHJ5aW5nIHRvIG1vdmUgYXdh
eSBmcm9tIHRoZSBnaXRodWIgbWFjcm8gKGxvbmcgdGVybQo+IGdvYWwpLCBJJ2QgZXZlbiBzdWdn
ZXN0IHdlIGRpcmVjdGx5IHN3aXRjaCB0byB1c2luZyB0aGUgZ2l0IGRvd25sb2FkCj4gbWV0aG9k
Ogo+Cj4gICAgIEJBQkVMRF9WRVJTSU9OID0gMS45LjIKPiAgICAgQkFCRUxEX1NJVEUgPSBodHRw
czovL2dpdGh1Yi5jb20vamVjaC9iYWJlbGQKPiAgICAgQkFCRUxEX1NJVEVfTUVUSE9EID0gZ2l0
Cj4KPiB3aGljaCB3b3VsZCBtZWFuIHRoZSBhcmNoaXZlIGZpbGVuYW1lIHdvdWxkIGNoYW5nZToK
Pgo+ICAgICBzaGEyNTYgWFguLi5YWCBiYWJlbGQtMS45LjItZ2l0NC50YXIuZ3oKPgo+ICh5ZXMs
IEkga25vdyBJIHN1Z2dlc3RlZCBoYXZpbmcgdGhlIGJhYmVsZC0gcHJlZml4IGluIHRoZSBnaXRo
dWIgbmFjcm8KPiBjYWxsLCBidXQgSSBqdXN0IGZvcmdvdCBhYm91dCB0aGUgaW1wbGljYXRpb25z
IHdpdGggdGhlIGhhc2gsIHNvcnJ5LikKCkRvbid0IHdvcnJ5LgpUaGFua3MgYWdhaW4gZm9yIHRo
ZSBkZXRhaWxlZCBleHBsYW5hdGlvbi4KSSB3aWxsIHN1Ym1pdCB2MyBBU0FQLgoKUmVnYXJkcywK
RGFyaW8KCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+IEZpeGVzOgo+ID4gLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8yNDQ3MDYwYzg2YWNmMWJkOGQ2
ZWUwYmNmOGY5YjZhZGNkZmM1MGM5Cj4gPgo+ID4gWzFdIGh0dHBzOi8vYWxpb3RoLWxpc3RzLmRl
Ymlhbi5uZXQvcGlwZXJtYWlsL2JhYmVsLXVzZXJzLzIwMjQtQXVndXN0LzAwNDE4Ny5odG1sCj4g
PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgdjIgLT4gdjM6Cj4gPiAgIC0gRml4IHRo
ZSB3YXkgdGhlIGdpdGh1YiBtYWNybyBpcyBjYWxsZWQuCj4gPgo+ID4gQ2hhbmdlcyB2MSAtPiB2
MjoKPiA+ICAgLSBEb24ndCBidW1wIHRvIDEuMTAuMCBidXQgdXBkYXRlIHRoZSBVUkwgc2l0ZS4K
PiA+Cj4gPiAgcGFja2FnZS9iYWJlbGQvYmFiZWxkLmhhc2ggfCAyICstCj4gPiAgcGFja2FnZS9i
YWJlbGQvYmFiZWxkLm1rICAgfCAyICstCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYmFiZWxk
L2JhYmVsZC5oYXNoIGIvcGFja2FnZS9iYWJlbGQvYmFiZWxkLmhhc2gKPiA+IGluZGV4IDJlMDUx
M2VmYTAxMC4uZTcyNWIxZmUzMTBjIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9iYWJlbGQvYmFi
ZWxkLmhhc2gKPiA+ICsrKyBiL3BhY2thZ2UvYmFiZWxkL2JhYmVsZC5oYXNoCj4gPiBAQCAtMSwz
ICsxLDMgQEAKPiA+ICAjIExvY2FsbHkgY29tcHV0ZWQKPiA+IC1zaGEyNTYgIDE1NGYwMGUwYThi
ZjM1ZDZlYTkwMjg4ODZjM2RjNWMzYzM0MmRkMWEzNjdkZjU1ZWYyOWE1NDdiNzU4NjdmMDcgIGJh
YmVsZC0xLjkuMi50YXIuZ3oKPiA+ICtzaGEyNTYgIGM4YzhjMzY5OGFmYjAwY2FhNWE1YzliYmJi
MGEyMmI1NmQ3OWFkM2Y5Nzc1MzgyOTE1YmE5NzlhYzg4YzRlOGYgIGJhYmVsZC0xLjkuMi50YXIu
Z3oKPiA+ICBzaGEyNTYgIGI0MTVjNDEyOTJjZWRlZjZjOTdiMjQzNjA5ZTUwNTUyODg3YzI5MzQz
NTY2YzYzOWYyMzI4MmQzMWVmZDJhZmQgIExJQ0VOQ0UKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2JhYmVsZC9iYWJlbGQubWsgYi9wYWNrYWdlL2JhYmVsZC9iYWJlbGQubWsKPiA+IGluZGV4IDc4
NWZhMmJjZTlmMS4uM2Y5YTk0NGVkMDYzIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9iYWJlbGQv
YmFiZWxkLm1rCj4gPiArKysgYi9wYWNrYWdlL2JhYmVsZC9iYWJlbGQubWsKPiA+IEBAIC01LDcg
KzUsNyBAQAo+ID4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPgo+ID4gIEJBQkVMRF9WRVJT
SU9OID0gMS45LjIKPiA+IC1CQUJFTERfU0lURSA9IGh0dHA6Ly93d3cucHBzLnVuaXYtcGFyaXMt
ZGlkZXJvdC5mci9+amNoL3NvZnR3YXJlL2ZpbGVzCj4gPiArQkFCRUxEX1NJVEUgPSAkKGNhbGwg
Z2l0aHViLGplY2gsYmFiZWxkLGJhYmVsZC0kKEJBQkVMRF9WRVJTSU9OKSkKPiA+ICBCQUJFTERf
TElDRU5TRSA9IE1JVAo+ID4gIEJBQkVMRF9MSUNFTlNFX0ZJTEVTID0gTElDRU5DRQo+ID4KPiA+
IC0tCj4gPiAyLjQzLjAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIg
fCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5
IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVy
ZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBc
IEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVs
b3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5l
dmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMApp
bmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
