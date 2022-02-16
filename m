Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0240C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6161881CDB;
	Wed, 16 Feb 2022 20:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnudYDm94u9T; Wed, 16 Feb 2022 20:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5A38828F2;
	Wed, 16 Feb 2022 20:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E50DB1BF20B
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA9A7416DA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvXd_yyPsp_O for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:59:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 665E0416CE
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:59:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9933:bb4:98b5:c594])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 63D3AB00563;
 Wed, 16 Feb 2022 21:59:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645045145;
 bh=cMDfvgOEY2t+VRXEBGQFzgDjFeHGETFvBMq1/UyDooM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sbgx+adXAwHjMy6qPjbFFCEsiAL93I5YN2OrzltIQGZyhBbQBWjkS13k8PToF7Pha
 8NYD6hXMbopCwieFxiwR/EIJ4wFiIxbSIr5sw6rn8v4ap9rH2yGeRqW3oYgypkHgrw
 9cZsk9b2QE95ePozPiAQTuQQ+8o2OLV8sStbwyadMckjb/Qa9Irul5EAcemPMaBjAp
 e09/2xPzVjvN7p+I5NQVJsK6tulWayt8J3u+CEH7In4y66//kiCTwn0WqZHMwkn8f5
 GMNxmyn3pLUH90W4lvYwHi4fNZsdxg8lDIEJHOhosxYI+YBwvYz9a0waq6HQ7QcBZ+
 gxepqP0DEWCNA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 21:59:02 +0100
Date: Wed, 16 Feb 2022 21:59:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20220216205902.GA522310@scaer>
References: <20220216133140.14668-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216133140.14668-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libusb: fix maybe-uninitialized
 error
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWVnb3IsIEFsbCwKCk9uIDIwMjItMDItMTYgMTQ6MzEgKzAxMDAsIHllZ29yc2xpc3RzLS0tIHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IEZyb206IFllZ29yIFllZnJlbW92IDx5ZWdvcnNs
aXN0c0Bnb29nbGVtYWlsLmNvbT4KPiAKPiBJbml0aWFsaXplIGFjdGl2ZV9jb25maWcgdG8gYW4g
aW52YWxpZCB2YWx1ZSB0byBhdm9pZCB0aGUgZm9sbG93aW5nCj4gY29tcGlsYXRpb24gZXJyb3I6
Cj4gCj4gb3MvbGludXhfdXNiZnMuYzogSW4gZnVuY3Rpb24g4oCYb3BfZ2V0X2NvbmZpZ3VyYXRp
b27igJk6Cj4gb3MvbGludXhfdXNiZnMuYzoxNDUyOjEyOiBlcnJvcjog4oCYYWN0aXZlX2NvbmZp
Z+KAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XZXJyb3I9
bWF5YmUtdW5pbml0aWFsaXplZF0KPiAgMTQ1MiB8ICAqY29uZmlnID0gKHVpbnQ4X3QpYWN0aXZl
X2NvbmZpZzsKPiAKPiBVcHN0cmVhbSBVUkw6IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJ1c2IvbGli
dXNiL3B1bGwvMTA2MgoKSSd2ZSBtb3ZlZCB0aGF0IGludG8gdGhlIHBhdGNoIGl0c2VsZiwgYXMg
aXQgaXMgZWl0aGVyIHRvIGZpbmQgd2hlbiB3ZQp1cGRhdGUgdGhlIHZlcnNpb24gYW5kIGhhdmUg
dG8gY2hlY2sgaWYgdGhlIHBhdGNoIGhhcyB0byBiZSByZW1vdmVkIG9yCnJlYmFzZWQuCgpBcHBs
aWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gU2lnbmVk
LW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgo+IC0t
LQo+ICAuLi5fdXNiZnMtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtZXJyb3IucGF0Y2ggfCAzNiAr
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnVzYi8wMDAyLWxpbnV4X3VzYmZzLWZpeC1t
YXliZS11bmluaXRpYWxpemVkLWVycm9yLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGlidXNiLzAwMDItbGludXhfdXNiZnMtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtZXJyb3IucGF0
Y2ggYi9wYWNrYWdlL2xpYnVzYi8wMDAyLWxpbnV4X3VzYmZzLWZpeC1tYXliZS11bmluaXRpYWxp
emVkLWVycm9yLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
Li4xOTIxNzJlOWViCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbGlidXNiLzAwMDIt
bGludXhfdXNiZnMtZml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtZXJyb3IucGF0Y2gKPiBAQCAtMCww
ICsxLDM2IEBACj4gK0Zyb20gYmVhNTg5MTU5MTQwMmYxNDk0MGE2MDdlYWZiZGNkMTY5ZmY4ODI3
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29y
c2xpc3RzQGdvb2dsZW1haWwuY29tPgo+ICtEYXRlOiBTdW4sIDYgRmViIDIwMjIgMDc6MTI6MTQg
KzAxMDAKPiArU3ViamVjdDogW1BBVENIIDIvMl0gbGludXhfdXNiZnM6IGZpeCBtYXliZS11bmlu
aXRpYWxpemVkIGVycm9yCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0
Cj4gKwo+ICtJbml0aWFsaXplIGFjdGl2ZV9jb25maWcgdG8gYW4gaW52YWxpZCB2YWx1ZSB0byBh
dm9pZCB0aGUgZm9sbG93aW5nCj4gK2NvbXBpbGF0aW9uIGVycm9yOgo+ICsKPiArb3MvbGludXhf
dXNiZnMuYzogSW4gZnVuY3Rpb24g4oCYb3BfZ2V0X2NvbmZpZ3VyYXRpb27igJk6Cj4gK29zL2xp
bnV4X3VzYmZzLmM6MTQ1MjoxMjogZXJyb3I6IOKAmGFjdGl2ZV9jb25maWfigJkgbWF5IGJlIHVz
ZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5pdGlh
bGl6ZWRdCj4gKyAxNDUyIHwgICpjb25maWcgPSAodWludDhfdClhY3RpdmVfY29uZmlnOwo+ICsK
PiArU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwu
Y29tPgo+ICstLS0KPiArIGxpYnVzYi9vcy9saW51eF91c2Jmcy5jIHwgMiArLQo+ICsgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gKwo+ICtkaWZmIC0tZ2l0
IGEvbGlidXNiL29zL2xpbnV4X3VzYmZzLmMgYi9saWJ1c2Ivb3MvbGludXhfdXNiZnMuYwo+ICtp
bmRleCBjMzAwNjc1Li4yODVkOWNhIDEwMDY0NAo+ICstLS0gYS9saWJ1c2Ivb3MvbGludXhfdXNi
ZnMuYwo+ICsrKysgYi9saWJ1c2Ivb3MvbGludXhfdXNiZnMuYwo+ICtAQCAtMTQyOSw3ICsxNDI5
LDcgQEAgc3RhdGljIGludCBvcF9nZXRfY29uZmlndXJhdGlvbihzdHJ1Y3QgbGlidXNiX2Rldmlj
ZV9oYW5kbGUgKmhhbmRsZSwKPiArIAl1aW50OF90ICpjb25maWcpCj4gKyB7Cj4gKyAJc3RydWN0
IGxpbnV4X2RldmljZV9wcml2ICpwcml2ID0gdXNiaV9nZXRfZGV2aWNlX3ByaXYoaGFuZGxlLT5k
ZXYpOwo+ICstCWludCBhY3RpdmVfY29uZmlnOwo+ICsrCWludCBhY3RpdmVfY29uZmlnID0gLTE7
IC8qIHRvIHBsZWFzZSBjb21waWxlciAqLwo+ICsgCWludCByOwo+ICsgCj4gKyAJaWYgKHByaXYt
PnN5c2ZzX2Rpcikgewo+ICstLSAKPiArMi4xNy4wCj4gKwo+IC0tIAo+IDIuMTcuMAo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290
IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwg
QVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBT
b2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAg
IHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAg
ICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0t
LS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
