Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90A7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BD981450;
	Sat,  8 Jan 2022 18:47:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FLDFT7QOR10J; Sat,  8 Jan 2022 18:47:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E55378144C;
	Sat,  8 Jan 2022 18:47:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8441BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC35A60A73
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:47:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2YRzTiQyTtQ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:47:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F245E607B5
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:47:43 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j6so35666278edw.12
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 10:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AsVV0JONkJ/JhQ2zlseu0GCFYj9s5ycP5aIHi7pLYP8=;
 b=Rfk0nE7ygY0w8AnMwS69xpk6/yVqYWU0MTormWrSZjEDLnb/22vpEfzyToERCcp3hi
 lDsWZ39DPjht8Esmonb9xH5Gzwj8nZ6KgQSYPAg8ygvY9zNBszHA0um5/3bhlDZQT+OK
 TdkCfejTkqSJGK20pdphyOcy0NuaX832mLyz6rFYZQPBtj5xNqY1RrqxareBFpySdpuL
 FwcOkUirYMaRCg8KNh90TWAwFb4BVyiX/nopCIoNEy1zEtO++pl1llnlt8brX8NPTL8U
 jd57CUf9DG6KXgr2H5LrTGkn8kIpdzucQcNED2YTf+rTEYs68FpqngT1M6u5cLRKRmKp
 xEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AsVV0JONkJ/JhQ2zlseu0GCFYj9s5ycP5aIHi7pLYP8=;
 b=1S03HbES6D45HQRl5bHOfXP6zyKpzpzrptdl60pb0AdaoQFXdlHeE7FFvd3LOqBH7G
 F+xh24BNthj/rcstySy8xFT9F820Ph//7dsh2s7kEQNA/d3PY3HrbVpnXDd0k0Fyh+F2
 SCM/nf+44JsS83XopsglvrXCfK+NdHTIRJVHAO1Uqw06/+0tXAfecX22MJZG+wEfJbfe
 zks2mvWzYLr1FLWwGBod1aREAdXSjBhFRJTuak0UGr00lMwTKn08cDoNQc79n9YchO64
 SKQLsK1uqCbcaEVJueiL37MBusoMeTIj2jhpSLSxTYmdYe6JptVXm/ltZ14VkFItnDsQ
 eajg==
X-Gm-Message-State: AOAM5314ro8wmCu6W74sbNKenRyrhd0ggWSVy9j9eUobMlK8GWHqFd59
 H9mGjZSTShNcbYHNMIpQNQXbOn98JjZ1nmlJMzE=
X-Google-Smtp-Source: ABdhPJxuxWp9dEtNCB/UaGtyfO1Dfs2+XH3c0wZCkoiQJ0SzfrMqY/Xzyp8m3h4u7D3j8s1om3IOdYNyWAMAZv1Nxro=
X-Received: by 2002:a17:906:38f:: with SMTP id
 b15mr7408570eja.661.1641667662218; 
 Sat, 08 Jan 2022 10:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20220104205455.3632671-1-fontaine.fabrice@gmail.com>
 <20220108115140.760e195f@windsurf>
 <CAPi7W82_k_toe+-1DdZv8wr2ArKjeZfb9qdarm5oewv52vsh4g@mail.gmail.com>
 <20220108183919.238c1885@gmx.net> <20220108193800.5f91ac3b@windsurf>
In-Reply-To: <20220108193800.5f91ac3b@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 8 Jan 2022 19:46:26 +0100
Message-ID: <CAPi7W80fbDbttdL7TS_23ZmHV=u-k=dFDQEhw-6sQH3+MgxdPg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/file: fix build with gcc 4.8
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgc2FtLiA4IGphbnYuIDIwMjIgw6AgMTk6MzgsIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFNhdCwgOCBKYW4gMjAyMiAx
ODozOToxOSArMDEwMAo+IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4gd3JvdGU6
Cj4KPiA+IFRoZSBkaWZmZXJlbmNlIHNlZW1zIHRvIGJlOgo+ID4KPiA+ICAgICAgICQgZGlmZiAt
cnUgZmlsZS01LjM4L2NvbmZpZ3VyZS5hYyBmaWxlLTUuNDEvY29uZmlndXJlLmFjCj4gPiBbLi4u
XQo+ID4gQEAgLTg4LDcgKzg4LDcgQEAKPiA+ICBBQ19TVUJTVChXQVJOSU5HUykKPiA+Cj4gPiAg
ZG5sIENoZWNrcyBmb3IgcHJvZ3JhbXMuCj4gPiAtQUNfUFJPR19DQ19TVERDCj4gPiArQUNfUFJP
R19DQwo+ID4gIEFDX1VTRV9TWVNURU1fRVhURU5TSU9OUwo+ID4gIEFNX1BST0dfQ0NfQ19PCj4g
PiAgQUNfQ19CSUdFTkRJQU4KPiA+IFsuLi5dCj4gPgo+ID4gQWNjb3JkaW5nIHRvIFsxXSBBQ19Q
Uk9HX0NDIGNoZWNrcy9lbmFibGVzIGM4OSBhbmQgQUNfUFJPR19DQ19TVERDIGNoZWNrcy9lbmFi
bHMgQzk5IChvcgo+ID4gdXNlIEFDX1BST0dfQ0NfQzk5IHRvIGJlIG1vcmUgZXhwbGljaXQpLi4u
LCBub3RlIHRoYXQgd2l0aCBBQ19QUk9HX0NDIHRoZSBhY19jdl9wcm9nX2NjX2M5OQo+ID4gZmVh
dHVyZSBpcyBnb25lIChzdGlsbCB1c2VkIGZvciB0YXJnZXQvaG9zdCBpbiBwYWNrYWdlL2ZpbGUv
ZmlsZS5taykuLi4KPgo+IEJ1dCB3aHkgdGhlIHNvbHV0aW9uIHdlIHVzZSBmb3IgdGhlIHRhcmdl
dCBwYWNrYWdlIGRvZXNuJ3Qgd29yayBmb3IgdGhlCj4gaG9zdCBwYWNrYWdlPwo+Cj4gT3IgcGVy
aGFwcyB3ZSdyZSBubyBsb25nZXIgdGVzdGluZyB0aGUgdGFyZ2V0IHBhY2thZ2Ugd2l0aCBnY2Mg
NC44ID8KaG9zdC1maWxlIGlzIGEgZGVwZW5kZW5jeSBvZiBmaWxlIHRoYXQncyB3aHkgd2UgaGF2
ZSBvbmx5IGJ1aWxkCmZhaWx1cmUgd2l0aCBob3N0LWZpbGUuCkJ1aWxkIGZhaWx1cmVzIGFyZSBy
YWlzZWQgb25seSBzaW5jZSB0aGUgYnVtcC4KPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6
em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpCZXN0IFJl
Z2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
