Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43922C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 16:23:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C852961027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 16:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C852961027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 918D84020D;
	Sun, 14 Nov 2021 16:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0GqSnWBeb6m; Sun, 14 Nov 2021 16:23:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF6F64020A;
	Sun, 14 Nov 2021 16:23:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C97C1BF30F
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 16:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B0E1401BD
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 16:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4UFbSPjHGOc for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 16:23:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D6CD40105
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 16:23:03 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z8so29922339ljz.9
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 08:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FvX6mWtkKkpUfsgEx30KBJcGIkxKTgnfvNXvzlUV0L8=;
 b=My9Bu5yV1Bq/rHxackp7QVCr6CrDa3rf+r4WfyTeoMS0mjTqiAbs/83OgKxOsInWO9
 5GnBwnQGQ7I/viOzycG16PxSBZrrCQ92jClCCaQHBJVH94arUcsyAg0Vw0uhKMYyH+I8
 dREUPJgqDXFQdpxZDNhzDJnXlEnxTRaSaTttWuHyMccGMLrAazfvZeg23kPY4Z1Ytu7M
 4lVZgctKpfOPdkVwJ7mX+6taQNx9XbzkWDfyrbdUNrb6exMwEy5Dx9y7jF98F2qUcEpe
 m2qQimDOYta/wSdk+jGjg3EI75iZRBB852gDkIRupSYPn+Ooz3rdvbZ5ssdlXbqbPH+M
 OprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FvX6mWtkKkpUfsgEx30KBJcGIkxKTgnfvNXvzlUV0L8=;
 b=kNFDb1pWePmWAr36jOHbI2/AJNFJdH9ztbJYqAixtwx4r5svgocbkhYs/G4+abLV1l
 UGkphvlE9nXovKbuKx2Yx6rULrDNvGK8FJW3bkmpKyYhysElVD9awKXUrhJUYXJskn13
 mZcN2JpqcPiMXXAUOJtzJ+VnGLUXczxGnmLngV6660hvXLD3HMpP3QjG7Z5iGwRi5mxj
 zM5DFtH3SRkZVSqVhh6c7YcuBzB7pofT5G56pzlOY9dEdB2Vd4R4li0IbLAmkDJwa3XL
 4wLPmEPxUuJ2sgW+opi1MxHtYd+Z7sPa0wB7B5QmObODnLvIiIn4dOXIHEOfoEM7QiiW
 yUnQ==
X-Gm-Message-State: AOAM533urjQlcRwKDPxbNd4fFyeKpTXJftTTeMoyA640i3cy7FW8ZhCf
 QtYOZ62kPRl3Ip14ypfQOv5HIwWJF6KVoFZwrwsOFDzzg7I=
X-Google-Smtp-Source: ABdhPJwoeS4GOi+5BiNyTMWSmUMHoADTEljgcOu49OLTQvzFtJylBclUzAwuTx4wWAbJ3sxBFa+8v+ChpRoN5Vgl3MQ=
X-Received: by 2002:a2e:a370:: with SMTP id i16mr31853892ljn.336.1636906981140; 
 Sun, 14 Nov 2021 08:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20211114113310.1304245-1-fontaine.fabrice@gmail.com>
 <20211114143353.0dfd4592@windsurf>
In-Reply-To: <20211114143353.0dfd4592@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Nov 2021 17:20:50 +0100
Message-ID: <CAPi7W81aokAfaj7tv3fG=zn-Q+cYzqJ5ybTzgUc7nAXww316jw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/pppd: bump to version 2.4.9
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgZGltLiAxNCBub3YuIDIwMjEgw6AgMTQ6MzMsIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFN1biwgMTQgTm92IDIwMjEg
MTI6MzM6MTAgKzAxMDAKPiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IC0gRHJvcCBwYXRjaCAoYWxyZWFkeSBpbiB2ZXJzaW9uKQo+ID4g
LSBVcGRhdGUgaGFzaCBvZiBic2QtY29tcC5jLCBjY3AuYyBhbmQgcGFzc3Byb21wdC5jIChubyBj
aGFuZ2UgaW4KPiA+ICAgbGljZW5zZSkKPiA+IC0gcnAtcHBwb2UgaGFzIGJlZW4gcmVuYW1lZCB0
byBwcHBvZSBzaW5jZQo+ID4gICBodHRwczovL2dpdGh1Yi5jb20vcGF1bHVzbWFjay9wcHAvY29t
bWl0L2IyYzM2ZTZjMGUxNjU1YWVhOWIxYjBhMDNhODE2MGY0MmEyNmM4ODQKPiA+IC0gTWFuYWdl
IEVBUC1UTFMgd2hpY2ggZGVwZW5kcyBvbiBvcGVuc3NsIGFuZCBoYXMgYmVlbiBhZGRlZCBhbmQg
aXMKPiA+ICAgZW5hYmxlZCBieSBkZWZhdWx0IHNpbmNlCj4gPiAgIGh0dHBzOi8vZ2l0aHViLmNv
bS9wYXVsdXNtYWNrL3BwcC9jb21taXQvZTg3ZmUxYmJkMzdhMTQ4NmM1MjIzZjExMGU5Y2UzZWY3
NTk3MWY5Mwo+Cj4gSSBhbSByYXRoZXIgY29uZnVzZWQgYnkgdGhpcywgZXNwZWNpYWxseSBzaW5j
ZSB5b3UncmUgY2hhbmdpbmcgcHBwZC5taywKPiBidXQgbm90IHRoZSBDb25maWcuaW4gdGhhdCBo
YXMgc29tZSBmdW5reSBsb2dpYzoKPgo+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5T
U0wgaWYgQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDCj4gICAgICAgICBzZWxlY3QgQlIyX1BBQ0tB
R0VfTElCT1BFTlNTTF9FTkFCTEVfREVTIGlmIEJSMl9QQUNLQUdFX0xJQk9QRU5TU0wgXAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmJiBCUjJfVE9P
TENIQUlOX1VTRVNfR0xJQkMKPgo+IENvdWxkIHlvdSBleHBsYWluIGEgYml0IG1vcmUgaG93IHRo
aXMgaXMgaW50ZW5kZWQgdG8gd29yaywgYW5kIHdoYXQgaXMKPiB0aGUgbG9naWMvcmF0aW9uYWxl
ID8KSSdsbCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGluIHYyIGJ1dCBiYXNpY2FsbHkgb3Bl
bnNzbCBpcyBzdGlsbAptYW5kYXRvcnkgd2l0aCBnbGliYyBiZWNhdXNlIGVuY3J5cHQgYW5kIHNl
dGtleSBmdW5jdGlvbnMgaGF2ZSBiZWVuCnJlbW92ZWQgZnJvbSBnbGliYyAyLjI4IChjZi4gY29t
bWl0CmI1MTliY2FmZTc1ZDEyNTZkMWZjNDJhYTI2MzkzNDA1Yjg5NjI5YjMpCj4KPiBBbHNvLCBJ
J3ZlIHRlc3RlZCBhbmQgdGhpcyAyLjQuOSB2ZXJzaW9uIG9mIHBwcGQgYnVpbGQgZmluZSB3aXRo
IG11c2wsCj4gc286Cj4KPiAgICAgICAgIGRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fVVNFU19N
VVNMICMgVXNlIF9fUCgpIG1hY3JvIGFsbCBvdmVyIHRoZSB0cmVlCj4KPiBjb3VsZCBiZSBkcm9w
cGVkLgpPSywgSSdsbCBkcm9wIGl0IGZyb20gdjIuCgo+Cj4gVGhhbmtzLAo+Cj4gVGhvbWFzCj4g
LS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
