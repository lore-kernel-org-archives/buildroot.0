Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4ABC47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 04:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C850340127;
	Sun, 24 Mar 2024 04:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cI-tW2EDwJqv; Sun, 24 Mar 2024 04:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAF2F4017A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAF2F4017A;
	Sun, 24 Mar 2024 04:54:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B74F1BF2F9
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 04:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 728934017A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 04:54:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdgFiMVf5PP0 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 04:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45A2B40127
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45A2B40127
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45A2B40127
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 04:54:07 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d476d7972aso55241071fa.1
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 21:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711256045; x=1711860845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0CnUE0S+DdP78B3Rwd5ieYsl3rPWCk4yT360Woxv3hs=;
 b=uAPUwsd37XwM2pT69zPTUNTB3i9wM7CYuNTCkiv3+3OfOyGqL9xtK4Zj+rAJzfixgK
 EJWQtPyoihGcBp6Bxl0zJ5xRRItuCOuwdNUnAJiiklydvZGgGZo+HuSsgqwLrmNzLki3
 3SjfOc/Y9DF5wn1Hn6b6lTJVoTaWY3/ObEPFdm7p9RrG4i8tHO2bC2nuE0F99+wC0209
 Di9tK0MKEZTAtM1cHb9wrlCld5QlI1RjvLOJ1DluTcRhZ2Bv4g3+TzV60Tz917Karkp1
 eBt0hgrO1nZmi/GL3pApTgWfhw/sC1Le4faIHCFKuMD7Bo37rP6Yncn28V2IEhdLcA/u
 7rTg==
X-Gm-Message-State: AOJu0YwzPSSVcw775l7OWPisSKpUwJdyfewf4DMefiEjM4bdmKD4DepW
 qAn3YU40/OJCbiU827VSqNPMnUxX5bV2A+MfspwsWmJ14D3ypsw28DYKI97FCevX8IPxHqTiEwa
 lC+6xKbJi9R7O5m/ES3WqKKb6bfOF7G4fSvM=
X-Google-Smtp-Source: AGHT+IEii+FN5sR7AX934IKnuUb4qzGbw+2F9Vw1GFbNQsCAL1U3R8NE4NZd0yanM2qSLEILcxUbWYiSaok01IL5jek=
X-Received: by 2002:a2e:9942:0:b0:2d4:9489:67ba with SMTP id
 r2-20020a2e9942000000b002d4948967bamr2396876ljj.12.1711256044774; Sat, 23 Mar
 2024 21:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240323160120.1276293-1-fancp2007@gmail.com>
 <8f04fa2e-4c65-4de6-8507-14dea3bb9649@mind.be>
In-Reply-To: <8f04fa2e-4c65-4de6-8507-14dea3bb9649@mind.be>
From: Scott Fan <fancp2007@gmail.com>
Date: Sun, 24 Mar 2024 12:53:53 +0800
Message-ID: <CAFkzVZbQHeSGPZsLH3NgKTZJ2iciKmDYuNx7BfXKW3YjCy=4_A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711256045; x=1711860845; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0CnUE0S+DdP78B3Rwd5ieYsl3rPWCk4yT360Woxv3hs=;
 b=f5MlVwgEawhj5GhcdALlC5XyZIwfKMFwiElCc+NH3ZCS2Vah5yBQUsurWYcNeze8T0
 vFdDUk9lvZMJZpJXVsBlGU3vZDhU8QyHim4gQrXx+czF5nxTgxorn4mNGTRnh/HCmYlU
 EebyNIPUEy4HQXuPLN/TcoakNlQ24Qrp2ukTpkUabrqPp+bk+63pTSBqt25h6PmfsoXc
 FbMoCk9ho3H5j+JegB/18O8KhSqPlaSkassqs69GFKoRnRqWvfDVjhfaKqLSBRyqz6RT
 hCKzTNYHXDw4/xLTWxfo3qt+CoL9iuSWBBgddeB7MR25DRdSdkBS9qABmsR7JRzBO3TA
 /PQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=f5MlVwgE
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-generic: remove trailing
 slash in the package-specific PKGDIR variable
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKSXQgaXMgcmVhbGx5IE5PVCBNVVNULCBidXQgU1VHR0VTVCB0byBkbyBpdC4K
Ckkgc2F3IGEgbG90IG9mIGxpbmVzIGNvbnRhaW5pbmcgZG91YmxlIHNsYXNoIHBhdGhzIGluIHRo
ZSBidWlsZCBsb2csCnRoZW4gSSBmb3VuZAp0aGUgJCgyKV9QS0dESVIgdmFyaWFibGUgYWx3YXlz
IGVuZHMgd2l0aCBhIHNsYXNoIGNoYXJhY3RlciwgaXQgY2F1c2VzCmRvdWJsZSBzbGFzaCBpbiBw
YXRocy4KCkFsdGhvdWdoIGl0IGhhcyBubyBzdWJzdGFudGlhbCBhZHZlcnNlIGNvbnNlcXVlbmNl
cywgdGhlIGRvdWJsZSBzbGFzaAppcyBjb21wbGV0ZWx5IHVubmVjZXNzYXJ5LgoKU2NvdHQgRmFu
CgpPbiBTdW4sIE1hciAyNCwgMjAyNCBhdCA0OjIy4oCvQU0gQXJub3V0IFZhbmRlY2FwcGVsbGUg
PGFybm91dEBtaW5kLmJlPiB3cm90ZToKPgo+ICAgSGkgU2NvdHQsCj4KPiBPbiAyMy8wMy8yMDI0
IDE3OjAxLCBTY290dCBGYW4gd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTY290dCBGYW4gPGZh
bmNwMjAwN0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAgcGFja2FnZS9wa2ctZ2VuZXJpYy5tayB8
IDIgKy0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsgYi9wYWNrYWdlL3Br
Zy1nZW5lcmljLm1rCj4gPiBpbmRleCA1NzdhMTQ4YzFlLi5mOWNiODcyMmI4IDEwMDY0NAo+ID4g
LS0tIGEvcGFja2FnZS9wa2ctZ2VuZXJpYy5tawo+ID4gKysrIGIvcGFja2FnZS9wa2ctZ2VuZXJp
Yy5tawo+ID4gQEAgLTQ4OSw3ICs0ODksNyBAQCBQQUNLQUdFU19BTEwgKz0gJCgxKQo+ID4gICAk
KDIpX1RZUEUgICAgICAgICAgICAgICAgICAgICAgID0gICQoNCkKPiA+ICAgJCgyKV9OQU1FICAg
ICAgICAgICAgICAgICAgID0gICQoMSkKPiA+ICAgJCgyKV9SQVdOQU1FICAgICAgICAgICAgICAg
ICAgICAgICAgPSAgJCQocGF0c3Vic3QgaG9zdC0lLCUsJCgxKSkKPiA+IC0kKDIpX1BLR0RJUiAg
ICAgICAgICAgICAgICAgID0gICQocGtnZGlyKQo+ID4gKyQoMilfUEtHRElSICAgICAgICAgICAg
ICAgICAgPSAgJCQocGF0c3Vic3QgJS8sJSwkKHBrZ2RpcikpCj4KPiAgIENhbiB5b3UgZXhwbGFp
biB3aHkgeW91IHdhbnQgdG8gZG8gdGhpcz8gUGVyaGFwcyBpdCBtYWtlcyB0aGUgUEtHRElSIGNv
bnRlbnRzCj4gYSBsaXR0bGUgYml0IG1vcmUgInB1cmUiLCBidXQgaXMgdGhhdCByZWFsbHkgc28g
dXNlZnVsPwo+Cj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPiA+Cj4gPiAgICMgS2VlcCB0aGUg
cGFja2FnZSB2ZXJzaW9uIHRoYXQgbWF5IGNvbnRhaW4gZm9yd2FyZCBzbGFzaGVzIGluIHRoZSBf
RExfVkVSU0lPTgo+ID4gICAjIHZhcmlhYmxlLCB0aGVuIHJlcGxhY2UgYWxsIGZvcndhcmQgc2xh
c2hlcyAoJy8nKSBieSB1bmRlcnNjb3JlcyAoJ18nKSB0bwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
