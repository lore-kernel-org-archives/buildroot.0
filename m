Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FEAC2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 17:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C880080DFE;
	Sun,  4 Jan 2026 17:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMLgS7JHuaBM; Sun,  4 Jan 2026 17:48:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C2D380DCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767548906;
	bh=pkSm5WIYhR2k1hjAnV5lGklHkAoq7tFijmAZzXIc0NY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WZDTR5u25fU/tshSFVDMPdFlgmo+S2U9DJLGAJazwuV8FKVU1ieBNXFr9t1RIX7LE
	 5kLRw+lOWc2zD78H5wbbZZMoFx1LOT649KRo+XrrukACedwpGRpmw6Ek2rLq87Hvc+
	 AdUI/HaTsNYNqCGyEbzS/dTJMhRi6VbBvIhJhtHY/oxGP98HRN6hUXfq3de8YciYG8
	 iualwXAWR70pPBNi5NybIogNSlxkRU2BVbt7HZ/xDSIesWk8+EpH6pTwu2AQtXup5W
	 HSLHe7wJb8IEzZsh3iZfEB9GNBgNAfOAYRVVV1jiicpUr2PLRaXa0soF+yH10RHp8g
	 CcDEJwD4LBxIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C2D380DCE;
	Sun,  4 Jan 2026 17:48:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3FE4E7
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B66E940496
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muSika-g28r3 for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 17:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BAF144032B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAF144032B
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAF144032B
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 17:48:23 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-5dbe6304b79so4993893137.3
 for <buildroot@buildroot.org>; Sun, 04 Jan 2026 09:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767548902; x=1768153702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PqhAYxtSWm4juOJdrE/axVABNw/e7Wvd+aqPvOo2AnU=;
 b=GksrQ9v+uotWS/qDujVXM46NEmpQxtgNnVBH0uPt7dXLCZKdGlzctDlgfLwk8vyZQM
 jTsDeR0lBV0+A6INOFxstHhj4/BTTPysrhN09QPYm1hWFJhnyLRrqLDWTfYBvaNghG3t
 A9AIPLMsbeZahXs6p+tZzaA6mqb3of2C0FkadLGjGLagKjEmvoQoZdLkiH1HphNG8sG8
 uXqvkLLqVsJ7x000zIsd5FBGwVPl7vbUnFkX6rKN3Vnkp/DrLHWHHgLTKrTRVvMMJSxq
 G8p/OmQcz1G7xA16ZD24iWbuHDIPwdS9CnIzYie62aG9cBDFO/E/Ibv/9uk5JYLyEzdZ
 fEhA==
X-Gm-Message-State: AOJu0YwrUgX8aQZV6COt8BQWrugVUtc7zWwZFTMCvuz0+QWo1I80tjit
 eqvAL5Rn9Lhm4bDzSVxr0wnyS/5Qvpo3eWH1MjEpQCw7VcVtRG2E3mHe002S/ABtuWK+bvPbBTD
 X2S9NtOEZUujbCqCOTJ9VxoCrlo6Xckg=
X-Gm-Gg: AY/fxX6ue02wcnnC0+ZDoJUzOXDbwE6LLKJz99nle/0JqhXSaL0fUJywaaLrwCAywv6
 7EH/HCEacVUX4EW5tkHVwZiunWC9tkFforUwn1jA+wYhW3VUii6TtUyjhHaog4atBq/U8Kz6+P6
 vWDX1Qr0Z/qjXjZ2nN8XaRBlJr2oI88plcWRsaf/Nv9YdVXZ1EAkTJo4R1TWI9PHovXdA+o/vEb
 dCNCkPo0k+0j1UWVLUwBex62sxTgJiTIn+Dmc8aYA2XYvnNk3LTbvBA/pI3pczfam2r3GYi3pn0
 uFT10CW50RMNR5YTjqclaz2WWIa/IKUsSQyX6B6+vfDcHMivrCz67dM=
X-Google-Smtp-Source: AGHT+IHaktOl8uzUEVGTAgm25DzgG95hHKVgI8DklcEzOT5epKhSPPlyA9tCuObrQKNntyA6uEDDBNFHdRbMpgFMxhg=
X-Received: by 2002:a05:6102:3710:b0:5db:fe41:747b with SMTP id
 ada2fe7eead31-5eb1a66315amr13134230137.18.1767548902357; Sun, 04 Jan 2026
 09:48:22 -0800 (PST)
MIME-Version: 1.0
References: <20260102002626.2690432-1-james.hilliard1@gmail.com>
 <20260102002626.2690432-2-james.hilliard1@gmail.com>
 <bec9ecc1bdd6aba80a0c7a7b87eec96c@free.fr>
In-Reply-To: <bec9ecc1bdd6aba80a0c7a7b87eec96c@free.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 4 Jan 2026 10:48:11 -0700
X-Gm-Features: AQt7F2rz6Zheuxz7CfRFu7TPfXDuh08KAa-bujDOkkz_d93vWfQQdXOUXPAy25o
Message-ID: <CADvTj4o_4D5=qt3S+0y1OXjR9W-G1nAmhF1jy8S24KQZE3KaEw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767548902; x=1768153702; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqhAYxtSWm4juOJdrE/axVABNw/e7Wvd+aqPvOo2AnU=;
 b=CA1NxWQQiUfNbKu9F6XcCKGvf5l8OlhjTX0cLQ8Ywi0qan3QBeh0dwvgauHS84gNfT
 Bc6x/8Gx4T2tDWyYIBVDHQh+tF5EYPGIgn/Mmiis0ubP0KDQeU6iijt1MRRKOKa7ODD7
 Bei+ZMAmMyy8iiNTGZzs+0PFgpDhAiBydVOR6yGLey2n0kFDDr0+xdzbRpxztYx9okbd
 NkeCa3wAigiAFkJU6aD4kRmcjnnDwjt27UswgyPo3McI8CRb1uUryWWuaxBeUQDVj4pv
 3meufpSPcRBhKDiLuEF9WBuh3lKe0/Zkol7cncDBOPN6F/jXfQR0nlpcU0Qb3Y2gbFoa
 /66A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CA1NxWQQ
Subject: Re: [Buildroot] [PATCH 2/2] package/python-mypy: bump to version
 1.19.1
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

T24gU3VuLCBKYW4gNCwgMjAyNiBhdCA1OjE04oCvQU0gSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLgo+Cj4g
T24gMDIvMDEvMjAyNiAwMToyNiwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPiBMaWNlbnNlIGhh
c2ggY2hhbmdlZCBkdWUgdG8gYWRkaXRpb24gb2YgYmFzZTY0IGxpY2Vuc2Ugd2hpY2gKPiA+IGlz
IEJTRC0yLUNsYXVzZToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24vbXlweS9jb21taXQv
OGY5MjJiM2Q4NzlmMzFlNGM1MmMxYzY0M2RlNzBlMjdiNTcyMDY1NAo+ID4KPiA+IEFkZCBuZXcg
cHl0aG9uLWxpYnJ0IGJ1aWxkL3J1bnRpbWUgZGVwZW5kZW5jeS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+
IFsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tbXlweS9weXRob24tbXlweS5t
awo+ID4gYi9wYWNrYWdlL3B5dGhvbi1teXB5L3B5dGhvbi1teXB5Lm1rCj4gPiBpbmRleCBiYTA3
ZWY1YjljLi40YjAyNzUzOTc4IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9weXRob24tbXlweS9w
eXRob24tbXlweS5tawo+ID4gKysrIGIvcGFja2FnZS9weXRob24tbXlweS9weXRob24tbXlweS5t
awo+ID4gQEAgLTQsMTkgKzQsMjEgQEAKPiA+ICAjCj4gPgo+ID4gIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiA+Cj4gPiAtUFlUSE9OX01ZUFlfVkVSU0lPTiA9IDEuMTguMgo+ID4gK1BZVEhPTl9N
WVBZX1ZFUlNJT04gPSAxLjE5LjEKPgo+IFRoaXMgbmV3IHZlcnNpb24gc2VlbXMgdG8gYnJlYWsg
dGhlIHB5dGhvbi1jaGFyc2V0LW5vcm1hbGl6ZXIKPiBwYWNrYWdlLiBZb3UgY2FuIHJlcHJvZHVj
ZSB0aGUgaXNzdWUgd2l0aCB0aGUgY29tbWFuZHM6Cj4KPiBjYXQgPi5jb25maWcgPDxFT0YKPiBC
UjJfYWFyY2g2ND15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gQlIyX1RPT0xDSEFJTl9F
WFRFUk5BTF9CT09UTElOPXkKPiBCUjJfUEFDS0FHRV9QWVRIT04zPXkKPiBCUjJfUEFDS0FHRV9Q
WVRIT05fQ0hBUlNFVF9OT1JNQUxJWkVSPXkKPiBFT0YKPiBtYWtlIG9sZGRlZmNvbmZpZwo+IG1h
a2UgcHl0aG9uLWNoYXJzZXQtbm9ybWFsaXplcgo+Cj4gV2hpY2ggc2hvd3MgdGhlIGVycm9yOgo+
Cj4gRVJST1IgTWlzc2luZyBkZXBlbmRlbmNpZXM6Cj4gICAgICAgICBteXB5PD0xLjE4LjIsPj0x
LjQuMQo+Cj4gQ291bGQgeW91IGhhdmUgYSBsb29rIHRvIGZpeCB0aGlzIGlzc3VlIGJlZm9yZSB3
ZSBtZXJnZSB0aGlzCj4gc2VyaWVzLCBwbGVhc2U/CgpTZW50IGEgdjIgc2VyaWVzIHdpdGggYSBm
aXggZm9yIHRoYXQ6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyNjAxMDQxNzQ3MDcuMzkwOTYzMi0yLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20vCgo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
