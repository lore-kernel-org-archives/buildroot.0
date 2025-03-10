Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EF9C282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 21:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E122F820F5;
	Mon, 10 Mar 2025 21:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVKFtewFvd8F; Mon, 10 Mar 2025 21:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9633820FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9633820FE;
	Mon, 10 Mar 2025 21:28:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C43594A
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 21:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B7CF40BA7
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 21:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6Ux1KX36xaA for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 21:28:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC9F940B53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC9F940B53
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC9F940B53
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 21:28:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 17EF02003B4;
 Mon, 10 Mar 2025 22:28:20 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Mar 2025 22:28:20 +0100
MIME-Version: 1.0
Date: Mon, 10 Mar 2025 22:28:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250310111413.2976804-1-fiona.klute@gmx.de>
References: <20250310111413.2976804-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <679637e4b70ed8060264d728d0536b9e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741642102;
 bh=aOEEcg7HnHGtjTCbYy9KO6IF2HswoEhBTM+09PJriAI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Dxg+DA01mzLl3BiqQuPaaiKKiHskXjHU6QrV0ol70Q1dRohY/l+D1o1KLPgiLh3dz
 8EKBow71wWkmFSF3m/HTn+8QovLbwrT+45/6VeusnCUozWnRRXjpFr+GZ/mua5jtIp
 58u2VJQzvc3RECGk1UMn3NHSTPBySfoxZZ5DeAp49JC1yvk9OqHBgDz9BasYt8cX/M
 K8m5lsjy2mskLCsQiF95HDUW1IpZsoJHLigCUESnoVsScuJ6wnrRNbRKCc1HrgS3/G
 8mmijc06Z11K/UEpAx1fngclP8en2p8/wIMThitMSNgC1yd+OsBsBrDFLzJF4b3KND
 ZIDs7OyO1eMaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dxg+DA01
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump version
 to 1.52.0
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

SGkgRmlvbmEsCgpUaGFua3MgZm9yIHRoZSBwYXRjaCEKCk9uIDEwLzAzLzIwMjUgMTI6MTQsIEZp
b25hIEtsdXRlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gRnJvbTogIkZpb25hIEtsdXRlIChXSVdB
KSIgPGZpb25hLmtsdXRlQGdteC5kZT4KPiAKPiBVcHN0cmVhbSBjaGFuZ2Vsb2cgd2l0aCBhIG1p
eCBvZiBuZXcgZmVhdHVyZXMgYW5kIGJ1Z2ZpeGVzOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9OZXR3b3JrTWFuYWdlci9OZXR3b3JrTWFuYWdlci8tL2Jsb2IvMS41Mi4wL05FV1M/
cmVmX3R5cGU9dGFncwo+IAo+IFN1cHBvcnQgZm9yIHRoZSAiZGhjcGNhbm9uIiBESENQIGNsaWVu
dCBoYXMgYmVlbiByZW1vdmVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZpb25hIEtsdXRlIChXSVdB
KSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+IC0tLQo+IElmIHRoaXMgaXMgYXBwbGllZCB0byAibmV4
dCIgaW5zdGVhZCBvZiAibWFzdGVyIiwgdGhlIG5leHQgcmVsZWFzZQo+IHNob3VsZCBwcm9iYWJs
eSBnZXQgMS41MC4zIGluc3RlYWQgKHdpdGggYSBmZXcgYnVnZml4ZXMpLCBzZWU6Cj4gaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL05ldHdvcmtNYW5hZ2VyL05ldHdvcmtNYW5hZ2VyLy0v
YmxvYi8xLjUwLjMvTkVXUz9yZWZfdHlwZT10YWdzCj4gCj4gIHBhY2thZ2UvbmV0d29yay1tYW5h
Z2VyL25ldHdvcmstbWFuYWdlci5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvbmV0d29yay1tYW5h
Z2VyL25ldHdvcmstbWFuYWdlci5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25l
dHdvcmstbWFuYWdlci9uZXR3b3JrLW1hbmFnZXIuaGFzaCAKPiBiL3BhY2thZ2UvbmV0d29yay1t
YW5hZ2VyL25ldHdvcmstbWFuYWdlci5oYXNoCj4gaW5kZXggNjRlYzVhY2JlYS4uYTA5NjNlMDEw
ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL25ldHdvcmstbWFuYWdlci9uZXR3b3JrLW1hbmFnZXIu
aGFzaAo+ICsrKyBiL3BhY2thZ2UvbmV0d29yay1tYW5hZ2VyL25ldHdvcmstbWFuYWdlci5oYXNo
Cj4gQEAgLTEsNSArMSw1IEBACj4gLSMgRnJvbSAKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvTmV0d29ya01hbmFnZXIvTmV0d29ya01hbmFnZXIvLS9yZWxlYXNlcy8xLjUwLjIvZG93
bmxvYWRzL05ldHdvcmtNYW5hZ2VyLTEuNTAuMi50YXIueHouc2hhMjU2c3VtCj4gLXNoYTI1NiAg
Cj4gMTA0NzNiZTlkM2FiODlmOGEyN2E2OGI3YmY1YmM5NTU3ODUxYTUxODNiNzRiNjI0MWU1ZTBm
YTVjNjkyMWZlZiAgCj4gTmV0d29ya01hbmFnZXItMS41MC4yLnRhci54ego+ICsjIEZyb20gCj4g
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL05ldHdvcmtNYW5hZ2VyL05ldHdvcmtNYW5h
Z2VyLy0vcmVsZWFzZXMvMS41Mi4wL2Rvd25sb2Fkcy9OZXR3b3JrTWFuYWdlci0xLjUyLjAudGFy
Lnh6LnNoYTI1NnN1bQo+ICtzaGEyNTYgIAo+IDM1NmYyMWExNWRhNTFlNDIxOGZkNGQwZmQ3OGNl
YTYxZTA2N2IxMTE2YTI1Y2RkZWU0YWY5ZGYwNTA2MmU5MmQgIAo+IE5ldHdvcmtNYW5hZ2VyLTEu
NTIuMC50YXIueHoKPiAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gIHNoYTI1NiAgCj4gODE3N2Y5NzUx
MzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAg
Cj4gQ09QWUlORwo+ICBzaGEyNTYgIAo+IGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBl
NTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIAo+IENPUFlJTkcuTEdQTAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL25ldHdvcmstbWFuYWdlci9uZXR3b3JrLW1hbmFnZXIubWsgCj4gYi9w
YWNrYWdlL25ldHdvcmstbWFuYWdlci9uZXR3b3JrLW1hbmFnZXIubWsKPiBpbmRleCAxYTBhZGFj
ZmEwLi5hYjNhNDM3ODM4IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbmV0d29yay1tYW5hZ2VyL25l
dHdvcmstbWFuYWdlci5tawo+ICsrKyBiL3BhY2thZ2UvbmV0d29yay1tYW5hZ2VyL25ldHdvcmst
bWFuYWdlci5tawo+IEBAIC00LDggKzQsOCBAQAo+ICAjCj4gIAo+ICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gCj4gLU5FVFdPUktfTUFOQUdFUl9WRVJTSU9OX01BSk9SID0gMS41MAo+IC1ORVRX
T1JLX01BTkFHRVJfVkVSU0lPTiA9ICQoTkVUV09SS19NQU5BR0VSX1ZFUlNJT05fTUFKT1IpLjIK
PiArTkVUV09SS19NQU5BR0VSX1ZFUlNJT05fTUFKT1IgPSAxLjUyCj4gK05FVFdPUktfTUFOQUdF
Ul9WRVJTSU9OID0gJChORVRXT1JLX01BTkFHRVJfVkVSU0lPTl9NQUpPUikuMAoKV2hlbiB0ZXN0
aW5nIHRoaXMgcGF0Y2ggb24gYnJhbmNoIG5leHQgYXQgY29tbWl0IGJjOTMzMTkgd2l0aApjb21t
YW5kczoKCiAgICAgY2F0IDw8RU9GID4uY29uZmlnCiAgICAgQlIyX2FhcmNoNjQ9eQogICAgIEJS
Ml9UT09MQ0hBSU5fRVhURVJOQUw9eQogICAgIEJSMl9QQUNLQUdFX05FVFdPUktfTUFOQUdFUj15
CiAgICAgQlIyX1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19FVURFVj15CiAgICAgRU9G
CiAgICAgbWFrZSBvbGRkZWZjb25maWcKICAgICBtYWtlIG5ldHdvcmstbWFuYWdlcgoKQ29tcGls
YXRpb24gZmFpbHMgd2l0aDoKCiAgICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIAouLi9zcmMvbGli
bm0tc3lzdGVtZC1zaGFyZWQvc3JjL2Jhc2ljL2ZzLXV0aWwuYzoyNzoKICAgICAuLi9zcmMvbGli
bm0tc3lzdGVtZC1zaGFyZWQvc3JjL2Jhc2ljL21pc3Npbmdfc3lzY2FsbC5oOiBJbiBmdW5jdGlv
biAK4oCYbWlzc2luZ19waWRmZF9zZW5kX3NpZ25hbOKAmToKICAgICAuLi9zcmMvbGlibm0tc3lz
dGVtZC1zaGFyZWQvc3JjL2Jhc2ljL21pc3Npbmdfc3lzY2FsbC5oOjMwODoyNDogCmVycm9yOiDi
gJhfX05SX3BpZGZkX3NlbmRfc2lnbmFs4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlz
IGZ1bmN0aW9uKTsgCmRpZCB5b3UgbWVhbiDigJhtaXNzaW5nX3BpZGZkX3NlbmRfc2lnbmFs4oCZ
PwogICAgICAgMzA4IHwgICAgICAgICByZXR1cm4gc3lzY2FsbChfX05SX3BpZGZkX3NlbmRfc2ln
bmFsLCBmZCwgc2lnLCAKaW5mbywgZmxhZ3MpOwogICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpUZXN0aW5nIHdpdGggdGhlIEJvb3RsaW4g
dG9vbGNoYWluIHdvcmtzLgpNYXliZSB0aGlzIG5ldyB2ZXJzaW9uIGludHJvZHVjZXMgbmV3IGRl
cGVuZGVuY2llcyBvbiB0aGUgS2VybmVsCmhlYWRlciB2ZXJzaW9uPwoKQ291bGQgeW91IGhhdmUg
YSBsb29rLCBwbGVhc2U/Cgo+ICBORVRXT1JLX01BTkFHRVJfU09VUkNFID0gCj4gTmV0d29ya01h
bmFnZXItJChORVRXT1JLX01BTkFHRVJfVkVSU0lPTikudGFyLnh6Cj4gIE5FVFdPUktfTUFOQUdF
Ul9TSVRFID0gCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL05ldHdvcmtNYW5hZ2Vy
L05ldHdvcmtNYW5hZ2VyLy0vcmVsZWFzZXMvJChORVRXT1JLX01BTkFHRVJfVkVSU0lPTikvZG93
bmxvYWRzCj4gIE5FVFdPUktfTUFOQUdFUl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAtLQo+IDIu
NDcuMgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
