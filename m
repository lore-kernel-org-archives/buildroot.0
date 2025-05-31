Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279EEC5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 21:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E44B383A97;
	Sat, 31 May 2025 21:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJx3RNYW64QM; Sat, 31 May 2025 21:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F205B83A9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F205B83A9B;
	Sat, 31 May 2025 21:28:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FEA2127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5254C4028F
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVJt2RGEcd0j for <buildroot@buildroot.org>;
 Sat, 31 May 2025 21:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52AD1401F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52AD1401F1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52AD1401F1
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:28:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B0592780331;
 Sat, 31 May 2025 23:28:22 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 31 May 2025 23:28:22 +0200
MIME-Version: 1.0
Date: Sat, 31 May 2025 23:28:22 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org
In-Reply-To: <20250303161557.571619-5-alex.bennee@linaro.org>
References: <20250303161557.571619-1-alex.bennee@linaro.org>
 <20250303161557.571619-5-alex.bennee@linaro.org>
User-Agent: Webmail Free/1.6.10
Message-ID: <abe28079a139d6be300c34593614aa66@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748726903;
 bh=Z0yHJkbEHLhf3daW0Mthdnw45dS8RYGZk+NRMGXxDx0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hkztCMYAbSVd4WecBOPv8Yw0BebM96UFC16QGkm7amfj6Bx3RH4mmi1Aa98y8q8eu
 zbpgEhYsHkdQsBHutKAcNjNB7FfO+Kas48sSGXt4d1+AqjYmzVnaMeSFiGaVY/ZvNC
 nqpb5sr1Vpo3Qn4fMLXqUdLz70APQWrB+L3u9/MfEmNejvssUOqrvEVYh8m2vB6vyJ
 bGjiF4bwEQtp34DxRhKHwQZJjN8SlrCw0GcQ+Et6m8lhLHRq6oUNUkpQY1atBRm1Fj
 1u4hWluikX+1PhGfge3OadVP/QgV71ODr3GiiwaD8zl4X50MgXcYGStXwgidRUHkn6
 /fJ7QNJ6vD7Gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hkztCMYA
Subject: Re: [Buildroot] [PATCH v4 4/6] package/vulkan-tools: suppress
 isystem being passed
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoIQoKSWYgdGhlIHZ1bGthbi10b29scyBwYWNr
YWdlIGlzIGtub3duIHRvIGJlIGJyb2tlbiBmcm9tIGl0cyBidW1wIHRvCjEuNC4zMDcgZnJvbSB0
aGUgcHJldmlvdXMgcGF0Y2gsIHRoaXMgcGF0Y2ggc2hvdWxkIHByZWZlcmFibHkgYmUKc3F1YXNo
ZWQgd2l0aCB0aGUgYnVtcC4gV2UgYXJlIHRyeWluZyB0byBrZWVwIGVhY2ggY29tbWl0IGZ1bmN0
aW9uYWwKdG8gbWFrZSBnaXQgYmlzZWN0IGVhc2llci4KCkNvdWxkIHlvdSBzcXVhc2ggdGhpcyBw
YXRjaCB3aXRoIHRoZSBwcmV2aW91cyBvbmUsIHBsZWFzZT8KCk9uIDAzLzAzLzIwMjUgMTc6MTUs
IEFsZXggQmVubsOpZSB3cm90ZToKPiBUaGlzIGFwcGxpZXMgTk9fU1lTVEVNX0ZST01fSU1QT1JU
RUQgMSB0byB0aGUgdnVsa2FuaW5mbyBidWlsZCB0bwo+IHByZXZlbnQgLWlzeXN0ZW0gYmVpbmcg
cGFzc2VkLCBicmVha2luZyB0aGUgYnVpbGQgd2l0aDoKPiAKPiAgIC4uLiBhYXJjaDY0LWJ1aWxk
cm9vdC1saW51eC1nbnUvaW5jbHVkZS9jKysvMTQuMi4wL2NzdGRsaWI6Nzk6MTU6IAo+IGZhdGFs
IGVycm9yOiBzdGRsaWIuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAgICAgNzkgfCAj
aW5jbHVkZV9uZXh0IDxzdGRsaWIuaD4KPiAgICAgICAgIHwgICAgICAgICAgICAgICBefn5+fn5+
fn5+Cj4gICBjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPiAtLS0KPiAgLi4uYW5pbmZvLXN1cHBy
ZXNzLWlzeXN0ZW0tYmVpbmctcGFzc2VkLnBhdGNoIHwgNTcgKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
Cj4gcGFja2FnZS92dWxrYW4tdG9vbHMvMDAwMS12dWxrYW5pbmZvLXN1cHByZXNzLWlzeXN0ZW0t
YmVpbmctcGFzc2VkLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCAKPiBhL3BhY2thZ2UvdnVsa2FuLXRv
b2xzLzAwMDEtdnVsa2FuaW5mby1zdXBwcmVzcy1pc3lzdGVtLWJlaW5nLXBhc3NlZC5wYXRjaCAK
PiBiL3BhY2thZ2UvdnVsa2FuLXRvb2xzLzAwMDEtdnVsa2FuaW5mby1zdXBwcmVzcy1pc3lzdGVt
LWJlaW5nLXBhc3NlZC5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMC4uMjZmOGM0YTU1Zgo+IC0tLSAvZGV2L251bGwKPiArKysgCj4gYi9wYWNrYWdlL3Z1bGth
bi10b29scy8wMDAxLXZ1bGthbmluZm8tc3VwcHJlc3MtaXN5c3RlbS1iZWluZy1wYXNzZWQucGF0
Y2gKPiBAQCAtMCwwICsxLDU3IEBACj4gK0Zyb20gOTMyYTk5MDJmOTIzYWEwYjY0MjNjZWVlOGZi
MDI4OTY2NWExZDE1NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogPT9VVEYtOD9x
P0FsZXg9MjBCZW5uPUMzPUE5ZT89IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+ICtEYXRlOiBG
cmksIDE0IEZlYiAyMDI1IDEwOjQ0OjU4ICswMDAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gdnVsa2Fu
aW5mbzogc3VwcHJlc3MgLWlzeXN0ZW0gYmVpbmcgcGFzc2VkCj4gK01JTUUtVmVyc2lvbjogMS4w
Cj4gK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gKwo+ICtEdXJpbmcgdGhlIHByb2Nlc3Mgb2YgdXBkYXRp
bmcgdnVsa2FuLXRvb2xzIGluIGJ1aWxkcm9vdCBJIHJhbiBpbnRvCj4gK3RoZSBmb2xsb3dpbmcg
YnVpbGQgZmFpbHVyZToKPiArCj4gKyAgWyA1MCVdIEJ1aWxkaW5nIENYWCBvYmplY3QgCj4gdnVs
a2FuaW5mby9DTWFrZUZpbGVzL3Z1bGthbmluZm8uZGlyL3Z1bGthbmluZm8uY3BwLm8KPiArICBJ
biBmaWxlIGluY2x1ZGVkIGZyb20gCj4gL2hvbWUvYWxleC9sc3JjL3Rlc3RzL2J1aWxkcm9vdC5n
aXQvYnVpbGRzL2FybTY0L2hvc3QvYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L2luY2x1ZGUv
YysrLzE0LjIuMC9iaXRzL3N0bF9hbGdvLmg6NzEsCj4gKyAgICAgICAgICAgICAgICAgICBmcm9t
IAo+IC9ob21lL2FsZXgvbHNyYy90ZXN0cy9idWlsZHJvb3QuZ2l0L2J1aWxkcy9hcm02NC9ob3N0
L2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9pbmNsdWRlL2MrKy8xNC4yLjAvYWxnb3JpdGht
OjYxLAo+ICsgICAgICAgICAgICAgICAgICAgZnJvbSAKPiAvaG9tZS9hbGV4L2xzcmMvdGVzdHMv
YnVpbGRyb290LmdpdC9idWlsZHMvYXJtNjQvYnVpbGQvdnVsa2FuLXRvb2xzLTEuNC4zMDcvdnVs
a2FuaW5mby8uL3Z1bGthbmluZm8uaDozMSwKPiArICAgICAgICAgICAgICAgICAgIGZyb20gCj4g
L2hvbWUvYWxleC9sc3JjL3Rlc3RzL2J1aWxkcm9vdC5naXQvYnVpbGRzL2FybTY0L2J1aWxkL3Z1
bGthbi10b29scy0xLjQuMzA3L3Z1bGthbmluZm8vZ2VuZXJhdGVkL3Z1bGthbmluZm8uaHBwOjI4
LAo+ICsgICAgICAgICAgICAgICAgICAgZnJvbSAKPiAvaG9tZS9hbGV4L2xzcmMvdGVzdHMvYnVp
bGRyb290LmdpdC9idWlsZHMvYXJtNjQvYnVpbGQvdnVsa2FuLXRvb2xzLTEuNC4zMDcvdnVsa2Fu
aW5mby92dWxrYW5pbmZvLmNwcDozNDoKPiArICAKPiAvaG9tZS9hbGV4L2xzcmMvdGVzdHMvYnVp
bGRyb290LmdpdC9idWlsZHMvYXJtNjQvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUv
aW5jbHVkZS9jKysvMTQuMi4wL2NzdGRsaWI6Nzk6MTU6IAo+IGZhdGFsIGVycm9yOiBzdGRsaWIu
aDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICsgICAgIDc5IHwgI2luY2x1ZGVfbmV4dCA8
c3RkbGliLmg+Cj4gKyAgICAgICAgfCAgICAgICAgICAgICAgIF5+fn5+fn5+fn4KPiArICBjb21w
aWxhdGlvbiB0ZXJtaW5hdGVkLgo+ICsgIG1ha2VbMl06ICoqKiBbdnVsa2FuaW5mby9DTWFrZUZp
bGVzL3Z1bGthbmluZm8uZGlyL2J1aWxkLm1ha2U6NzY6IAo+IHZ1bGthbmluZm8vQ01ha2VGaWxl
cy92dWxrYW5pbmZvLmRpci92dWxrYW5pbmZvLmNwcC5vXSBFcnJvciAxCj4gKyAgbWFrZVsxXTog
KioqIFtDTWFrZUZpbGVzL01ha2VmaWxlMjoxMTY6IAo+IHZ1bGthbmluZm8vQ01ha2VGaWxlcy92
dWxrYW5pbmZvLmRpci9hbGxdIEVycm9yIDIKPiArICBtYWtlOiAqKiogW01ha2VmaWxlOjEzNjog
YWxsXSBFcnJvciAyCj4gKwo+ICtUaGUgdW5kZXJseWluZyByZWFzb24gd2FzIC1pc3lzdGVtIGJl
aW5nIHBhc3NlZCB0byB0aGUgYnVpbGQgd2hpY2ggSQo+ICt0aGluayByZXNldHMgdGhlIGluY2x1
ZGUgcGF0aCBmb3Igc3lzdGVtIGluY2x1ZGVzLiBUaGlzIG1pZ2h0IGJlIGEgYnVnCj4gK2luIGNt
YWtlIGJ1dCBmcm9tIGxvb2tpbmcgYXQgdGhlIENNYWtlIHNvdXJjZSBJIGZvdW5kIHNvbWUgZXhh
bXBsZXMKPiArdGhhdCBzZXQ6IE5PX1NZU1RFTV9GUk9NX0lNUE9SVEVEIDEgYXMgYSB0YXJnZXQg
cHJvcGVydHkgd2hpY2ggc2VlbXMKPiArdG8gZG8gdGhlIGpvYi4KPiArCj4gK1RoaXMgZG9lc24n
dCBzZWVtIHRvIGFmZmVjdCB0aGUgbm9ybWFsIG5vbi1jcm9zcyBidWlsZCBhbHRob3VnaCBJCj4g
K3dvdWxkbid0IGV4cGVjdCB5b3UgbmVlZCB0byBwYXNzIC1pc3lzdGVtIGFueXdheS4KPiArCj4g
K1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy9w
dWxsLzEwNzcKPiArU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5h
cm8ub3JnPgo+ICstLS0KPiArIHZ1bGthbmluZm8vQ01ha2VMaXN0cy50eHQgfCAzICsrLQo+ICsg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICsKPiArZGlm
ZiAtLWdpdCBhL3Z1bGthbmluZm8vQ01ha2VMaXN0cy50eHQgYi92dWxrYW5pbmZvL0NNYWtlTGlz
dHMudHh0Cj4gK2luZGV4IDdlNTFiYjJkLi5kNGY3ZTFmYSAxMDA2NDQKPiArLS0tIGEvdnVsa2Fu
aW5mby9DTWFrZUxpc3RzLnR4dAo+ICsrKysgYi92dWxrYW5pbmZvL0NNYWtlTGlzdHMudHh0Cj4g
K0BAIC0yMiw3ICsyMiw4IEBAIHNldChWVUxLQU5JTkZPX05BTUUgdnVsa2FuaW5mbykKPiArIHNl
dChHRU5FUkFURUQgZ2VuZXJhdGVkKQo+ICsKPiArIGFkZF9leGVjdXRhYmxlKHZ1bGthbmluZm8p
Cj4gKy1zZXRfdGFyZ2V0X3Byb3BlcnRpZXModnVsa2FuaW5mbyBQUk9QRVJUSUVTIE9VVFBVVF9O
QU1FIAo+ICR7VlVMS0FOSU5GT19OQU1FfSkKPiArK3NldF90YXJnZXRfcHJvcGVydGllcyh2dWxr
YW5pbmZvIFBST1BFUlRJRVMgT1VUUFVUX05BTUUgCj4gJHtWVUxLQU5JTkZPX05BTUV9Cj4gKysg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5PX1NZU1RFTV9GUk9N
X0lNUE9SVEVEIAo+IDEpCj4gKwo+ICsgdGFyZ2V0X3NvdXJjZXModnVsa2FuaW5mbyBQUklWQVRF
IHZ1bGthbmluZm8uY3BwKQo+ICsKPiArLS0KPiArMi4zOS41Cj4gKwo+IC0tCj4gMi4zOS41Cj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCkJlc3QgcmVnYXJk
cywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
