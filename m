Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29673CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 17:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C811E61325;
	Thu,  9 Oct 2025 17:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y23vkWtuw2Vl; Thu,  9 Oct 2025 17:47:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDA79612E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA79612E5;
	Thu,  9 Oct 2025 17:47:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 876C821B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 17:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7836B40F74
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 17:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIxu0rXTWg_c for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 17:47:34 +0000 (UTC)
X-Greylist: delayed 313 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 09 Oct 2025 17:47:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0189E40F4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0189E40F4A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0189E40F4A
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 17:47:33 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 85E252C80C53
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 19:42:18 +0200 (CEST)
Message-ID: <13eefae6-0fb5-4e32-bca1-0ff35d13a5a0@bubu1.eu>
Date: Thu, 9 Oct 2025 19:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20251009152813.1690704-1-vincent.stehle@arm.com>
Content-Language: en-US
In-Reply-To: <20251009152813.1690704-1-vincent.stehle@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760031738; bh=HPvFDfyYL5NQqSHBaxq16LEtJBiXFYHmkaPODypSXhw=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=dLDw90kgQVCpOqzEZYs8Jkq9KPBc9uLeEazDCVwSQknGXeizZnz8DDC6/1XE4ytdE
 lvUuVHuYiRPno4eaUmI4HRYFBYYnPAODdCa4+e9piEWBDoAcDvTxqG5zilBb2UbN3O
 zuXjPZm1H8X8B8Q7mjX1Wg87G0J1LNVTX/RbJ+ma/R9c0mHhI8MwyzR2C+rHsxF7S+
 E65ftGb8EtBAfKSJrDZ/NBiCq3atAOuj0OYyBERTllwPSDcm33PoZNj8bkXYNtOoZi
 StzHNq5mp2VJtp/gr4SJpRcQJEvMvNeAkvV+RE9us/l6yx+69TOVq6R5oCHC5D/FK5
 04OZIQBgKTtYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=dLDw90kg
Subject: Re: [Buildroot] [PATCH] utils/brmake: filter output for parallel
 build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCEKCk9uIDEwLzkvMjUgMTc6MjgsIFZpbmNlbnQgU3RlaGzDqSB3cm90ZToKPiBX
aGVuIGJ1aWxkaW5nIGluIHBhcmFsbGVsIHdpdGggcGVyLXBhY2thZ2UgZGlyZWN0b3JpZXMKPiAo
QlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTPXkpLCBicm1ha2Ugb3V0cHV0IGlzIG9mdGVuIGdh
cmJsZWQ6CgpUaGlzIGhhcyBib3RoZXJlZCBtZSBmb3Igc29vbyBsb25nLCBidXQgSSBuZXZlciBm
b3VuZCBvdXQgd2h5IHRoaXMgaXMgCmdvaW5nIHdyb25nLiBEbyB5b3Uga25vdyB3aHkgdGhpcyBz
cGVjaWZpY2FsbHkgZmFpbHMgd2l0aCBQUERzICh3aGljaCBJIAphbHdheXMgZW5hYmxlLCBzbyBJ
IG5ldmVyIGtuZXcgdGhpcyB3YXMgbm90IGJyb2tlbiB3aXRob3V0IHRoZW0pPwoKPiAKPiAgICAy
MDI1LTEwLTA4VDE4OjM5OjEwID4+PiBob3N0LWR0YyAxLjcuMiBCdWlsZGluZwo+ICAgIDIwMjUt
MTAtMDhUMTg6Mzk6MTEgY2hlY2tpbmcgZm9yIHN0ZGludC5oLi4uID4+PiBob3N0LWR0YyAxLjcu
MiBJbnN0YWxsaW5nIHRvIGhvc3QgZGlyZWN0b3J5Cj4gICAgMjAyNS0xMC0wOFQxODozOToxMiBj
aGVja2luZyBmb3IgbGltaXRzLmguLi4gPj4+IGhvc3QtZ21wIDYuMy4wIEluc3RhbGxpbmcgdG8g
aG9zdCBkaXJlY3RvcnkKPiAKPiBSZW1vdmUgdGhlIHNwdXJpb3VzIHN0cmluZyBiZXR3ZWVuIHRo
ZSB0aW1lc3RhbXAgYW5kIHRoZSAiPj4+IiBtYXJrZXIgdG8KPiBmaXggdGhpcy4KPiBXZSBuZWVk
IHNvbWUgZXh0cmEgY2FyZSB0byBwcmVzZXJ2ZSB0aGUgcHJlY2VkaW5nICJ0ZXJtIGJvbGQiIHNw
ZWNpYWwKPiBjaGFyYWN0ZXJzIHNlcXVlbmNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQg
U3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gLS0tCj4gICB1dGlscy9icm1ha2UgfCAzICsrLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS91dGlscy9icm1ha2UgYi91dGlscy9icm1ha2UKPiBpbmRleCBhNGI5ZTdmYTcxLi4y
YTc0ZDU4MTY3IDEwMDc1NQo+IC0tLSBhL3V0aWxzL2JybWFrZQo+ICsrKyBiL3V0aWxzL2JybWFr
ZQo+IEBAIC0xMiw3ICsxMiw4IEBAIG1haW4oKSB7Cj4gICAgICAgICAgICAgICAgcHJpbnRmICIl
KCVZLSVtLSVkVCVIOiVNOiVTKVQgJXNcbiIgLTEgIiR7bGluZX0iCj4gICAgICAgICAgICBkb25l
IFwKPiAgICAgICAgICAgIHx0ZWUgLWEgYnIubG9nIFwKPiAtICAgICAgICAgfGdyZXAgLS1jb2xv
dXI9bmV2ZXIgLUUgJz4+PicKPiArICAgICAgICAgfGdyZXAgLS1saW5lLWJ1ZmZlcmVkIC0tY29s
b3VyPW5ldmVyIC1FICc+Pj4nIFwKCkNvdWxkIHlvdSBleHBsYWluIHdoYXQgLS1saW5lLWJ1ZmZl
cmVkIGRvZXMgaGVyZSBhbmQgd2h5IHdlIG5lZWQgdGhpcz8gCihUaGUgbWFuIHBhZ2Ugd2Fzbid0
IHRvbyBoZWxwZnVsIGluIGp1c3Qgc3BlY2lmeWluZyAiVXNlIGxpbmUgYnVmZmVyaW5nIApvbiBv
dXRwdXQiLgoKPiArICAgICAgICAgfHNlZCAtRSAncy9eKFswLTlUOi1dezE5fSkgW1s6cHJpbnQ6
XV0qKC4qPj4+ICkvXDEgXDIvJwo+ICAgICAgICAgICkKPiAgICAgICByZXQ9JHs/fQo+ICAgCgpC
ZXN0LApNYXJjdXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
