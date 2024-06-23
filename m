Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B29CC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 10:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E5434068D;
	Sun, 23 Jun 2024 10:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYTickKtdAq7; Sun, 23 Jun 2024 10:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246B14063C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 246B14063C;
	Sun, 23 Jun 2024 10:11:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D100F1BF59C
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 10:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAF1160613
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 10:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aBpQO4HXtlVo for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 10:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEE5560606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEE5560606
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEE5560606
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 10:11:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 48C537802D6;
 Sun, 23 Jun 2024 12:10:59 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49298])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Jun 2024 10:10:59 +0000
MIME-Version: 1.0
Date: Sun, 23 Jun 2024 10:10:59 +0000
From: Julien Olivain <ju.o@free.fr>
To: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <20240623033804.105858-1-lancethepants@gmail.com>
References: <20240623033804.105858-1-lancethepants@gmail.com>
User-Agent: Webmail Free/1.6.7
Message-ID: <38e42162ab203dcbf1b02124a5d6a402@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719137460;
 bh=79wbivLDRw6lsfj/hdHnGI0bxn7KgYRx4KehOGG0O/4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=glsiCDHx6M7KW9P7gZy7URvpTCPwb9ioQAAtB+fYohuuuSzRjHujadLgalo4CVAd0
 tN+fONIANoucddWrnLAdH7rgz3iwgPBDn6We+X5nxLKpRGLu5klXK2LPy7O2Vm+kfI
 iT31Jcu227sVsrNy7D2HFs7xl6imwZsi7CAFvmcl/zQ5R2n+AtfOpbTvzYwFqaKSYq
 qjwmYF9pypCqaBhQ6IewfprVUI4WHHHvkS+SNsoQWi7I8GVNsOeKE9XLb4bv2hcXQ2
 9lqasRaXXTYjmJ5ElH7/rz5zIpCIXqYDCd/nrdTWVOKPWWbXGlrkvUL6J8YBYJQkQ7
 EhQ2w1j0eszcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=glsiCDHx
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: Fix building syslinux
 with GCC 14.x
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTGFuY2UsIEFsbCwKCk9uIDIzLzA2LzIwMjQgMDM6MzgsIExhbmNlIEZyZWRyaWNrc29uIHdy
b3RlOgo+IEZyb206IExhbmNlIEZyZWRyaWNrc29uIDxsYW5jZXRoZXBhbnRzQGdtYWlsLmNvbT4K
PiAKPiBBZGQgbWlzc2luZyBzdGRpby5oIGluY2x1ZGUuIFdpdGhvdXQgaXQgcmVzdWx0cyBpbiB0
aGUgZm9sbG93aW5nIGVycm9yIAo+IHVuZGVyIEdDQyAxNC54Cj4gCj4gLi4vLi4vLi4vY29tMzIv
bGliL3N5c2xpbnV4L2RlYnVnLmM6IEluIGZ1bmN0aW9uIOKAmHN5c2xpbnV4X2RlYnVn4oCZOgo+
IC4uLy4uLy4uL2NvbTMyL2xpYi9zeXNsaW51eC9kZWJ1Zy5jOjkxOjU6IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiAKPiBvZiBmdW5jdGlvbiDigJhwcmludGbigJkgWy1XaW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dCj4gICAgOTEgfCAgICAgcHJpbnRmKCJEeW5hbWljIGRlYnVnIHVu
YXZhaWxhYmxlXG4iKTsKPiAKPiBVcHN0cmVhbTogZGVhZCAobGFzdCByZWxlYXNlIGluIDIwMTQp
CgpFdmVuIHN5c2xpbnV4IGhhZCBubyByZWxlYXNlIHNpbmNlIDIwMTQsIGl0cyBtYWlsaW5nIGxp
c3QgaXMgc3RpbGwgbW9yZQpvciBsZXNzIG9wZXJhdGluZzogaHR0cHM6Ly93d3cuc3lzbGludXgu
b3JnL2FyY2hpdmVzLwpUaGUgcGF0Y2ggY291bGQgYmUgc2VudCBvbiB0aGF0IGxpc3QsIGluIGNh
c2UgdGhlIHByb2plY3QgZ2V0cyBhIG5ldwptYWludGFpbmVyIG9yIGdldCBmb3JrZWQgYnkgc29t
ZWJvZHkgZWxzZS4uLgoKU2VlLCBmb3IgZXhhbXBsZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI0LjA1L2Jvb3Qvc3lzbGludXgvMDAxOS1zdGRk
ZWYuaC1hZGQtd2NoYXJfdC10eXBlLWRlZmluaXRpb24ucGF0Y2g/cmVmX3R5cGU9dGFncyNMNDAK
Cj4gU2lnbmVkLW9mZi1ieTogTGFuY2UgRnJlZHJpY2tzb24gPGxhbmNldGhlcGFudHNAZ21haWwu
Y29tPgo+IC0tLQo+ICAuLi4vMDAyMC1wdWxsLWluLXN0ZGlvLWgtZm9yLWdjYzE0LnBhdGNoICAg
ICAgfCAzNCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3N5c2xpbnV4LzAwMjAtcHVsbC1pbi1z
dGRpby1oLWZvci1nY2MxNC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9ib290L3N5c2xpbnV4LzAw
MjAtcHVsbC1pbi1zdGRpby1oLWZvci1nY2MxNC5wYXRjaCAKPiBiL2Jvb3Qvc3lzbGludXgvMDAy
MC1wdWxsLWluLXN0ZGlvLWgtZm9yLWdjYzE0LnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwLi4wOWEwMDc0YjMxCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Jv
b3Qvc3lzbGludXgvMDAyMC1wdWxsLWluLXN0ZGlvLWgtZm9yLWdjYzE0LnBhdGNoCj4gQEAgLTAs
MCArMSwzNCBAQAo+ICtGcm9tIGRmYTI3MDUxMDBhODkzYmMwMTdkMjM0MDZkYWE5YTM4M2ZiYzNj
OTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IExhbmNlIEZyZWRyaWNrc29uIDxs
YW5jZXRoZXBhbnRzQGdtYWlsLmNvbT4KPiArRGF0ZTogV2VkLCA1IEp1biAyMDI0IDE0OjMxOjM4
IC0wNjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gY29tMzIvbGliL3N5c2xpbnV4L2RlYnVnLmM6IGFk
ZCBtaXNzaW5nIHN0ZGlvLmggCj4gaW5jbHVkZS4KPiArCj4gK0ZpeCBidWlsZGluZyBzeXNsaW51
eCB3aXRoIEdDQyAxNC54Cj4gKwo+ICtBZGQgbWlzc2luZyBzdGRpby5oIGluY2x1ZGUuIFdpdGhv
dXQgaXQgcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nIGVycm9yIAo+IHVuZGVyIEdDQyAxNC54Cj4g
Kwo+ICsuLi8uLi8uLi9jb20zMi9saWIvc3lzbGludXgvZGVidWcuYzogSW4gZnVuY3Rpb24g4oCY
c3lzbGludXhfZGVidWfigJk6Cj4gKy4uLy4uLy4uL2NvbTMyL2xpYi9zeXNsaW51eC9kZWJ1Zy5j
OjkxOjU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiAKPiBvZiBmdW5jdGlvbiDigJhwcmlu
dGbigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gKyAgIDkxIHwgICAgIHBy
aW50ZigiRHluYW1pYyBkZWJ1ZyB1bmF2YWlsYWJsZVxuIik7Cj4gKwo+ICtVcHN0cmVhbTogZGVh
ZCAobGFzdCByZWxlYXNlIGluIDIwMTQpCj4gK1NpZ25lZC1vZmYtYnk6IExhbmNlIEZyZWRyaWNr
c29uIDxsYW5jZXRoZXBhbnRzQGdtYWlsLmNvbT4KPiArLS0tCj4gKyBjb20zMi9saWIvc3lzbGlu
dXgvZGVidWcuYyB8IDEgKwo+ICsgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gKwo+
ICtkaWZmIC0tZ2l0IGEvY29tMzIvbGliL3N5c2xpbnV4L2RlYnVnLmMgYi9jb20zMi9saWIvc3lz
bGludXgvZGVidWcuYwo+ICtpbmRleCBkOWFiODYzZi4uZThmNTNkNTcgMTAwNjQ0Cj4gKy0tLSBh
L2NvbTMyL2xpYi9zeXNsaW51eC9kZWJ1Zy5jCj4gKysrKyBiL2NvbTMyL2xpYi9zeXNsaW51eC9k
ZWJ1Zy5jCj4gK0BAIC0xLDYgKzEsNyBAQAo+ICsgI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPiAr
ICNpbmNsdWRlIDxzdHJpbmcuaD4KPiArICNpbmNsdWRlIDxzdGRib29sLmg+Cj4gKysjaW5jbHVk
ZSA8c3RkaW8uaD4KPiArCj4gKyAjaWZkZWYgRFlOQU1JQ19ERUJVRwo+ICsKPiArLS0KPiArMi4z
OS4yCj4gKwo+IC0tCj4gMi4zOS4yCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
