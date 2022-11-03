Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF3DC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 03:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3638E81E93;
	Thu,  3 Nov 2022 03:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3638E81E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y8BmV2jdx0nb; Thu,  3 Nov 2022 03:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17AF581E8E;
	Thu,  3 Nov 2022 03:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17AF581E8E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B7F71BF28C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 03:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06E1E4013B
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 03:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06E1E4013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlW7kzhc6L20 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 03:07:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C81D8400D0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C81D8400D0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 03:07:11 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 b1-20020a17090a7ac100b00213fde52d49so596591pjl.3
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 20:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vuQnCiM3vGiplR1J1fe0iQRQpog9W4Y0kLjFCIZvb6o=;
 b=MipF08MFNRLXM8qY4HAVAoS/4pRtt5yyEQzejs3611mPttJ1adCDrpnNb3inct0X5R
 BE9dlH6tLJ0jwXG3iZMS19ZCDmvQ+7823BAzP796SwXP1xPoMFAMUo2YYlkpTwiok/eh
 BaZ/ZAkWyMY7wFwBpE7gN/jirHvIAROQDqgkk4ICWG6zdDjMzAWNseQFjM5fmJdxPX6J
 DP/YJ4VIUWh4wgh9GHGAxzpBdUrmjJcAlOqgSF/Abw0N9d/DqA7W6oFrTr0Shv5V+NaM
 eX6D9jU4W6CZnMJTddl+v9Wq8u5UyhwtRmKq1yJuE8Oq7QJa6ezXuI1pbn8tt/ZVYqxV
 8ESQ==
X-Gm-Message-State: ACrzQf1cjXBvGB54Iq4rPW5TMJY7idE5LWTgItKO2/mFUFIucVOU+00u
 C+uigIJ9JzgX2gpeKMq1RPtyDq1hBJCX1AiIP+0=
X-Google-Smtp-Source: AMsMyM48TtQFkUNOgMphmfx4R30gNR74N3m64GtAC/CzZiyeAwEEok/s4ZXCEX45XtkH8hvqR+nE4HwGvxEgjxZll3c=
X-Received: by 2002:a17:902:d1d3:b0:187:3d23:3490 with SMTP id
 g19-20020a170902d1d300b001873d233490mr9935129plb.149.1667444831192; Wed, 02
 Nov 2022 20:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221102185739.2346971-1-james.hilliard1@gmail.com>
 <875yfwokvu.fsf@grinn-global.com>
In-Reply-To: <875yfwokvu.fsf@grinn-global.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 2 Nov 2022 23:06:59 -0400
Message-ID: <CADvTj4oKHrxdriu-p8TJ51i2+9JGThcB2xtfeOrOED+rfAgBkg@mail.gmail.com>
To: =?UTF-8?Q?Marcin_Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vuQnCiM3vGiplR1J1fe0iQRQpog9W4Y0kLjFCIZvb6o=;
 b=juGe215g5qRlbq/5H1tru/Jo5cFRGu2JsKqj4XDKBdRlQzBVCP6uM3t/24fzwYWRju
 ZtlK7xKKCv1cQ300LgX+TnYqd1LX/2+nh2MUk4VByeWqad5MRpcGbknxqMgLAhkpYzl0
 wWC7q+8UrMJ9YXmwoCqNovX0hcodk5PW0rb5p7RyBb6/Ru4lcamND0ahxQQg6E0Bzv2r
 QTzDQCwrMqrCmkI2su0h0HQPDkFund4k9Q1GtI8YAOe1eNqu+cCpLatjdtmRvzRs+L6B
 ag8nFov3cF6B91cTmGVrqdMTx4w8ZImYW3BzSp3sSQazEWE0iuzOBwME0/D/4KlvYWMs
 ZpUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=juGe215g
Subject: Re: [Buildroot] [PATCH 1/2] package/python-dbus-fast: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBOb3YgMiwgMjAyMiBhdCAxMDowMiBQTSBNYXJjaW4gTmllc3Ryw7NqCjxtLm5pZXN0
cm9qQGdyaW5uLWdsb2JhbC5jb20+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBTZWVtcyB0aGF0
IHdlJ3ZlIGJlZW4gd29ya2luZyBvbiB0aGUgc2FtZSBzdHVmZiB0b2RheSwgYXMgSSd2ZSBqdXN0
IHNlbnQKPiB0aGUgc2FtZSB1cGRhdGUgbm93LgoKWWVhaCwgSSB3YXMgZ29pbmcgdGhyb3VnaCB0
aGUgb3V0ZGF0ZWQgcHl0aG9uIHBhY2thZ2VzIHRoYXQgbmVlZGVkIHVwZGF0ZXMsCnByb2JhYmx5
IGdvaW5nIHRvIHN3YXAgdGhpcyBpbiB0byByZXBsYWNlIHB5dGhvbi1kYnVzLW5leHQgaW4gb25l
IG9mIG15IG93bgpweXRob24gcHJvamVjdHMuCgo+Cj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyaXRlczoKPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGls
bGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBERVZFTE9QRVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4gIHBhY2thZ2Uv
Q29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgcGFja2Fn
ZS9weXRob24tZGJ1cy1mYXN0L0NvbmZpZy5pbiAgICAgICAgICAgICB8ICA3ICsrKysrKysKPiA+
ICBwYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5oYXNoIHwgIDUgKysr
KysKPiA+ICBwYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5tayAgIHwg
MTYgKysrKysrKysrKysrKysrKwo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygr
KQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvQ29uZmln
LmluCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRo
b24tZGJ1cy1mYXN0Lmhhc2gKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24t
ZGJ1cy1mYXN0L3B5dGhvbi1kYnVzLWZhc3QubWsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvREVWRUxP
UEVSUyBiL0RFVkVMT1BFUlMKPiA+IGluZGV4IDdkMjc5MzY5OTIuLjQxMDRhMzNmN2YgMTAwNjQ0
Cj4gPiAtLS0gYS9ERVZFTE9QRVJTCj4gPiArKysgYi9ERVZFTE9QRVJTCj4gPiBAQCAtMTg4MSw2
ICsxODgxLDcgQEAgRjogICAgICBwYWNrYWdlL211cmF0YS1jeXctZncvCj4gPiAgRjogICBwYWNr
YWdlL25ldGRhdGEvCj4gPiAgRjogICBwYWNrYWdlL3B5dGhvbi1hbnNpY29sb3JzLwo+ID4gIEY6
ICAgcGFja2FnZS9weXRob24tYmxlYWsvCj4gPiArRjogICBwYWNrYWdlL3B5dGhvbi1kYnVzLWZh
c3QvCj4gPgo+Cj4gWW91J3ZlIGFkZGVkIG5ldyBlbnRyeSB1bmRlciBteSBuYW1lLiBJIGhhdmUg
bm90aGluZyBhZ2FpbnN0IChhcyBJIGhhdmUKPiBwb3N0ZWQgYWxtb3N0IHRoZSBzYW1lIHBhdGNo
KSwgYnV0IEkgZ3Vlc3MgdGhpcyB3YXMgYnkgbWlzdGFrZSwgcmlnaHQ/CgpPaCwgd2hvb3BzLCB3
YXMgY29weSBwYXN0aW5nIGFuZCBtaXhlZCB0aGF0IHVwIHdpdGggdGhlIENvbmZpZy5pbiBhZGRp
dGlvbgp3aGVuIGRvaW5nIGEgc2VhcmNoIGFuZCBpbnNlcnQuCgo+Cj4gPiAgRjogICBwYWNrYWdl
L3B5dGhvbi1kYnVzLW5leHQvCj4gPiAgRjogICBwYWNrYWdlL3B5dGhvbi1pbmljb25maWcvCj4g
PiAgRjogICBwYWNrYWdlL3B5dGhvbi1pbnRlbGhleC8KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gPiBpbmRleCAyMzhkNzgxM2YwLi5kYjll
OTRmMzU3IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiA+ICsrKyBiL3BhY2th
Z2UvQ29uZmlnLmluCj4gPiBAQCAtMTAxNSw2ICsxMDE1LDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0
aG9uIG1vZHVsZXMiCj4gPiAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWRhcGhuZS9Db25m
aWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWRhdGFwcm9wZXJ0eS9Db25m
aWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWRhdGV1dGlsL0NvbmZpZy5p
biIKPiA+ICsgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tZGJ1cy1mYXN0L0NvbmZpZy5pbiIK
PiA+ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tZGJ1cy1uZXh0L0NvbmZpZy5pbiIKPiA+
ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tZGVjb3JhdG9yL0NvbmZpZy5pbiIKPiA+ICAg
ICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tZGVmdXNlZHhtbC9Db25maWcuaW4iCj4gPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9weXRob24tZGJ1cy1mYXN0L0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0
aG9uLWRidXMtZmFzdC9Db25maWcuaW4KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRl
eCAwMDAwMDAwMDAwLi40MDBlNzBiZDdiCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNr
YWdlL3B5dGhvbi1kYnVzLWZhc3QvQ29uZmlnLmluCj4gPiBAQCAtMCwwICsxLDcgQEAKPiA+ICtj
b25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0RCVVNfRkFTVAo+ID4gKyAgICAgYm9vbCAicHl0aG9u
LWRidXMtZmFzdCIKPiA+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fQVNZTkNfVElN
RU9VVCAjIHJ1bnRpbWUKPgo+IFRoZXJlIGlzIHJ1bnRpbWUgZGVwZW5kZW5jeSBvbiBYTUwsIHdo
aWNoIEkgZGlzY292ZXJlZCB3aXRoIHJ1bnRpbWUKPiB0ZXN0aW5nLiBTbyBtaXNzaW5nOgo+Cj4g
ICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OM19QWUVYUEFUICMgcnVudGltZQoKQWgsIHllYWgs
IGxvb2tzIGxpa2UgSSBtaXNzZWQgdGhhdC4KCj4KPiA+ICsgICAgIGhlbHAKPiA+ICsgICAgICAg
QSBmYXN0ZXIgdmVyc2lvbiBvZiBkYnVzLW5leHQuCj4gPiArCj4gPiArICAgICAgIGh0dHBzOi8v
Z2l0aHViLmNvbS9ibHVldG9vdGgtZGV2aWNlcy9kYnVzLWZhc3QKPiA+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5oYXNoIGIvcGFja2FnZS9w
eXRob24tZGJ1cy1mYXN0L3B5dGhvbi1kYnVzLWZhc3QuaGFzaAo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAuLmYwZGNlZWI0M2QKPiA+IC0tLSAvZGV2L251bGwK
PiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lmhhc2gK
PiA+IEBAIC0wLDAgKzEsNSBAQAo+ID4gKyMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGku
b3JnL3B5cGkvZGJ1cy1mYXN0L2pzb24KPiA+ICttZDUgIGVlYmYyYzU1OGRkMWFmMGY4ZjMyYjM2
MWU5MWYyZmEzICBkYnVzX2Zhc3QtMS42MS4xLnRhci5nego+ID4gK3NoYTI1NiAgYmRhNGE3ZDU1
OTA0N2I3NGY0MDllZGEyNzhmNjhmNjEwYTQxOGU4NmFkM2VmYTAzNjhmYTJlZDI0MGRhYTZiNiAg
ZGJ1c19mYXN0LTEuNjEuMS50YXIuZ3oKPiA+ICsjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNo
ZWNrc3Vtcwo+ID4gK3NoYTI1NiAgYzM3ZTljNzUxMTBlMDFkMWYwYzUzNjBkYzdkNzc3NmEzMGFj
NWY3MGQyNDQwZGIyMTQ0MjNlNGI3YTc3YTZhZiAgTElDRU5TRQo+ID4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLWRidXMtZmFzdC9weXRob24tZGJ1cy1mYXN0Lm1rIGIvcGFja2FnZS9weXRo
b24tZGJ1cy1mYXN0L3B5dGhvbi1kYnVzLWZhc3QubWsKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi5kZTcwNDliYTIyCj4gPiAtLS0gL2Rldi9udWxsCj4gPiAr
KysgYi9wYWNrYWdlL3B5dGhvbi1kYnVzLWZhc3QvcHl0aG9uLWRidXMtZmFzdC5tawo+ID4gQEAg
LTAsMCArMSwxNiBAQAo+ID4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiArIwo+ID4gKyMg
cHl0aG9uLWRidXMtZmFzdAo+ID4gKyMKPiA+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4g
Kwo+ID4gK1BZVEhPTl9EQlVTX0ZBU1RfVkVSU0lPTiA9IDEuNjEuMQo+ID4gK1BZVEhPTl9EQlVT
X0ZBU1RfU09VUkNFID0gZGJ1c19mYXN0LSQoUFlUSE9OX0RCVVNfRkFTVF9WRVJTSU9OKS50YXIu
Z3oKPiA+ICtQWVRIT05fREJVU19GQVNUX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3Rl
ZC5vcmcvcGFja2FnZXMvZGQvZjQvYTI4MGQ0NmIxMTlkNTlmNmEzZDg0YWJmNDc0NDUyYWU3NjY1
MTU1OGIwOTYzYWI4YzQ4YWUxM2I1YTQ0Cj4gPiArUFlUSE9OX0RCVVNfRkFTVF9TRVRVUF9UWVBF
ID0gc2V0dXB0b29scwo+ID4gK1BZVEhPTl9EQlVTX0ZBU1RfTElDRU5TRSA9IE1JVAo+ID4gK1BZ
VEhPTl9EQlVTX0ZBU1RfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiA+ICtQWVRIT05fREJVU19G
QVNUX0VOViA9IFJFUVVJUkVfQ1lUSE9OPTEKPiA+ICtQWVRIT05fREJVU19GQVNUX0RFUEVOREVO
Q0lFUyA9IGhvc3QtcHl0aG9uLWN5dGhvbgoKWW91IHNob3VsZCBhZGQgdGhlc2UgdHdvIGxpbmVz
IHRvIHlvdXIgcGF0Y2ggdG8gZW5hYmxlIGN5dGhvbiBvcHRpbWl6ZWQgbW9kdWxlcy4KCj4gPiAr
Cj4gPiArJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQo+Cj4KPiAtLQo+IE1hcmNpbiBOaWVzdHLD
s2oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
