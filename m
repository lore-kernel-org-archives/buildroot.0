Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A76CC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 20:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED724225C;
	Wed,  7 Feb 2024 20:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhDCpl1rsZuN; Wed,  7 Feb 2024 20:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BB1C42269
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BB1C42269;
	Wed,  7 Feb 2024 20:15:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DD4F1BF599
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 20:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08D3A81ECA
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 20:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bKLLpwbiyUsI for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 20:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E550D81E8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E550D81E8B
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E550D81E8B
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 20:15:12 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-603fd31f5c2so2131647b3.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 12:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707336911; x=1707941711;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e0h8JGwTxIIbZt0k1sE28ebtTOnn4h76Dz2U8h8CVoM=;
 b=CQTDLbYvwvvm95MXivGwgE1ak9Q3rlj9MzIR5imoqfNYuUtmh1x0S/NPEMcaf58BzM
 AhAF9QWI71A7Kdn2NtTNcMQ1y0mHr9sqgzhNi8OAKh225PY/ngVNpO7V6gWA1ugDn7Bn
 Xq+ggmQrsL1J/GwOiV9QS7NnC6LAv8wFLpC08Ffvsq8Cb82gYpuAjeeYiPXESPZag777
 S16Z8oNLebJ0KUoHfcsX3gJrlg7vQ1n5hz+4h/REEM5y+XL7YgsnysF6+qXOZRxDgu5N
 QcGBUURpWBgIqWW1I04ANcvThcDh/Ju6l+cBLWIA5ckeZi9B82A39xXfpJp6fzfkj9fu
 9pkg==
X-Gm-Message-State: AOJu0Yxn2b2Fa6abUdZYtztarZVgyDcaZcfSXal4O5OKBuF1DCKgkh7p
 NRo1aGAbD6B21IfOguwOrVaNih6Fp+i7qfGBHECrBq/fMUr25OLl0IwSFOo1k0BW7MYr4TU31Zh
 gTW9fZhQbZnYBTm59lfAbAECa5olWmlB7EpOTxX61eprdPJLWhpi2Gg==
X-Google-Smtp-Source: AGHT+IHocQwCJQPDLrDrzb4XvRu07k1kVuuXnjpKtac/5+t2pDBmeuj02+w/s5x297Ku46REFniZkch9vpEPWS954cM=
X-Received: by 2002:a25:808b:0:b0:dc6:b1ab:b400 with SMTP id
 n11-20020a25808b000000b00dc6b1abb400mr425626ybk.18.1707336911397; Wed, 07 Feb
 2024 12:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20240207173911.3704142-1-dario.binacchi@amarulasolutions.com>
 <ZcPQv10uGwEEseaj@landeda>
In-Reply-To: <ZcPQv10uGwEEseaj@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 7 Feb 2024 21:15:00 +0100
Message-ID: <CABGWkvqnSWkCv5HgpyPwB28DOxMWY1iGJhUfUedJTC58df-5BA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1707336911; x=1707941711;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e0h8JGwTxIIbZt0k1sE28ebtTOnn4h76Dz2U8h8CVoM=;
 b=gHk+EFgLRbL2Vam9xTF2fx2ZXdHerVcfL3l112hD+MWPSw1h9RcXTU8bBhJl4+KYRg
 dBJeITwuVUEVJHllA6Bih+Tq5AwKN6ZSYVpRexZOpN/wXEQ0Q3eAItRiG7TfA05XsEwV
 iUSbup9e/2Jt/nj6V0bU9l+izdO3D1bHw224o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gHk+EFgL
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: drop README.md from
 license files
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFdlZCwgRmViIDcsIDIwMjQgYXQgNzo0OeKAr1BNIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IERhcnJpbywgQWxsLAo+Cj4gT24g
MjAyNC0wMi0wNyAxODozOSArMDEwMCwgRGFyaW8gQmluYWNjaGkgc3Bha2UgdGh1c2x5Ogo+ID4g
VGhlIHBhdGNoIGRyb3BzIHRoZSBmaWxlIFJFQURNRS5tZCBmcm9tIHRoZSBsaWNlbnNlIGZpbGVz
LiBJbmRlZWQsIHRoZQo+ID4gbGljZW5zaW5nIHRlcm1zIGFwcGx5IHRvIHRoaXJkLXBhcnR5IGxp
YnJhcmllcyB0aGF0IHV1dSBsaW5rcyB0bywgYW5kCj4gPiBldmVuIHRob3VnaCB0aGV5IGFyZSBi
dW5kbGVkIGluIHRoZSBzb3VyY2UgdHJlZSBvZiB1dXV8bWZndG9vbHMsIHRoZXkKPiA+IGFyZSBu
b3QgdXNlZCBieSBCdWlsZHJvb3QgYXMgd2UgdXNlIHRoZSBvbmVzIHdlIGJ1aWxkLiBUaGVyZWZv
cmUsIHRoZQo+ID4gYWN0dWFsIGxpY2Vuc2UgZmlsZSBvZiB0aGUgcGFja2FnZSBpcyB0aGUgZmls
ZSBMSUNFTlNFLgo+ID4KPiA+IE1vcmVvdmVyLCB0aGlzIGFsc28gbGVhZHMgdG8gc2ltcGxpZnlp
bmcgdGhlIGJ1bXAgdG8gbmV3IHZlcnNpb25zLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPgo+IEFwcGxp
ZWQgdG8gbWFzdGVyIGZyb20gQnJ1c3NlbHMgYWlycG9ydCwgdGhhbmtzLgoKVGhhbmsgeW91IHZl
cnkgbXVjaCwgYW5kIHBsZWFzZSByZW1lbWJlciB0byBwdXQgeW91ciBsYXB0b3AgaW4gYWlycGxh
bmUgbW9kZQphdCBsZWFzdCBkdXJpbmcgdGhlIGZsaWdodC4gOikKCkJlc3QgcmVnYXJkcywKRGFy
aW8KCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+IC0tLQo+ID4gIHBhY2thZ2Uv
dXV1L3V1dS5oYXNoIHwgMSAtCj4gPiAgcGFja2FnZS91dXUvdXV1Lm1rICAgfCAyICstCj4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS91dXUvdXV1Lmhhc2ggYi9wYWNrYWdlL3V1dS91dXUuaGFzaAo+
ID4gaW5kZXggYzIzMWQ1ZDcyOWYwLi5lNDVjYmI4NjgwNzggMTAwNjQ0Cj4gPiAtLS0gYS9wYWNr
YWdlL3V1dS91dXUuaGFzaAo+ID4gKysrIGIvcGFja2FnZS91dXUvdXV1Lmhhc2gKPiA+IEBAIC0x
LDQgKzEsMyBAQAo+ID4gICMgbG9jYWxseSBjb21wdXRlZAo+ID4gIHNoYTI1NiAgNmU2NWZjMDI4
YWZhY2M5NGI4MDVhZTM3NmUzZGEzODY0ZGNiMjU3MGQ0MjUwMzc4MjBlNzE2MjA3YWI3MDM3MyAg
dXV1X3NvdXJjZS11dXVfMS41LjE2NS50YXIuZ3oKPiA+ICBzaGEyNTYgIGNjOGQ0N2Y3YjkyNjBm
NjY2OWVjZDQxYzI0NTU0YzU1MmYxNzU4MWQ4MWVlOGZjNjAyYzZkMjNlZGI4YmY0OTUgIExJQ0VO
U0UKPiA+IC1zaGEyNTYgIDFiM2QwMzBhMTgyNGQ2MzNmNzUxOTQ3NDNiZDkyYmMxZWQyZDlhNGJm
MTkxNWJjMTFlNDliZjRjMGM1NDAxMmQgIFJFQURNRS5tZAo+ID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvdXV1L3V1dS5tayBiL3BhY2thZ2UvdXV1L3V1dS5tawo+ID4gaW5kZXggODBkNWUxOTM3YTk3
Li41ODAwMjc3YjEwZDUgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3V1dS91dXUubWsKPiA+ICsr
KyBiL3BhY2thZ2UvdXV1L3V1dS5tawo+ID4gQEAgLTgsNyArOCw3IEBAIFVVVV9WRVJTSU9OID0g
MS41LjE2NQo+ID4gIFVVVV9TT1VSQ0UgPSB1dXVfc291cmNlLXV1dV8kKFVVVV9WRVJTSU9OKS50
YXIuZ3oKPiA+ICBVVVVfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9OWFBtaWNyby9tZmd0b29s
cy9yZWxlYXNlcy9kb3dubG9hZC91dXVfJChVVVVfVkVSU0lPTikKPiA+ICBVVVVfTElDRU5TRSA9
IEJTRCAzLUNsYXVzZSAiTmV3IiBvciAiUmV2aXNlZCIgTGljZW5zZQo+ID4gLVVVVV9MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRSBSRUFETUUubWQKPiA+ICtVVVVfTElDRU5TRV9GSUxFUyA9IExJQ0VO
U0UKPiA+ICBIT1NUX1VVVV9ERVBFTkRFTkNJRVMgPSBcCj4gPiAgICAgICBob3N0LWJ6aXAyIFwK
PiA+ICAgICAgIGhvc3QtbGlidXNiIFwKPiA+IC0tCj4gPiAyLjQzLjAKPiA+Cj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cj4gLS0KPiAuLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBY
ICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5p
cy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJh
Y3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoK
U2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxh
IFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRv
LCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cu
YW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
