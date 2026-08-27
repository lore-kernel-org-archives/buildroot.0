Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039F7C61DBE
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 00:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 954A8404FF;
	Thu, 27 Aug 2026 00:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MVYQvjDea84; Thu, 27 Aug 2026 00:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787791610;
	bh=W993JPHyQBLN9BfyzdBn/QmHQc/1bUMrJIPpoRwmMus=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dcHZ+XuIvOhi8KCmTIAN4Q0tlj3k9psUCko4RfiKxxTEPTAfOrW2T5wATBoVvpu0K
	 0hKqM2ZZLvEqFbBBYqJ+V9SO+IhSWskM/2Qt4OqPfwUBoTTc9nSK/SoFpLihK9fCoI
	 vnleORnFNLUmnG4E2Xt8BTdibf6mDdOC0VC2vL5V9+BFyrKOsJmB+fedL9qpemEJOx
	 VPzIphH7vQzDSJs8nY+SqvRdaKR75NCSka9TJ+9jzhj12S9W03xOSdDwc6oyNs3sby
	 Wy8xW1+NYriOyBQu61/5bd5+m1kwH7HpbFkYcj5cVSTI3+cP05VpJ0PLSkXe55Zacy
	 o2TcX0odYZxBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD14E404F7;
	Thu, 27 Aug 2026 00:46:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85BDD334
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BB1F60642
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQyY-jGu-Yhh for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 00:46:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=matthew.l.weber@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=thewebers.ws
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=thewebers-ws.20251104.gappssmtp.com
 header.i=@thewebers-ws.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=uN7T64lE
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD09B605EC
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 00:46:45 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-3a20d12211bso6000571fa.0
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 17:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787791603; cv=none;
 d=google.com; s=arc-20260327;
 b=NS6okaQzotbaS09Wty+z0lIEt7/3nayvqnAAXZwTaoe6xnMI/A5yhzIo1f7TkAjFOo
 gxiKQIBorDpNmfcr4XJvCct63Ly7Yl/CsiX3CrDSF0ahfPuQY2mg49FHVaGPB5gufxOA
 GH/34FqKY9nwWXAZsmSM8/Vnn92I6HPMwBG4cIFsfGn6yZiAGXCvjdXwtF+JzDwLgW/H
 iOPobKBAEQoycUP/C0ZMxIXeYRhMBSmFYHqRvlg27YEZdxWeVsLlAS2scGVE1/K3QxAB
 3jZjEoiRr4+EPu030D8IASNx7XqHW3j4Q+K3kq/SrfUjjeBGiLSS3hJuYPWhWNj3CtdK
 qPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fQHnSLhq/pAArLsuo/L7Ko8/O7D+LXBH3GNg07T0U78=;
 fh=2AgEs1vvEY1FZ2pFR9FIfo1m5yePocERthq97wSCbGU=;
 b=TxbrfcBijiZkw5T7exkaiLDkyMFlS8eAQqsRjLW5/omzumGnBer1BGh7R2q9oINomF
 5GQnp447Kd/WgBHjSVrfDhHlMUTQ1dfSb5HDK6pNAjpAwd7TvvGt+KZ6NbfYAobIZ6qu
 upX4gaeE6I2UQJmPKmwr5uxBqAfAmcFz4huFNmAj7D8coDm2ZnnRQVulDrKtaYl7YTKW
 KFXXDloOzs2PBRuAOccmc3IuyAGlXlJyc/Xr/hWysMNyKqKIX8/KGuFfJej8M7l1UFNr
 2XE/eLaG84clwElWZRRU+j4wRCEu5NoDXqRGPvdqR6xqVm3i+QBc3+GmuqlCRpsEdVND
 9eTg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thewebers-ws.20251104.gappssmtp.com; s=20251104; t=1787791603; x=1788396403;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fQHnSLhq/pAArLsuo/L7Ko8/O7D+LXBH3GNg07T0U78=;
 b=uN7T64lEEJhL6z82k4+JYSFn7KcwF/bCFn0n6runzd0H9Svl90ZizkylA9OQ+eeoMi
 cSRzH7P6vGfFgteOpXEhJH/N/I3MNQ3kFfPtqSeur/+W3aiCSQPbv+Fl5mDByX5jxHW1
 ZPtXnSz9ukySwlgWqcT0AO2eeYf94e0DjRBQFtWogORxDdQJGXwIz3TwjKBbzEf5UQy1
 j/mnyq5XvUowbj5gM4WPWSZX4oRK6wdAZgLiR5ssN68AJLmfpzPnLr0LXCVYItoVcilf
 rZzNWRkhbUG+56bugPrgmsh06tH2B87vtpTetVBXN0PoOcfyHNc0/tvTHDCBoKiPy5qH
 mcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787791603; x=1788396403;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fQHnSLhq/pAArLsuo/L7Ko8/O7D+LXBH3GNg07T0U78=;
 b=l0FeiaXk3JZB1OQCzJdp+j2pxNIlVRPwHunbrSXHQvC8l2O2j59x1z4aZb74hjMwg5
 mgGv7Lcff/7qkGVAvPlM4sS01v22SmVn1qBq+U/9qTGv4CmeFrnC5JnQK1jrqvIWc6lL
 K3osziawM8HuaIy7CTB21Ytd9anVsSSCztxHNd50yHzwBgg5ZZ6kN8PbUZow6dHW5mgv
 F7K0JGE4aq/WnYP91Pi+TJhFSjNLALZEkQYoFUARiLY8u9DFFMPgWxoB9b9LdD/q8zoZ
 VBUPSpnJ/q0PcDtdzdbY1mc7L4y3X3b30l47EN/nmF7Zd0QxlU1A1TndZrHf5w0UjHu0
 5gUA==
X-Gm-Message-State: AFuF++n+HgA9V5t5Bn670TU+SsXCR0TX/WaEjhuBB2BnheGMGR83kz2R
 WxwVJ2HM5pjPYUT6rWUecD4IKiZfbBWEQaBWrktnEVGaMRoQQLK4whE8MsY7VZ2eg4RkAnyLnKo
 4lSyzS6wM7OngyZ2RMqAVPND1oytzGFc=
X-Gm-Gg: AR+sD13wUYUALkk6ODRd8ZnE/T948gPKRGwrFHvJEd56c/P2IJ8OpK3HtxuIYoI3Q7G
 WG6h3gtfLYv1SvFXq8OAGmSAVcT/swBjPZRL1wXURbTYZQy1ymj1yWo9JkLFKyKLHfMobsRoFHc
 Ye1cyhIAmIk7l2mQ36OKzxtobG3O9AfJ1G9cx/EcRjTCCauC3pBy+Y5B6J4LxzMhHuK941chlfB
 5Ti1VLoaoTUpkOufDDdgQBmHqdLtOBWymoBU6vdNsEMfmF9tpiypNunMxad39wU7ObeiFxltAV5
 f/y2DBUkekvt580FqhEEtwLimP43JthtvR7gFGJSel0u
X-Received: by 2002:a2e:9892:0:b0:393:a68e:fd3e with SMTP id
 38308e7fff4ca-3a20dbc8b60mr3356121fa.12.1787791602625; Wed, 26 Aug 2026
 17:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260826064649.292291-1-neal.frager@amd.com>
 <20260826064649.292291-3-neal.frager@amd.com>
In-Reply-To: <20260826064649.292291-3-neal.frager@amd.com>
From: Matthew Weber <matt@thewebers.ws>
Date: Wed, 26 Aug 2026 19:46:31 -0500
X-Gm-Features: AcwNN1Xn-PRcpsvv4_5Z4tu5sPmyP1wBwc5rf817ThAdDR-cQ3b9pCp18hV3o54
Message-ID: <CAFt09wP8NauN0iHSWfua1tB+KiZNWH33422bPJ-o4rwM2A=3zw@mail.gmail.com>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, alistair@alistair23.me, 
 stefano.stabellini@amd.com, ibai.erkiaga-elorza@amd.com, 
 luca.ceresoli@bootlin.com, micheal.saleab@amd.com, yann.morin@orange.com, 
 matthew.l.weber3@boeing.com, Matthew Weber <mathew.l.weber3@boeing.com>, 
 brandon.maier@collins.com, john.ernberg@actia.se, brian.j.wood2@boeing.com, 
 ju.o@free.fr, stewart.hildebrand@amd.com, thomas.petazzoni@bootlin.com, 
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Subject: Re: [Buildroot] [PATCH v5 3/4] package/xen: add custom tarball
 support
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

TmVhbCwKCk9uIFdlZCwgQXVnIDI2LCAyMDI2IGF0IDE6NDfigK9BTSBOZWFsIEZyYWdlciB2aWEg
YnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBBZGQgc3VwcG9y
dCBmb3IgY3VzdG9tIHRhcmJhbGxzIHN1Y2ggYXMgdGFyYmFsbHMgZnJvbSB2ZW5kb3IgWGVuIHRy
ZWVzLgo+Cj4gVG8gdGVzdCB0aGlzIGZlYXR1cmUsIHVzZSB0aGUgZm9sbG93aW5nIGNvbmZpZ3Mg
dG8gdGVzdCBsYXRlc3QgcmVsZWFzZSBvZiB0aGUKPiBYaWxpbnggWGVuIHZlbmRvciB0cmVlLgo+
Cj4gVG8gdGVzdDoKPiBCUjJfYWFyY2g2ND15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4g
QlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFM
X0JPT1RMSU5fQUFSQ0g2NF9HTElCQ19TVEFCTEU9eQo+IEJSMl9QQUNLQUdFX1hFTj15Cj4gQlIy
X1BBQ0tBR0VfWEVOX0NVU1RPTV9UQVJCQUxMPXkKPiBCUjJfUEFDS0FHRV9YRU5fQ1VTVE9NX1RB
UkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIsWGlsaW54LHhlbix4bG54LXJlYmFzZS12NC4y
MV8yMDI2LjEpL3hsbngtcmViYXNlLXY0LjIxXzIwMjYuMS50YXIuZ3oiCj4KPiBBZGQgdG8gcGFj
a2FnZS94ZW4veGVuLmhhc2g6Cj4gc2hhMjU2ICAwMzQ5OGY1MWI4ZGFhZTcwYzQyOWFjZTRiZGU2
ZTJiZTY3OWIzYTBhYzI4Yjg4NmM3MzM1YzAyMmZlZWY2MTAwICB4bG54LXJlYmFzZS12NC4yMV8y
MDI2LjEudGFyLmd6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJA
YW1kLmNvbT4KPiBUZXN0ZWQtYnk6IE1hdHRoZXcgV2ViZXIgPG1hdGhldy5sLndlYmVyM0Bib2Vp
bmcuY29tPgo+IFByaW9yIHRlc3QgZGV0YWlsczogaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vbWF0
dGhldy1sLXdlYmVyL2MxN2YxNGEzNzkzY2NlZTQ0MGEzODNlNDE3N2ZmM2RiCj4gUmV2aWV3ZWQt
Ynk6IEpvaG4gRXJuYmVyZyA8am9obi5lcm5iZXJnQGFjdGlhLnNlPgo+IC0tLQo+IFYxLT5WMjoK
PiAtIHJlYmFzZWQgdG8gdXBkYXRlZCBtYXN0ZXIgYnJhbmNoCj4gLSBhZGRlZCB0aGUgbGluZSBt
b3ZlIG9mIHRoZSBYRU5fU0lURSBkZWZpbml0aW9uCj4gVjItPlY0Ogo+IC0gbWVyZ2VkIGludG8g
bmV3IHBhdGNoIHNlcmllcyBhcyB0aGUgdGhpcmQgcGF0Y2gKPiBWNC0+VjU6Cj4gLSByZW1vdmVk
IHVubmVjZXNzYXJ5IEJSX05PX0NIRUNLX0hBU0hfRk9SCgoKUmFuIHRocm91Z2ggdGhlc2Ugc2Vx
dWVuY2VzICh0ZXN0IDMgY292ZXJlZCB0aGlzIHBhdGNoLCBtYWtlCnhlbi1zb3VyY2Ugd2l0aCBC
UjJfUEFDS0FHRV9YRU5fQ1VTVE9NX1RBUkJBTEwpCmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL21h
dHRoZXctbC13ZWJlci8yMzEwMTQ5MGE2ZTk1YThiMGY0NDVlMTRlYzIyZDlkNQoKVGVzdGVkLWJ5
OiBNYXR0IFdlYmVyIDxtYXR0QHRoZXdlYmVycy53cz4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
