Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98ECCD3445
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 18:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 596CF41E0B;
	Fri,  8 May 2026 18:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdIbHN-OQyTy; Fri,  8 May 2026 18:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37D7041DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778263778;
	bh=HJ4FvGlbCe47tE2ByxRcutbRG4xYB9dUw/EchtiTJ7I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OcZAiIVxJ8EUCOYloJoO3p9wKJrwWd49NIBHq8KO7obmxn/Nwe87B4HyztiKvHEGL
	 JhBI9DYCECl0C83pHxmMR/0Da77OVl8TxYkTcgz5KTNK1oz2AlpYGzOJ42+I1R0K9/
	 RRx90MFMhoWpwnKtp/IyVJxuQoAYTW7b8w6TQVAkWobxaNLM8z2AK+r/1k9wX5TpGL
	 GxdLrzCZasUlYDjz0ibMPBAiKlAqkJj6ZcfIBaOf8f3+Jt08vQcOp0CXWdMvhKb+G5
	 DcNF8h3eLJPQWDRWyLlys+x2DCgDJ6TZj4X9wBd+J9uecLkRtOLcaa4lpxJMMrWSJP
	 eOPrYU7EIQGLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37D7041DFA;
	Fri,  8 May 2026 18:09:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6661A22F
 for <buildroot@buildroot.org>; Fri,  8 May 2026 18:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BF4B617B4
 for <buildroot@buildroot.org>; Fri,  8 May 2026 18:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zby8dgmQcoNV for <buildroot@buildroot.org>;
 Fri,  8 May 2026 18:09:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DE49617AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DE49617AE
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DE49617AE
 for <buildroot@buildroot.org>; Fri,  8 May 2026 18:09:35 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-631311d876cso818078137.2
 for <buildroot@buildroot.org>; Fri, 08 May 2026 11:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778263774; cv=none;
 d=google.com; s=arc-20240605;
 b=YdqnAIzuhVWxGSGkXmjciSqXCrghBPPgcTdtHqbbfr8464Nw//znmQp/3yp4UEayJN
 pgtZStYRz4HhHO2VzaWKifzJBsJd5cr7FuYrTZYpSIaXTVV/WyKNo0NyWyclqV1qvT/r
 fhZ19PDSpbxDuCsUBi3so+q2ih3dTzwFXg9CImqj6xpyyhgexaoGatCstKIvnyeCHIRh
 ARuD2Y5ggd5uIZetv4Xa7bOeK2RAy8/foUTlwYdFM/v2gKk+2CbCz+aSaTZgzKmUoebe
 iRykNgX4gdIehOHZ8o5owaSMgWYd9J04UxUyV+HTQX87671JFkgKVLyRZ309VHJ383pN
 YyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1GGCp1n/lRivaUZcsGZIznK3AmC9UNqEsbKRZnWZnrs=;
 fh=e28a2yLOrbszlTguUcbW8Vv02UEngvw9GW7bh6CyzFc=;
 b=kWlYnrZkOI4fUlGn36YBZeZI4kRNB7AOdx920AVmzLYoIK+vVv3hkn6HN8g8KwbOH9
 3WkwPBQlZlNlSoVnmE/XLf3GVPym5j4z2d86x1MUMYPrD0UhPojQisND9xtj2uFn+Q3M
 caushsm8+pSctXSl61nkgMHNe9bG+VtSO2jYThOWKg5e/Ha08DKYYlBtfV/BZW1TXxVR
 d2s2nFl6Tgtjd/+exXw9Ccbx7kIrRcbOTzECcPt7lRXbpKR3gLf0mJ4dEYprrK42Nsap
 jpjHeXszy2bLWEu7glbP4R1wp6E6i9xWdcOlEkPZkPikGrk/IENpvbF2Wbk0HDwbZIGS
 TL7g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778263774; x=1778868574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1GGCp1n/lRivaUZcsGZIznK3AmC9UNqEsbKRZnWZnrs=;
 b=VxJjyr4gmNOIIF4O/M8iNHIFqqa7lH/eeio2MD7mmV979VeE/euWS/mAGEdcKMBD7D
 /ZaZMfPHSg3lu0P8r4G0NDlNstZYkx4pfoIJPQOG/AzYn8KlbJiX40++cC4QGC4wbZ32
 XifSjSzfM4xgxqsIkrH5t5YFuUsjoL5Mw/Yr7B4JHDRL1IG7eyIoyRyAv+qX29pGBAM7
 n13TD8/Z8OpB40NFTRe/N8dTJF2u3vNDqQ/JKQdpyraOsuzWt4VnUVCk3FPuUpeYCaPg
 CJXijSgCkuVvE2LCfcoCPIUqubN7w2izh5GEIBIGweXt4yZEvqCYtC8YVJdR61ktU5eS
 XJHw==
X-Gm-Message-State: AOJu0YzTiUtMw98FA2WDECBJqUF9Gq3kldXZS0tNne+VtmxtPcYr4h2N
 IfAhXUhRFmo/u2RiiSWJf04QbfRaKCl2tBW0NlTbPt0Z66gCfzB+RnfM3B0rKJqn5VKcn4lCBiB
 W2EUxdvu62GejxM/6aZK8c1IlHt9B8qU=
X-Gm-Gg: Acq92OFzT2SVfNkZO4NF/5PG+dIr8dZ+a4bFJp5957nTby+G+Zw820mkV7fiaexLCZv
 iYp1eGyKYxkAgsn7nXrgYGtjjV/gQhQ3oW0Mq78L5cAxX3XRmkA+U06WQwzRUu/ennty2oo7j+4
 XHzlfX8KPuzB1RxjVzbMJakkSNVlVP1syfjSBW5qwp2XMuA1tqXSSVU1oGxCSTNEmuLV1L2xWqE
 VbVe5uI9bIuTpDXrPS20NU/0BduTxg1NRaqj7g1TgzkTWi1fMOSHT74e+/B3Zqo6s31mtmPirK4
 WdrOga04bGStFcGePM2xsAjEDcR5WrjiMyqEPYitDhW6LmVJrNpeRXP+RJacHRqfz+GrbQ==
X-Received: by 2002:a05:6102:3ecb:b0:631:8665:350c with SMTP id
 ada2fe7eead31-631866549b5mr456374137.25.1778263773802; Fri, 08 May 2026
 11:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
 <20260506223341.1759760-35-james.hilliard1@gmail.com>
 <CAMwDAPiSOPm2OCNJXe1ko3YDUodcmnMBURPKB2b_nbJU+AQK=g@mail.gmail.com>
In-Reply-To: <CAMwDAPiSOPm2OCNJXe1ko3YDUodcmnMBURPKB2b_nbJU+AQK=g@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 8 May 2026 12:09:22 -0600
X-Gm-Features: AVHnY4JTXUvO9AHWSTIwl82AAv_90X7qXbKuAItC80QCxLOIx2cDl-uHTqKlhD4
Message-ID: <CADvTj4r-B5eHr0K3XchEy8g_umaYXos953A-FnARLg+gG=Z+Zw@mail.gmail.com>
To: Ferdinand Bachmann <ferdinand.bachmann@go-e.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>, 
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, 
 Bernd Kuhls <bernd@kuhls.net>, Brandon Maier <brandon.maier@collins.com>, 
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Doug Kehn <rdkehn@gmail.com>, 
 Spenser Gilliland <spenser@gillilanding.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778263774; x=1778868574; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GGCp1n/lRivaUZcsGZIznK3AmC9UNqEsbKRZnWZnrs=;
 b=FsYTAcnQT6spBV3rIaCi8qXPcDvIRLt93lzu/+5Jwzh5m3cFnk/4cchtZ0XeRBTmak
 Nj3/zdRemTTFMhqYb3t0Ob7As/TZFjxT6BcTOca35HhK89LK+nDtWJHXxFBidCS7TRY9
 LZaA1OmJ60zo41QzuEPpP+y4mtaLsKWsOoutQik4L36DrnDR8q+4bQl6lcU8T2swJNHS
 BjrSZjrypX5nsENt54oUu4sxiWP+e71KPJ/n67+h+/fpQiWFc25ICXAHWVZib7JjXU5F
 OJ0jZuG5x2GGDL8bz9yNGTkCwbk+JtEjoifiHnIUMg+4Bn1hMS78E9sdb55DxD9YYcD1
 JkDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=FsYTAcnQ
Subject: Re: [Buildroot] [PATCH 35/40] package/uboot-tools: preserve
 /usr/sbin symlink
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

T24gRnJpLCBNYXkgOCwgMjAyNiBhdCAzOjU34oCvQU0gRmVyZGluYW5kIEJhY2htYW5uCjxmZXJk
aW5hbmQuYmFjaG1hbm5AZ28tZS5jb20+IHdyb3RlOgo+Cj4gSGkgSmFtZXMhCj4KPiAtRCBub3Jt
YWxseSBkb2Vzbid0IHJlcGxhY2Ugc3ltbGlua3Mgd2l0aCBkaXJlY3RvcmllcywgYnV0IFVidW50
dSAyNi4wNCBzaGlwcyB3aXRoIFJ1c3QgdXV0aWxzIGluc3RlYWQgb2YgR05VIGNvcmV1dGlscywg
d2hpY2ggaGFzIGEgYnVnIGluIGBpbnN0YWxsYCB0aGF0IGNhdXNlcyB0aGlzOgoKT2gsIHRoYXQg
bWFrZXMgbW9yZSBzZW5zZSwgSSBoYWQgYXNzdW1lZCBpdCB3YXMgZHVlIHRvIG1lcmdlZCBiaW4K
c2luY2UgdGhlIHJzeW5jIGVycm9yIHdhcyBiYXNpY2FsbHkgdGhlIHNhbWUgYXMgdGhpczoKaHR0
cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QvY29tbWl0LzI4Njk0ZGNlYzcyYjEx
ZmFjYTZlOWQ5MzcxZmIwZjY1YzU5MGRlOGIKCkkgdGVzdGVkIHdpdGggdGhlIGRvY3VtZW50ZWQg
d29ya2Fyb3VuZCBvbiBnaXRodWIgYW5kIGl0IHNlZW1zIHRvIGhhdmUKZml4ZWQgdGhlIGlzc3Vl
Ogp1cGRhdGUtYWx0ZXJuYXRpdmVzIC0taW5zdGFsbCAvdXNyL2Jpbi9pbnN0YWxsIGluc3RhbGwg
L3Vzci9iaW4vZ251aW5zdGFsbCAxMDAKCj4KPiBodHRwczovL2dpdGh1Yi5jb20vdXV0aWxzL2Nv
cmV1dGlscy9pc3N1ZXMvMTIxNjYKPgo+IFRoaXMgYWxzbyBhZmZlY3RzIGxvdHMgb2Ygb3RoZXIg
cGFja2FnZXMgKGUuZy4gbHZtMikgYW5kIHBhdGNoaW5nIGV2ZXJ5IHNpbmdsZSBvbmUgb2YgdGhl
bSB0byBub3QgdXNlIGBpbnN0YWxsIC1EYCBpcyBwcm9iYWJseSBvdXQgb2YgdGhlIHF1ZXN0aW9u
LgoKSG1tLCB5ZWFoLCB0aGF0J3Mgbm90IGlkZWFsLCBub3Qgc3VyZSBpZiB3ZSBzaG91bGQgc3Rp
bGwgY2hhbmdlIHRoZSA0MApJIHBhdGNoZWQgb3Igbm90LgoKPiBBbHNvLCBjYW4geW91IGxvb2sg
YXQgbXkgcGF0Y2ggZm9yIGlzc3VlIDE3MyAoaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vd29ya19pdGVtcy8xNzMpPyB1Ym9vdC10b29scyBjdXJyZW50bHkgc2ls
ZW50bHkgYnVpbGRzIHdpdGhvdXQgRklUX1NJR05BVFVSRSBzdXBwb3J0IGV2ZW4gaWYgZW5hYmxl
ZC4gVGhpcyBzaG91bGQgYmUgZml4ZWQuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gRmVyZGluYW5kIEJh
Y2htYW5uCj4KPiBPbiBUaHUsIDcgTWF5IDIwMjYgYXQgMDA6MzQsIEphbWVzIEhpbGxpYXJkIDxq
YW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gV2l0aCBCUjJfUk9PVEZTX01F
UkdFRF9CSU49eSwgL3Vzci9zYmluIGlzIGEgc3ltbGluayB0byBiaW4uCj4+IFVzaW5nIGluc3Rh
bGwgLUQgZm9yIGZpbGVzIGJlbG93ICQoVEFSR0VUX0RJUikvdXNyL3NiaW4gY2FuIGNyZWF0ZQo+
PiB0aGUgcGFyZW50IGRpcmVjdG9yeSBwYXRoIGFuZCByZXBsYWNlIHRoYXQgc3ltbGluayB3aXRo
IGEgcmVhbAo+PiBkaXJlY3RvcnkuCj4+Cj4+IFdpdGggcGVyLXBhY2thZ2UgZGlyZWN0b3JpZXMs
IHRoaXMgY2FuIGxhdGVyIG1ha2UgcnN5bmMgZmFpbCB3aGVuIGEKPj4gcGFja2FnZSB0YXJnZXQg
ZGlyZWN0b3J5IGNvbnRhaW5zIGEgbm9uLWVtcHR5IHVzci9zYmluIGRpcmVjdG9yeSBhbmQKPj4g
dGhlIHNrZWxldG9uIHByb3ZpZGVzIHVzci9zYmluIC0+IGJpbi4KPj4KPj4gVGhlIHNrZWxldG9u
IGRlcGVuZGVuY3kgaGFzIGFscmVhZHkgY3JlYXRlZCAvdXNyL3NiaW4sIGVpdGhlciBhcyBhCj4+
IGRpcmVjdG9yeSBvciBhcyB0aGUgbWVyZ2VkLWJpbiBzeW1saW5rLCBzbyB1c2UgcGxhaW4gaW5z
dGFsbCBhbmQgbGV0IGl0Cj4+IGZvbGxvdyB0aGUgZXhpc3RpbmcgcGF0aC4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4+IC0t
LQo+PiAgcGFja2FnZS91Ym9vdC10b29scy91Ym9vdC10b29scy5tayB8IDQgKystLQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMubWsgYi9wYWNrYWdlL3Vib290
LXRvb2xzL3Vib290LXRvb2xzLm1rCj4+IGluZGV4IGZhMGI2YWJhNzguLjg5ZDJlYzM4ZWEgMTAw
NjQ0Cj4+IC0tLSBhL3BhY2thZ2UvdWJvb3QtdG9vbHMvdWJvb3QtdG9vbHMubWsKPj4gKysrIGIv
cGFja2FnZS91Ym9vdC10b29scy91Ym9vdC10b29scy5tawo+PiBAQCAtOTIsMTQgKzkyLDE0IEBA
IGVuZGlmCj4+Cj4+ICBpZmVxICgkKEJSMl9QQUNLQUdFX1VCT09UX1RPT0xTX0ZXUFJJTlRFTlYp
LHkpCj4+ICBkZWZpbmUgVUJPT1RfVE9PTFNfSU5TVEFMTF9GV1BSSU5URU5WCj4+IC0gICAgICAg
JChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3Rvb2xzL2Vudi9md19wcmludGVudiAkKFRBUkdF
VF9ESVIpL3Vzci9zYmluL2Z3X3ByaW50ZW52Cj4+ICsgICAgICAgJChJTlNUQUxMKSAtbSAwNzU1
ICQoQEQpL3Rvb2xzL2Vudi9md19wcmludGVudiAkKFRBUkdFVF9ESVIpL3Vzci9zYmluL2Z3X3By
aW50ZW52Cj4+ICAgICAgICAgbG4gLXNmIGZ3X3ByaW50ZW52ICQoVEFSR0VUX0RJUikvdXNyL3Ni
aW4vZndfc2V0ZW52Cj4+ICBlbmRlZgo+PiAgZW5kaWYKPj4KPj4gIGlmZXEgKCQoQlIyX1BBQ0tB
R0VfVUJPT1RfVE9PTFNfRFVNUElNQUdFKSx5KQo+PiAgZGVmaW5lIFVCT09UX1RPT0xTX0lOU1RB
TExfRFVNUElNQUdFCj4+IC0gICAgICAgJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3Rvb2xz
L2R1bXBpbWFnZSAkKFRBUkdFVF9ESVIpL3Vzci9zYmluL2R1bXBpbWFnZQo+PiArICAgICAgICQo
SU5TVEFMTCkgLW0gMDc1NSAkKEBEKS90b29scy9kdW1waW1hZ2UgJChUQVJHRVRfRElSKS91c3Iv
c2Jpbi9kdW1waW1hZ2UKPj4gIGVuZGVmCj4+ICBlbmRpZgo+Pgo+PiAtLQo+PiAyLjUzLjAKPj4K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
