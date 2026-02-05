Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10661EA794D
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 00:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B31E40CCD;
	Thu,  5 Feb 2026 00:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YKvpHuhyN22; Thu,  5 Feb 2026 00:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5C6440793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770252707;
	bh=0rZFJK0wAYP/HoBIM6RhCgyZjaXq4JXh/SSKUDlW95w=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p5wXYZn3v/Rme/6n6dMGst8GDdYu9MVJDlyd2Y6u9an7d83nMhu40vgTzM+zdG1wK
	 Ii307ji8UhypPhWTL0zSs8pB03+3zbuhQ/uEHZsEk0dYUs2L5sN8CVRVw4TV59cVzy
	 oUIHLQ7sa61P/bH7gOhmFOtDGWzUxK8WtH0nun5RXefyr66MMFhnnKu6gRWL84bM0F
	 OSkFDsXlSwLEeCXuwGekWDU7DKruJMMo2GhCcYXycBAEZHf/FzPDEyqtqvhQ9PjCKk
	 Pr5X/PwF3lYJ4yAkmSlmfINRK+fU5WTItafdykzH2OSOh9pgawSSLIvjhs2lNq3S8M
	 KKeF3tkPejvtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5C6440793;
	Thu,  5 Feb 2026 00:51:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0652617A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 00:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4BDE810F6
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 00:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIJPiEqdRLjk for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 00:51:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2BF6B81111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BF6B81111
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BF6B81111
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 00:51:43 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-5eeff7e8bb3so322903137.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 16:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770252703; cv=none;
 d=google.com; s=arc-20240605;
 b=ePbQrMAyJ7VsosufU60TUwmfh6XxZfGfvzcv6cRbCbubS8DvNJEbSFSDZzFRVUmHXN
 HR51U7XKqH+scX+YruIoP5I1aO5LhdDd2qyrWHnxKT4F+fyPAOgIwFiORN+ilVH8mjyl
 UyYu4yhNa51dxNfjSAHVHb5BwyG/frymvLberiMvh7VeCIZtpp3Pwmen2ASDT2E9NQG5
 g10Ji6BwbqA75sspUHEEkOj4SAkjq9Y2wjbk+UjIRGEBaaSU+L2a/tTfzqeN80fulJ2+
 7tH8KjhPNEfLkNgmvTchHkI/1m0RYyvb9WOoLgiHjb0N/r3oALzAAJb/Xr3mW+7tM78C
 57oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TozjOxSG9I6ZVXGITZZ3oKps4pSUED7sIUnuya/YZmI=;
 fh=2ovs4QjYm6YHdSNMwP/XH813cu2PushBJwKyK8+z0GQ=;
 b=Nx9KXsqUSGNmezlKsJEGS+ns0Iyjv57xMhFO3mOwgAeQTkZsusKVar2o5tnccXMxkx
 KJ+LpKJRkUSJ3UuM/falLvs65ASaOHjjPt5QvOZFb/ptngR4g4pwK0Y7FTL+mjdRMXE5
 HzYcQ3oJRV8Awf9I0JzsWIanvFz3d6b8Vh0hqKDsjg278+DEoU27Sy6o5ZRvu1nQyvXR
 tQ688FxyBXtsB3Re1y3dJHYluXkLpijNqcmcL5l/oKUQDYraiP0SYkVV0LZuODRY/jDb
 NJKHyeL2X9/T+d/9GHLd3fYE7pCAwoFN4d1BYWCqZSl5nZw/sCK4PMhcXgqLJViWIkPD
 yH9Q==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770252703; x=1770857503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TozjOxSG9I6ZVXGITZZ3oKps4pSUED7sIUnuya/YZmI=;
 b=Z4+ClU1p9V15bVK6fKaCuCfGLVnES3AGyzVaTPek6KoX+yIZ6n1vhth9EB2hYVzDtI
 hyqYqLl9czEAJBIvgderWaIgFw5uSXrI7FkaB094gvN7ZWpyxNjpuxHcepm26yotTcNW
 4O5NlNeiM5qz1+5d+IBakhfRE54VazJHOSRmumZ1APxJK9EMKL8zG/pNQuBWgEKh3f7m
 xHNrzRBN+jf8ZpP1UCSv6v8I36/flWo1hArLZaKQU6THQcnJ1/9d7DvHxtRAkP+AZPBS
 vh5spmhwsVPJpatW+7n0Te7lrb5jiDYbu77MWM7IPNuWsnyv/TP7SFNTg16tIFXwpvjB
 6M4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2oNUHVUCW+5+XbaljRVzIL2QUmxk5C4gksNR30u//WI7Vsd1MsSfMSrS8jJwGaXRSQkNJ2+Fe4TI=@buildroot.org
X-Gm-Message-State: AOJu0YwDUli2PGCarts5LFkBhO1fvDL/xefq8Gmuh4wLvJ91FIcqLWwH
 CG02aVGWrHn/Bj8rlAoeMqwZdPIE3XSZZiBIrBIbaV36S1S7cxmtgC2p7DwRE800U3ozMRdCVTP
 a5p+f7o7245046d8Gsa11nsTVKU2HBR4=
X-Gm-Gg: AZuq6aK2GkzsUCRExpr0JVSncA+hyB275lZKD3BLxSFo4zR/gVZZohNVdMDjqwlYul+
 ntNyX+rs5HGl/2KVJh5xZlAalmtLbLx7TJbplPKxAXxCpvayEZBb60OVkdh6sJsC8FlePBmRCM2
 bDCOa1ZHN0lF4bU62wzHlOzIkscQ4uiORqQLDE4rluOemzQElNM10O41MwfxiEiSuDqsFAV+GWt
 NcSUpQ9MX4qbaPDiRk4ogExjMrUfAsHrMEGffQrdKy9YP/jwDruy5wIgMYa8wU265xlJB+yLVil
 r0vTJMS4vjkzRjLavIuKYkIivt7Z2+xgWxnjuVmbesQG5og2XjzGr+Xtuw==
X-Received: by 2002:a05:6102:6d4:b0:5f1:7aad:a8ef with SMTP id
 ada2fe7eead31-5f93959d99cmr1538766137.25.1770252702740; Wed, 04 Feb 2026
 16:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20251228213710.2591716-1-james.hilliard1@gmail.com>
 <20251228213710.2591716-2-james.hilliard1@gmail.com>
 <CA+h8R2rJFvtnP4DD7qwGx0smh7sgkDeptMUibqhJgSUuUO3Lyw@mail.gmail.com>
 <c8defb4d-4f5f-4bdf-8ff9-4adad5891fcd@mind.be>
 <CADvTj4rGb6KO0BUFyss9TRy9Ctk7oLdJ1PJLg-F3Y59e73XYbA@mail.gmail.com>
 <CA+h8R2oQ71c5rtXO-GB+Bbr2QAyYNczJhZVxAxY0OgXs0zkEUg@mail.gmail.com>
 <CADvTj4p7Y8MWHkRTpBek+ji_PCo0ujknOJA7Y3xeUk7_N+Uuig@mail.gmail.com>
 <CA+h8R2prYxrG7JoDgg8gVwZFLPxNq-wO7yFOH1Np3M8fQ_aWTw@mail.gmail.com>
In-Reply-To: <CA+h8R2prYxrG7JoDgg8gVwZFLPxNq-wO7yFOH1Np3M8fQ_aWTw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 4 Feb 2026 17:51:30 -0700
X-Gm-Features: AZwV_QhWO2kbi76R5dG8whivJVK9jUfiwtNvnkcN70FPhY_JbDMGys83vsqvoes
Message-ID: <CADvTj4pERPjd1AshpVeQc-HAcbc+vnJqjmrb8wf_E+A59Fv6JQ@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770252703; x=1770857503; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TozjOxSG9I6ZVXGITZZ3oKps4pSUED7sIUnuya/YZmI=;
 b=H58AS4FmvjTZqidrCcTbjmHRjt8oBkhZX2hBfKgkXHPvyWYHyBgrgUsFi0pLo5PCFY
 6Ls6teCHm3YK/21L78ITCfU2KZEFtQUkW2ih5p8WVzvketdnRqNxIcqFfYth15cRYlZi
 A9cQzJ7jJ4eS5mLDx03w4Ih83ZUQjE8x6qjRUCz5c83PAt66RC4mH8oBfxAcqiUNSY4h
 bhm/a98OCVUkZenOCEj6e5t/QM04bQPCZLBS0LldAPHrU7AYCenJiaQ60gRnFHegSNN8
 ZlWvvOL83O8zaO/rkyy1MecLBY0xW0lbci7L8xxfyiVvfqtlIJD3cjbEa9wtt0RPD716
 Jjyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H58AS4Fm
Subject: Re: [Buildroot] [PATCH v6 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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

T24gV2VkLCBGZWIgNCwgMjAyNiBhdCA1OjQ14oCvUE0gQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlz
dGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IE9uIFdlZCwgRmViIDQs
IDIwMjYgYXQgNDo0MOKAr1BNIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPiB3cm90ZToKPiA+IEkgdGhpbmsgdGFpbHNjYWxlIGhhcyBzb21lIGtub3duIHZ1bG5lcmFi
aWxpdGllcywgdW5zdXJlIGlmIGFueSBhcmUKPiA+IGluIHByYWN0aWNlIGV4cGxvaXRhYmxlLgo+
ID4KPiA+IEkgaGF2ZW4ndCByZWFsbHkgYm90aGVyZWQgd2l0aCByZXBvcnRpbmcgR09QUk9YWT1k
aXJlY3QgaXNzdWVzCj4gPiB1cHN0cmVhbSByZWNlbnRseSBhcyBpdCdzIHN1Y2ggYW4gdW5jb21t
b24gaXNzdWUgZm9yIGFueW9uZSB0bwo+ID4gZW5jb3VudGVyIGFuZCBJIGZlZWwgaXQncyBtb3N0
bHkganVzdCBnZW5lcmF0aW5nIHVud2FudGVkIG5vaXNlIGZvcgo+ID4gdXBzdHJlYW0gcHJvamVj
dHMuCj4KPiBUYWlsc2NhbGUgcHJvbXB0bHkgZml4ZWQgdGhlIGlzc3VlIGxhc3QgdGltZSByZXBv
cnRlZCBpdCBzbyBpdCdzCj4gaGFyZGx5IHVud2FudGVkIG5vaXNlLgoKWWVhaCwgbWF5YmUuCgo+
IFdlIGNvdWxkIHdyaXRlIGEgc2NyaXB0IHRoYXQgZGV0ZWN0cyB0aGlzIGlzc3VlIGFuZCBnZW5l
cmF0ZXMgYSAubWQKPiBmaWxlIHdpdGggaXNzdWVzIHRvIGZpbGUuCgpJIHRoaW5rIHRoZSBiZXN0
IHdheSB0byBwdXNoIHByb2plY3RzIHRvd2FyZHMgcHJldmVudGluZyBhbnkKR09QUk9YWT1kaXJl
Y3QgYnJlYWthZ2Ugd291bGQgYmUgdG8gd3JpdGUgYSBnaXRodWIgYWN0aW9uIHNvCnRoYXQgcHJv
amVjdHMgd2hpY2ggY2FyZSBhYm91dCBHT1BST1hZPWRpcmVjdCBzdXBwb3J0IGNhbiBnZXQKaW1t
ZWRpYXRlIGZlZWRiYWNrIG9uIHdoZXRoZXIgb3Igbm90IGEgZGVwZW5kZW5jeSBpcyBicm9rZW4K
b3Igbm90IHdpdGggR09QUk9YWT1kaXJlY3QoYW5kIHByb2JhYmx5IGFsc28gaGF2ZSBpdCB2YWxp
ZGF0ZQp0aGUgZGVmYXVsdCBHT1BST1hZIGNvbmZpZ3VyYXRpb24gYXMgd2VsbCB0byBlbnN1cmUg
dGhhdCBpdApkb2Vzbid0IHJlZ3Jlc3MgZWl0aGVyKS4KCj4gSSB3b3VsZCBoYXBwaWx5IGZpbGUg
dGhlIGlzc3VlcyBmcm9tIG15IEdpdEh1YiBhY2NvdW50IGlmIG5lZWRlZC4KPgo+IFRoYW5rcywK
PiBDaHJpc3RpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
