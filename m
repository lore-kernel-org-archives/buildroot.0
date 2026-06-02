Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889CBCD6E4A
	for <buildroot@archiver.kernel.org>; Tue,  2 Jun 2026 05:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A47B60AF3;
	Tue,  2 Jun 2026 05:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0WdDwmEAzBKZ; Tue,  2 Jun 2026 05:24:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C70260AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780377849;
	bh=1G05PaXq/z4JtES3OG5fbXB0wRWkVuUHQomunMnYUJg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rViShUNp4T/zDP0kjyMgj1sO5XKsmzAhGHOaofCcerxZCKYkH1zcXz0Zn/yej5eh+
	 rtMIigTblrJjCbrQ0hkJ3gUVoe9RQXeAj313Db5oQifFIFIM70eAxr5Uz9JI+fgtqo
	 ehVf0TbhOO1whfJqlCIuL9QZfaSIEWGgZSI+4a+r/HLpVUqXkZ/5SwdXq7U7zbX6o1
	 TgE3aB0Ka1ZP/RECVZWjqZcePnT//FGSupNBglT9cWbfIzBkdxfUguAOrAIMeYbUlP
	 ZimJ/UsGLahsyP2nlSSJIG+vnHhVKhNTNrRmZ3q38AZfG3LWgvkVut32C4ZplK5Bkm
	 J9dcHO/RZe3fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C70260AF4;
	Tue,  2 Jun 2026 05:24:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DE62223
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 744CB40DE4
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLWvkrBXjNrv for <buildroot@buildroot.org>;
 Tue,  2 Jun 2026 05:24:05 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1230; helo=mail-dl1-x1230.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 323E440DE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 323E440DE2
Received: from mail-dl1-x1230.google.com (mail-dl1-x1230.google.com
 [IPv6:2607:f8b0:4864:20::1230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 323E440DE2
 for <buildroot@buildroot.org>; Tue,  2 Jun 2026 05:24:03 +0000 (UTC)
Received: by mail-dl1-x1230.google.com with SMTP id
 a92af1059eb24-137f0aa125bso307505c88.0
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 22:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780377842; cv=none;
 d=google.com; s=arc-20240605;
 b=YZbMzKpsMDVHzny+uLP4vBSoM/w8b+c1E5XLZDJ2mnUGLJdytP56dYqBffVpyF14my
 3TpZHg+MJM+KjCMEUP4b/Jh/zWR8+SDt72oZOqtgim2g9MmFTniWNOFlzzSfH86LkDvl
 rt92hi08XtFb7CiHLeVD3/NBLzXORXpVOy88N7fv57skOsHvQRTZZM34VKyZqvhEOPzD
 9aT2a2miAvHbm1YjXxVS/f42S83riZH+mxrUU5QISldf9Q7fxxNwIJr7ZD+ir6pluJ5D
 UdnpqsBIZR18fI5vAQvwJ3qbNDTGGDn6o6z4jq2QHpFNCvqzvfGt8TM+iFcxNmoWgQJP
 2mlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6cA4ekhS/t6wPsnwrVuoNHzd67CkzUFbNYRZokUD1dM=;
 fh=vMqg6hdzrQnLZJZ3j83cFHAQv7Dc02zdIfdi9CHAN7c=;
 b=aMP/GVXfcSAFNjEqnlFZH2WNmGoj9J5uE2yDL3s1oEmoEDHDUM7Mnuo2OAKlsus/gF
 gMGGNhSKIJKQ43purZtQzsKhDx/u522iTs2sElp4e2s6lmr2KiE5LfLhFHoP40A9/cL6
 hP7ZbSFj/LNePhmyWf8jw/uBXCZf2x/n/4iHU8JK/l/Fazobmrzdj8X4J5AuVSI9gpGG
 L5blX7XM48xjGjNU/CZk0PgzQQrtaWfwjzuWex4qdSvI2n3KGkDHDcIcwF+aLgL6p/wy
 rKh2WGpfkloqj/MneEeR0qTDm2hQ2FvyCgscKk2Ky7lXgt6XiGNEnJ7MmKeN7M7+tDzJ
 hzlg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780377842; x=1780982642;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6cA4ekhS/t6wPsnwrVuoNHzd67CkzUFbNYRZokUD1dM=;
 b=bAreDdSqvTQTCBAsDlsVvO7+wcnNL0TLZGNblpK4vwkhrcf3nwXYo/MUAtwac5Dwsk
 NKUNFlShnoud0lsZJJQAf6nhRyhe93Zn5FhmxU7V83vsO9PRV4gV4oLZQIO5s5DaHhKm
 LTfgOj4uEDMKue0eNU7XFNSXEwUkx0MZ7vMzIlWKO2Lx1NhdLWNm1lq2sKRvom83BTJ5
 EphdIGa3AFJeCF9ksG0n7UFlZGYBfGSALm3206BdEtXJlLA8SATXk2RPUufP5naQqZ0+
 F/HwaxDS/XAb4vXLFHTn/spbsTEsTZv9nF2o4hQbmj5jLYeo7am3lceNx+WCI5ft2XdS
 lHeg==
X-Gm-Message-State: AOJu0YxPg8jNdYiBLc/gDsAvwAdpU42OzMaeZ1yMS4ozEfSJkA6bRZ7/
 xi0BrpnsoziWhhUjDzLLzmI6nfvcALn/RN1P6iQ4xNx5Hv+YuMwEl2x2KhD5PNmkJm5O961vdF5
 w5Lvck/pPxNeQBan6QL/nva3veWxkZPu1dVKOfOjqew==
X-Gm-Gg: Acq92OHEdjiuIh1D/8gqsCXnIRfSL+UBGgjFpGS820dS166Z+87Hqzb4u6eGISy9XIZ
 l1b9CTG0KZe+237DeNPxlxmR8aYYjLf+WNgq5UJSQOJLUnmcGzFi3ecqVzbhX5kh8PqjOwsv6Ug
 VFpcx5dpBTO8tXwGYtnFdOdVDEqolZ2s1+rK6jVzumJ2KFCI9hIyFtQ50w/UgU+p4HXmaciDDed
 i+iDRfvgZNrjzpgETBrws2iuQUQ/yu5S/wO2wairUDrfWd5wd6zOb0RPOYm0PvRD4jDJyY69wn/
 e4DCz5C4HNHVq/Fzk6RKn259mciv
X-Received: by 2002:a05:7022:60a4:b0:136:da48:a3e2 with SMTP id
 a92af1059eb24-137d4283627mr6893844c88.27.1780377842429; Mon, 01 Jun 2026
 22:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260601204735.888967-1-j@j-ernberg.se>
 <20260601204735.888967-2-j@j-ernberg.se>
 <e8aa6f35-a7fc-49d5-9c75-f2fb047262f1@rnout.be>
In-Reply-To: <e8aa6f35-a7fc-49d5-9c75-f2fb047262f1@rnout.be>
From: John Ernberg <j@j-ernberg.se>
Date: Tue, 2 Jun 2026 07:23:51 +0200
X-Gm-Features: AVHnY4JUXL4DpL_zvBbbaEQdL7xuVWo7XLL6zAOQQmjrZ8XIN2cV9M1g-mFTtb8
Message-ID: <CAAHg4Zgg=N3aG9=obqT+ry0G9HmO92HfsQSF6q+xmQDQORYC2Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, John Ernberg <john.ernberg@actia.se>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780377842; x=1780982642;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cA4ekhS/t6wPsnwrVuoNHzd67CkzUFbNYRZokUD1dM=;
 b=FpccqHuQ0k93bvfXFrnLu10iGJzogwE0CDai1IHFDvOl9AGv6hiSfJrPiHCHnbiPQ5
 J8tIIPDGYUnnneEgcdXi73YNyjQh1p1a4yd/7pLDuYQZc/JZUrQ2by5UrUOm6zVVTRGJ
 JcmkTnv6+sG8RAaGRyHM1J/r6GhP+eIlq2R/JgeyJMY85/b4sJQQ0YmOYzkmN7wntX1j
 sWPZ0ryGwiUN0qipR/OlwFpXqa3X/0H2AiTyyyg+nchq4zTM4xHqRr+tK8WnOc0c79/P
 EUpu4QRYCZ/YNLAR0igXtoFYSsqZl3p2Bygkdxw8/rZJf0oj5k8fK0k0zKOyzASvUb8G
 rIzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=FpccqHuQ
Subject: Re: [Buildroot] [RFC PATCH 1/9] package/foot: Prefer ncurses
 terminfo if ncurses is selected
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

SGkgQXJub3V0LAoKT24gTW9uLCBKdW4gMSwgMjAyNiBhdCAxMToxMuKAr1BNIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAcm5vdXQuYmU+IHdyb3RlOgo+Cj4KPgo+IE9uIDAxLzA2LzIwMjYg
MjI6NDcsIEpvaG4gRXJuYmVyZyB3cm90ZToKPiA+IGZvb3QncyBJTlNUQUxMLm1kIHNheXMgdG8g
dXNlIHRoZSBuY3Vyc2VzIHByb3ZpZGVkIHRlcm1pbmZvLiBbMV0KPiA+Cj4gPiBJZiB0aGUgbmN1
cnNlcyBwYWNrYWdlIGlzIGJlaW5nIGluc3RhbGxlZCwgZGlzYWJsZSBnZW5lcmF0aW5nIHRoZSBi
dW5kbGVkCj4gPiB0ZXJtaW5mbyBpbiBmYXZvciBvZiB0aGUgbmN1cnNlcyBvbmUuCj4gPgo+ID4g
TGluazogaHR0cHM6Ly9jb2RlYmVyZy5vcmcvZG5rbC9mb290L3NyYy9icmFuY2gvbWFzdGVyL0lO
U1RBTEwubWQjb3RoZXIgWzFdCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEVybmJlcmcgPGpAai1l
cm5iZXJnLnNlPgo+ID4KPiA+IC0tLQo+ID4KPiA+IFJGQzogQmVjYXVzZSBJIGFtIGNvbmNlcm5l
ZCBpdCBtaWdodCBicmVhayBzdHVmZiBpbiB3YXlzIEkgZG9uJ3Qga25vdyBob3cKPiA+IHRvIHRl
c3QuCj4KPiAgIFRvIHRlc3QgdGhpcyB5b3UgY2FuIGxvb2sgYXQ6Cj4KPiAtIElzIHRoZXJlIGFu
eSBmaWxlIHRoYXQgZG9lc24ndCBnZXQgaW5zdGFsbGVkIGFueW1vcmUgYnkgZWl0aGVyIGZvb3Qg
b3IgbmN1cnNlcz8KPiAtIEZvciB0aGUgZmlsZXMgdGhhdCBhcmUgbm90IGluc3RhbGxlZCBhbnlt
b3JlIChiZWNhdXNlIHRoZXkgY29uZmxpY3QpLCBhcmUgdGhleQo+IGNvbnRlbnRzIGRpZmZlcmVu
dD8gSXMgdGhlIGRpZmZlcmVuY2Ugc2lnbmlmaWNhbnQ/CgpUaGUgZmlsZXNpemUgb2YgdGhlIHRl
cm1pbmZvJ3MgYXJlIGRpZmZlcmVudCwgdGhlIGZvb3Qgb25lIGlzIGJpZ2dlcgpzdWdnZXN0aW5n
IGl0IGNvbnRhaW5zCnRoaW5ncyBub3QgaW4gdGhlIG5jdXJzZXMgcHJvdmlkZWQgdGVybWluZm8u
IEl0J3MgdGhlIHNpZ25pZmljYW5jZSBvZgp0aGUgZGlmZmVyZW5jZXMgdGhhdApJIGhhdmUgbm90
IGJlZW4gYWJsZSB0byBmaWd1cmUgb3V0IGhvdyB0byB0ZXN0LgoKSSBjaGVja2VkIHRoYXQgdGhl
IG9ubHkgcGFja2FnaW5nIGRpZmZlcmVuY2VzIHByZSBhbmQgcG9zdCBwYXRjaCBpcwp0aGF0IGZv
b3QgZG9lc24ndAppbnN0YWxsIGl0cyBvd24gdGVybWluZm8uCgpXZSBjb3VsZCBhbHNvIGdvIHRo
ZSBvdGhlciByb3V0ZSBmcm9tIHRoZSBpbnN0YWxsIGRvY3VtZW50YXRpb24gYW5kCmZvcmNlIGZv
b3QgdG8gdXNlCmEgZGlmZmVyZW50IHRlcm1pbmZvLCBidXQgaXQgaGFzIHRoZSBjYXZlYXQgdGhh
dCBpZiB5b3UgU1NIIHRvIGEKc3lzdGVtIHdpdGhvdXQgZm9vdCBiZWluZwppbnN0YWxsZWQgdGhl
IHNhbWUgd2F5IGl0IHdvbid0IGZpbmQgdGhlIG5jdXJzZXMgdGVybWluZm8uCgpCZXN0IHJlZ2Fy
ZHMgLy8gSm9obiBFcm5iZXJnCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
