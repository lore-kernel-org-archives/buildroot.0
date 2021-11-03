Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691FBC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:39:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5282610FD
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5282610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CB8B40543;
	Wed,  3 Nov 2021 22:39:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00qt75r2IEXp; Wed,  3 Nov 2021 22:39:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D22C540541;
	Wed,  3 Nov 2021 22:39:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 402F61BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D65D4016A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6rlKQBXuq6Sx for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:39:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFC6240165
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:39:09 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id y8so6366497ljm.4
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 15:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lMB90/gCj94dbVLHwq1zdZESchGfGuDzezyPD/pYZbE=;
 b=OfmKWfJv1tACeSrPQXVYUliEtGHhmXO2ofdwfU+1Ux99qCdU8WgaUQgugTMRu+803w
 DbHeIvnOmvenLGeSqtJFTfzyY0Er+Izn9w9cg1BwXaWkQmZzwJxtm2+QKHhgDEKZ37Pw
 WTOrLjBCPDrnlHiO0Ga7nNZwFDrtFPP3z64RhW4QpH2re9P7JqTRFGo0oLVH4NNX1HUM
 U55Cn0EaeAazUE8KFWqIerjpY01Gn+CDhTTh0Ojzg85ptDSJth1mdK0j7jCyymYFYa15
 6mpcqC5NV4kQBQn+IGYXp7bIOhPuc4mIKHGLztJvBjO8MIla9eYdUsuG4TRXbs/WAHUP
 8lFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lMB90/gCj94dbVLHwq1zdZESchGfGuDzezyPD/pYZbE=;
 b=UXtUTKTjsJjNT3fLcCQs6O971cHBQEtkXjtft7u38/ysiTaTXcttMpMOuy0xBu/DPQ
 HfRB/17Ma92W3z/i6HL/bMX42EgSkjYAGK2TiThM44n7XLa7UGsr6u9T+FYsE1UC9X5C
 7uEXBelUqHFkzeBl55HcBDs0VSJSb6cZT6knGGsI5IzpSfIoJE5jjtPgyJ9m5PgKUV2y
 gnGf7PcvLG74P+krzapVQETeDZGDsilyeCt8Kuxa+aEswwEAxvL2EeDS/nCEpVMbQlYZ
 THuS8eEQqcu+bfLrZ7vzh9KfHOUvXf+kWHb5Akp6BaOIi2GE6BJdR7YCLkC8ulqKgKEc
 4fAw==
X-Gm-Message-State: AOAM531YdeGRFGpeDohpMev6YIokkEHE06M7l7gnNWR2wzkA3ggpz7ST
 beCLjBlP2mprSDNIlQZn80oVRny9Honyp5Bcd0r5UujWrJI=
X-Google-Smtp-Source: ABdhPJzqPVGwFdrtVtt817v7wvYRrtz0iRlzy2RD2JzwaFy7KNhDNCASgysUHSNin+VYhG6ZLKaftfIGYSbC1IJg8/8=
X-Received: by 2002:a2e:3007:: with SMTP id w7mr17758780ljw.336.1635979147607; 
 Wed, 03 Nov 2021 15:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211029065957.3084528-1-james.hilliard1@gmail.com>
 <20211103204805.1facb4a9@gmx.net>
 <CADvTj4rCzGkrFuPj67Xu9s7A3FNeyBpBEBQKiULQaLF4GYnEKg@mail.gmail.com>
 <20211103211202.539dba74@gmx.net>
 <CADvTj4ofL6Pzrog2Ss1UrHKwCBRxQWHR6=L4JhDXbUTyp5AJ8w@mail.gmail.com>
In-Reply-To: <CADvTj4ofL6Pzrog2Ss1UrHKwCBRxQWHR6=L4JhDXbUTyp5AJ8w@mail.gmail.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 3 Nov 2021 23:37:17 +0100
Message-ID: <CAPi7W813LC+sPcSZDHuGwY7fjED_iinZWg=ZjU2odqKMDkYg2Q@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: add
 host-python3-six host dependency
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
Cc: Peter Seiderer <ps.report@gmx.net>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKTGUgbWVyLiAzIG5vdi4gMjAyMSDDoCAyMToyMCwgSmFtZXMgSGlsbGlhcmQKPGph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFdlZCwgTm92IDMsIDIw
MjEgYXQgMjoxMiBQTSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyb3RlOgo+
ID4KPiA+IEhlbGxvIEphbWVzLAo+ID4KPiA+IE9uIFdlZCwgMyBOb3YgMjAyMSAxMzo1MTowOSAt
MDYwMCwgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+
ID4KPiA+ID4gT24gV2VkLCBOb3YgMywgMjAyMSBhdCAxOjQ4IFBNIFBldGVyIFNlaWRlcmVyIDxw
cy5yZXBvcnRAZ214Lm5ldD4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBIZWxsbyBKYW1lcywgRmFi
cmljZSwgKgo+ID4gPiA+Cj4gPiA+ID4gT24gRnJpLCAyOSBPY3QgMjAyMSAwMDo1OTo1NyAtMDYw
MCwgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
PiA+Cj4gPiA+ID4gPiBUaGlzIGRlcGVuZGVuY3kgd2Fzbid0IGFkZGVkIGR1cmluZyB0aGUgcmVt
b3ZhbCBvZgo+ID4gPiA+ID4gcHl0aG9uMy1jcnlwdG9ncmFwaHkuCj4gPiA+ID4KPiA+ID4gPiBU
aGUgY29udmVyc2lvbi9kcm9wcGluZyBvZiBweXRob24zLWNyeXB0b2dyYXBoeSB3YXMgZG9uZSB3
aXRoIGNvbW1pdHMgWzFdIGFuZCBbMl0sCj4gPiA+ID4gYW5kIHRoZSBjb21taXQgbG9nIG9mIFsx
XSBzdGF0ZXMgdGhlIGRyb3BwaW5nIG9mIHRoZSBob3N0LXB5dGhvbjMtc2l4IGRlcGVuZGVuY3kK
PiA+ID4gPiB3YXMgaW50ZW50aW9uYWxseToKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgWy4uLl0K
PiA+ID4gPiAgICAgICAgIFdoaWxlIGF0IGl0LCBkcm9wIGhvc3QtcHl0aG9uMy1waXAgYW5kIGhv
c3QtcHl0aG9uMy1zaXggYXMgdGhlc2UKPiA+ID4gPiAgICAgICAgIGRlcGVuZGVuY2llcyBhcmUg
bm90IG5lZWRlZC4gSW5kZWVkLCBwaXAgd2FzIG5ldmVyIGEgZGVwZW5kZW5jeSBvZgo+ID4gPiA+
ICAgICAgICAgY3J5cHRvZ3JhcGh5IGFuZCBzaXggaXMgbm90IGEgZGVwZW5kZW5jeSB3aXRoIHB5
dGhvbjMgYW5kIHdpbGwgYmUKPiA+ID4gPiAgICAgICAgIGRyb3BwZWQgaW4gdmVyc2lvbiAzLjQg
YW5kCj4gPiA+ID4gICAgICAgICBodHRwczovL2dpdGh1Yi5jb20vcHljYS9jcnlwdG9ncmFwaHkv
Y29tbWl0L2U2NmRiODA3OWQzZmJkMDExMGU4N2VjZTFmZDQ4ZjRiZmQ5ZTQ4YjkKPiA+ID4gPiAg
ICAgICAgIFsuLi5dCj4gPiA+ID4KPiA+ID4gPiBCdXQgdGhlIHBhY2thZ2UgcHl0aG9uLWNyeXB0
b2dyYXBoeSBpcyBzdGlsbCBhdCB2ZXJzaW9uIDMuMy4yIChhbmQgY2xlYXJseSBkZXBlbmRzIG9u
IHNpeCkKPiA+ID4gPgo+ID4gPiA+IEBGYWJyaWNlOiB2ZXJzaW9uIGJ1bXAgcGVuZGluZz8KPiA+
ID4KPiA+ID4gSSBhY3R1YWxseSBoYXZlIGEgcGF0Y2ggZnJvbSBhIHdoaWxlIGJhY2sgYnVtcGlu
ZyB0aGUgdmVyc2lvbi4uLmJ1dCBpdAo+ID4gPiBhbHNvIHJlcXVpcmVzIHJ1c3QKPiA+ID4gc3Vw
cG9ydCBhbmQgdGhhdCB3b3VsZCBwcm9iYWJseSBjYXVzZSBhIGJpdCBvZiBicmVha2FnZToKPiA+
ID4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDIxMDMxODA0NDI1My4zMjAyMzU1LTItamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KPiA+ID4K
PiA+ID4gU28gaXQncyBwcm9iYWJseSBnb2luZyB0byBiZSBhIHdoaWxlIGJlZm9yZSB3ZSBjYW4g
dXBkYXRlIGNyeXB0b2dyYXBoeQo+ID4gPiBpZiBJIGhhZCB0byBndWVzcy4KPiA+Cj4gPiBDbGVh
ciB2b3RlIGZvciBrZWVwaW5nIHRoZSBvbGQgdmVyc2lvbiBhbmQgcmUtYWRkaW5nIHRoZSBob3N0
LXB5dGhvbjMtc2l4Cj4gPiBkZXBlbmRlbmN5IDstKQo+ID4KPiA+IE1pbmQgdG8gcmUtc3BpbiB5
b3VyIHBhdGNoIHdpdGggc29tZSBleHBsYW5hdGlvbj8KPgo+IFN1cmUsIEkgbW9zdGx5IGp1c3Qg
Y29waWVkIHlvdXIgZXhwbGFuYXRpb24gb2YgdGhlIGlzc3VlOgo+IGh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTExMDMyMDE5MzIuMjk2ODk3
LTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KSSBhbHJlYWR5IHNlbnQgYSBwYXRjaCBhIGZl
dyBkYXlzIGFnbzoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC8yMDIxMTAyNjE2MzIyMi4zOTEyNjQ0LTEtZm9udGFpbmUuZmFicmljZUBnbWFpbC5j
b20vCj4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gUGV0ZXIKPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4g
PiBASmFtZXM6IHdpdGggYSBiaXQgb2YgZXhwbGFuYXRpb24gYWRkZWQgdG8gdGhlIGNvbW1pdCBs
b2cgeW91IGNhbiBhZGQgbXkKPiA+ID4gPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBQZXRlciBTZWlk
ZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gPiA+ID4KPiA+ID4gPiBCdXQgYWx0aG91Z2ggZmlu
ZSB3aXRoIGFuIHZlcnNpb24gYnVtcCBvZiB0aGUgcGFja2FnZSA7LSkKPiA+ID4gPgo+ID4gPiA+
IFJlZ2FyZHMsCj4gPiA+ID4gUGV0ZXIKPiA+ID4gPgo+ID4gPiA+IFsxXSBodHRwczovL2dpdC5i
dWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTk1YTYzYTM0YWM5MjA0YzRmZTA2OTE1
NDc4M2JkOTdlZDQ4YzNhZTIKPiA+ID4gPiBbMl0gaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9i
dWlsZHJvb3QvY29tbWl0Lz9pZD00MzE0NzgyN2E3Yjc1OTI0ODI4OGZhZDFkOTcxMzBjMDI3YzIz
ZTlhCj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBGaXhlczoKPiA+ID4gPiA+ICAtIGh0dHA6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzk3MS85NzExY2NlYmI5YzNlMmZhOGYx
N2Q5NjlkOGI0MzFkNDMwMTY3N2UzL2J1aWxkLWVuZC5sb2cKPiA+ID4gPiA+Cj4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4K
PiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIHBhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRo
b24tY3J5cHRvZ3JhcGh5Lm1rIHwgNSArKysrLQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9weXRob24tY3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsg
Yi9wYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBoeS5tawo+ID4g
PiA+ID4gaW5kZXggZTIxYjlkYjA0Mi4uMDgxZGZjMDZhMCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBh
L3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rCj4gPiA+
ID4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNyeXB0b2dyYXBo
eS5tawo+ID4gPiA+ID4gQEAgLTE0LDcgKzE0LDEwIEBAIFBZVEhPTl9DUllQVE9HUkFQSFlfQ1BF
X0lEX1ZFTkRPUiA9IGNyeXB0b2dyYXBoeV9wcm9qZWN0Cj4gPiA+ID4gPiAgUFlUSE9OX0NSWVBU
T0dSQVBIWV9DUEVfSURfUFJPRFVDVCA9IGNyeXB0b2dyYXBoeQo+ID4gPiA+ID4gIFBZVEhPTl9D
UllQVE9HUkFQSFlfREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24tY2ZmaSBvcGVuc3NsCj4gPiA+
ID4gPiAgSE9TVF9QWVRIT05fQ1JZUFRPR1JBUEhZX05FRURTX0hPU1RfUFlUSE9OID0gcHl0aG9u
Mwo+ID4gPiA+ID4gLUhPU1RfUFlUSE9OX0NSWVBUT0dSQVBIWV9ERVBFTkRFTkNJRVMgPSBob3N0
LXB5dGhvbjMtY2ZmaSBob3N0LW9wZW5zc2wKPiA+ID4gPiA+ICtIT1NUX1BZVEhPTl9DUllQVE9H
UkFQSFlfREVQRU5ERU5DSUVTID0gXAo+ID4gPiA+ID4gKyAgICAgaG9zdC1weXRob24zLWNmZmkg
XAo+ID4gPiA+ID4gKyAgICAgaG9zdC1weXRob24zLXNpeCBcCj4gPiA+ID4gPiArICAgICBob3N0
LW9wZW5zc2wKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQo+
ID4gPiA+ID4gICQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQo+ID4gPiA+Cj4gPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+ID4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPgpC
ZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
