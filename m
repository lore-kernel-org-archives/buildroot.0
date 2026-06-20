Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61B5CD98F2
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 874D36FA88;
	Sat, 20 Jun 2026 09:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EiAYQhr4QmUs; Sat, 20 Jun 2026 09:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 922E36FA92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781948431;
	bh=ixNL8Jqk7ZS0+SDd+UQvOkPSmAghy3TfTiq6U1BnUD4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rCpw/lrZWAtqa09gkPbLxwTXb/SPZEtH+mFAOukM+ems30shYI1cKLwDi4mPMNLzQ
	 C9G4bd4T3BlposW+VkCO0a68a3bopVDuIUgdkzeqdTQSSOQrFlcA6MjWUXvSp1eRdH
	 70/3wgXLsSv2SBTU7rvmRRhI6ZxDleke5vLHHePZKktqGuEvMDx2+pUwMVh8pWQ/mQ
	 EHXektg+c4F2v3iVrSr+JdeYyDTfnJZaXO0C0q93NCnMk78rrLyQsIA96daUA/yf7B
	 Mn8cc/Vf9CsoEZ+tukaLUoKyV8WXllMDEjkuAEA5MF5RTA5B0dxj14tb9w8izTyWJE
	 kYJ6a5ky8qmUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 922E36FA92;
	Sat, 20 Jun 2026 09:40:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 25F6F367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BD4485027
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fx3wMebyHAty for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C659E84FE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C659E84FE4
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C659E84FE4
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:40:27 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso39731555e9.2
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781948425; x=1782553225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wfyPEsaoXwPy+SaqgepRl2H3JDKkAph09tdcKj/VWtE=;
 b=gw7t62eNESbMVEkmyru9npRDeUrSzyRVXPd25pX2A/XVQWufL0sIaF3D4Q8VgJsEZs
 HFOG2mhjPM1vKvg9JoamqIiBLXS3y+LKa/53hv7pRDim72Q5RoD/OFiE9XEm8HvKsDHO
 Xbjt6ZiUNqgs5Y/qzA43A7+cYFyHRPIFb1Jk286Q1v2RP6GhGDEBo5nnNco7JOV9Vs9g
 QbCe9yp2JhL/DOnn5fD5VzbLMNnPkKhfcDAJ4ALExlXRmMsJA3OmE4DEtuIbKBdOYHTb
 qPXMw/0N8qZuxN2hP1UInMXhuKsCNoBf7uf/cwTSvzM+e4Y4dZNXkK3uSW77dC9ySsPs
 GhvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+RXi00L7qzTnYx1PX8gCMDKUDXoRyJiLrPdT665Rs+NGzAJEHaEfWl1jwvFc8DFI96jWvFt5UuUO8=@buildroot.org
X-Gm-Message-State: AOJu0Yxfly9i+Sa3NyIlGBcpB59jqFInsIeY3wGgoBMLx8q87wWCmneI
 2escEXaRnMFLzSq6dK32K2Uv16TII4lqIJwdG0EGVa/sc6NYPb47dOZdO8BdIPDpTnI=
X-Gm-Gg: AfdE7cmmyBSGL7sUjjxOyFLUlk7rDd3vNFIWSiZiysEa+aXxOmFfna1oNmAkVnrbhPE
 /IE1xIYw5cuVxnCvV+RI6JC2ldaHoEv4kueOwDw13lC18AI5B6uBdIKzoHjAqutbVAQjQlZM/11
 ZRmAJxDvPkAk3D4Eek13qk6G9eNDEU8XCAXU/M1nGJpK6PKHRG4ZRFu0Kuv8XPg1+gcDZKs1vyb
 mz/d43ch3sGDozNwRO8s7cMZRrwRthBtQhIwi5dsRdaBJ9dT++8DyLXczzEdBZINmtnLG1urr1l
 v37ZbW3OzfUmPK+gnFSyGTHJuqNPOhKAzqYXn6YIrm/UUxvmHNe7ItQPgTGZwy0knjmW2GZk6Rs
 xj1fJGkUv4Pt1CYRP2SVOe5Z2ZlM6eiSibf62H0oEoZDaCWqCG4V17sdfFxRNfH5xoy249Et9/U
 dVt9jY
X-Received: by 2002:a05:600c:8b2b:b0:492:4a56:690b with SMTP id
 5b1f17b1804b1-4924a5669d3mr35399915e9.35.1781948425265; 
 Sat, 20 Jun 2026 02:40:25 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666c57afasm6817085f8f.29.2026.06.20.02.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:40:24 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 20 Jun 2026 11:39:50 +0200
Message-ID: <20260620094024.28845-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260619090027.3145553-1-peter@korsgaard.com>
References: <20260619090027.3145553-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781948425; x=1782553225; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wfyPEsaoXwPy+SaqgepRl2H3JDKkAph09tdcKj/VWtE=;
 b=Nkpi0UfYZIbwhWAyPdXDMr5sNHDwCtuMgEIr/S6vv7n3UqMFoFp3SsqKIGx/ghWyys
 2I0a1HJaEZm3wa4cVyKFO8UVwtyaU1HMjM1vKeRmzs/23/7+p4fIyH1QEkX06iCCafwK
 A/Mg3tANqgkS7sv4cmYnvHoBtx+731NUPmw9HETEH3WuqDcEUt4GbbZ3MWOvthoLOCcK
 oxhThVp9afrwwjMqDvoooCm4vc6dSHXdBg/eIQyTjqvxQ96QA/YLmr33mkV+x0U3qLeK
 23sb2m3LWjW0SyhBk91S/x4ecR6KcUNwPPdcoahVbteoAuDose7o+j/Sqz+Y7oI5uMpu
 +BRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Nkpi0UfY
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: fixup scp-style
 git sites
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

SGkgUGV0ZXIsCgpJbiByZXBseSBvZjoKPiBDb21taXQgZThjNTRmZmIzZCAoInV0aWxzL2dlbmVy
YXRlLWN5Y2xvbmVkeDogZ2VuZXJhdGUgdmNzCj4gZXh0ZXJuYWxSZWZlcmVuY2VzIGZvciBzb3Vy
Y2UgcmVwb3MiKSBhZGRlZCBleHRlcm5hbFJlZmVyZW5jZXMgdG8gdGhlIHNvdXJjZQo+IGNvZGUg
b2YgcGFja2FnZXMuCj4gCj4gVGhpcyB1bmZvcnR1bmF0ZWx5IGNhdXNlcyBpc3N1ZXMgd2l0aCBw
YWNrYWdlcyAoaW4gYnIyLWV4dGVybmFsKSBmZXRjaGluZwo+IGZyb20gZ2l0IHVzaW5nIHRoZSBz
Y3AtbGlrZSBzeW50YXgsIEUuRy46Cj4gCj4gIEZPT19TSVRFX01FVEhPRCA9IGdpdAo+ICBGT09f
U0lURSA9IGdpdEBnaXRodWIuY29tOjxwcm9qZWN0Pi88cmVwbz4uZ2l0Cj4gCj4gV2hpY2ggZW5k
cyB1cCBpbiB0aGUgU0JPTSBhczoKPiAKPiBbCj4gICB7Cj4gICAgICJ0eXBlIjogInZjcyIsCj4g
ICAgICJ1cmwiOiAiZ2l0QGdpdGh1Yi5jb206PHByb2plY3Q+LzxyZXBvPi5naXQiLAo+ICAgICAi
Y29tbWVudCI6ICJnaXQgcmVwb3NpdG9yeSIKPiAgIH0KPiBdCj4gCj4gVGhpcyAoY29ycmVjdGx5
KSBjYXVzZXMgRGVwZW5kZW5jeSB0cmFjayB0byByZWplY3QgdGhlIFNCT00gaW1wb3J0IHdpdGg6
Cj4gCj4gewo+ICAgInN0YXR1cyI6IDQwMCwKPiAgICJ0aXRsZSI6ICJUaGUgdXBsb2FkZWQgQk9N
IGlzIGludmFsaWQiLAo+ICAgImRldGFpbCI6ICJTY2hlbWEgdmFsaWRhdGlvbiBmYWlsZWQiLAo+
ICAgImVycm9ycyI6IFsKPiAgICAgIiQuY29tcG9uZW50c1syXS5leHRlcm5hbFJlZmVyZW5jZXNb
MF0udXJsOiBkb2VzIG5vdCBtYXRjaCB0aGUgaXJpLXJlZmVyZW5jZSBwYXR0ZXJuIG11c3QgYmUg
YSB2YWxpZCBSRkMgMzk4NyBJUkktcmVmZXJlbmNlIiwKPiAgICAgIiQuY29tcG9uZW50c1syXS5l
eHRlcm5hbFJlZmVyZW5jZXNbMF0udXJsOiBkb2VzIG5vdCBtYXRjaCB0aGUgaXJpLXJlZmVyZW5j
ZSBwYXR0ZXJuIG11c3QgYmUgYSB2YWxpZCBSRkMgMzk4NyBJUkktcmVmZXJlbmNlIiwKPiAgICAg
IiQuY29tcG9uZW50c1syXS5leHRlcm5hbFJlZmVyZW5jZXNbMF0udXJsOiBkb2VzIG5vdCBtYXRj
aCB0aGUgcmVnZXggcGF0dGVybiBedXJuOmNkeDpbMC05YS1mXXs4fS1bMC05YS1mXXs0fS1bMC05
YS1mXXs0fS1bMC05YS1mXXs0fS1bMC05YS1mXXsxMn0vWzEtOV1bMC05XSokIiwKPiAgICBdCj4g
fQo+IAo+IFRoZSBDeWNsb25lRFggc3BlYyBpbmRlZWQgcmVxdWlyZXMgYSBVUkk6Cj4gCj4gVGhl
IFVSSSAoVVJMIG9yIFVSTikgdG8gdGhlIGV4dGVybmFsIHJlZmVyZW5jZS4gIEV4dGVybmFsIHJl
ZmVyZW5jZXMgYXJlCj4gVVJJcyBhbmQgdGhlcmVmb3JlIGNhbiBhY2NlcHQgYW55IFVSTCBzY2hl
bWUgaW5jbHVkaW5nIGh0dHBzIChSRkMtNzIzMCksCj4gbWFpbHRvIChSRkMtMjM2OCksIHRlbCAo
UkZDLTM5NjYpLCBhbmQgZG5zIChSRkMtNDUwMSkKPiAKPiBodHRwczovL2N5Y2xvbmVkeC5vcmcv
ZG9jcy8xLjYvanNvbi8jbWV0YWRhdGFfdG9vbHNfb25lT2ZfaTBfY29tcG9uZW50c19pdGVtc19l
eHRlcm5hbFJlZmVyZW5jZXNfaXRlbXNfdXJsCj4gCj4gVGhlIHVzZXJAaG9zdDpwcm9qZWN0L3Jl
cG8uZ2l0IGlzIGEgZ2l0LXNwZWNpZmljIHNob3J0aGFuZCBmb3IgYSBnaXQtb3Zlci1zc2ggVVJM
LiBGcm9tIG1hbiBnaXQtY2xvbmU6Cj4gCj4gIEdpdCBzdXBwb3J0cyBzc2gsIGdpdCwgaHR0cCwg
YW5kIGh0dHBzIHByb3RvY29scyAoaW4gYWRkaXRpb24sIGZ0cCBhbmQgZnRwcwo+ICBjYW4gYmUg
dXNlZCBmb3IgZmV0Y2hpbmcsIGJ1dCB0aGlzIGlzIGluZWZmaWNpZW50IGFuZCBkZXByZWNhdGVk
OyBkbyBub3QgdXNlCj4gIHRoZW0pLgo+IAo+ICBUaGUgbmF0aXZlIHRyYW5zcG9ydCAoaS5lLiAg
Z2l0Oi8vIFVSTCkgZG9lcyBubyBhdXRoZW50aWNhdGlvbiBhbmQgc2hvdWxkCj4gIGJlIHVzZWQg
d2l0aCBjYXV0aW9uIG9uIHVuc2VjdXJlZCBuZXR3b3Jrcy4KPiAKPiAgVGhlIGZvbGxvd2luZyBz
eW50YXhlcyBtYXkgYmUgdXNlZCB3aXRoIHRoZW06Cj4gCj4gIOKAoiAgIHNzaDovL1t1c2VyQF1o
b3N0Lnh6Wzpwb3J0XS9wYXRoL3RvL3JlcG8uZ2l0Lwo+ICDigKIgICBnaXQ6Ly9ob3N0Lnh6Wzpw
b3J0XS9wYXRoL3RvL3JlcG8uZ2l0Lwo+ICDigKIgICBodHRwW3NdOi8vaG9zdC54els6cG9ydF0v
cGF0aC90by9yZXBvLmdpdC8KPiAg4oCiICAgZnRwW3NdOi8vaG9zdC54els6cG9ydF0vcGF0aC90
by9yZXBvLmdpdC8KPiAKPiAgQW4gYWx0ZXJuYXRpdmUgc2NwLWxpa2Ugc3ludGF4IG1heSBhbHNv
IGJlIHVzZWQgd2l0aCB0aGUgc3NoIHByb3RvY29sOgo+IAo+ICDigKIgICBbdXNlckBdaG9zdC54
ejpwYXRoL3RvL3JlcG8uZ2l0Lwo+IAo+IFNvIGNvbnZlcnQgdGhlIHNjcC1saWtlIHN5bnRheCB0
byBzc2g6Ly8gVVJMcyBpbiBwYXJzZV91cmlzKCkgZm9yIHNwZWMKPiBjb21wbGlhbmNlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KCkkg
c2VlIHRoYXQgImRvd25sb2FkcyIgc2VjdGlvbiBmcm9tICJzaG93LWluZm8iIGFyZSBub3QgdGVz
dGVkIG9uIHRoZQpnZW5lcmF0ZS1jeWNsb25lZHggdGVzdHMgeWV0LiBJIHdpbGwgYWRkIHRoaXMg
bGF0ZXIuCgpUaGFua3MgZm9yIHRoZSBkZXRhaWxsZWQgZGVzY3JpcHRpb24gIQoKQWNrZWQtQnk6
IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KCj4gLS0tCj4gIHV0aWxzL2dl
bmVyYXRlLWN5Y2xvbmVkeCB8IDYgKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4IGIvdXRpbHMv
Z2VuZXJhdGUtY3ljbG9uZWR4Cj4gaW5kZXggYmFkZTAxOGNkNC4uZGYxMmVlODRjMCAxMDA3NTUK
PiAtLS0gYS91dGlscy9nZW5lcmF0ZS1jeWNsb25lZHgKPiArKysgYi91dGlscy9nZW5lcmF0ZS1j
eWNsb25lZHgKPiBAQCAtMjgwLDYgKzI4MCwxMiBAQCBkZWYgcGFyc2VfdXJpcyh1cmlzOiBsaXN0
W3N0cl0pIC0+IEl0ZXJhdG9yW3R1cGxlW2xpc3Rbc3RyXSwgc3RyXV06Cj4gICAgICAgICAgc2No
ZW1lLCBfLCBzdHJpcHBlZF91cmkgPSB1cmkucGFydGl0aW9uKCIrIikKPiAgICAgICAgICBpZiBz
dHJpcHBlZF91cmk6Cj4gICAgICAgICAgICAgIHBhcnNlZCA9IHVybGxpYi5wYXJzZS51cmxwYXJz
ZShzdHJpcHBlZF91cmkpCj4gKwo+ICsgICAgICAgICAgICAjIGNvbnZlcnQgc2NwLXN0eWxlIGhv
c3Q6cGF0aCBzaXRlIHRvIHNzaDovLyB1cmkKPiArICAgICAgICAgICAgaWYgc2NoZW1lID09ICJn
aXQiIGFuZCBub3QgcGFyc2VkLnNjaGVtZToKPiArICAgICAgICAgICAgICAgIGhvc3QsIF8sIHBh
dGggPSBzdHJpcHBlZF91cmkucGFydGl0aW9uKCI6IikKPiArICAgICAgICAgICAgICAgIHN0cmlw
cGVkX3VyaSA9ICJzc2g6Ly8iICsgaG9zdCArICIvIiArIHBhdGgKPiArCj4gICAgICAgICAgICAg
IGlmIHBhcnNlZC5ob3N0bmFtZSAhPSAic291cmNlcy5idWlsZHJvb3QubmV0IjoKPiAgICAgICAg
ICAgICAgICAgIHlpZWxkIHNjaGVtZS5zcGxpdCgifCIpLCBzdHJpcHBlZF91cmkKPiAgCj4gLS0g
Cj4gMi40Ny4zCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
