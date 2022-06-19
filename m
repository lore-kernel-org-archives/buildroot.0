Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A856BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 537A360E5D;
	Sun, 19 Jun 2022 16:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 537A360E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fhs8FOmRX7L8; Sun, 19 Jun 2022 16:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30F0260C31;
	Sun, 19 Jun 2022 16:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F0260C31
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A08A1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 410758239A
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 410758239A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rx6nXqdGA4RN for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:50:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 284B181D18
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 284B181D18
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:50:19 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gl15so16997049ejb.4
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=slKZHBa8nDnySSfRb/kC8QbWjl44wUniN5HuQgsHLVs=;
 b=by/n/+Hs4ETgyCg5QHr527i2b//IjOK/mjxSwZtNx22Vgonkq2BFa92UA+Czl6sxT3
 LP+0etJMLFXUpOMYyVvSUrqccBRXauJHokouhs2/dNtwDPqO9EUKagLieAfHM2UdC5sU
 gm2LIkzaDvBjSuHl8YjSrvdJzNi0qpkC2GlTDQ5AnpKVWB5Ii+bjeUj8Dt42MZUsykud
 aw/tt53sUjY61sRFOxHGqPW5b5iszysaYW3ehMtm3aZPiOT7L/7xZ0uLusVSckkYHfQO
 3sLlnaP7B6LkL9C7K76SUompnlBwoSQUS3+Adq/mPjZGTo1n5BZ0YP9ch8GRWTfEjZjm
 CTTw==
X-Gm-Message-State: AJIora/e+lnjCyd8Ehq7ryXwA6WK8Z76UOu8lhOAWU+m+iuSANDQIrPx
 c+812r9bzkerumReJqGwP26SgbFxgMDUyA==
X-Google-Smtp-Source: AGRyM1th+eTHY8pIoiGdohNkGDL+QShzsFbLZR2SnelLVCS/92VKMMvxC+Y7MWrUA3Xko4RGlhZXow==
X-Received: by 2002:a17:906:51d5:b0:711:f4c7:5085 with SMTP id
 v21-20020a17090651d500b00711f4c75085mr18133288ejk.650.1655657417405; 
 Sun, 19 Jun 2022 09:50:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p18-20020aa7c4d2000000b004351f58451dsm8170698edr.17.2022.06.19.09.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 09:50:16 -0700 (PDT)
Message-ID: <87ff856d-1b22-f7f6-2692-d2938a4f4e79@mind.be>
Date: Sun, 19 Jun 2022 18:50:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20220602073546.557932-1-jose.pekkarinen@unikie.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220602073546.557932-1-jose.pekkarinen@unikie.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=slKZHBa8nDnySSfRb/kC8QbWjl44wUniN5HuQgsHLVs=;
 b=aALVNIVyHv6TMybHEsVspn0r7xRmElJjdGIffdzuVrxCffPDWNr1phYu5hFVyUxceU
 IWPBH15AYtov1Sjdc/n2P4EkQX0FGZKeB152d1lArdx+Ia1KVJrOtD0Xeo65NqYBUyVb
 J5N399CBmcKc+Vi/Dmm4nXocspl7CPAUlJJFCYoL3jHUwgWRst7O7M+vLKCzxUEXnLZ9
 6kHpEIJY06yZJd6kMJXUdADCBaz04eM6tc9cMEJlT24qFeguYOuVtarrAGIRWJYJNk4Z
 8boOjh6czVAtroWyqolac2x5RANBOgh0Xk2xyR1hTKCB8VbBDBqz/RM822b4dD8TAN68
 xwKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aALVNIVy
Subject: Re: [Buildroot] [PATCH] package/python-alembic: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMi8wNi8yMDIyIDA5OjM1LCBKb3PDqSBQZWtrYXJpbmVuIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVu
aWtpZS5jb20+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIEZvciBQeXRob24gcGFj
a2FnZXMsIGl0J3MgbmljZSB0byBhZGQgYSBydW50aW1lIHRlc3QsIHRvIGNoZWNrIHRoYXQgbm8g
cnVudGltZSAKZGVwZW5kZW5jaWVzIGFyZSBmb3Jnb3R0ZW4gKGVzcGVjaWFsbHkgd2hlbiB1cGRh
dGluZyB0aGUgcGFja2FnZSkuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgREVWRUxP
UEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAgcGFja2FnZS9D
b25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICAgcGFja2FnZS9weXRo
b24tYWxlbWJpYy9Db25maWcuaW4gICAgICAgICAgIHwgIDcgKysrKysrKwo+ICAgcGFja2FnZS9w
eXRob24tYWxlbWJpYy9weXRob24tYWxlbWJpYy5oYXNoIHwgIDUgKysrKysKPiAgIHBhY2thZ2Uv
cHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMubWsgICB8IDE0ICsrKysrKysrKysrKysrCj4g
ICA1IGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3B5dGhvbi1hbGVtYmljL0NvbmZpZy5pbgo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMuaGFzaAo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMubWsKPiAKPiBk
aWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCBjMzM5NTlmYTQ1Li4y
ODJmZWI4YWRmIDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4g
QEAgLTE1MzgsNiArMTUzOCw3IEBAIE46CUpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5l
bkB1bmlraWUuY29tPgo+ICAgRjoJcGFja2FnZS9hbGZyZWQvCj4gICBGOglwYWNrYWdlL2JteDcv
Cj4gICBGOglwYWNrYWdlL3B5dGhvbi1hZXhwZWN0Lwo+ICtGOglwYWNrYWdlL3B5dGhvbi1hbGVt
YmljLwo+ICAgRjoJcGFja2FnZS9zb2Z0aHNtMi8KPiAgIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3NhbXBsZV9weXRob25fYWV4cGVjdC5weQo+ICAgRjoJc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fYWV4cGVjdC5weQo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggODg5MjEzNDEzMy4uNTg2
NmVkNjllOSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uv
Q29uZmlnLmluCj4gQEAgLTkyOSw2ICs5MjksNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9k
dWxlcyIKPiAgIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFpb3J3bG9jay9Db25maWcuaW4iCj4g
ICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1haW9zaWduYWwvQ29uZmlnLmluIgo+ICAgCXNvdXJj
ZSAicGFja2FnZS9weXRob24tYWlvemlwa2luL0NvbmZpZy5pbiIKPiArCXNvdXJjZSAicGFja2Fn
ZS9weXRob24tYWxlbWJpYy9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1h
bHNhYXVkaW8vQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9weXRob24tYW5zaWNvbG9y
cy9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1hcmdoL0NvbmZpZy5pbiIK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYWxlbWJpYy9Db25maWcuaW4gYi9wYWNrYWdl
L3B5dGhvbi1hbGVtYmljL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMC4uYTUzZGRlN2Y3Zgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5
dGhvbi1hbGVtYmljL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsNyBAQAo+ICtjb25maWcgQlIyX1BB
Q0tBR0VfUFlUSE9OX0FMRU1CSUMKPiArCWJvb2wgInB5dGhvbi1hbGVtYmljIgo+ICsJaGVscAo+
ICsJICBBbGVtYmljIGlzIGEgZGF0YWJhc2UgbWlncmF0aW9ucyB0b29sIHdyaXR0ZW4gYnkgdGhl
IGF1dGhvcgo+ICsJICBvZiBTUUxBbGNoZW15Lgo+ICsKPiArCSAgaHR0cHM6Ly9hbGVtYmljLnNx
bGFsY2hlbXkub3JnCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9u
LWFsZW1iaWMuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9uLWFsZW1iaWMuaGFz
aAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uOGY1Y2JiNmZhMwo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1hbGVtYmljL3B5dGhvbi1hbGVt
YmljLmhhc2gKPiBAQCAtMCwwICsxLDUgQEAKPiArIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8v
cHlwaS5vcmcvcHlwaS9hbGVtYmljL2pzb24KPiArbWQ1ICA0NGU4MjM0MWE2ZWUwYTQyZjYzZGMx
ZjUxY2FmOTFlNiAgYWxlbWJpYy0xLjcuNy50YXIuZ3oKPiArc2hhMjU2ICA0OTYxMjQ4MTczZWFk
N2NlOGEyMWVmYjNkZTM3OGYxM2I4Mzk4ZTY2MzBmYWIwZWIyNThkYzc0YThhZjI0YzU4ICBhbGVt
YmljLTEuNy43LnRhci5nego+ICsjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+
ICtzaGEyNTYgIGYwZTNmN2E1MDgwODc5Y2NhZTc5ODg4MmQ5YmVlM2Q0OGZlMzM1ZDBiYWQ4NGNh
OGVlYzg2ZmE1OTQzNzVlYTAgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24t
YWxlbWJpYy9weXRob24tYWxlbWJpYy5tayBiL3BhY2thZ2UvcHl0aG9uLWFsZW1iaWMvcHl0aG9u
LWFsZW1iaWMubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjhi
YTMyNjQ3YWIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tYWxlbWJpYy9w
eXRob24tYWxlbWJpYy5tawo+IEBAIC0wLDAgKzEsMTQgQEAKPiArIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiArIwo+ICsjIHB5dGhvbi1hbGVtYmljCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiArCj4gK1BZVEhPTl9BTEVNQklDX1ZFUlNJT04gPSAxLjcuNwo+ICtQWVRIT05fQUxF
TUJJQ19TT1VSQ0UgPSBhbGVtYmljLSQoUFlUSE9OX0FMRU1CSUNfVkVSU0lPTikudGFyLmd6Cj4g
K1BZVEhPTl9BTEVNQklDX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFj
a2FnZXMvMzAvYjkvNTUyNmI0M2E0YzU0ZDE3N2FiMTRhZjBhZjRiNWMzMWQ3M2RiMzNkMWFkM2Uz
MDk3NmQzYjAyM2UwNTk0Cj4gK1BZVEhPTl9BTEVNQklDX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xz
Cj4gK1BZVEhPTl9BTEVNQklDX0xJQ0VOU0UgPSBNSVQKPiArUFlUSE9OX0FMRU1CSUNfTElDRU5T
RV9GSUxFUyA9IExJQ0VOU0UKPiArCj4gKyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
