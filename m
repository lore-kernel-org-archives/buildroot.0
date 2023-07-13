Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D62C0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1822C61306;
	Thu, 13 Jul 2023 07:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1822C61306
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mG0zyBfOYsY9; Thu, 13 Jul 2023 07:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C2C5612FE;
	Thu, 13 Jul 2023 07:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2C5612FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 444D01BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B40940BE4
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:42:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B40940BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZV6Rp1jheS4J for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:42:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E72940A85
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E72940A85
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:42:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbdfda88f4so3080325e9.1
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 00:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689234137; x=1691826137;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xfA0O6EEkjeHqrDNxtgeqjFtDiDbDv5lj8kXpUN8ya8=;
 b=B5hgPwPfSgs2DEMPum1IRCOfpEZ3ppsxVDI4Pn+0qZbcDf4KtjDohsLF07Ca27DAII
 AdSNxRaSddYIqKvuoC4ekrsgVKH3YAq+gQIH8mFZqvaWBMK6x29pIlsugI6JJAM2gDbs
 9WcXQ2gZWhDjEjjQnvOtGlauBjARufrcYI78nbab+Cl6mFq9I4ThC5IpN57kB9dQzfso
 KtAM8rFkVpZWfLipTIAWXzTl3dmOxo/8VhzsN2xaHsPSgDIvND4h/K1pBnR99DTW6B5N
 Av3D8Jkopf5U11dxa34fCOU5ztqZljJYnFmWwqFOqC+YemFFjULT6ZsgtnbBmTmYAu2M
 5BCg==
X-Gm-Message-State: ABy/qLYWtYTuuFY4qvM3ripnfvKG5HUSfXxLcEvw6wavkfndkDm/+I8W
 IdNUPYOz01HFUzKNIX3833pXlg==
X-Google-Smtp-Source: APBJJlHLOH32dFWjj2RFmmkKJ35axC08DzUT5LDi89BzQGEbKK77NEcUxvDoZWqWKTXJnNbLBeQ5hg==
X-Received: by 2002:a7b:cb10:0:b0:3fc:21:2c43 with SMTP id
 u16-20020a7bcb10000000b003fc00212c43mr761643wmj.13.1689234137278; 
 Thu, 13 Jul 2023 00:42:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a7bc8cb000000b003fa98908014sm17681912wml.8.2023.07.13.00.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 00:42:17 -0700 (PDT)
Message-ID: <047de8ec-f6ed-976a-8113-8c5c0ba5a520@smile.fr>
Date: Thu, 13 Jul 2023 09:42:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20230609174955.409551-1-romain.naour@gmail.com>
 <20230712214357.2e04f24d@windsurf> <20230712214613.32816a8f@windsurf>
 <18ad1be4-69f1-382b-47f2-a7b7ceab8610@smile.fr>
In-Reply-To: <18ad1be4-69f1-382b-47f2-a7b7ceab8610@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1689234137; x=1691826137;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xfA0O6EEkjeHqrDNxtgeqjFtDiDbDv5lj8kXpUN8ya8=;
 b=kEBx7X25lG0S8weJ2Z7WTBNtvWsJhet+vDVHbY6eN81mPAuQL3MEcXv7xl6yjpkHSJ
 Wu8vzI77/2IWLtNyajNdFdqU3i2aHzT0qzWYhuZcJG8W9OD9VyEA1OL572Ky2zFpUaPa
 ixEP4HTaKUU+Ko8yJVlnIuEzJ57298k0lSOEhEJVgBq5rvBEhif2MEvTXIIydXsewqSk
 dGCat/fDtFZQ7LWAmRS59zrlcyFB9kS/xLuySdRbAqcVQrqxVf+f9nyu9HNh92NfKTe0
 LHNb3qOVx5fR+FDnr7XoVSaLZp8supMgPtMuaenmetQAYaf7G7bAbBUXau06FBOr2pj8
 wTfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=kEBx7X25
Subject: Re: [Buildroot] [PATCH 1/4] support/testing: add python-mako
 runtime test
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTMvMDcvMjAyMyDDoCAwOTozNiwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
VGhvbWFzLCBBbGwsCj4gCj4gTGUgMTIvMDcvMjAyMyDDoCAyMTo0NiwgVGhvbWFzIFBldGF6em9u
aSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4+IE9uIFdlZCwgMTIgSnVsIDIwMjMgMjE6NDM6
NTcgKzAyMDAKPj4gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4gd3JvdGU6Cj4+Cj4+PiBJIG1pZ2h0IG5vdCBoYXZlIGdyYXNwZWQgdGhlIGZ1bGwgc2NhbGUg
b2YgdGhlIGlzc3VlLCBidXQgbXkgZmVlbGluZyBpcwo+Pj4gdGhhdDoKPj4+Cj4+PiAtIHB5dGhv
bi1tYWtvIG5lZWRzIG1hcmt1cHNhZmUgdW5jb25kaXRpb25hbGx5LCBhcyBkZW1vbnN0cmF0ZWQg
YnkgeW91cgo+Pj4gICB0ZXN0IFRlc3RQeXRob25QeTNNYWtvLiBTbyBweXRob24tbWFrbyBzaG91
bGQgdW5jb25kaXRpb25hbGx5IHNlbGVjdAo+Pj4gICBCUjJfUEFDS0FHRV9QWVRIT05fTUFSS1VQ
U0FGRQo+Pj4KPj4+IC0gcHl0aG9uLW1ha28gb25seSBuZWVkcyBweWdtZW50cy9iYWJlbCBhcyBv
cHRpb25hbCBkZXBlbmRlbmNpZXMgc28KPj4+ICAgeW91ciBwYXRjaGVzIDIvNCBhbmQgMy80IGFy
ZSBmaW5lCj4+Pgo+Pj4gLSBpbiBvcmRlciB0byBmaXggYnVnICMxNTYyOCwgd2UgbmVlZCB0byBl
bnN1cmUgdGhhdCB0aGUgcGlnbGl0IHBhY2thZ2UKPj4+ICAgc2VsZWN0cyBCUjJfUEFDS0FHRV9Q
WVRIT05fTUFLT19FWFRfUFlHTUVOVFBMVUdJTiwgc28gdGhhdAo+Pj4gICBweXRob24tbWFrbyBp
cyBpbnN0YWxsZWQgd2l0aCBweWdtZW50cyBzdXBwb3J0Cj4+Pgo+Pj4gRG9lcyB0aGF0IG1ha2Ug
c2Vuc2UgPwo+Pgo+PiBJIGdvdCBpdCB3cm9uZywgeW91ciBiYXNpYyB0ZXN0IHNob3dzIHRoYXQg
Ym90aCBweWdtZW50cyBhbmQgbWFya3Vwc2FmZQo+PiBhcmUgbmVlZGVkIGZvciBhIGJhc2ljIHVz
YWdlIG9mIHB5dGhvbi1tYWtvOgo+Pgo+PiAkIC4vc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyAt
byAuLi9vdXRwdXRzLyAtayB0ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uX21ha28uVGVzdFB5dGhv
blB5M01ha28KPj4gMjE6MzI6MDQgVGVzdFB5dGhvblB5M01ha28gICAgICAgICAgICAgICAgICAg
ICAgICBTdGFydGluZwo+PiAyMTozMjowNCBUZXN0UHl0aG9uUHkzTWFrbyAgICAgICAgICAgICAg
ICAgICAgICAgIEJ1aWxkaW5nCj4+IDIxOjM0OjU1IFRlc3RQeXRob25QeTNNYWtvICAgICAgICAg
ICAgICAgICAgICAgICAgQnVpbGRpbmcgZG9uZQo+PiAyMTozNTowMSBUZXN0UHl0aG9uUHkzTWFr
byAgICAgICAgICAgICAgICAgICAgICAgIENsZWFuaW5nIHVwCj4+IEYKPj4gPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQo+PiBGQUlMOiB0ZXN0X3J1biAodGVzdHMucGFja2FnZS50ZXN0X3B5dGhvbl9tYWtvLlRlc3RQ
eXRob25QeTNNYWtvKQo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IFRyYWNlYmFjayAobW9zdCByZWNlbnQg
Y2FsbCBsYXN0KToKPj4gICBGaWxlICIvaG9tZS90aG9tYXMvYnVpbGRyb290L2J1aWxkcm9vdC9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbi5weSIsIGxpbmUgMTM3LCBp
biB0ZXN0X3J1bgo+PiAgICAgc2VsZi5ydW5fc2FtcGxlX3NjcmlwdHMoKQo+PiAgIEZpbGUgIi9o
b21lL3Rob21hcy9idWlsZHJvb3QvYnVpbGRyb290L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfcHl0aG9uLnB5IiwgbGluZSAxMzIsIGluIHJ1bl9zYW1wbGVfc2NyaXB0cwo+PiAg
ICAgc2VsZi5hc3NlcnRSdW5PayhjbWQsIHRpbWVvdXQ9c2VsZi50aW1lb3V0KQo+PiAgIEZpbGUg
Ii9ob21lL3Rob21hcy9idWlsZHJvb3QvYnVpbGRyb290L3N1cHBvcnQvdGVzdGluZy9pbmZyYS9i
YXNldGVzdC5weSIsIGxpbmUgOTUsIGluIGFzc2VydFJ1bk9rCj4+ICAgICBzZWxmLmFzc2VydEVx
dWFsKAo+PiBBc3NlcnRpb25FcnJvcjogMSAhPSAwIDogCj4+IEZhaWxlZCB0byBydW46IHB5dGhv
biBzYW1wbGVfcHl0aG9uX21ha28ucHkKPj4gb3V0cHV0IHdhczoKPj4gICBUcmFjZWJhY2sgKG1v
c3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4+ICAgICBGaWxlICIvdXNyL2xpYi9weXRob24zLjExL3Np
dGUtcGFja2FnZXMvbWFrby9leGNlcHRpb25zLnB5IiwgbGluZSAyODcsIGluIF9pbnN0YWxsX2hp
Z2hsaWdodGluZwo+PiAgICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2Vz
L21ha28vZXhjZXB0aW9ucy5weSIsIGxpbmUgMjcxLCBpbiBfaW5zdGFsbF9weWdtZW50cwo+PiAg
ICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL21ha28vZXh0L3B5Z21l
bnRwbHVnaW4ucHkiLCBsaW5lIDcsIGluIDxtb2R1bGU+Cj4+ICAgTW9kdWxlTm90Rm91bmRFcnJv
cjogTm8gbW9kdWxlIG5hbWVkICdweWdtZW50cycKCklJUkMsIEkgZGlkbid0IGhhdmUgdGhpcyBl
cnJvciB3aGlsZSB0ZXN0aW5nIHdpdGggVGVzdFB5dGhvblB5M01ha28gd2l0aApTZWJhc3RpYW4g
cGF0Y2ggYXBwbGllZCBhbmQgYW1tYW5kZWQgdG8gcmVtb3ZlIHB5Z21lbnRzIGRlcGVuZGVuY3ku
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4+ICAgCj4+ICAgRHVyaW5nIGhhbmRsaW5nIG9mIHRo
ZSBhYm92ZSBleGNlcHRpb24sIGFub3RoZXIgZXhjZXB0aW9uIG9jY3VycmVkOgo+PiAgIAo+PiAg
IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKPj4gICAgIEZpbGUgIi9yb290L3Nh
bXBsZV9weXRob25fbWFrby5weSIsIGxpbmUgMSwgaW4gPG1vZHVsZT4KPj4gICAgICAgZnJvbSBt
YWtvIGltcG9ydCBydW50aW1lCj4+ICAgICBGaWxlICIvdXNyL2xpYi9weXRob24zLjExL3NpdGUt
cGFja2FnZXMvbWFrby9ydW50aW1lLnB5IiwgbGluZSAxNSwgaW4gPG1vZHVsZT4KPj4gICAgIEZp
bGUgIi91c3IvbGliL3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9tYWtvL2V4Y2VwdGlvbnMucHki
LCBsaW5lIDI5MiwgaW4gPG1vZHVsZT4KPj4gICAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTEv
c2l0ZS1wYWNrYWdlcy9tYWtvL2V4Y2VwdGlvbnMucHkiLCBsaW5lIDI4OSwgaW4gX2luc3RhbGxf
aGlnaGxpZ2h0aW5nCj4+ICAgICBGaWxlICIvdXNyL2xpYi9weXRob24zLjExL3NpdGUtcGFja2Fn
ZXMvbWFrby9leGNlcHRpb25zLnB5IiwgbGluZSAyNzcsIGluIF9pbnN0YWxsX2ZhbGxiYWNrCj4+
ICAgICBGaWxlICIvdXNyL2xpYi9weXRob24zLjExL3NpdGUtcGFja2FnZXMvbWFrby9maWx0ZXJz
LnB5IiwgbGluZSAxNCwgaW4gPG1vZHVsZT4KPj4gICBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBt
b2R1bGUgbmFtZWQgJ21hcmt1cHNhZmUnCj4+Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gUmFuIDEgdGVz
dCBpbiAxNzcuMTU3cwo+Pgo+PiBGQUlMRUQgKGZhaWx1cmVzPTEpCj4+Cj4+IFNvIHRvIG1lIGl0
IGxvb2tzIGxpa2UgdGhlIHBhdGNoIGZyb20gU2ViYXN0aWFuIGlzIGNvcnJlY3QsIGFuZAo+PiB0
aGVyZWZvcmUgeW91ciBQQVRDSCAyLzQgYWRkaW5nIGFuIG9wdGlvbiB0byBlbmFibGUgcHlnbWVu
dHMgc3VwcG9ydAo+PiBkb2VzIG5vdCBtYWtlIHNlbnNlIGJlY2F1c2UgcHlnbWVudHMgaXMgbmVl
ZGVkIHVuY29uZGl0aW9uYWxseSBieQo+PiBweXRob24tbWFrby4KPj4KPj4gVGhvdWdodHM/Cj4g
Cj4gQWN0dWFsbHkgdGhlIHBhdGNoIGZyb20gU2ViYXN0aWFuIHNob3VsZCBiZSBwYXJ0IG9mIHRo
aXMgc2VyaWVzIGJ1dCB3aXRob3V0Cj4gc2VsZWN0aW5nIHB5Z21lbnRzLgo+IAo+IEl0J3MgdW5j
bGVhciBmb3IgbWUgaWYgcHlnbWVudHMgYW5kIGJhYmVsIGFyZSByZWFsbHkgbWFuZGF0b3J5IHJ1
bnRpbWUKPiBkZXBlbmRlbmNpZXMgb2YgbWFrby4gSW5kZWVkLCBweWdtZW50cyBhbmQgYmFiZWwg
YXJlIHVzZWQgYnkgIm1ha28gZXh0ZW5zaW9uIgo+IGFuZCBtYXkgbm90IGJlIHVzZWQgYXQgYWxs
IHdoZW4gdXNpbmcgcHl0aG9uLW1ha28uCj4gCj4gRG8gd2UgcmVhbGx5IHdhbnQgdG8gaGFuZGxl
IHN1Y2ggIm1ha28gZXh0ZW5zaW9uIiA/Cj4gCj4gT3RoZXJ3aXNlLCBJJ20gZmluZSB0byBhZGQg
dGhlbSBhcyBydW50aW1lIGRlcGVuZGVuY2llcyBvZiBtYWtvLgo+IAo+IEJlc3QgcmVnYXJkcywK
PiBSb21haW4KPiAKPj4KPj4gVGhvbWFzCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
