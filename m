Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4377CC6B30
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 01:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CA0A606A5;
	Thu, 15 Oct 2026 01:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eS5cVS4dY2YH; Thu, 15 Oct 2026 01:52:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3199D607CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792029137;
	b=GsiYBONSTDISqS6LMg7Pf/HjjXKuwsjxj3ZHB6TBINhzbGCBvOEscKKSfCN4FoojG0y/
	 xb1ODg4kAibp+4RjPXC1GiPsfprzF1zraYK8U15vjMhLj1b4jjn8VlFT2SaxF5sezGx9j
	 P/miaQCFKBo0pRiAa2aCotzly76vOY4sKWRgHb8O5PjHY6/W05g2OPkWOw0giluHlnQGV
	 4T9JJIpudd2i0PmfwqDEL9yxPln70NG6vGIXwvErL0XKoBC3SXsJJbOOO7OxLkcuUn+cb
	 FNfzqN5koTJc3DL2D+I/BWo1uMp4LJeL4gJ0Fu6lZfPR+7fXhtq2SvS3JamJkXAMAZg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792029137;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=zyBOY6yfr0Pt6uJS7S+IpzbNkKbUBOjaFSy+rGzoaQM=;
	b=Ril6dkA7UHGx7VXGbXRkQlTt/ygxylkbhMqLDG/942YBWxV4wemLGjdJ6IWVwaTt6PaF
	 tsLxqns0n4ibrtmHFS7mh53TlgWPiJaCg+1kuiw2uhgmWeR4XJhYuQMd1VNa37wcqPilc
	 AucOUX5B/Gii6kLsQ2WiIXgJctrYQ5JvR79EF1qyAorXoqQC4EBFG1TiA6BJPhBSnQ2mp
	 GkECKNz92oe/KK7R1AdpMSet0iHtPAT6zymxYqFg/kgiMJE7pwBBDD2VY7BfTa9sLzzMP
	 hek/BZtmPYMIgY++7KE++d7sDua4bjSOycATY/mOwsapMT0Ar9ceL4xN9THgGqvJcCA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792029137;
	bh=zyBOY6yfr0Pt6uJS7S+IpzbNkKbUBOjaFSy+rGzoaQM=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lDuhLpJArEoylLc8knImxwoooIGfIbgiQryJgufYqdoCNbE1gsh3OWjfDqKrahA29
	 xdP7L1u+fZv4OoEFZ98gpzAtDTh7TxYJpwyRJ01158TUDP9o4Svl1fG0AGJ4zBCQlQ
	 Dd3slKLjYVmGhQDCAKyj3kgMLbkK1B0FG0EmZLQwmaB+jq9cc3ft9wMghWcBpSl97d
	 Itk2h3gpO/2mtbbBzlHXqv7uvOLmFBWm51q8ohDm5E8FcSBv9FqnpvRsT5pZaAyZuh
	 gcmbNh58DnhOOMOrkQCa5ssp+cPt4/fROA+uHCRl8wAtD/CsW4umqsD4wh5XVHaS/M
	 zz/fg7T4Fny3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3199D607CE;
	Thu, 15 Oct 2026 01:52:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEF92255
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 01:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4DC5407D0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 01:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gqcw3zzcDWoO for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 01:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9F123407CE
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::92f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792029134;
 b=NSke9MJBA5Pln8pR4cNAGhmBvjElsqm4Xy8OcquzMZyM84WErpFkEJl1UKhuFsJPKZHB
 HHwdkJtwNkehB007l3P3koLtDYmN6bvImS4Qs2wOrLz+wiQJi3akslUt1N4RKZ0AEZOD9
 Dag689kKiUugX6pf1+igwd6JIiNKM9wfissI1l5e/nahOZXDgreSjKLS1wmw21B8/2+Vf
 xkmRk68Rk9v9uXp4Gv9qfo9tfRbA9mGNITv5dwxkPdt9Yd8fMKvjvt+66UkC8XBaapZ3U
 owj3Rr4qUPfCusnhgCgFqh+xRjiM4q3QkCK4SdL6Xb0Ef3HG0jBUWcvDftr11rKopnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792029134;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=Eu1MQLcKZQjgtovCRTRhXv2VZIHhC6r1aS3TfxNGEN4=;
 b=P/QWGQS9Qi/UWttNLl6IQbGycPvMr3h31a91W2wFZ83QCxBnCy0e3NlF9CrfRVqRCdrz
 9rGl/j9YuAtZCjhjca7RwKp/jILUkBfAKTHRqpE0Ai5x2L4iNXw059OI5Ypo35+Ww2cRg
 C0WWjSRvZiZ8gWnmAu1L5Gdt5ln+yp9nb/YmbKFYeQQRRVyUw7Ndar9wEAbzqvTsXBs0T
 o/Bf7sPdLaACcdsaY3z9BE5ha04y31xMR5B1YakhLyEReapotCqv361Esvg7xwgiZngg/
 L6hCipa8gNdWyjR4ExGAhPP+QE32FpfGKLGvOxXGl9qpb+8/6qnW2PB8TMHSXZeN9tg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="raOajW9/"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::92f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92f; helo=mail-ua1-x92f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=raOajW9/
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F123407CE
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 01:52:14 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-9851592ada1so1358455241.0
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 18:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792029133; cv=none;
 d=google.com; s=arc-20260327;
 b=Yh1E4ELzViPGfDnahSnNGY7Hmby+A/qolAkKQalxfCZZaExYCeolRGSx8zCSproBpn
 H8ViE1zCB/HvarD/yAcpSixjpj+NX4dG4AH7jbqfCI02IMqM3rWn+BtVu0SirfjMqRXv
 8nWLS5FD1Gy7EV80WZd0FRRsGiRslqJwNGLgAPRxMx+G38USyvpqCRfgNZ0rYyPsQENg
 YP7zhvx8ebVHQJ2DcaJ1IG418+Oc0kR1nfipUEV3x1HL+h2DZ+4KTgn/oqhP3DPc8NPX
 7bY4HOYC+NfGUxi3Maf3yn60+JZZ++HcFGeByIC8DrPxF7i//hv6jRtrhTpcq3WyUbxI
 yUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Eu1MQLcKZQjgtovCRTRhXv2VZIHhC6r1aS3TfxNGEN4=;
 fh=xbOgN+LnOToYmtBzYOVUsFBlo9mXVTr3nMHfWsIwCLk=;
 b=sCAdtgQH5ncYKbchgsHYw3eKONHJGf1/gzxpsiqY+6ZyIcy0GuKY5dT4/Lw/hGPh6C
 AncE1Bbcb6upX0Dr5hkY30BHmcdo0+CymQnqP/bnMp/ZF3jxZ7cpn9Pk7AP2tfDnixNe
 9Fx4Gmfu1wY5G/oI2a605rPQi38zETgWdYWJn/OXyTDVm84+Rm4z1CDCNH7TMhBiOppC
 26H3lIJiis/LOMdGJc7pYWVXHyytC6AvHKlGbgju7iBbaCy8DFf7KgCQ3E4Wrt3vHmW7
 o5aRLejq8e7I85goY99SZ7E/ThXGNsunn71RgjSWltAt8PPX6B+NmTrxGPTzFhGoa7qj
 Vhrg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792029133; x=1792633933; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Eu1MQLcKZQjgtovCRTRhXv2VZIHhC6r1aS3TfxNGEN4=;
 b=raOajW9/RS+LyivmNUbQaz6NHfObqNWcRW4xv1WQiKInAWSlJO9xiyzokb3wcpueku
 1F8GkOd5a2j5z97yPPfSgeU1YdTmo3MrqWWRB1KdSZwxNC1BFWXu0g/zntpfm+K0++mA
 GzkjRjLDiaHvSVwLRWnHGe6l7vEvH5ZsrRmdwhndkTSFdQ17A0T0ahLj4XJ54OvH4g6S
 /tHTLbLzah7Nf3JXBbbCtkXtubDOU9cP+H/91AqDCBxlNzkvk1WRCH7f51thPIvmLNDN
 nh794D8WbGjKrtaS/AKP9SMw/eqHHHeXDWjKFWAaKSAbXxvMmXT9PJ5+SWdkiEXPNPCN
 LGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792029133; x=1792633933;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Eu1MQLcKZQjgtovCRTRhXv2VZIHhC6r1aS3TfxNGEN4=;
 b=WYo9eDlfFUr86iTzK65ZQkECDJ6CWhC/EPHoar8YICrm4OlT4kewOQP6xiGYA2ZdCY
 XYeQg5gglpJl3FlNaHyycuL8K7N9dNh1U5regS+TLq/9B2w5GGwJN0KuVCkQfbB3rKfe
 WJBrc3rOOdAfwYfzGf7Cs6njrK3sZDOy5+g3ZGUy/nA6Z3EPtG0xVN8QXESuDFfjKcPF
 ohlZHtKseeHKwn/QYSESDF6/WvKRzKTEHvmfndf6Swb1hRkoDJxOqWy63UblKi1HaB9v
 rZC0Jg5S4SHoO42H3j4JtM7J+Lm/Mqo1OjXR2yfChdi4WwJ/m8wcNKFyOywAO9tpNTZJ
 ToZw==
X-Gm-Message-State: AFq9FYLB7f4CORlrLy2bo2aVaCQajjlezgsyvwkvLwDUhHMusljr1uzB
 l5PmHGCQucoGV/EjHuRWn+6ARA+v+NAkHUx2vscM29wKGDil/n4BRFK9ayLTgq84Yxznq7XSRT/
 g6oiZQR/Nz8iHA6leLzSny5BjT6AmEh8=
X-Gm-Gg: AYBFou0/rKfbxSMnlro5MgGd5KmEmcPvFTXl76SS+bAFKOTKYpYQtEVYeq9ME4ZyXP+
 tf9oEUUVYLfoCVlIO2nY9RVbPEaTdzzxm3H/2nK94UVvCpM/LNWnIJQEDL+B4reTHNw9Mgv40KX
 nuy45rNkwPJI+fW5oq+O7pnIt9iOOX2M07/Fks8M/PCpoloQMr6W12wTUbVJs15MDRRo0Y2KIII
 CSZvwWtQlzCf8p+6MfhrSgcRwagBZ7ouBwTwgwE3Mi/gwDR9BGUzNIkeIGBuwGJ9LO7k/d6B5o6
 hw73MlXV1sEpkb1LJdMfNIjoK12vHFfWunUb4HHIzDQ/69SkGpvREhzbQhpUVtZM4JW7jCzNXiy
 vB1UDqmL8Zdbyw69946Iap5ugQ+cS30TznJltNInPXRHR/EJXCR516Cugw6Q4KKqGhqnptb8uIm
 nw2kdsXxHY1loiAxGMhbrIipVkXDJ9CKpglMRbwZ3JiYjvONEFWVlNFVI=
X-Received: by 2002:a05:6102:3714:b0:7a7:ce1f:6b95 with SMTP id
 ada2fe7eead31-7cb36985e42mr4812901137.2.1792029132710; Wed, 14 Oct 2026
 18:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261013232940.2690456-1-james.hilliard1@gmail.com>
 <20261013232940.2690456-9-james.hilliard1@gmail.com>
 <a84c070e-1798-41c2-9d7e-2d4748476629@gmx.de>
In-Reply-To: <a84c070e-1798-41c2-9d7e-2d4748476629@gmx.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:52:01 -0600
X-Gm-Features: AclHuK_KhfZOXyodVCt6Elr3xKJxyF3sHiBuMCQiiWIycZsspFfvLP46vedpx4c
Message-ID: <CADvTj4onDWn4MKsS2yAFY=mXupHa0g8dZAQWMBYFU67xNMkXqQ@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 9/9] boot/uboot: add
 host-python-pkg-resources dependency for binman
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgNDoyNeKAr0FNIEZpb25hIEtsdXRlIDxmaW9uYS5rbHV0
ZUBnbXguZGU+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiB0aGFuayB5b3UgZm9yIGxvb2tpbmcg
YXQgdGhpcyBwcm9ibGVtIQo+Cj4gQW0gMTQuMTAuMjYgdW0gMDE6Mjkgc2NocmllYiBKYW1lcyBI
aWxsaWFyZDoKPiA+IEJpbm1hbiBpbiBvbGRlciBVLUJvb3QgdmVyc2lvbnMgaW1wb3J0cyBwa2df
cmVzb3VyY2VzIHRvIGZpbmQgZW50cnkKPiA+IG1vZHVsZXMgYW5kIHJlYWQgdGhlIG1pc3Npbmct
YmxvYiBoZWxwIHRleHQuIFNldHVwdG9vbHMgODIgbm8gbG9uZ2VyCj4gPiBwcm92aWRlcyB0aGlz
IG1vZHVsZS4KPiA+Cj4gPiBEZXBlbmQgb24gdGhlIHN0YW5kYWxvbmUgaG9zdCBwYWNrYWdlIHdo
ZW4gQmlubWFuIGlzIGVuYWJsZWQsIHNvIG9sZGVyCj4gPiBVLUJvb3QgcmVsZWFzZXMgYW5kIHZl
bmRvciB0cmVlcyBjb250aW51ZSB0byB3b3JrIGFmdGVyIHNldHVwdG9vbHMgaXMKPiA+IHVwZGF0
ZWQuCj4KPiBJJ2QgcmF0aGVyIGhhdmUgdGhpcyBvcHRpb25hbCAobGlrZSB0aGUgZXhpc3RpbmcK
PiBCUjJfVEFSR0VUX1VCT09UX05FRURTXyogb3B0aW9ucywgdW5sZXNzIHlvdSBjYW4gZmluZCBh
IHNpbXBsZSB3YXkgdG8KPiBtYWtlIGl0IGNvbmRpdGlvbmFsIG9uIFUtQm9vdCB2ZXJzaW9uIDwg
MjAyNS4xMCkuIFN1cmUsIHdpdGggYSBjb25maWcKPiBvcHRpb24gZGVmY29uZmlncyB3aXRoIG9s
ZCBVLUJvb3Qgd291bGQgaGF2ZSB0byBiZSBmaXhlZCwgYnV0IG90aGVyd2lzZQo+IHJlY2VudCBV
LUJvb3QgdmVyc2lvbnMgaGF2ZSB0byBwdWxsIGluIHBrZ19yZXNvdXJjZXMgYW5kIGl0cwo+IGRl
cGVuZGVuY2llcyBldmVuIHRob3VnaCB0aGV5IGRvbid0IG5lZWQgaXQgKGlmIHVzaW5nIGJpbm1h
bikuCgpIbW0sIEknbSB0aGlua2luZyB0aGlzIHNob3VsZCBtYXliZSBqdXN0IGdvIHVuZGVyOgpC
UjJfVEFSR0VUX1VCT09UX05FRURTX1BZVEhPTjMKCkl0J3MgYSBob3N0IHRvb2wgYW55d2F5cyBz
byBwdWxsaW5nIGluIGEgZmV3IHVubmVjZXNzYXJ5IGRlcGVuZGVuY2llcwpwcm9iYWJseSBpc24n
dCBhIGJpZyBkZWFsLCBlc3BlY2lhbGx5IGZvciBweXRob24gcGFja2FnZSBkZXBlbmRlbmNpZXMK
bGlrZSB0aGlzIHdoaWNoIGFyZSByZWxhdGl2ZWx5IGxpZ2h0d2VpZ2h0LgoKPgo+IEJlc3QgcmVn
YXJkcywKPiBGaW9uYQo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICBib290L3Vib290L3Vib290Lm1rIHwg
MSArCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9ib290L3Vib290L3Vib290Lm1rIGIvYm9vdC91Ym9vdC91Ym9vdC5tawo+ID4gaW5kZXgg
OTZiOGNkMGQyZS4uMWY5OGYxYjI2OCAxMDA2NDQKPiA+IC0tLSBhL2Jvb3QvdWJvb3QvdWJvb3Qu
bWsKPiA+ICsrKyBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiA+IEBAIC0zMDQsNiArMzA0LDcgQEAg
aWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4pLHkpCj4gPiAgICMgaHR0cHM6Ly9z
b3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wNC90b29scy9idWlsZG1h
bi9yZXF1aXJlbWVudHMudHh0Cj4gPiAgIFVCT09UX0RFUEVOREVOQ0lFUyArPSBcCj4gPiAgICAg
ICBob3N0LXB5dGhvbi1qc29uc2NoZW1hIFwKPiA+ICsgICAgIGhvc3QtcHl0aG9uLXBrZy1yZXNv
dXJjZXMgXAo+ID4gICAgICAgaG9zdC1weXRob24tcHl5YW1sIFwKPiA+ICAgICAgIGhvc3QtcHl0
aG9uLXlhbWxsaW50Cj4gPiAgIFVCT09UX01BS0VfT1BUUyArPSBCSU5NQU5fSU5ESVJTPSQoQklO
QVJJRVNfRElSKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
