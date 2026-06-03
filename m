Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA96CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 04:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4A1E4220E;
	Wed,  3 Jun 2026 04:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rtThTYnNGaF; Wed,  3 Jun 2026 04:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEEB7420DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780459920;
	bh=qgvGS+SyX0Z0A4ie09wNc3BJzmnH5SrDR2CrKrNdsQg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YhuZ8w2eIFzGSud90GrakRhb3XJrEJgnYUt5MCf5GFh/Do6hsocQUn/vnDxfBb3w+
	 S8IcTWVattNbLqtU8ZDnxKpLWvHYGJFDudTVY8gteGfP92WOHKp/Kkpr49hAtfoTuj
	 y3T7RwnFyckF/j0RNT52Kvq1RszgB/BpcnxJvRDOhkz9Rla/YhNRU0R0EDdF3uoKTk
	 Xk/uEGo1pIHQcThIXcsQlcSLTWe+gZ0hELqBeBD79moG1y6ykCdkTwpF3MiICcpfZQ
	 foVpRE5+/eYLRJK+mIOy9OCc/B7O31BAbIHh3tTZWNhrNrfx+t4xQCaVZ/aUKr0pQI
	 iAMN2mHwujgMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEEB7420DF;
	Wed,  3 Jun 2026 04:11:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCE0F259
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 04:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE552420DF
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 04:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQGgXCMYk3Tb for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 04:11:57 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::122c; helo=mail-dl1-x122c.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45EC8406A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45EC8406A7
Received: from mail-dl1-x122c.google.com (mail-dl1-x122c.google.com
 [IPv6:2607:f8b0:4864:20::122c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45EC8406A7
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 04:11:55 +0000 (UTC)
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-137dd523634so5189068c88.1
 for <buildroot@buildroot.org>; Tue, 02 Jun 2026 21:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780459915; cv=none;
 d=google.com; s=arc-20240605;
 b=N9IyMeJXqmo6QoVye0JgbcOCNYcS5ZgCyia54b1OIzf3Lz9lYT4i1h9FO/H7wSdZKR
 WYIPXO16Qzl5eqC0NxRQb7nL/Nl/nZmR5YUGSYKiBK8d1UKmGmeniuiLrj9PIUw2UGiP
 T50v1OxiJ5jv0KwAR6RMUesHk+sA/Pt0t1Cdm+vT+JF9/geCJiH2PSdOsLf4rV6Fb8sw
 IV992YtUZsidHMqVdCUP8KtB1ptYqo+FHNBOkX5FhH/R79H0xoy9QOyOcKw4BmEyBobA
 RTiPe88/xrFYLA2IbMOomv31DRXHOWj6gclbIqCrQ6e91enp4uBLFnEnErMVXZrmDmsQ
 EI4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DlQthouT5dgF5Z7p9nVH6n2jn8R6BuMkJLcsXpScJYU=;
 fh=mdlkzoGL+GM/52YFG00yx+1Q6D+8+463ltl64PeVY0M=;
 b=UGZGlE7EeZac7J12qkYJ3Stb75ScGYqC9MTIclaFHfTyvJqFn8NO1LeUCgVHe32Vr5
 L0f2/hZEZaAKlrnWoPY3jkL690wHkzCD2QtHgARxLmul6JevNAFLyVfHwY5DYh5wd9Z7
 UBkJdpMdpXrfGcFUm3r6qUFaNqtnuKzilFyfTrpE6ghuZaF592X+1v6M4pRDPGZk6GU1
 4UKGyCKeHCVlvKrRMbzL86GhrJGwhx5eq/YNGAG9i7sPNPk31U+wXL8CqK5LNAPM0TFm
 Fm4KWvq7E5Fa+26Kp4QhGSPmET4dGpuO4IDEJe73LW3AMzORtvyAECrnC5RD56YaXlGE
 DMXA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780459915; x=1781064715;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DlQthouT5dgF5Z7p9nVH6n2jn8R6BuMkJLcsXpScJYU=;
 b=dg5kMjIVLE6LZZhQEqOvKU/PsJDKcqhwVz9QzsaD/3EQ7EFRZbW0/RmAnMcR8aVzta
 WuYMZdFUsMKW1CIBXFYr7EE64Mx7nl2pXGQPVhF0znrE84e0TapaHVoG6EoZhpRXY2LW
 4RAg8qhWW+MvYlE8HBiEFf35czxJh+eA66VwfKMv97Ucj+FVy5rxJtlpKq+IMtyuSZXC
 nYwHSkxjf3IigPuWcd6q7icmlljgdAfS+VF6kYXV1uRj1oNUWNjHtuIvRh0yHtBG/FEk
 FTiL2FivjAJX1uPGIL8CHe1RqA8tDn+ch913qjqXVG04eEc6boPBkzsyNqdH7+3yIe5G
 pYGg==
X-Gm-Message-State: AOJu0Yz7/BJOpDW5+x3tbFJ97qcxn/Xx04sQZN1oK3NbPWqCRm3dnR3+
 JXT7CQ9ZTxNE2D2ncfkmVDNKMjLHm+BZQyQ+FAAlg2aLVVvgQfLXYyigVXauyxqe7NR52fiKDA/
 NomlYz/frSAS3Eju+pxK7S3Suw0HkVzHTjzSfthMXyl45CK/mZGhKpczJqQ==
X-Gm-Gg: Acq92OGZ7l8+SPmGWRYPVN1o9NsxwPxJJbVOHYkNVzzOiRds5t1hkYScqrgtK+WVoou
 jh24azoLVQTmv/ATECeqYAozHBwrzJNwaYHZ+iXgy/+N3h9doQR+/oIznn2MW0biLK+DkAyTftP
 3zaYFnysG/xtGaGraMhSZcJyZhW9PoA0IgqUkRzPwg5L64+k1cQyH2w4TjdC4HrtLLBZ/eFAYbU
 Ozf+qmQhQ2viwWPskQiw2GHW121s/B0HLMWeLQ8rDV8QTae4vsv2MHe4Pjw+GCEDVv0qwoS25+j
 CZjVSLeHGaginzvWvQ==
X-Received: by 2002:a05:7022:686:b0:137:ea00:3f49 with SMTP id
 a92af1059eb24-137f6bd8729mr626148c88.35.1780459915030; Tue, 02 Jun 2026
 21:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260601204735.888967-1-j@j-ernberg.se>
 <20260601204735.888967-8-j@j-ernberg.se>
 <8b817f4c-b876-412a-84d0-0226b11b7282@smile.fr>
In-Reply-To: <8b817f4c-b876-412a-84d0-0226b11b7282@smile.fr>
From: John Ernberg <j@j-ernberg.se>
Date: Wed, 3 Jun 2026 06:11:44 +0200
X-Gm-Features: AVHnY4ImF5sdTM39T_vSdqHjcHkdXZIbDpTYBDmjrw85KLQOwREpmWvArGW45n0
Message-ID: <CAAHg4Zi+E5hZcWcbG0tLQpe0iPDmLAJqMz1Z1Q6hWbyQM-bpOw@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, John Ernberg <john.ernberg@actia.se>, 
 Carlo Caione <carlo.caione@gmail.com>, Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780459915; x=1781064715;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DlQthouT5dgF5Z7p9nVH6n2jn8R6BuMkJLcsXpScJYU=;
 b=cyDAxZ7DfTZJJjrwgk17HOCmo58Tzkkqjb6eEudfHJilezttUJS7v8TuVJvOuxuHSO
 TUFQ3WZ0Hli3BLflv6lelZH5wdSoJdxdBcXe/gffe0JueXyTGZyqM0MEqucwKV08Yxo0
 P962a+SLIfNFdBeMLBHFNrAnrQ+I1EPyl9XfaAzgQnBwQ1FaT6XPvixhxe4berv23Nh6
 5dksA4/IhXfS+mnTA343X5SVS7jBiSwr82Rn37CfD2oSvPkQY/TjlymmJo3pIOEdWC/M
 TU+A7UJTOTr11Ganbj/skCt/Fv1/4RdMy2I31ZbPvbWwZyFvDAgk6eUuI0jlbL2p6tHP
 Xe2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=cyDAxZ7D
Subject: Re: [Buildroot] [RFC PATCH 7/9] package/jailhouse: Drop the package
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

SGkgUm9tYWluLAoKT24gVHVlLCBKdW4gMiwgMjAyNiBhdCAxMDo0MuKAr1BNIFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIEpvaG4sIEFsbCwKPgo+
IExlIDAxLzA2LzIwMjYgw6AgMjI6NDcsIEpvaG4gRXJuYmVyZyBhIMOpY3JpdCA6Cj4gPiBVcHN0
cmVhbSBoYXMgbm90IHNlZW4gYW55IGFjdGl2aXR5IHNpbmNlIDIwMjIgWzFdLCBzYW1lIGZvciB0
aGUgbWFpbGluZwo+ID4gbGlzdC4KPiA+Cj4gPiBJdCBkb2VzIG5vdCBjb21waWxlIHdpdGggbW9k
ZXJuIGtlcm5lbHMuIFRoZXJlIGhhcyBiZWVuIG5vIGNvbXBsYWludHMgb3IKPiA+IGZpeGVzIGZy
b20gdXNlcnMgeWV0IGFib3V0IHRoaXMgd2l0aCBtb2Rlcm4ga2VybmVscy4KPgo+IE5vdCBvbmx5
IHdpdGggbW9kZXJuIGtlcm5lbHMgYnV0IGFsc28gd2l0aCBsYXRlc3QgZ2NjIHJlbGVhc2UgdXNp
bmcgYzIzLiBTaW5jZQo+IHRoZSBidWlsZCBzeXN0ZW0gZG9lc24ndCBzcGVjaWZ5IGFueSB2ZXJz
aW9ucyBvZiB0aGUgQyBzdGFuZGFyZCwgaXQgZG9lc24ndAo+IGJ1aWxkIHdpdGggZ2NjIDE1Lgo+
Cj4gVGhlIGphaWxob3VzZSBydW50aW1lIHRlc3QgZG9lc24ndCBidWlsZCBzaW5jZSB0aGUgbGVz
dCBBUk0gYWFyY2g2NCB0b29sY2hhaW4KPiB2ZXJzaW9uIGJ1bXA6Cj4KPiAgIGh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTQ2MjI4NDM0NjMKPgo+IERv
IHlvdSBoYXZlIGFueSBpbmZvcm1hdGlvbiBzYXlpbmcgdGhhdCB0aGUgcHJvamVjdCBpcyBubyBs
b25nZXIgbWFpbnRhaW5lZD8KPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KCk5vIGV4cGxpY2l0
IHN0YXRlbWVudHMsIGp1c3QgY2lyY3Vtc3RhbnRpYWwgY2x1ZXMgc3VjaCBhcyB0aGVpcgptYWls
aW5nIGxpc3QgaXMgY29tcGxldGVseSBmaWxsZWQgd2l0aCBzcGFtIGFuZCB0aGUgZmV3IG5vbi1z
cGFtCmUtbWFpbHMgYXJlIG5vdCBnZXR0aW5nIGFueSByZXNwb25zZXMgZnJvbSBTaWVtZW5zIG9y
IGFueW9uZSBlbHNlIHdobwpjYW4gY29tbWl0IHRvIHRoZSByZXBvLgoKaHR0cHM6Ly9tYWlsLWFy
Y2hpdmUuY29tL2phaWxob3VzZS1kZXZAZ29vZ2xlZ3JvdXBzLmNvbS8KClRoZSBmZXcgcGF0Y2hl
cyBwb3N0ZWQgdGhlcmUgaW4gMjAyNCBoYXZlIG5vdCBiZWVuIHBpY2tlZCB1cCBub3IKcmVjZWl2
ZWQgYW55IGZlZWRiYWNrLgpQYXRjaGVzIHRvdWNoaW5nIHRoZSBqYWlsaG91c2UgYm9vdHN0cmFw
cGluZyAoYWxzbyBzZW50IHRvIHRoZSBhYm92ZQpsaXN0KSBpbiB0aGUga2VybmVsIGFyZSBhbHNv
IG5vdCBnZXR0aW5nIGFueSByZXZpZXdzIG5vciBhY2tzIGZyb20gdGhlCm1haW50YWluZXIgaW4g
dGhlIGtlcm5lbCBNQUlOVEFJTkVSUyBmaWxlLgoKVGhlcmUgaXMgb25lIHBhdGNoIGluIDIwMjQg
dG8gcmVtb3ZlIHRoZSBJUkMgY2hhbm5lbCBmcm9tIHRoZSByZWFkbWUKYmVjYXVzZSBpdCBpcyBu
byBsb25nZXIgdXNlZCB3aG9jaCBnb3QgYW4gYWNrIGZyb20gYSBjb250cmlidXRvciwgYnV0Cndh
c24ndCBwaWNrZWQgdXAuCgpodHRwczovL21haWwtYXJjaGl2ZS5jb20vamFpbGhvdXNlLWRldkBn
b29nbGVncm91cHMuY29tL21zZzExNTk3Lmh0bWwKCkFuZCB0aGF0IHRoZWlyIGdpdGh1YiBoYXMg
c2VlbiAwIGFjdGl2aXR5IHNpbmNlIEphbiAyMDIzIChhbmQgbm93IEkKc2VlIEkgaGF2ZSBhIHR5
cG8gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLi4uKS4KaHR0cHM6Ly9naXRodWIuY29tL3NpZW1lbnMv
amFpbGhvdXNlL2NvbW1pdHMvbWFzdGVyLwoKQmVzdCByZWdhcmRzIC8vIEpvaG4gRXJuYmVyZwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
