Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05F7CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC2940735;
	Sat, 10 Oct 2026 12:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecC5pvU7esO7; Sat, 10 Oct 2026 12:46:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6E50E40664
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791636378;
	b=cRcoKeHDbg/laQMPooI1knhlCJC/e5hqAsYMtMJt4TkZzjQYPKMnn3tRn+iKoXzDJSPM
	 KQpafXWLfxeseqoLMrNQp++d5HwTEchNYfy4LW3JeMfu0o8Dy+mYGEkL5+1n6qJdmmKR+
	 0ysf7AstSygP337C4szVHtm8o+49T+PVGltUkst1NC2iDOXwM5rOX4Mek1UPEPOt1INIJ
	 dwtY/Ap6zPb2QK/JgYraw0N/2VLUeMVwadj0E/PhVg3dkf+cw0Ay/Q5qzKmsmQBcMJrtf
	 4CzfjsiWVQilze0kaNGvl/+Pmb5jZZmOlIfYj3adt8My55yjMWQYU2kRVEGhGnZ9pmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791636378;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ui9bgNM5MxCc6cPfmI7cB2uO3q/15oMXTObwdZ2r9kw=;
	b=ZDFzbrzJz6l0FoWnTAkWco7XkQlU0jxhRi/LbWqmMJkh/8/M3kgqeJaN7wutihpAPKH7
	 FDdZEMO4aEhhoaxQ8JzupQOtFO84nMME9KZZqnzy3S8ZZnvCaoVyQ8d8nC+NNIj79Y6yY
	 N4GrBDXJ4JDxdaz0AnR0KFPoZ+crbZnAayfL8QJCMQkGxbvcgkRMQqdC0ZsqQl1oUzLC2
	 51Cc0Wa4OcDg3nddElFnjhbBiZi50pP6xCFR88pwLqErzYfjsvN8Snfp5hVfDQ13tOIht
	 2pG3kXA3MrISxYOWZcVyRW3jkxeHDIzQg8ObZpZgHg2wmifjfyMqBtrN/n5ouY5cdgg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791636378;
	bh=Ui9bgNM5MxCc6cPfmI7cB2uO3q/15oMXTObwdZ2r9kw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ptFkWG+X8e9ICmL4Ms7XjHN0yHz440OGfx6cUYZNCWq2E2kA52Yc7sWgTWmQSMPHV
	 gk9Grq2Z8IJ9RkEo3unGNLXCOUj8pgiSsKLTFruVHToGZtCHYJotupjChoP9ufrkMj
	 y42HkFgTM12s4vqUi8+keEGpVWc0u0NM+RXjZzWIN8yxtIo4XNfRvmWmCKlCt7RfEU
	 fOi534VcsoTPvduoDefyity2imtTGAazF70rpdTrIqwgp1uoAMi6Ixevvydaq/AM/v
	 FketF9H1nBTP82ugLYFz2Oefus/4FMDrUoiC8GeiucJGtOMzxD8de0HNbY4vIGv79U
	 P3frraUTCxlNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E50E40664;
	Sat, 10 Oct 2026 12:46:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6AE322B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C884A40664
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTyLMmi_wpYc for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:46:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8384A40637
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791636376;
 b=nJX7Tp07b8jfepTxajWthiIAxIAX8pxTJeynyAtmn2TKK/MMsO+e1p+BdSfWSh2tvUvY
 5lQvP31/tR4+nSx2xcoCeVxKpqa3l7ppVIiM285JspZ76+NUOvBTWwoHOUZWpjPrsjfUA
 kdvgKwX9SqnN7WT8cZoYOZODlsu2L3u+yRCXBQ4E4CvGif1T3DpbVWADE1o+rbmW9CRSE
 5V701VkVJvJ9ZzgsrBaBMjvkNaemy8VUQGW00MmCa/EAy9WImK+lra1AJA3T3vHMzu+pH
 roRIdY7eR7AJvnbzRJdchwDiyp7W/lhLp2Ro8h4FP2U25amWDWPDoFz96oBwgMuD7Yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791636376;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=Xd9+7+blg+l/ngbjEfVz+JWjZ5UyFgS5JN7TCXpKuiM=;
 b=TGiI/xfGFq3QS6KfA9YAYitrhNaoMp4HzWvuUaW+tNhx6JKnZUT3ct+1oRnwLKmv5pV1
 W1keJ2dYZ6bHzbEmvki4zA1wtkoxEBycHy4KbsEr51/KDn9iiiVfyb8QrkjBjjoh+OtqL
 YBcawX/Wgdl6+GZaHQtlG882nAwA9S3nmI1dnE4CAvj5oWbLjF+aTpu2/tYw77ZRkISmZ
 XCy3tKUpos2d1f4co9QayNnPNBVZxHFGEr/EVYY5VWTygyheXHaa9M33LjjEEYeaht5vH
 1xIRvBVNr1zPApp2tW5SzIEWI9+PFbU96R9Uti/6Acykwm4EToKIeikbre2zdCmSoaw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HJ3elwax; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8384A40637
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:46:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so4984675e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 05:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791636373; x=1792241173;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Xd9+7+blg+l/ngbjEfVz+JWjZ5UyFgS5JN7TCXpKuiM=;
 b=Oh94oyfLtOxD7QRgbqQB2qQph6MKYaZ1Co5WV3tDrtDdsnrAxLmb4qEQLCpgUxJ/Sz
 +UJL/z+eVdiv6EsnOa6uoyEZik3u9C7fjZQo0rNWo33HKiAiTktdsYPdSMtpQPECcmHn
 qSF/KOSjAS8qRQAK+BQjc4BaD13jZwbrA2q+Ekk7QTB+/fZlaW75VB3RENa4AMlMY9N9
 1cmei01PWr7IpywlFHFWS1J9W1H8A6Ks3T+rm9yOPybyP7sT/OOl4PnCYTUKGQ/H7Dz9
 aE6OJ6bIU78sNymZVlQZ7svSyF7rNNDVlvTRqShpOozoQxbnDfhr9sIdBdyhFS4Sx3pX
 q8dg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzJEUOxByNMaALSdL1wF4cZOuzGoW/noCWg6XqBES3vhnU9eLLAipXi1d9dtmRYB9u09VUOGuoEOJs=@buildroot.org
X-Gm-Message-State: AFq9FYLuYOgVvStcvL5EYnRF41zBEjW3cHYYn6MvCG1LTVeOet4uNZHG
 yCyOvhkFtE3oqCiV2r0wzTYbmko5saQ41oLpE06xZkA6wU1+n97sV6mxFFQecm3aUZA=
X-Gm-Gg: AYBFou2cQgfCcKkiTCmuVU/jfrXwX6+orljs68wus/jHszob4nSL/tY07JMCDkrGxrR
 aXMtNBnLZgLgKDt0R3q59HzXuVoQKgufPh5zFY5YS97d8AzmJl9MHxG+NqS9KwhTCf++z1lVCKZ
 pvlPOkVwype34S0uCdxaut+yY+Ba23F5povW3YyaFtbwkdu9OGio/7oSoFkpn7oX3TmSGmS1Y1m
 PDAM84GzW7w7yIvEEgsYfAvW3fHh8T8P7V87w3e+8xXCLKYgElK+nyhbvjJxSrBBcMXEGCl5+oC
 fH5OKN43r79Phw0JZ5O7u+VgWOMmkeDAUxLlSwKWMc/An3PqHupcakUw4qRmcx2qcYGc5lmfnwQ
 fzxqFJuHVWwZTmJf+dkJrzdR8jLnd9Z8ZLlbHm69+4MCNRMFtE8tPlAGOihLsEOXLGII8OQjaFg
 FMTERtvi9JTntsF6ld2dKZXKUXJKPNpnVuIhxZZ8VBvSREABEV/VL1Ldx3vNQVo6V8X6VZiN6Mk
 IWe1I33kfQZsfRnvL498trz0ZDZhvdene5PoGsb2nC2gDuo2tGoyITr
X-Received: by 2002:a05:600c:3111:b0:4a1:811c:8069 with SMTP id
 5b1f17b1804b1-4a18e49d640mr88798585e9.8.1791636373021; 
 Sat, 10 Oct 2026 05:46:13 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm180143665e9.6.2026.10.10.05.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 05:46:12 -0700 (PDT)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Date: Sat, 10 Oct 2026 14:45:41 +0200
Message-ID: <20261010124611.503972-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917091904.2560461-3-raphael.melotte@mind.be>
References: <20260917091904.2560461-3-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC PATCH 2/2] package/qemu/Config.in.host: fix
 typo in comment dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFwaGFlbCwKCkkgdGhpbmsgaXQncyB3b3J0aCBtZW50aW9uaW5nIHRoYXQgdGhpcyB3
YXMgaW50cm9kdWNlZCBpbiBjb21taXQKMjU1YWNkYzE0MzY1OGFhNjM3Y2U3NWY2NTdiM2JlYmVl
MWQ1OGM5NS4KCkJlc3QgcmVnYXJkcywKUEVSQUxFIFRob21hcwoKSW4gcmVwbHkgb2Y6Cj4gVGhl
ICJob3N0LXFlbXUgbmVlZHMgYSBob3N0IGdjYyA+PSA4IiBjb21tZW50IGRlcGVuZHMgb24KPiBC
UjJfUEFDS0FHRV9IT1NUX1FFTVVfVVNFUl9BUkNIX1NVUFBPUlQsIG1pc3NpbmcgdGhlIHRyYWls
aW5nICJTIgo+IG9mIHRoZSBhY3R1YWwgc3ltYm9sIEJSMl9QQUNLQUdFX0hPU1RfUUVNVV9VU0VS
X0FSQ0hfU1VQUE9SVFMsCj4gZGVmaW5lZCBhIGZldyBsaW5lcyBhYm92ZSBhbmQgdXNlZCBjb3Jy
ZWN0bHkgZXZlcnl3aGVyZSBlbHNlIGluCj4gdGhpcyBmaWxlLgo+IAo+IEJlY2F1c2UgdGhpcyB0
eXBvJ2Qgc3ltYm9sIGlzIG5ldmVyIGRlZmluZWQgYW55d2hlcmUsIGl0IGlzIGFsd2F5cwo+IGNv
bnNpZGVyZWQgZmFsc2UgYnkgS2NvbmZpZywgc28gdGhlIGNvbW1lbnQncyAiZGVwZW5kcyBvbiIg
Y2xhdXNlCj4gc2lsZW50bHkgbG9zZXMgb25lIG9mIGl0cyB0d28gaW50ZW5kZWQgY29uZGl0aW9u
cy4KPiAKPiBBc3Npc3RlZC1ieTogTExNCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90
dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgoKPiAtLS0KPiAgcGFja2FnZS9xZW11L0NvbmZp
Zy5pbi5ob3N0IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0IGIv
cGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0Cj4gaW5kZXggYzdkZDU4NzZlNS4uNjQ0ZGZkNGQ4
MiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QKPiArKysgYi9wYWNr
YWdlL3FlbXUvQ29uZmlnLmluLmhvc3QKPiBAQCAtMzcsNyArMzcsNyBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfSE9TVF9RRU1VX1VTRVJfQVJDSF9TVVBQT1JUUwo+ICAKPiAgY29tbWVudCAiaG9zdC1x
ZW11IG5lZWRzIGEgaG9zdCBnY2MgPj0gOCIKPiAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9T
VF9RRU1VX1NZU1RFTV9BUkNIX1NVUFBPUlRTIHx8IFwKPiAtCQlCUjJfUEFDS0FHRV9IT1NUX1FF
TVVfVVNFUl9BUkNIX1NVUFBPUlQKPiArCQlCUjJfUEFDS0FHRV9IT1NUX1FFTVVfVVNFUl9BUkNI
X1NVUFBPUlRTCj4gIAlkZXBlbmRzIG9uICFCUjJfSE9TVF9HQ0NfQVRfTEVBU1RfOAo+ICAKPiAg
Y29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfUUVNVQo+IC0tIAo+IDIuNTQuMAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
