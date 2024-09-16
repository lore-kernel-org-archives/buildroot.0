Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F981C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 14:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAA0E40BD1;
	Mon, 16 Sep 2024 14:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4CAaPvaWwjz; Mon, 16 Sep 2024 14:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD38B40462
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD38B40462;
	Mon, 16 Sep 2024 14:56:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19C571BF3B0
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 14:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16577804F5
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 14:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUv9jI0QzFni for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 14:56:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F411E8114A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F411E8114A
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F411E8114A
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 14:56:21 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-848b77c89e0so783560241.0
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 07:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726498580; x=1727103380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6eRhgvbj1nnGziJ7iftUX7ve32pyXnMSyuBFeIEkTRw=;
 b=PBpno3QIpGxwlQDHdCTKVmLW9Hcxetz7K4GrphLCgQ8+RubV50H8uJWsv0lztrnkJi
 xyAgW/XVNv9yiydEqhQpaUNcdy95Toqn/YCk2lG1lQwejp7gjLobaOhWJNfH6AL4ti9S
 o5HgM9WB5cdt2qn2LU97125zxpD5w3UjsNU6WTHykU1UHlS002YoVEq402xqiDjYIezk
 l1xAsOwAbsuVYjuk848O1XyyfBDMCqKxqIcp4Hr33KhYtfJRBcc5BuKKc1Vmpu0aC2NJ
 qprw+rK1HJcrH77zgx6qcF/qwMzS8HR3O3uTohh8dT9QvsowecgvpT2T+00kTDp781B1
 UmGg==
X-Gm-Message-State: AOJu0YyTBiNy79WGu2yRWG/kBSs6NxUfnwKB8XNLe9AnHhhSJ4Oj4QE6
 3JDANZKdKGAuVPhQFgg7a3AeM37YBJd2Mkmwl2qWWeKhzgD31hx1Cgz6Vjhv6/W+LzYG11ddYYh
 myjvMPEUTixLQUHbah8Ws8TqxWyc=
X-Google-Smtp-Source: AGHT+IHV51wzpn15qIdHfhRpnJniT3JZCc+D1tApuDSWXfbdGKczbp+K8xHvJDacy33vPUOWs1gbxc++oez+OqnS7I8=
X-Received: by 2002:a05:6102:374f:b0:497:50c0:a6cb with SMTP id
 ada2fe7eead31-49d4f6b5b87mr8027603137.19.1726498580389; Mon, 16 Sep 2024
 07:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240915210214.1603251-1-james.hilliard1@gmail.com>
 <Zuf-iqFoHtIMwdcm@landeda>
In-Reply-To: <Zuf-iqFoHtIMwdcm@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Sep 2024 08:56:08 -0600
Message-ID: <CADvTj4os=4W1EY9OKjYPFKQ1G_gZ6ZU+yhwDPBZFjPTn6deJHQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726498580; x=1727103380; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6eRhgvbj1nnGziJ7iftUX7ve32pyXnMSyuBFeIEkTRw=;
 b=ToM9qPKuKTt97FoMZAZaEOK/qGkJQm1NeLwjRRCeeAEsV0FbfCYYrTKC+FWwQSDkiL
 VTnAkiRHAgBZ/CxrcwMV4GLgl2TKtlocPFktyecIPnRjEnGPq+EmjNtGnQ1vRpTtE3au
 kFRablCa7V3qyzHZ9Q5rrdNHRBB9OXc3ch27BpB962triyZHKyQkKjgUE+CWzT14iXTz
 cbROkF0FkhZueKdMqhlrJFsMfIPdgD738/cRE+wJHUHJrhvUy8kJSv1qVGkhR11IfDhP
 4AqlCEw+Obt8RVBV5DzuBP2DPQktHfwicv0O32Jv2c528lGKpUyYIFXDAoCHdXbxMx53
 2qDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ToM9qPKu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-lark: bump to version
 1.2.2
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

T24gTW9uLCBTZXAgMTYsIDIwMjQgYXQgMzo0NuKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI0LTA5LTE1
IDE1OjAyIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBWZXJpZmllZCBs
aWNlbnNlIHJlbWFpbnMgTUlUIGFmdGVyIGhhc2ggY2hhbmdlZC4KPgo+IE9LLCBncmVhdCwgYnV0
IHdoYXQgd2FzIHRoZSBhY3R1YWwgY2hhbmdlLCB0aGVuPwoKTm90IHN1cmUsIHByb2JhYmx5IGxp
bmUgZW5kaW5ncyBvciBzb21lIGZvcm1hdHRpbmcgbGlrZSB0aGF0CndoaWNoIHdhc24ndCBzaG93
aW5nIHVwIGluIGdpdC4KCj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgcGFja2FnZS9weXRob24tbGFyay9weXRob24tbGFyay5oYXNoIHwgNiArKystLS0K
PiA+ICBwYWNrYWdlL3B5dGhvbi1sYXJrL3B5dGhvbi1sYXJrLm1rICAgfCA0ICsrLS0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tbGFyay9weXRob24tbGFyay5oYXNoIGIvcGFja2Fn
ZS9weXRob24tbGFyay9weXRob24tbGFyay5oYXNoCj4gPiBpbmRleCA5ZWE3NzhjOGRhLi4zNWVl
ODQyYTRhIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9weXRob24tbGFyay9weXRob24tbGFyay5o
YXNoCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1sYXJrL3B5dGhvbi1sYXJrLmhhc2gKPiA+IEBA
IC0xLDUgKzEsNSBAQAo+ID4gICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3JnL3B5
cGkvbGFyay9qc29uCj4gPiAtbWQ1ICAxMjRjMzZlYTNiNjg3ODNmMDZjZWE1ZmU2ZWU4YTZmMiAg
bGFyay0xLjEuOC50YXIuZ3oKPiA+IC1zaGEyNTYgIDdlZjQyNGRiNTdmNTljMWZmZDZmMGQ0YzJi
NzA1MTE5OTI3ZjU2NmI2OGMwZmUxOTQyZGRkY2MwZTQ0MzkxYTUgIGxhcmstMS4xLjgudGFyLmd6
Cj4gPiArbWQ1ICA5OTc2MGVkODE5MDRjNTZiMmRiMmI3YWI3NzIzMDYzZSAgbGFyay0xLjIuMi50
YXIuZ3oKPiA+ICtzaGEyNTYgIGNhODA3ZDAxNjJjZDE2Y2VmMTVhOGZlZWNiODYyZDczMTllN2Ew
OWJkYjEzYWVmOTI3OTY4ZTQ1MDQwZmVkODAgIGxhcmstMS4yLjIudGFyLmd6Cj4gPiAgIyBMb2Nh
bGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiA+IC1zaGEyNTYgIDgyNjNlNTY1MmQwN2Nl
Y2IzYWRhZGYwNTE0MGI2NWU3MGNmYTE2OWVjZWM1ZjUyMGZlMTY3MTQ3OWNlMTJhODMgIExJQ0VO
U0UKPiA+ICtzaGEyNTYgIDJlZWU2MGY1MmQ0ZTExMzU3YmY4OWU3MmIwMzRkMDUwZTI4NWU0N2Zk
YTEzNjFlNTY2MmZiMzIyZWUyN2Q3NzEgIExJQ0VOU0UKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3B5dGhvbi1sYXJrL3B5dGhvbi1sYXJrLm1rIGIvcGFja2FnZS9weXRob24tbGFyay9weXRob24t
bGFyay5tawo+ID4gaW5kZXggOWNiMzBhYmI2NS4uMWE4NWI0OWJkMyAxMDA2NDQKPiA+IC0tLSBh
L3BhY2thZ2UvcHl0aG9uLWxhcmsvcHl0aG9uLWxhcmsubWsKPiA+ICsrKyBiL3BhY2thZ2UvcHl0
aG9uLWxhcmsvcHl0aG9uLWxhcmsubWsKPiA+IEBAIC00LDkgKzQsOSBAQAo+ID4gICMKPiA+ICAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4KPiA+IC1QWVRIT05fTEFSS19WRVJTSU9OID0gMS4x
LjgKPiA+ICtQWVRIT05fTEFSS19WRVJTSU9OID0gMS4yLjIKPiA+ICBQWVRIT05fTEFSS19TT1VS
Q0UgPSBsYXJrLSQoUFlUSE9OX0xBUktfVkVSU0lPTikudGFyLmd6Cj4gPiAtUFlUSE9OX0xBUktf
U0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8xMi8xYy9iNDY2
YjU4ZGFjYWMxNWZmZWZjZTliY2I1MTI4ZTE4OTQ4YTE0Mzg0OTYxMGE3ZDUzMDBmMzE5MjBiZTAK
PiA+ICtQWVRIT05fTEFSS19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3Bh
Y2thZ2VzL2FmLzYwL2JjNzYyMmFlZmIyYWVlMWMwYjRiYTIzYzE0NDZkM2UzMDIyNWM4NzcwYjM4
ZDdhZWRiZmI2NWNhOWQ1YQo+ID4gIFBZVEhPTl9MQVJLX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xz
Cj4gPiAgUFlUSE9OX0xBUktfTElDRU5TRSA9IE1JVAo+ID4gIFBZVEhPTl9MQVJLX0xJQ0VOU0Vf
RklMRVMgPSBMSUNFTlNFCj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+ID4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBB
U0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5T
VCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+
ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
