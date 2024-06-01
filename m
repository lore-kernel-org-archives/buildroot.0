Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC5EC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 14:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F30384776;
	Sat,  1 Jun 2024 14:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id no3Dtsv5uYCH; Sat,  1 Jun 2024 14:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 703F184780
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 703F184780;
	Sat,  1 Jun 2024 14:53:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39F2B1BF4DD
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 14:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3460160733
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 14:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uT07hqHxW0vY for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 14:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02DE5606DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02DE5606DF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02DE5606DF
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 14:53:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8719F13F8A7;
 Sat,  1 Jun 2024 16:53:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 16:53:16 +0200
Date: Sat, 1 Jun 2024 16:53:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Message-ID: <Zls13APtGsAALejW@landeda>
References: <20240531203110.2395842-1-gero.schwaericke@grandcentrix.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531203110.2395842-1-gero.schwaericke@grandcentrix.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717253598;
 bh=okpBgadnfTm8WOjjDM8j5eYImw8aRkWqQbKuvKyTt7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D7S53pTh/gzCmeestWI3SbRoJu8C+1gnw7GJk88pWL/5X4tvKE7j4CJbOS/WP7cBz
 ZZRukUPDRWIWG96KR0gTZ/sckJz4tm4muPalec+MaakLsDrGrd8r3dDKFzD2usOeKk
 bg+a8A//+CUXWwxco2eqRbNaO2ui/K3vrWqncGr5qG55W6hSPesokqYt7bRZp83Xjd
 AxT082FZo864DUCADzGsWGScRvmwGLRCrGxzTosby7xTMLdFNPiv/6xDHBnDTqyGTy
 wUzTIcO6FxqKyNPA+/DX6E/8OmuUn3gzCj9KtV8Z1QTDzTKeh8IHHRoVfYsMpIJasb
 PDMqXQintEwrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=D7S53pTh
Subject: Re: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.19.x, 5.4.x,
 5.10.x, 5.15.x, 6.1.x, 6.6.x, 6.8.x series
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2VybywgQWxsLAoKT24gMjAyNC0wNS0zMSAyMjozMSArMDIwMCwgR2VybyBTY2h3w6RyaWNrZSB2
aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPiBTaWduZWQtb2ZmLWJ5OiBHZXJvIFNjaHfDpHJp
Y2tlIDxnZXJvLnNjaHdhZXJpY2tlQGdyYW5kY2VudHJpeC5uZXQ+CgpBcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIGxpbnV4L0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGxpbnV4L2xpbnV4Lmhhc2ggICAg
ICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKystLS0tLS0tCj4gIHBhY2thZ2UvbGludXgtaGVh
ZGVycy9Db25maWcuaW4uaG9zdCB8IDE0ICsrKysrKystLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xp
bnV4L0NvbmZpZy5pbiBiL2xpbnV4L0NvbmZpZy5pbgo+IGluZGV4IGQzZDRjNDI5MTAuLjE5NGEy
NGYzOTEgMTAwNjQ0Cj4gLS0tIGEvbGludXgvQ29uZmlnLmluCj4gKysrIGIvbGludXgvQ29uZmln
LmluCj4gQEAgLTEzNCw3ICsxMzQsNyBAQCBjb25maWcgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01f
UkVQT19HSVRfU1VCTU9EVUxFUwo+ICAKPiAgY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfVkVSU0lP
Tgo+ICAJc3RyaW5nCj4gLQlkZWZhdWx0ICI2LjguOSIgaWYgQlIyX0xJTlVYX0tFUk5FTF9MQVRF
U1RfVkVSU0lPTgo+ICsJZGVmYXVsdCAiNi44LjEyIiBpZiBCUjJfTElOVVhfS0VSTkVMX0xBVEVT
VF9WRVJTSU9OCj4gIAlkZWZhdWx0ICI1LjEwLjE2Mi1jaXAyNCIgaWYgQlIyX0xJTlVYX0tFUk5F
TF9MQVRFU1RfQ0lQX1ZFUlNJT04KPiAgCWRlZmF1bHQgIjUuMTAuMTYyLWNpcDI0LXJ0MTAiIGlm
IEJSMl9MSU5VWF9LRVJORUxfTEFURVNUX0NJUF9SVF9WRVJTSU9OCj4gIAlkZWZhdWx0IEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUUgXAo+IGRpZmYgLS1naXQgYS9saW51eC9s
aW51eC5oYXNoIGIvbGludXgvbGludXguaGFzaAo+IGluZGV4IGFmODIxNDhlODAuLmI5NzI1NTdm
YzAgMTAwNjQ0Cj4gLS0tIGEvbGludXgvbGludXguaGFzaAo+ICsrKyBiL2xpbnV4L2xpbnV4Lmhh
c2gKPiBAQCAtMSwxMyArMSwxMyBAQAo+ICAjIEZyb20gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9w
dWIvbGludXgva2VybmVsL3Y2Lngvc2hhMjU2c3Vtcy5hc2MKPiAtc2hhMjU2ICBmOTA1ZjEyMzhl
YTdhOGU4NTMxNGJhY2YyODMzMDJlODA5NzAwNjAxMGQyNWZjZWE3MjZkMGRlMGVhNWJjOWI2ICBs
aW51eC02LjguOS50YXIueHoKPiAtc2hhMjU2ICBiNjZhNWI4NjNiMGY4NjY5NDQ4Yjc0Y2E4M2Jk
NjQxYTg1NmYxNjRiMjk5NTZlNTM5YmJjYjVmZGVlYWI5Y2M2ICBsaW51eC02LjYuMzAudGFyLnh6
Cj4gLXNoYTI1NiAgODNhM2Q3MmU3NjRmY2VkYTJjMWZjNjhhNGVhNmI5MTI1M2EyOGRhNTZhNjg4
YTJiNjE3NzZiMGQxOTc4OGUxZCAgbGludXgtNi4xLjkwLnRhci54ego+ICtzaGEyNTYgIDE5YjMx
OTU2ZDIyOWI1YjljYTU2NzFmYTFjNzQzMjAxNzk2ODJhM2Q4ZDAwZmM4Njc5NDExNGIyMWRhODYw
MzkgIGxpbnV4LTYuOC4xMi50YXIueHoKPiArc2hhMjU2ICBhYWE4MjRlYWYwN2Y2MTkxMWQyMmI3
NWZmMDkwYTQwM2MzZGQwYmQ3M2UyMzkzM2UwYmJhOGI1OTcxNDM2Y2UxICBsaW51eC02LjYuMzIu
dGFyLnh6Cj4gK3NoYTI1NiAgOTAxOWY0MjdiZmRjOWNlZDViYzk1NGQ3NjBkMzdhYzA4YzBjZGZm
YjQ1YWQyODA4N2ZjNDVhNzNlNjQzMzZjOSAgbGludXgtNi4xLjkyLnRhci54ego+ICAjIEZyb20g
aHR0cHM6Ly93d3cua2VybmVsLm9yZy9wdWIvbGludXgva2VybmVsL3Y1Lngvc2hhMjU2c3Vtcy5h
c2MKPiAtc2hhMjU2ICBmOTA3MWM4M2E0ZmQ4YjgwYWYwMjZiNDhjZmMxODY5YmZhMjU4ODNmOTE0
OGI5MmI1ZGMxZTFlMWUyNmRkNWM2ICBsaW51eC01LjE1LjE1OC50YXIueHoKPiAtc2hhMjU2ICBl
MzEwNTg4YzRiMjNmMDk1OTYxNGU2MGYwMDdhZmMyMGU5YjFhOGYyOTZkNjgyYjA0MWZhMTI5Zjk2
ZmJlMTUxICBsaW51eC01LjEwLjIxNi50YXIueHoKPiAtc2hhMjU2ICBkYWQyYjA2ODk0NmYwY2Ew
MDI2MTMwZDdhYjE3NjAxZDUwNzRkOTBiMzgxMzc5YzQ0NzkzMTRkNGVkZjQzMDRjICBsaW51eC01
LjQuMjc1LnRhci54ego+ICtzaGEyNTYgIGY0MWU3MThlMzNiODhmMjY5YTZiNmE3NjUzZTVlOTgy
NGM0YmE1NDFmNmZmZTViZjI2ZWNjMzdjNTQwYTFiMDUgIGxpbnV4LTUuMTUuMTYwLnRhci54ego+
ICtzaGEyNTYgIDljMzZiMjQzZThjM2VjMWQ1OTYzMzY2NjE4ZjMzNjcxMGI4NDM0MGJmOTViZTIw
MzdiMjZjNDUyMzkyY2IyZDYgIGxpbnV4LTUuMTAuMjE4LnRhci54ego+ICtzaGEyNTYgIDdlMWY1
YjI4NTg4ZTQ5ZGRmZDE4ZTc3NzI0NzZlNGU4YjUyYmRjOWMzZTE5YmVhZmNiYjdjMTAzZTZjMDFm
NTEgIGxpbnV4LTUuNC4yNzcudGFyLnh6Cj4gICMgRnJvbSBodHRwczovL3d3dy5rZXJuZWwub3Jn
L3B1Yi9saW51eC9rZXJuZWwvdjQueC9zaGEyNTZzdW1zLmFzYwo+IC1zaGEyNTYgIGE4MTQ1ZTJl
Y2Y4NDM3YjZkMDY0MDBjMzM1OGE1OTVjNDdhNzQ0NDNiMTY0ODkwY2YxMmEwN2Q4NzIyNTM5Yzgg
IGxpbnV4LTQuMTkuMzEzLnRhci54ego+ICtzaGEyNTYgIDZjNWU0ZDNjODdmZWFkYmZkYjlmN2Qy
ZTQ2ZjNmMTIwYjAwMjg2YmEzODA0OTFjNTk1NjcwOGUwYjk0MjMyYzggIGxpbnV4LTQuMTkuMzE1
LnRhci54ego+ICAjIExvY2FsbHkgY29tcHV0ZWQKPiAgc2hhMjU2ICBmYjBlZGMzYzE4ZTQ3ZDJi
Njk3NGNiMDg4MGEwYWZiNWMzZmEwOGY1MGVlODdkZmRmMjQzNDk0MDVlYTVmOGFlICBsaW51eC1j
aXAtNS4xMC4xNjItY2lwMjQudGFyLmd6Cj4gIHNoYTI1NiAgYjU1MzkyNDNmMTg3ZTNkNDc4ZDc2
ZDQ0YWUxM2FhYjgzOTUyYzk0Yjg4NWFkODg5ZGY2ZmE5OTk3ZTE2YTQ0MSAgbGludXgtY2lwLTUu
MTAuMTYyLWNpcDI0LXJ0MTAudGFyLmd6Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGludXgtaGVh
ZGVycy9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvbGludXgtaGVhZGVycy9Db25maWcuaW4uaG9z
dAo+IGluZGV4IGQ4ZjQ4ZWQwYjcuLjQ4MTAxNzgzYjkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9s
aW51eC1oZWFkZXJzL0NvbmZpZy5pbi5ob3N0Cj4gKysrIGIvcGFja2FnZS9saW51eC1oZWFkZXJz
L0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTQxNSwxMyArNDE1LDEzIEBAIGVuZGNob2ljZQo+ICAKPiAg
Y29uZmlnIEJSMl9ERUZBVUxUX0tFUk5FTF9IRUFERVJTCj4gIAlzdHJpbmcKPiAtCWRlZmF1bHQg
IjQuMTkuMzEzIglpZiBCUjJfS0VSTkVMX0hFQURFUlNfNF8xOQo+IC0JZGVmYXVsdCAiNS40LjI3
NSIJaWYgQlIyX0tFUk5FTF9IRUFERVJTXzVfNAo+IC0JZGVmYXVsdCAiNS4xMC4yMTYiCWlmIEJS
Ml9LRVJORUxfSEVBREVSU181XzEwCj4gLQlkZWZhdWx0ICI1LjE1LjE1OCIJaWYgQlIyX0tFUk5F
TF9IRUFERVJTXzVfMTUKPiAtCWRlZmF1bHQgIjYuMS45MCIJaWYgQlIyX0tFUk5FTF9IRUFERVJT
XzZfMQo+IC0JZGVmYXVsdCAiNi42LjMwIglpZiBCUjJfS0VSTkVMX0hFQURFUlNfNl82Cj4gLQlk
ZWZhdWx0ICI2LjguOSIJCWlmIEJSMl9LRVJORUxfSEVBREVSU182XzgKPiArCWRlZmF1bHQgIjQu
MTkuMzE1IglpZiBCUjJfS0VSTkVMX0hFQURFUlNfNF8xOQo+ICsJZGVmYXVsdCAiNS40LjI3NyIJ
aWYgQlIyX0tFUk5FTF9IRUFERVJTXzVfNAo+ICsJZGVmYXVsdCAiNS4xMC4yMTgiCWlmIEJSMl9L
RVJORUxfSEVBREVSU181XzEwCj4gKwlkZWZhdWx0ICI1LjE1LjE2MCIJaWYgQlIyX0tFUk5FTF9I
RUFERVJTXzVfMTUKPiArCWRlZmF1bHQgIjYuMS45MiIJaWYgQlIyX0tFUk5FTF9IRUFERVJTXzZf
MQo+ICsJZGVmYXVsdCAiNi42LjMyIglpZiBCUjJfS0VSTkVMX0hFQURFUlNfNl82Cj4gKwlkZWZh
dWx0ICI2LjguMTIiCWlmIEJSMl9LRVJORUxfSEVBREVSU182XzgKPiAgCWRlZmF1bHQgQlIyX0RF
RkFVTFRfS0VSTkVMX1ZFUlNJT04gaWYgQlIyX0tFUk5FTF9IRUFERVJTX1ZFUlNJT04KPiAgCWRl
ZmF1bHQgImN1c3RvbSIJaWYgQlIyX0tFUk5FTF9IRUFERVJTX0NVU1RPTV9UQVJCQUxMCj4gIAlk
ZWZhdWx0IEJSMl9LRVJORUxfSEVBREVSU19DVVNUT01fUkVQT19WRVJTSU9OIFwKPiAtLSAKPiAy
LjQ1LjEKPiAKPiAKPiAtLSAKPiAKPiAKPiAKPiDigJPigJPigJMKPiAKPiAKPiBncmFuZGNlbnRy
aXggR21iSCB8IEEgVm9kYWZvbmUgQ29tcGFuecKgwrfCoEhvbHptYXJrdCAxwqDCt8KgNTA2NzYg
Cj4gKkNvbG9nbmUqwqB8wqBQaG9lbml4c2Vlc3RyYXNzZSAxOMKgwrfCoDQ0MjYzICpEb3J0bXVu
ZCrCoMK3wqBHZXJtYW55Cj4gfMKgaW4gCj4gPGh0dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9jb21w
YW55L2dyYW5kY2VudHJpeD4gfCBwaG9uZTogKzQ5LTIyMS02NzctODYwLTAgCj4gfMKgZW1haWw6
IGhlbGxvQGdyYW5kY2VudHJpeC5uZXQgPG1haWx0bzpoZWxsb0BncmFuZGNlbnRyaXgubmV0Pgo+
IAo+IAo+IGdyYW5kY2VudHJpeCBjYXJlcyBhYm91dMKgcHJpdmFjeSAKPiA8aHR0cHM6Ly9ncmFu
ZGNlbnRyaXgubmV0L2RlL3BhZ2VzL3ByaXZhY3ltYWlsLz4KPiAKPiBBbXRzZ2VyaWNodCBLw7Zs
biB8IEhSQiDCoAo+IDcwMTE5IHwgR2VzY2jDpGZ0c2bDvGhyZXI6IE0uIEtyw7ZtZXIswqAgUi4g
SMOkbmVsIHwgVVN0Li1JZE5yLjogREUyNjYzMzM5NjkKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVy
IHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
