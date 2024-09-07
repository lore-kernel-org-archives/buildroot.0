Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC66ECE56F
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 21:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB90560644;
	Sat,  7 Sep 2024 21:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxogI1rb-p76; Sat,  7 Sep 2024 21:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE53F60676
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE53F60676;
	Sat,  7 Sep 2024 21:28:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE3EB1BF41F
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8E8460676
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 21:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HsNV6ks-zTk2 for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 21:28:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A774A60644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A774A60644
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A774A60644
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 21:28:12 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-49bc42bec6dso866201137.0
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 14:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725744491; x=1726349291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n6yNwdI3CTVBvQq/blOyBZ7RS867RCK55kDrTgyWDWA=;
 b=ucWJG7AR5SEYY0HoElSqWwKUIKHciGWkSr+8ZhD5WwlY0t2HOY+jNkvRxQf6X2eEDy
 zkx+KYC5Md0xbrRSG7KtvtjBhJ6BMLOwFyBj2w7Q7+VUxwB4+H4sNb29t3Jy7x9VoUYD
 BbxNWoWv0mNJQ+5DW8LZHg2LgJse9fGLwRTOUAFLiMHiRY1rVSrAvjltx1Pikg+sAKT8
 BHH2IR4yZM2LfLZCZvNyxQs+ymcdyffuhJ/YTRhMpled9Xzg2cggGt5g0vKR6iRkshjr
 z6Ky2DntdVsTRjhC4PJyYgbJ+T0c+BWBAA9WO15FSuUTxVUH6YF/cx0QNAp4jISJSSkz
 nMGg==
X-Gm-Message-State: AOJu0Ywv5NW9kAb96cC1A0uWJCbKC0wmdTk8b1dI/Pa6AjsRIl7Z+F35
 5N3IbAY2ocr+Ug+ojevtgvdIbMtdUblaMG4B7Fl+kiD9ENgWJZwE/Dy1g4JWkVI5sVc95dQyWXK
 blKdEGns8UnaXDSXRJcSckDhpWUaH0HUK
X-Google-Smtp-Source: AGHT+IGJ///Iv7m5PEPJh071j2cdkhcQWBLAW75jPP2o7rK9ZoqDu4rFrh4xnjePBztbJf7mrGAYmnGom13Qf+rBSSg=
X-Received: by 2002:a05:6102:c8d:b0:492:a9f8:4a71 with SMTP id
 ada2fe7eead31-49bde144522mr6971447137.8.1725744491221; Sat, 07 Sep 2024
 14:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240719045639.3336541-1-james.hilliard1@gmail.com>
 <Zty3kl18c4yV2fVt@landeda>
In-Reply-To: <Zty3kl18c4yV2fVt@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 7 Sep 2024 15:28:00 -0600
Message-ID: <CADvTj4ocAGx3muDBPfNZFK3thDeiwqCZG2ZhCjFMZHEraP2Tkg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725744491; x=1726349291; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n6yNwdI3CTVBvQq/blOyBZ7RS867RCK55kDrTgyWDWA=;
 b=OnSX2F6dMm2g00CccIjsoeVBD6CMp5ldR1kf0WTvHGCobgXTKyJ4diDdGYc4+GXT5x
 +YdWAp0oeoUhsAuToaBx1Hfu474RHHqk9ATbK0UpOtU8Cy4Trutnk2U1KL9dWod6zLEg
 F2+Y5YJUNEphYXyLD/yYYlE5CAkRcA6eFCZQ8IRzU0k9c6uN6mn2KSw8GWJIhOi485bR
 BK+dWa6MhYUmdssm2agmuQxt7T04qPJd9nAnOTwqYcEzuk+cpAbX5U5jIChvqN8n7oqL
 9ltwJyKa9kT3fzkUuyq6H0CAx+/wvXqbCexBXck3Tzp4L2q1+NAnWC4l4euyc5mbXr87
 yp4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OnSX2F6d
Subject: Re: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 1.7.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBTZXAgNywgMjAyNCBhdCAyOjI54oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gSmFtZXMsIGFsbCwKPgo+IE9uIDIwMjQtMDctMTgg
MjI6NTYgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gLS0tCj4g
PiAgcGFja2FnZS9weXRob24tbWF0dXJpbi9weXRob24tbWF0dXJpbi5oYXNoIHwgMiArLQo+ID4g
IHBhY2thZ2UvcHl0aG9uLW1hdHVyaW4vcHl0aG9uLW1hdHVyaW4ubWsgICB8IDcgKysrLS0tLQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1tYXR1cmluL3B5dGhvbi1tYXR1cmluLmhh
c2ggYi9wYWNrYWdlL3B5dGhvbi1tYXR1cmluL3B5dGhvbi1tYXR1cmluLmhhc2gKPiA+IGluZGV4
IDk4MDcyNjBlYmQuLjNjNWY4MzZhZDUgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1t
YXR1cmluL3B5dGhvbi1tYXR1cmluLmhhc2gKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLW1hdHVy
aW4vcHl0aG9uLW1hdHVyaW4uaGFzaAo+ID4gQEAgLTEsNSArMSw1IEBACj4gPiAgIyBMb2NhbGx5
IGNhbGN1bGF0ZWQgYWZ0ZXIgdmVuZG9yaW5nCj4gPiAtc2hhMjU2ICA1M2Q1MWY1ZTJkZWNjYTlh
ZjI0ODc0ODY4NGFlZmE5MjQ1OTEwNzU3ZjE5YWUxNDdkY2Y1NjYxNzJlY2IwOTA3ICBweXRob24t
bWF0dXJpbi0xLjQuMC1jYXJnbzIudGFyLmd6Cj4gPiArc2hhMjU2ICA1NmMxOGIwOWQzODA4MGY5
OTc1ZmI2NzliZTFmZGEwMWI5MzZkMjFmNWVmMjMzOTY3Y2RhM2RkNzQ5MDVlNjgzICBtYXR1cmlu
LTEuNy4wLnRhci5nego+ID4gICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4g
PiAgc2hhMjU2ICBhNjBlZWE4MTc1MTQ1MzE2NjhkN2UwMDc2NTczMTQ0OWZlMTRkMDU5ZDMyNDll
MGJjOTNiMzZkZTQ1Zjc1OWYyICBsaWNlbnNlLWFwYWNoZQo+ID4gIHNoYTI1NiAgZWE3ODgyYzU1
OTczMzc2NmFkMDgzNDNiZGUxZDFlYzgwYTQ5NjdjMDNhNzM4ZmI4ZTAwNThlZjYyODlmN2I3YyAg
bGljZW5zZS1taXQKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1tYXR1cmluL3B5dGhv
bi1tYXR1cmluLm1rIGIvcGFja2FnZS9weXRob24tbWF0dXJpbi9weXRob24tbWF0dXJpbi5tawo+
ID4gaW5kZXggMzc0NzlkZDdlNy4uNzBjZGIxNTk0OSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2Uv
cHl0aG9uLW1hdHVyaW4vcHl0aG9uLW1hdHVyaW4ubWsKPiA+ICsrKyBiL3BhY2thZ2UvcHl0aG9u
LW1hdHVyaW4vcHl0aG9uLW1hdHVyaW4ubWsKPiA+IEBAIC00LDEwICs0LDkgQEAKPiA+ICAjCj4g
PiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+Cj4gPiAtUFlUSE9OX01BVFVSSU5fVkVSU0lP
TiA9IDEuNC4wCj4gPiAtUFlUSE9OX01BVFVSSU5fU09VUkNFX1BZUEkgPSBtYXR1cmluLSQoUFlU
SE9OX01BVFVSSU5fVkVSU0lPTikudGFyLmd6Cj4gPiAtUFlUSE9OX01BVFVSSU5fU0lURV9QWVBJ
ID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzIwLzkwLzQzYTNhYTM1
ZjAzN2U5MTU4MmVjNzUxNmE5MjA4NGE3MWY4NGU4OWUzOWVmNTgwODEzYmVkMDcyYjE1NAo+ID4g
LVBZVEhPTl9NQVRVUklOX1NJVEUgPSAkKFBZVEhPTl9NQVRVUklOX1NJVEVfUFlQSSkvJChQWVRI
T05fTUFUVVJJTl9TT1VSQ0VfUFlQSSk/YnVpbGRyb290LXBhdGg9ZmlsZW5hbWUKPgo+IFRoaXMg
Y2hhbmdlIGlzIGluY29ycmVjdDogaXQgZHJvcHMgdGhlIGhhY2sgd2UgaGF2ZSB0byBlbnN1cmUg
d2UgY2FuCj4gaGF2ZSBvdXIgLWNhcmdvMiBwb3N0LXZlcnNpb24gc3VmZml4IGFwcGVuZGVkIHRv
IGFyY2hpdmUgZmlsZW5hbWUsIGFzCj4gZG9uZSBpbiBjb21taXQgYzYxN2ViYmM5NzdkLgo+Cj4g
UGxlYXNlLCBjYXJlZnVsbHkgcHJlcGFyZSB5b3VyIGNoYW5nZXMsIGVzcGVjaWFsbHkgd2hlbiB0
aGVyZSBhcmUKPiBjaGFuZ2VzIHRoYXQgYXJlIHNvIHVudXN1YWwgbGlrZSB0aG9zZSB3ZWlyZCBf
U0lURV9QWVBJIGFuZCBfU09VUkNFX1BZUEkKPiB2YXJpYWJsZXNzIHRoYXQgYXJlIG5vdCB1c3Vh
bGx5IHBhcnQgb2Ygb3VyIHB5dGhvbiBwYWNrYWdlcy4gVGhhdCBzaG91bGQKPiByZWFsbHkgaGF2
ZSB0cmlnZ2VyZWQgYSB3YXJuaW5nIHdoZW4gcHJlcGFyYWluZyB0aGUgcGF0Y2guLi4KClJlYXBw
bGllZCB0aGUgY2FyZ28yIHZlcnNpb24gaGFjayBmb3IgMS43LjE6Cmh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA5MDcyMTE2MzguOTQ1NTQy
LTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9S
SU4uCj4KPiA+ICtQWVRIT05fTUFUVVJJTl9WRVJTSU9OID0gMS43LjAKPiA+ICtQWVRIT05fTUFU
VVJJTl9TT1VSQ0UgPSBtYXR1cmluLSQoUFlUSE9OX01BVFVSSU5fVkVSU0lPTikudGFyLmd6Cj4g
PiArUFlUSE9OX01BVFVSSU5fU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9w
YWNrYWdlcy84MC9kYS9hNGJiZDZlOTdmMzY0NWY0ZWJkNzI1MzIxYWEyMzVlMjJlMzEwMzdkZmQ5
MmNhZjQ1MzlmNzIxYzBhNWEKPiA+ICBQWVRIT05fTUFUVVJJTl9TRVRVUF9UWVBFID0gc2V0dXB0
b29scy1ydXN0Cj4gPiAgUFlUSE9OX01BVFVSSU5fTElDRU5TRSA9IEFwYWNoZS0yLjAgb3IgTUlU
Cj4gPiAgUFlUSE9OX01BVFVSSU5fTElDRU5TRV9GSUxFUyA9IGxpY2Vuc2UtYXBhY2hlIGxpY2Vu
c2UtbWl0Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
PiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJC
T04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUg
IERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCAr
MzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwg
IFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBf
LypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
