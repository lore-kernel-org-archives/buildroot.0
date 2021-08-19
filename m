Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B035EC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:32:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB636109E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DB636109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54AF84020E;
	Thu, 19 Aug 2021 21:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMbpE2LNM--z; Thu, 19 Aug 2021 21:32:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC66D40248;
	Thu, 19 Aug 2021 21:32:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE5551BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D23D60775
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MECjDOkAD4JD for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:31:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9C6260607
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:31:48 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f2so13827378ljn.1
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 14:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ALL4Yz+JsJ09bbwQMCJPfR3NoWyt2W82m87BuomtJKY=;
 b=uIHjMwpkzzrTP+hI3O0FuWh/50rAB4E75GPM+OadVZyksc2X6kH+L9IRb+86rqGKHI
 Zr+KfbPYqeoA6xiknSBx+NTsS58BVDQK+3om0/UBJ237hjrMSG6oNuqTy03INiH2HaF4
 /TbMjf41pSo4wG42FEItJ/R5bydXdaN0LyGNVfFWQGO5QuhpiW2btJNfgPRLAuzoCNtu
 K6L6Azxr0w2nJVpoLOpaj0ucfO/oPB373gR+D3uttZtY6tFbo/Jmdvfz4UJgW1Bqwspk
 23WCbjY747NPOUJJTWa2Zw8M5dUbCZccdEtvNgmKTniZD/y0ksVa5xD7HJRHJ72W21Zt
 GXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ALL4Yz+JsJ09bbwQMCJPfR3NoWyt2W82m87BuomtJKY=;
 b=tRuXSLtGMe86MWUSnSrWEA6bLhRkOdo63KjKs0SjNhaHqDVkCPWEfhY2Mlb0E7lU24
 ZRVMgtQfjlTQ14HjLXlApkmTYtnlxRBVdfBPxeO8DAECKbCEDIerljRfloDqGDFVr+Y8
 I9cPmI3K3lkTq6o89MsDNJyume9+cPK3bWE+fcXmZKyHrZ4Z2EJAxXESXQEPw0gB5gCO
 1MtpNJQXFl6NwmTL1ii0YbOnebsES/m8dKlFOeUuXAjKoDEhWii605UxfuXupudE+7VH
 6FnIEJghVKI+6qcvLYiM0zivADBIQ2JD2eqD+tYO/sMIerx/fgs8Yix9UDmXnKeY4dTd
 cK7Q==
X-Gm-Message-State: AOAM533uN+EoE1DNsegrICwxI6wIPszh1oB9x4ZbCEb9S0wHKKbWPKg8
 NeXFoY13Zpt+TbxD03FuDNLFlsD5xPViV67KWZ0=
X-Google-Smtp-Source: ABdhPJycX2Dx9hkzByPn9yHtMcgfKs24GFzuOPBmM/xlMLSXUgJaMSIVN0dNq3uHkIyR+8UppivXy0ZJhQqbncToqXw=
X-Received: by 2002:a2e:a78c:: with SMTP id c12mr13382769ljf.319.1629408706803; 
 Thu, 19 Aug 2021 14:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210819160351.1045591-1-fontaine.fabrice@gmail.com>
 <20210819204326.GD27036@scaer>
In-Reply-To: <20210819204326.GD27036@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 19 Aug 2021 23:31:35 +0200
Message-ID: <CAPi7W838Rd84Gor1+eRAZYq66KQ4q73JieLKX0QfAWKiWoCG4w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/mpv: fix build of vaapi with
 egl-drm
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

WWFubiwKCkxlIGpldS4gMTkgYW/Du3QgMjAyMSDDoCAyMjo0MywgWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IEZhYnJpY2UsIEFsbCwKPgo+IE9u
IDIwMjEtMDgtMTkgMTg6MDMgKzAyMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+
ID4gQnVpbGQgb2YgdmFhcGkgd2l0aCBlZ2wtZHJtIGlzIGJyb2tlbiBzaW5jZSBjb21taXQKPiA+
IDZlYzQ3YzRlNTljN2M4YzU3ZTk3MmRhYjk4NWM4YTJiYTBiZjcxNzQgYmVjYXVzZSBlZ2wtZHJt
IGlzIGEgcGFydCBvZiBnbAo+ID4gZ3JvdXAgd2hpY2ggaXMgb25seSBlbmFibGVkIGlmIEJSMl9Q
QUNLQUdFX0hBU19MSUJHTCBvcgo+ID4gQlIyX1BBQ0tBR0VfSEFTX0xJQkdMRVMgYXJlIHNldDoK
PiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9tcHYtcGxheWVyL21wdi9ibG9iL2VjMDAwNmJmYTFhYWY2
MDhhNzE0MTkyOWYyODcxYzg5YWM3YTE1ZDYvd3NjcmlwdCNMNTcyCj4gPgo+ID4gRml4ZXM6Cj4g
PiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lNWMxNTIyOGY0MmE3
M2Y4YzM0YjI2NjMwYjIwNzRjMzBlNWY1OTY2Cj4KPiBUaGlzIGlzc3VlIGlzIGFib3V0IG1pc3Np
bmcgWDExLCBzbyBJIGFtIG5vdCBzdXJlIEkgc2VlIHRoZSByZWxhdGlvbgo+IHdpdGggdGhpcyBj
aGFuZ2UuLi4KVGhpcyBpc3N1ZSBpcyBub3QgYWJvdXQgbWlzc2luZyBYMTEgZGVzcGl0ZSB3aGF0
IGlzIGJlaW5nIGRpc3BsYXllZCBpbgp0aGUgbG9nIG1lc3NhZ2UuCnZhYXBpIGhhcyB0aGUgZm9s
bG93aW5nIGRlcGVuZGVuY2llcyBhcyB3cml0dGVuIGluCmh0dHBzOi8vZ2l0aHViLmNvbS9tcHYt
cGxheWVyL21wdi9ibG9iL2VjMDAwNmJmYTFhYWY2MDhhNzE0MTkyOWYyODcxYzg5YWM3YTE1ZDYv
d3NjcmlwdCNMNjMyOgonZGVwcyc6ICdsaWJkbCAmJiAoeDExIHx8IHdheWxhbmQgfHwgZWdsLWRy
bSknLAoKSW4gdGhlIGF1dG9idWlsZGVyIGZhaWx1cmUsIHdlIHRyeSB0byBlbmFibGUgdmFhcGkg
YmVjYXVzZQpCUjJfUEFDS0FHRV9NUFZfU1VQUE9SVFNfVkFBUEkgaXMgc2V0IHRvIHRydWUgYmVj
YXVzZQpCUjJfUEFDS0FHRV9MSUJEUk0gYW5kIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRUdM
IGFyZSBhbHNvIHNldCB0bwp0cnVlLgpIb3dldmVyLCBhcyB3cml0dGVuIGluIG15IGNvbW1pdCBt
ZXNzYWdlLCB0aGlzIGZhaWxzIGJlY2F1c2Ugd2UgYWxzbyBkaXNhYmxlIGdsLgo+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gIHBhY2thZ2UvbXB2L21wdi5tayB8IDMgKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL21wdi9tcHYu
bWsgYi9wYWNrYWdlL21wdi9tcHYubWsKPiA+IGluZGV4IDkxZTMxZGQxNTAuLmY4ZWNhZWI3OGEg
MTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL21wdi9tcHYubWsKPiA+ICsrKyBiL3BhY2thZ2UvbXB2
L21wdi5tawo+ID4gQEAgLTE0OCw2ICsxNDgsOSBAQCBNUFZfREVQRU5ERU5DSUVTICs9IGxpYmds
Cj4gPiAgZWxzZSBpZmVxICgkKEJSMl9QQUNLQUdFX0hBU19MSUJHTEVTKSx5KQo+ID4gIE1QVl9D
T05GX09QVFMgKz0gLS1lbmFibGUtZ2wKPiA+ICBNUFZfREVQRU5ERU5DSUVTICs9IGxpYmdsZXMK
PiA+ICtlbHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTCkseSkKPiA+ICtNUFZfQ09O
Rl9PUFRTICs9IC0tZW5hYmxlLWdsCj4gPiArTVBWX0RFUEVOREVOQ0lFUyArPSBsaWJlZ2wKPgo+
IEhlcmUsIHlvdSBhcmUgY2hlY2tpbmcgd2l0aCBCUjJfUEFDS0FHRV9IQVNfTElCRUdMLCBidXQg
aW4gdGhlIHByZXZpb3VzCj4gcGF0Y2gsIGFzIG5vdGVkIGJ5IFRob21hcywgeW91IHVzZWQgQlIy
X1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FR0wuCj4KPiBBbnkgcmVhc29uIGZvciB0aGUgZGlzY3Jl
cGFuY3k/ClllcywgYmVjYXVzZSBlZ2wtZHJtIChhbmQgc28gdmFhcGktZHJtKSBkZXBlbmRzIG9u
IGdibToKJ2RlcHMnOiAnZHJtICYmIGdibSAmJiBlZ2wnLAoKQnV0IGdsIChhbmQgc28gdmFhcGkp
IGRvZXMgbm90IG9ubHkgZGVwZW5kcyBvbiBlZ2wtZHJtLCBpdCBjYW4gYmUKZW5hYmxlZCBpZiB3
YXlsYW5kIGFuZCBlZ2wgYXJlIGF2YWlsYWJsZSAoZ2wtd2F5bGFuZCk6CidkZXBzJzogJ2dsLWNv
Y29hIHx8IGdsLXgxMSB8fCBlZ2wteDExIHx8IGVnbC1kcm0gfHwgJworICdnbC13aW4zMiB8fCBn
bC13YXlsYW5kIHx8IHJwaSB8fCAnCisgJ3BsYWluLWdsJywKPgo+IEFuZCBsb29raW5nIGZyb20g
ZnVydGhlciBhd2F5LCBpdCBsb29rcyBsaWtlIHRoZSB0d28gcHJvYmxlbXMgYXJlIHJlYWxseQo+
IHJlbGF0ZWQgb25lIHRvIHRoZSBvdGhlciwgYW5kIHNvIG1heWJlIG5lZWQgdG8gYmUgZml4ZWQg
aW4gdGhlIHNhbWUKPiBwYXRjaC4uLgpJTUhPLCB0aGV5IGFyZSBub3QgcmVsYXRlZCBidXQgSSBj
YW4gbWVyZ2UgYm90aCBpZiB5b3UgcHJlZmVyLiBCZXJuZAp3aGF0IGlzIHlvdXIgb3Bpbmlvbj8K
Pgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4gIGVsc2UKPiA+ICBNUFZfQ09ORl9P
UFRTICs9IC0tZGlzYWJsZS1nbAo+ID4gIGVuZGlmCj4gPiAtLQo+ID4gMi4zMC4yCj4gPgo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+ID4gaHR0cDovL2xp
c3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRk
ZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIg
Mzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAg
ICAgICAgICAgICAgfAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTog
IFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKPiAnLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNl
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94
Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
