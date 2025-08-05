Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA792C87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 13:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3A4D61779;
	Tue,  5 Aug 2025 13:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAHQFR9JDs0W; Tue,  5 Aug 2025 13:13:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B242A61795
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B242A61795;
	Tue,  5 Aug 2025 13:13:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0E4A12C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 13:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE2D04080C
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 13:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2Wexb7QuW7p for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 13:13:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2D7F40749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2D7F40749
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2D7F40749
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 13:13:16 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b8de193b60so1546015f8f.0
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 06:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754399595; x=1755004395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vo3y+oXlNM6BV5GIqL1dYQ3EQf27urBWyCZw5WvSHOM=;
 b=YJuy2U+IhrMS9vuSlQMN2i0LDSzeg9d9xHR6oAWNBamfwK+9noDENVXbg3ZUvgONa9
 MYLhKz+gcAJKJXNiOMTVGwZwnNTbQEsJnimWjZba3vdhNLBgzKZ8X5etCEbcAXwYkRjQ
 frbiUqO+Oz4OfCGX6HEHEjnFYiFUJX4pk+IB0KIhGSB/cla9BuJEmMgDsySBF2WDEqj8
 AYu9Nn1FIfJBtQS6fAILC+MMq9wbYAQsqIWKUnu6Ay97Sve5S7J17UsC2uB3nBV2KCQ1
 yW86pZ1ajL6Jj6RXHESR0iFpQbeHFh0XagjAf3FEBI4iK0wjwugrre4+pwzR4P4PRaGA
 q9CA==
X-Gm-Message-State: AOJu0YyT6WchQuX+IriNGTgMCLa0JO134oMB433L5NcrQuTj4kwIT98A
 VFWNXVetgMcw/pJKclfiswOlGqPBpd0VF9lPxNS8+JYvTCRoLQZGQgfdTkPWPvhTyTC9nH+78YA
 Nc8JAPbaBI7zc5W/2uiV/PPkHprHMBFI=
X-Gm-Gg: ASbGncsFJMU0JM7VaZvd1xK1bwMuQ/Zqgk8CHD6//PqA1M1pCQFv3HvWf16laJPtwa7
 gKRE/rGxLX+bwTckFekqMz2fs6zAUas/Dz36Rp1UPmKDn+fK6EL2o1lEIXGyn/Wvzhr+9Bbgqji
 64ZvocV2izFkcHAc8L06qN7h2OXSZ1JBPGonkg0etZn9083ACyt7KedzLvkte0xPbJOY8qisO0P
 zZMmtY0
X-Google-Smtp-Source: AGHT+IFBVDZQYeYbgwM3kuTk1Fhu4/jI16hVzFiRrBJOvmZtS/srxpw+UnUlX7hihiQuYLhKsyvIoPVXcmktSX2KRCo=
X-Received: by 2002:a05:6000:400a:b0:3a6:d93e:5282 with SMTP id
 ffacd0b85a97d-3b8d94ca91bmr8136092f8f.59.1754399594386; Tue, 05 Aug 2025
 06:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250805024222.247903-1-Mr.Bossman075@gmail.com>
 <SA1PR12MB5615FCBAADC904C28ECC3D36F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
In-Reply-To: <SA1PR12MB5615FCBAADC904C28ECC3D36F022A@SA1PR12MB5615.namprd12.prod.outlook.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Tue, 5 Aug 2025 09:12:38 -0400
X-Gm-Features: Ac12FXxeQZI8ckUcbLMVI7wSJv9c8_hQfVYBD9_p7UtpZiJUoqUo0hEYHlAtumU
Message-ID: <CAJFTR8QFBJO4yd_AW+rcEJPcme_M6dbrOWFwaFNUp_b8AcsECQ@mail.gmail.com>
To: "Frager, Neal" <neal.frager@amd.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Arnout Vandecappelle <arnout@mind.be>, Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754399595; x=1755004395; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vo3y+oXlNM6BV5GIqL1dYQ3EQf27urBWyCZw5WvSHOM=;
 b=QY9Jsu4StWIPgvJjti5RoqhWhLHJNDw3R2Aq8y8FrrI0Qqk5TIwl/9WnJ/DqKlM9r9
 kR4RQ/mD7tIgCTlmLTDSE/RmZTnVQ31rYXt143UH7DXs0ghy0KLdNe5ft/duDdgx1J3O
 15IpOp1rvl213NUZFrNfqZg2g9UwHGJKAXoLBk/kvjJZGwPsjFQK4VjRgIgI1e9o3doz
 bcIYXzeARv0gKXd61/K4wBOeKdSN6K7hctvlvafYVNCSr/KrJBDf0AYS722V0yvCbKTc
 3DlY2fykUtXz1GrEqp9jFbrrWvFCD2NPConN1F+V8jjDur4WCde8B0zusBos4sxCYWvN
 pyOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QY9Jsu4S
Subject: Re: [Buildroot] [PATCH] package/gcc-bare-metal: Add extra options
 to bare-metal gcc
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

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCAxMjoxMOKAr0FNIEZyYWdlciwgTmVhbCA8bmVhbC5mcmFn
ZXJAYW1kLmNvbT4gd3JvdGU6Cj4KPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVy
bmFsIERpc3RyaWJ1dGlvbiBPbmx5XQo+Cj4gSGkgSmVzc2UsCj4KPiA+IFVzZXJzIG1heSB3YW50
IHRvIGFkZCBleHRyYSBvcHRpb25zIHRvIHRoZSBiYXJlLW1ldGFsIGdjYwo+ID4gY29uZmlndXJh
dGlvbiwgc3VjaCBhcyBhIGRlZmF1bHQgYWJpLiBBZGQgYSBuZXcgb3B0aW9uIHRvCj4gPiBhbGxv
dyB0aGlzLCBzaW1pbGFyIHRvIHRoZSBleGlzdGluZyBvbmUgZm9yIHRoZSByZWd1bGFyIGdjYy4K
Pgo+ID4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUgPE1yLkJvc3NtYW4wNzVAZ21haWwuY29t
Pgo+Cj4gVGhhbmsgeW91IGZvciBjb250cmlidXRpbmcgdG8gdGhlIGJhcmUtbWV0YWwgdG9vbGNo
YWluIQo+Cj4gUmVnYXJkaW5nIHRoZSBkZWZhdWx0IGFiaSBvcHRpb24sIEkganVzdCBoYXZlIHR3
byBxdWVzdGlvbnMgYWJvdXQgdGhhdC4KPgo+IDEuIElmIHlvdSBjaGFuZ2UgdGhlIGdjYyBkZWZh
dWx0IGFiaSBvcHRpb24sIGRvZXNuJ3QgdGhlIG5ld2xpYiBhYmkgb3B0aW9uCj4gYWxzbyBuZWVk
IHRvIGNoYW5nZT8KCkkgY291bGQgbm90IGZpZ3VyZSBvdXQgaG93IHRvIHNldCB0aGUgZGVmYXVs
dCBBQkkgdGhhdCBuZXdsaWIgdXNlcwp3aXRob3V0IHNldHRpbmcgbXVsdGlsaWIuClRoZSBzb2x1
dGlvbiBJIGZvdW5kIHdhcyB0byBzZXQgdGhlIEFCSSBvbiBnY2Mgd2l0aCBgLS13aXRoLWFiaT1g
IGxpa2UKdGhlIG90aGVyIHRvb2xjaGFpbnMgZG8uClRoaXMgZG9lcyBjaGFuZ2UgdGhlIEFCSSB0
aGF0IG5ld2xpYiB1c2VzLCB3aXRob3V0IHRoZSBuZWVkIGZvciBtdWx0aWxpYi4KCj4KPiAyLiBU
aGUgYWJpIG5hbWVzIGFyZSBkaWZmZXJlbnQgZnJvbSBhcmNoIHRvIGFyY2gsIHNvIGlmIHdlIGhh
dmUgYSBzdHJpbmcgb2YKPiBiYXJlLW1ldGFsIHRvb2xjaGFpbnMsIHRoaXMgb3B0aW9uIHdpbGwg
bm90IHdvcmsgYmVjYXVzZSBhIHZhbGlkIGFiaSBmb3Igb25lCj4gYXJjaCB3aWxsIGJlIGludmFs
aWQgZm9yIGFub3RoZXIuICBJZiB5b3Ugb25seSBuZWVkIHRoaXMgY29uZmlnIGZvciB0aGUKPiBk
ZWZhdWx0IGFiaSwgY291bGQgbXkgbXVsdGlsaWIgcGF0Y2ggYmVsb3cgYmUgYSBzb2x1dGlvbiBm
b3IgeW91PwoKWWVzLCBpdCBkb2VzIHNvbHZlIG15IHByb2JsZW0sIHRob3VnaCBpdCBzaWduaWZp
Y2FudGx5IGluY3JlYXNlcyB0aGUKY29tcGlsZSB0aW1lLgoKVGhlIHByb2JsZW0gdGhhdCBJIGVu
Y291bnRlcmVkIGlzIHRoYXQgdGhlIGRlZmF1bHQgQUJJIGZvciByaXNjdjMyIGlzCmlscDMyZCwg
c28gbmV3bGliIHVzZXMgdGhhdCBBQkkgZXZlbiB0aG91Z2ggbXkgQ1BVIGRvZXNuJ3QgaGF2ZQpm
bG9hdGluZyBwb2ludCBzdXBwb3J0LiBJIHdhcyBnb2luZyB0byBzZW5kIGEgcGF0Y2ggdG8gc2V0
IHRoZSBkZWZhdWx0CkFCSSwgQVJDSCwgZXRjIHRvIG1hdGNoIHRoYXQgb2YgdGhlIHRhcmdldCwg
YnV0IGFzIHlvdSBtZW50aW9uZWQsIGZvcgptdWx0aXBsZSBvciBkaWZmZXJpbmcgYXJjaGl0ZWN0
dXJlcyBvciBBQklzIHRoYXQgd291bGRuJ3Qgd29yay4KCj4KPiBodHRwczovL3BhdGNod29yay5v
emxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUwNjE5MTU0ODExLjkzNjI2NS0x
LW5lYWwuZnJhZ2VyQGFtZC5jb20vCj4KPiA+IC0tLQo+ID4gcGFja2FnZS9nY2MtYmFyZS1tZXRh
bC9nY2MtYmFyZS1tZXRhbC5tayAgICAgICAgICAgfCAzICsrLQo+ID4gdG9vbGNoYWluL3Rvb2xj
aGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC9Db25maWcuaW4gfCA4ICsrKysrKysrCj4gPiAyIGZp
bGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+ID4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsgYi9wYWNrYWdl
L2djYy1iYXJlLW1ldGFsL2djYy1iYXJlLW1ldGFsLm1rCj4gPiBpbmRleCAxNzIzMmE4ZWYxLi5l
NzI5MGExMWJmIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFy
ZS1tZXRhbC5tawo+ID4gKysrIGIvcGFja2FnZS9nY2MtYmFyZS1tZXRhbC9nY2MtYmFyZS1tZXRh
bC5tawo+ID4gQEAgLTUzLDcgKzUzLDggQEAgSE9TVF9HQ0NfQkFSRV9NRVRBTF9DT05GX09QVFMg
PSBcCj4gPiAgICAgICAtLXdpdGgtZ21wPSQoSE9TVF9ESVIpIFwKPiA+ICAgICAgIC0td2l0aC1t
cGM9JChIT1NUX0RJUikgXAo+ID4gICAgICAgLS13aXRoLW1wZnI9JChIT1NUX0RJUikgXAo+ID4g
LSAgICAgLS13aXRoLWlzbD0kKEhPU1RfRElSKQo+ID4gKyAgICAgLS13aXRoLWlzbD0kKEhPU1Rf
RElSKSBcCj4gPiArICAgICAkKGNhbGwgcXN0cmlwLCQoQlIyX0VYVFJBX0dDQ19CQVJFX01FVEFM
X0NPTkZfT1BUSU9OUykpCj4KPiA+IGRlZmluZSBIT1NUX0dDQ19CQVJFX01FVEFMX0NPTkZJR1VS
RV9DTURTCj4gPiAgICAgICAkKGZvcmVhY2ggYXJjaF90dXBsZSwgJChUT09MQ0hBSU5fQkFSRV9N
RVRBTF9CVUlMRFJPT1RfQVJDSF9UVVBMRSksIFwKPiA+IGRpZmYgLS1naXQgYS90b29sY2hhaW4v
dG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290L0NvbmZpZy5pbiBiL3Rvb2xjaGFpbi90b29s
Y2hhaW4tYmFyZS1tZXRhbC1idWlsZHJvb3QvQ29uZmlnLmluCj4gPiBpbmRleCAxOWM5NzQxMGM2
Li44OWIwYTk4ZmRkIDEwMDY0NAo+ID4gLS0tIGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1l
dGFsLWJ1aWxkcm9vdC9Db25maWcuaW4KPiA+ICsrKyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tYmFy
ZS1tZXRhbC1idWlsZHJvb3QvQ29uZmlnLmluCj4gPiBAQCAtMTIsNiArMTIsMTQgQEAgY29uZmln
IEJSMl9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1RfQVJDSAo+ID4gICAgICAgICBtZXRh
bCB0b29sY2hhaW4sIHVzZSB0aGUgZm9sbG93aW5nIGRlZmluaXRpb246Cj4gPiAgICAgICAgICJt
aWNyb2JsYXplZWwtYnVpbGRyb290LWVsZiByaXNjdjMyLWJ1aWxkcm9vdC1lbGYiCj4KPiA+ICtj
b25maWcgQlIyX0VYVFJBX0dDQ19CQVJFX01FVEFMX0NPTkZfT1BUSU9OUwo+Cj4gSSBiZWxpZXZl
IHRoZSBuYW1pbmcgY29udmVudGlvbiBzaG91bGQgYmU6Cj4gQlIyX0hPU1RfR0NDX0JBUkVfTUVU
QUxfRVhUUkFfQ09ORl9PUFRJT05TCj4KPiBUaGlzIHdheSBhbGwgb3B0aW9ucyBoYXZlIGZvcm1h
dCBCUjJfPHBhY2thZ2VfbmFtZT5fPG9wdGlvbl9uYW1lPi4KPgo+IEFsc28sIHNpbmNlIHRoaXMg
b3B0aW9uIGlzIHNwZWNpZmljIHRvIGdjYy1iYXJlLW1ldGFsIGFuZCBub3QgdGhlIG90aGVyCj4g
cGFja2FnZXMgaW5jbHVkZWQgYnkgdG9vbGNoYWluLWJhcmUtbWV0YWwtYnVpbGRyb290LCBJIHRo
aW5rIHRoaXMgb3B0aW9uCj4gd291bGQgYmVsb25nIGluIGEgbmV3IGZpbGUgY2FsbGVkOgo+IC4u
L3BhY2thZ2UvZ2NjLWJhcmUtbWV0YWwvQ29uZmlnLmluLmhvc3QKPgo+IGluc3RlYWQgb2Y6Cj4g
IC4udG9vbGNoYWluL3Rvb2xjaGFpbi1iYXJlLW1ldGFsLWJ1aWxkcm9vdC9Db25maWcuaW4KCk9r
LCB3aWxsIHNlbmQgVjIgd2Fzbid0IHN1cmUgYWJvdXQgdGhlc2UgdHdvIGlzc3VlcywgYXMgdGhl
IGJ1aWx0LWluCnRvb2xjaGFpbiBkb2VzCml0IGxpa2UgdGhpcywgbm90IHRoZSB0eXBpY2FsIGZv
cm1hdC4KCj4KPiA+ICsgICAgIHN0cmluZyAiQWRkaXRpb25hbCBiYXJlLW1ldGFsIGdjYyBvcHRp
b25zIgo+ID4gKyAgICAgZGVmYXVsdCAiIgo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBBbnkg
YWRkaXRpb25hbCBiYXJlLW1ldGFsIGdjYyBjb25maWd1cmUgb3B0aW9ucyB5b3UKPiA+ICsgICAg
ICAgbWF5IHdhbnQgdG8gaW5jbHVkZS4gQWZmZWN0cyBhbCBhcmNoaXRlY3R1cmUgdHVwbGVzCgpB
bHNvIHdpbGwgZml4IHRoaXMgdHlwby4uLgoKVGhhbmtzLApKZXNzZSBUYXViZQoKPiA+ICsgICAg
ICAgc3BlY2lmaWVkIGluIEJSMl9UT09MQ0hBSU5fQkFSRV9NRVRBTF9CVUlMRFJPT1RfQVJDSC4K
PiA+ICsKPiA+IHNvdXJjZSAicGFja2FnZS9uZXdsaWItYmFyZS1tZXRhbC9Db25maWcuaW4iCj4K
PiA+IGVuZGlmICMgQlIyX1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVAo+ID4gLS0KPiA+
IDIuNDkuMAo+Cj4gVGhhbmtzIGFnYWluIGZvciBjb250cmlidXRpbmchCj4KPiBCZXN0IHJlZ2Fy
ZHMsCj4gTmVhbCBGcmFnZXIKPiBBTUQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
