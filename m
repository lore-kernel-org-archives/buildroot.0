Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451D1C27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 17:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E2D660627;
	Sun,  9 Jun 2024 17:45:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3xnPRkSqMdc; Sun,  9 Jun 2024 17:45:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01DBC6066B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01DBC6066B;
	Sun,  9 Jun 2024 17:45:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3EC41BF589
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 17:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE24683AA2
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 17:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y27lyrRkzRR2 for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 17:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66C1183A65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C1183A65
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66C1183A65
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 17:45:21 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-572c65cea55so4713825a12.0
 for <buildroot@buildroot.org>; Sun, 09 Jun 2024 10:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717955119; x=1718559919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nDqCkWPEJ9GV+NzmGvQ02T3bu7M2xvRwo4vYda9seUQ=;
 b=MavV6jvz6alI02XQsSbCiCktV/qu3k8q98dQAp6tDT0bl04a8UcDkcFT37Z7aLZMOd
 Wogkw3YMPFeMil/s7xiN7trgoQhrJy8zzve1Etb+OnLvavUWxRiVB72VoPnUFFHiSb7O
 /jc1A/rnA+GnRJ7mIYrCIxqgadkb2CYrFj05kXRRdJB+nMJ1CrHNcQbe487KH8PytStU
 +V9OxN/zi+Huz8jYyE8aB3yoipd2PUN+wnG6fImRltsKaRwO/1N75dpF1UrkJTsrvITI
 b5it3qDpKBPeIauqlVzGRZcBqsAqIMGrsRq2qQm/qk3FXPkT7y/hI0wC56Nw9bBr4XL/
 tv3Q==
X-Gm-Message-State: AOJu0YzSWMyGIDQgfxzS0b3+v7JmXPx7nFW7P2KvlDa1qYgOKOOOhPf5
 1+vSfGvmzjpRa2tfvPS2y9GDyYLAfSU+SbeBx4OJIcHKlJDQe7Aq4DDl2UHLyDnJ/HCiUzuWwR4
 pgw8I35yfqCJJjcV9JG6Ce0gTSlnj+X6Qj8g=
X-Google-Smtp-Source: AGHT+IE3bx47HsmHARwJCuTA5hfaAzfWtM6kQWq7aYTxvkrDdlT6pWEWmZnmLOvwkYhZgJRYMeoovyoJAMbcxRn6tMg=
X-Received: by 2002:a50:a6ca:0:b0:575:2a03:8ff6 with SMTP id
 4fb4d7f45d1cf-57aa55ae244mr8824756a12.16.1717955119120; Sun, 09 Jun 2024
 10:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240609032509.8939-1-vfazio@gmail.com> <ZmXPjI6Mb9KVrqQj@landeda>
In-Reply-To: <ZmXPjI6Mb9KVrqQj@landeda>
From: Vincent Fazio <vfazio@gmail.com>
Date: Sun, 9 Jun 2024 12:45:08 -0500
Message-ID: <CAOrEah6YUxMdn7ak2wtFefLzKej3-KXKf5Gk1MLRu5A-=1Od5Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717955119; x=1718559919; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nDqCkWPEJ9GV+NzmGvQ02T3bu7M2xvRwo4vYda9seUQ=;
 b=esx8XCn8UgUbZsKDUR8chZx3WO6hnXbrAJ5dIcj5xnlJlAwSy4/fdyQbQi+7q6WjQe
 tiLqSgAL/gR880s1KFWDwy8yZmGucKiaiYZ1KGlRVisocFZqMx0mQ3cdapbwg92Fzkea
 3rVnaBlR0ZKVdIVkaKir2hLthTuHJRnz5lTpQnPkNTGfiiP8/DXrCzwJG73zOdLwaJyg
 kG1bGjcH3NTcCK215rLyFm2nbWboNm4A+CCO1bYrq1nCGM6PkVo1B7cShBuxzpy+IaNh
 /X71NRG2+7vEAA0rb2UAdlccHgOHnncmQ8cMb8D8D7J3t7GyboFU0IE6YZvSQh3oOUgu
 bjGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=esx8XCn8
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix config directory
 pattern
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgYWxsCgpPbiBTdW4sIEp1biA5LCAyMDI0IGF0IDEwOjUx4oCvQU0gWWFubiBFLiBNT1JJ
TiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gVmluY2VudCwgQWxsLAo+Cj4g
T24gMjAyNC0wNi0wOCAyMjoyNSAtMDUwMCwgVmluY2VudCBGYXppbyBzcGFrZSB0aHVzbHk6Cj4g
PiBJZiBhIHBsYXRmb3JtIHRyaXBsZXQgaXMgbm90IGRldGVjdGVkIGR1cmluZyB0aGUgY29uZmln
dXJlIHN0YWdlLCB0aGUKPiA+IGNvbmZpZyBkaXJlY3RvcnkgKExJQlBMKSBkZWZhdWx0cyB0byBg
Y29uZmlnLSRMRFZFUlNJT05gLgo+Cj4gSSBmb3VuZCB0aGUgJExEVkVSU0lPTiB0byBiZSBhIGJp
dCBzdHJhbmdlLCBldmVuIHRob3VnaCB0aGF0IGlzIGFjdHVhbGx5Cj4gd2hhdCB0aGUgY29kZSB1
c2VzLCBidXQgaGVyZSwgaW4gdGhlIGNvbnRlY3Qgb2YgYSBCdWlsZHJvdCBjb21taXQgbG9nLAo+
IGl0IGRvZXMgbm90IGxvb2sgcmlnaHQsIGFzIGl0IHJhdGhlciBoaW50cyBhdCB0aGUgdmVyc2lv
biBvZiBsZCwgd2hpY2gKPiBkb2VzIG5vdCBtYWtlIHNlbnNlLi4uCj4KPiBTbyBJIGp1c3QgZHJv
cHBlZCB0aGUgTEQgdG8ga2VlcCAkVkVSU0lPTiwgd2hpY2ggbWFrZXMgbW9yIGVzZW5zZSBJCj4g
YmVsaWV2ZS4KPgo+ID4gSW4gdGhpcyBzY2VuYXJpbywgdGhlIGBQWVRIT04zX1JFTU9WRV9VU0VM
RVNTX0ZJTEVTYCBob29rIHdvdWxkIGZhaWwgZHVlCj4gPiB0byBgZmluZGAgaW5jb3JyZWN0bHkg
ZXhwZWN0aW5nIGEgc2Vjb25kIGRhc2ggYW5kIHRoZW4gdGhlIHRyaXBsZXQuCj4gPgo+ID4gTm93
LCB3ZSBnbG9iIGFueXRoaW5nIGFmdGVyIHRoZSB2ZXJzaW9uIHdoaWNoIHdpbGwgbWF0Y2ggaW4g
Ym90aCBjYXNlcy4KPgo+IFdvb3QsIDExTWlCIGRyb3BwZWQgaGVyZSEg8J+RjQo+Cj4gPiBGaXhl
czogNTRkNDhjOGNhZCAoInBhY2thZ2UvcHl0aG9uMzogbWlzY2VsbGFuZW91cyBmaXh1cHMiKQo+
Cj4gSW4gZmFjdCwgaXQgd2FzIGFscmVhZHkgYnJva2VuIGJlZm9yZSB0aGF0OiBtYXN0ZXIsIHdo
aWNoIGRvZXMgbm90IGhhdmUKPiA1NGQ0OGM4Y2FkLCBhbHJhZHkgc3VmZmVyZWQgZnJvbSB0aGF0
IGlzc3VlLCBleGNlcHQgdGhlIGVycm9yIGlzIGlnbm9yZSwKPiBhcyB0ZSBmaW5kIGlzIGluIGEg
c3ViLXNoZWxsIGV2YWx1YXRlZCBhcyB0aGUgbGlzdCBmb3IgYSBmb3ItbG9vcC4KPgo+IFdvdWxk
IHlvdSBjYXJlIHRvIHNlbmQgdGhlIHNhbWUgZml4IGZvciBtYXN0ZXIsIHBsZWFzZT8KPgoKU3Vy
ZSB0aGluZzogaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDI0MDYwOTE3NDA0OC4zMTA2Mi0xLXZmYXppb0BnbWFpbC5jb20vCgoKPiA+IFNpZ25l
ZC1vZmYtYnk6IFZpbmNlbnQgRmF6aW8gPHZmYXppb0BnbWFpbC5jb20+Cj4KPiBBcHBsaWVkIHRv
IG5leHQsIHRoYW5rcy4KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+ID4gLS0tCj4g
PiAgcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcHl0aG9uMy9weXRob24zLm1rIGIvcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsKPiA+IGlu
ZGV4IGEwYjllZDQ0MzcuLmE4MmJjNDdhNTcgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhv
bjMvcHl0aG9uMy5tawo+ID4gKysrIGIvcGFja2FnZS9weXRob24zL3B5dGhvbjMubWsKPiA+IEBA
IC0yMDQsNyArMjA0LDcgQEAgUFlUSE9OM19DT05GX09QVFMgKz0gXAo+ID4gIGRlZmluZSBQWVRI
T04zX1JFTU9WRV9VU0VMRVNTX0ZJTEVTCj4gPiAgICAgICBybSAtZiAkKFRBUkdFVF9ESVIpL3Vz
ci9iaW4vcHl0aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1IpLWNvbmZpZwo+ID4gICAgICAgcm0g
LWYgJChUQVJHRVRfRElSKS91c3IvYmluL3B5dGhvbjMtY29uZmlnCj4gPiAtICAgICBmaW5kICQo
VEFSR0VUX0RJUikvdXNyL2xpYi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikvY29uZmln
LSQoUFlUSE9OM19WRVJTSU9OX01BSk9SKS0qLyBcCj4gPiArICAgICBmaW5kICQoVEFSR0VUX0RJ
UikvdXNyL2xpYi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikvY29uZmlnLSQoUFlUSE9O
M19WRVJTSU9OX01BSk9SKSovIFwKPiA+ICAgICAgICAgICAgICAgLXR5cGUgZiAtbm90IC1uYW1l
IE1ha2VmaWxlIC1leGVjIHJtIC1yZiB7fSBcOwo+ID4gICAgICAgZmluZCAkKFRBUkdFVF9ESVIp
L3Vzci9saWIvcHl0aG9uJChQWVRIT04zX1ZFUlNJT05fTUFKT1IpLyAtdHlwZSBkIFwKPiA+ICAg
ICAgICAgICAgICAgLW5hbWUgX19weWNhY2hlX18gLWV4ZWMgcm0gLXJmIHt9IFw7Cj4gPiAtLQo+
ID4gMi4zNC4xCj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1P
UklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29u
c3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1M
IE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
