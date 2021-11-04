Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC62C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 17:30:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E9DD61186
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 17:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E9DD61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65F4640517;
	Thu,  4 Nov 2021 17:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jzh7mPivaDav; Thu,  4 Nov 2021 17:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A98CF405A6;
	Thu,  4 Nov 2021 17:30:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2661BF32B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 17:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D4FC8188B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 17:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YEEArXckZmd for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 17:30:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A852A8177C
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636047002;
 bh=inXo9OQT9srbSYvn9eVoy+fxiMVmlD6AKo8v4ddMmXE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=IOAUk52GGeOfc+5gJJhoKOo8fTBnqzYHAGrz7w6dL4KRM7N46bAV7JKULxgGAmwWb
 BpNTPvtIMqHrXELq7k6gvXXFWP3nGsOAqDBOuNVJiO3ZYEt+3gcLrSM43NeqohKx+8
 k0rXI6GAGxOVBG/Vj/KM5XPQW0DdN/t+r3jImHfo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.39]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9kM-1mwzuI1yge-00Gbjg; Thu, 04
 Nov 2021 18:30:02 +0100
Date: Thu, 4 Nov 2021 18:30:01 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211104183001.4d31551b@gmx.net>
In-Reply-To: <CAPi7W813LC+sPcSZDHuGwY7fjED_iinZWg=ZjU2odqKMDkYg2Q@mail.gmail.com>
References: <20211029065957.3084528-1-james.hilliard1@gmail.com>
 <20211103204805.1facb4a9@gmx.net>
 <CADvTj4rCzGkrFuPj67Xu9s7A3FNeyBpBEBQKiULQaLF4GYnEKg@mail.gmail.com>
 <20211103211202.539dba74@gmx.net>
 <CADvTj4ofL6Pzrog2Ss1UrHKwCBRxQWHR6=L4JhDXbUTyp5AJ8w@mail.gmail.com>
 <CAPi7W813LC+sPcSZDHuGwY7fjED_iinZWg=ZjU2odqKMDkYg2Q@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:HbkGTGHf0yzw/6uaJa84niHOkNNFE9JOXAcZqHxBosg3Yfuxfq0
 KRdX9ZsV0f0SETw9TAyEqEGZlhEytYK1dJptJW0JAMew9xsR5YAaZoMw9zF+OthmWQ78htu
 zEwmFTUGmtnuVYNASs8Qzf5txy9wEDGVA6S8a7tmY4Z1UhLnE25fNfaEYgpIz2s/nx8B+LJ
 ud+Kqa1hVxye3LGll7ZvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nH20St6zBvE=:Fg82GxqWN1LaoIHUzsmFDj
 C8fpDVHWX8pQFmfPPbz5KGVXSoGeinScuJ/yYB0xrBtnNR5xOeC4+biN7O2HUkY0JokSFoRfn
 FDWx23qvW8xDyi8cBFor+WE2unIoGWazyTLAhTrs4SLkDmeFSFg+c2fC94UDlTLj7g2EVDxgP
 K4ZcuO5WGvT//im4lntL74TjEiQMeHx2NkOLJ4gBvWV+HkuYcAYuhEx8fW1f8cek8K1IRLXPS
 PhnFLepe98nMeN0RLBuUDzjlmtjSNd/9GxS3tX6t1qu5C29X6OQoiKBBYWXPXRa5acy38Vjzs
 FrKhiKtshCzO7ZqMCN9ONs5NYtekc1fUtnwCaclRQBVa+dAu4BvPx7BXS7VMCWvoLgoOdug1c
 3jHWpyY+Akznx7aGedczpTewAPOrbiuWRzdWXWIwcV3aTYZiQfmATio9wf3FCvYZ3bgysXYy5
 PG8LYRbPLbEYk4GSq3gJWXuf8BOT4qieS2JBkNlf+zBEsCJ7MECnGN6rcA/P/2vg0dUJmBVJs
 wlH1XVZqNxunFNmvsTJvBE2c6GZWNkdPrPnHUdbI1Y9ZGaXLDfs3sUmbsd11goPxo4qnVj3i0
 3Lc5t3SohRBvrue5ynnpuf603R8Nha4Cd0xdkLTkp7i0PPRrxStoqbmtR9xq9IqKNBABxIlJx
 BjkR3iiTjwxS0ojZMPWX6jNdfRofuB7kwAlu/Oplj5OBLl8yvwBRhSLSpldgAhwqRRqQdMcP+
 M/PamK4mTLkZNCxSC23lIIzgmf3nENrKJQ8gORza+sp7pLKOnCny8j9MEC7tPMavjNN/4GU6h
 GDUiVsL2IZw7jVPQrzCsSdlOrLrsbKI7vLcVV/Kkt3vEuIQrfQ0sO9H/H/mGiCg1azSpNrTRp
 iXh4DRcqUKynTq8GqHfPGtgNFR567wxKcISMMr5ry+7XvQEWzwCBJ8JWrG6BdV3W9SJPBBII/
 kKJs1JeZW1YR5lK4yBfkY/DxouePC7fm/5Mp5x5LNVwvNgrfiqWTnb56/LKljPnWHl+aYhzzi
 9LGP2Jea8qKjsiZTsSuzfsShDxQ4M/KUZeYaKxEV8+wgBeTchUXgPuiNQdgkmGrHH9CPHwsTD
 7+qABJeaZjsFsA=
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmFicmljZSwKCk9uIFdlZCwgMyBOb3YgMjAyMSAyMzozNzoxNyArMDEwMCwgRmFicmlj
ZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgoKPiBIaSBhbGws
Cj4gCj4gTGUgbWVyLiAzIG5vdi4gMjAyMSDDoCAyMToyMCwgSmFtZXMgSGlsbGlhcmQKPiA8amFt
ZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gYSDDqWNyaXQgOgo+ID4KPiA+IE9uIFdlZCwgTm92IDMs
IDIwMjEgYXQgMjoxMiBQTSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyb3Rl
OiAgCj4gPiA+Cj4gPiA+IEhlbGxvIEphbWVzLAo+ID4gPgo+ID4gPiBPbiBXZWQsIDMgTm92IDIw
MjEgMTM6NTE6MDkgLTA2MDAsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPiB3cm90ZToKPiA+ID4gIAo+ID4gPiA+IE9uIFdlZCwgTm92IDMsIDIwMjEgYXQgMTo0OCBQ
TSBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+IHdyb3RlOiAgCj4gPiA+ID4gPgo+
ID4gPiA+ID4gSGVsbG8gSmFtZXMsIEZhYnJpY2UsICoKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBG
cmksIDI5IE9jdCAyMDIxIDAwOjU5OjU3IC0wNjAwLCBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGls
bGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiAgCj4gPiA+ID4gPiA+IFRoaXMgZGVw
ZW5kZW5jeSB3YXNuJ3QgYWRkZWQgZHVyaW5nIHRoZSByZW1vdmFsIG9mCj4gPiA+ID4gPiA+IHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LiAgCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIGNvbnZlcnNpb24v
ZHJvcHBpbmcgb2YgcHl0aG9uMy1jcnlwdG9ncmFwaHkgd2FzIGRvbmUgd2l0aCBjb21taXRzIFsx
XSBhbmQgWzJdLAo+ID4gPiA+ID4gYW5kIHRoZSBjb21taXQgbG9nIG9mIFsxXSBzdGF0ZXMgdGhl
IGRyb3BwaW5nIG9mIHRoZSBob3N0LXB5dGhvbjMtc2l4IGRlcGVuZGVuY3kKPiA+ID4gPiA+IHdh
cyBpbnRlbnRpb25hbGx5Ogo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgWy4uLl0KPiA+ID4g
PiA+ICAgICAgICAgV2hpbGUgYXQgaXQsIGRyb3AgaG9zdC1weXRob24zLXBpcCBhbmQgaG9zdC1w
eXRob24zLXNpeCBhcyB0aGVzZQo+ID4gPiA+ID4gICAgICAgICBkZXBlbmRlbmNpZXMgYXJlIG5v
dCBuZWVkZWQuIEluZGVlZCwgcGlwIHdhcyBuZXZlciBhIGRlcGVuZGVuY3kgb2YKPiA+ID4gPiA+
ICAgICAgICAgY3J5cHRvZ3JhcGh5IGFuZCBzaXggaXMgbm90IGEgZGVwZW5kZW5jeSB3aXRoIHB5
dGhvbjMgYW5kIHdpbGwgYmUKPiA+ID4gPiA+ICAgICAgICAgZHJvcHBlZCBpbiB2ZXJzaW9uIDMu
NCBhbmQKPiA+ID4gPiA+ICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3B5Y2EvY3J5cHRvZ3Jh
cGh5L2NvbW1pdC9lNjZkYjgwNzlkM2ZiZDAxMTBlODdlY2UxZmQ0OGY0YmZkOWU0OGI5Cj4gPiA+
ID4gPiAgICAgICAgIFsuLi5dCj4gPiA+ID4gPgo+ID4gPiA+ID4gQnV0IHRoZSBwYWNrYWdlIHB5
dGhvbi1jcnlwdG9ncmFwaHkgaXMgc3RpbGwgYXQgdmVyc2lvbiAzLjMuMiAoYW5kIGNsZWFybHkg
ZGVwZW5kcyBvbiBzaXgpCj4gPiA+ID4gPgo+ID4gPiA+ID4gQEZhYnJpY2U6IHZlcnNpb24gYnVt
cCBwZW5kaW5nPyAgCj4gPiA+ID4KPiA+ID4gPiBJIGFjdHVhbGx5IGhhdmUgYSBwYXRjaCBmcm9t
IGEgd2hpbGUgYmFjayBidW1waW5nIHRoZSB2ZXJzaW9uLi4uYnV0IGl0Cj4gPiA+ID4gYWxzbyBy
ZXF1aXJlcyBydXN0Cj4gPiA+ID4gc3VwcG9ydCBhbmQgdGhhdCB3b3VsZCBwcm9iYWJseSBjYXVz
ZSBhIGJpdCBvZiBicmVha2FnZToKPiA+ID4gPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjEwMzE4MDQ0MjUzLjMyMDIzNTUtMi1qYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tLwo+ID4gPiA+Cj4gPiA+ID4gU28gaXQncyBwcm9iYWJseSBnb2lu
ZyB0byBiZSBhIHdoaWxlIGJlZm9yZSB3ZSBjYW4gdXBkYXRlIGNyeXB0b2dyYXBoeQo+ID4gPiA+
IGlmIEkgaGFkIHRvIGd1ZXNzLiAgCj4gPiA+Cj4gPiA+IENsZWFyIHZvdGUgZm9yIGtlZXBpbmcg
dGhlIG9sZCB2ZXJzaW9uIGFuZCByZS1hZGRpbmcgdGhlIGhvc3QtcHl0aG9uMy1zaXgKPiA+ID4g
ZGVwZW5kZW5jeSA7LSkKPiA+ID4KPiA+ID4gTWluZCB0byByZS1zcGluIHlvdXIgcGF0Y2ggd2l0
aCBzb21lIGV4cGxhbmF0aW9uPyAgCj4gPgo+ID4gU3VyZSwgSSBtb3N0bHkganVzdCBjb3BpZWQg
eW91ciBleHBsYW5hdGlvbiBvZiB0aGUgaXNzdWU6Cj4gPiBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjExMTAzMjAxOTMyLjI5Njg5Ny0xLWph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vICAKPiBJIGFscmVhZHkgc2VudCBhIHBhdGNoIGEgZmV3
IGRheXMgYWdvOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyMTEwMjYxNjMyMjIuMzkxMjY0NC0xLWZvbnRhaW5lLmZhYnJpY2VAZ21haWwu
Y29tLwoKU29ycnkgZm9yIG1pc3NpbmcgdGhpcyBvbmUuLi4KClJlZ2FyZHMsClBldGVyCgo+ID4g
IAo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBQZXRlcgo+ID4gPiAgCj4gPiA+ID4gIAo+ID4g
PiA+ID4KPiA+ID4gPiA+IEBKYW1lczogd2l0aCBhIGJpdCBvZiBleHBsYW5hdGlvbiBhZGRlZCB0
byB0aGUgY29tbWl0IGxvZyB5b3UgY2FuIGFkZCBteQo+ID4gPiA+ID4KPiA+ID4gPiA+IFJldmll
d2VkLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gQnV0IGFsdGhvdWdoIGZpbmUgd2l0aCBhbiB2ZXJzaW9uIGJ1bXAgb2YgdGhlIHBhY2th
Z2UgOy0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiA+IFBldGVyCj4gPiA+
ID4gPgo+ID4gPiA+ID4gWzFdIGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2Nv
bW1pdC8/aWQ9OTVhNjNhMzRhYzkyMDRjNGZlMDY5MTU0NzgzYmQ5N2VkNDhjM2FlMgo+ID4gPiA+
ID4gWzJdIGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9NDMx
NDc4MjdhN2I3NTkyNDgyODhmYWQxZDk3MTMwYzAyN2MyM2U5YQo+ID4gPiA+ID4gIAo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBGaXhlczoKPiA+ID4gPiA+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3QubmV0L3Jlc3VsdHMvOTcxLzk3MTFjY2ViYjljM2UyZmE4ZjE3ZDk2OWQ4YjQzMWQ0
MzAxNjc3ZTMvYnVpbGQtZW5kLmxvZwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+ID4gPiA+
ID4gLS0tCj4gPiA+ID4gPiA+ICBwYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHkvcHl0aG9uLWNy
eXB0b2dyYXBoeS5tayB8IDUgKysrKy0KPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1r
IGIvcGFja2FnZS9weXRob24tY3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsKPiA+
ID4gPiA+ID4gaW5kZXggZTIxYjlkYjA0Mi4uMDgxZGZjMDZhMCAxMDA2NDQKPiA+ID4gPiA+ID4g
LS0tIGEvcGFja2FnZS9weXRob24tY3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsK
PiA+ID4gPiA+ID4gKysrIGIvcGFja2FnZS9weXRob24tY3J5cHRvZ3JhcGh5L3B5dGhvbi1jcnlw
dG9ncmFwaHkubWsKPiA+ID4gPiA+ID4gQEAgLTE0LDcgKzE0LDEwIEBAIFBZVEhPTl9DUllQVE9H
UkFQSFlfQ1BFX0lEX1ZFTkRPUiA9IGNyeXB0b2dyYXBoeV9wcm9qZWN0Cj4gPiA+ID4gPiA+ICBQ
WVRIT05fQ1JZUFRPR1JBUEhZX0NQRV9JRF9QUk9EVUNUID0gY3J5cHRvZ3JhcGh5Cj4gPiA+ID4g
PiA+ICBQWVRIT05fQ1JZUFRPR1JBUEhZX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uLWNmZmkg
b3BlbnNzbAo+ID4gPiA+ID4gPiAgSE9TVF9QWVRIT05fQ1JZUFRPR1JBUEhZX05FRURTX0hPU1Rf
UFlUSE9OID0gcHl0aG9uMwo+ID4gPiA+ID4gPiAtSE9TVF9QWVRIT05fQ1JZUFRPR1JBUEhZX0RF
UEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uMy1jZmZpIGhvc3Qtb3BlbnNzbAo+ID4gPiA+ID4gPiAr
SE9TVF9QWVRIT05fQ1JZUFRPR1JBUEhZX0RFUEVOREVOQ0lFUyA9IFwKPiA+ID4gPiA+ID4gKyAg
ICAgaG9zdC1weXRob24zLWNmZmkgXAo+ID4gPiA+ID4gPiArICAgICBob3N0LXB5dGhvbjMtc2l4
IFwKPiA+ID4gPiA+ID4gKyAgICAgaG9zdC1vcGVuc3NsCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ICAkKGV2YWwgJChweXRob24tcGFja2FnZSkpCj4gPiA+ID4gPiA+ICAkKGV2YWwgJChob3N0LXB5
dGhvbi1wYWNrYWdlKSkgIAo+ID4gPiA+ID4gIAo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+ID4gPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiA+ID4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290ICAKPiA+ID4gIAo+IEJlc3Qg
UmVnYXJkcywKPiAKPiBGYWJyaWNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
