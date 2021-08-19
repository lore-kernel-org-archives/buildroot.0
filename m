Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0607C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:05:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E2FE610A0
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E2FE610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D37F40185;
	Thu, 19 Aug 2021 21:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UwgTadhJRKFk; Thu, 19 Aug 2021 21:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43CAD40281;
	Thu, 19 Aug 2021 21:05:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 408831BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C58240281
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:05:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFqkQdGbkKPD for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:05:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EB4940185
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:05:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9904:2733:9b91:ffcc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B5B202003C6;
 Thu, 19 Aug 2021 23:05:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629407123;
 bh=QpIR/QNv+oh9K9TsO8g8MiS+6OEOLZlOuuyDIe15ARI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WfMPv5FsnGuI7MnIfqM45FOmdI94pinl0fQADMCF761ccMKYaZTGGNG37zeOq20Cb
 s4h09GchpB3hy2cTm62yIakrnBVv0B8jw6u2DSpTVxnIwN48MQcFaMwqAO0upUYHM/
 OUpGFTda3qcVWI+V6AFAqWAcp4A/ITBrjf5BXjLlBUjCTCKm5LxGdWTFlYfD8YjThb
 LI31zoLK2rus+Q0X2dYd9GIbnBKhw+sO3GGtiwAnntrmbFBlJy9X4f3Nv+13NTgBLt
 vZcEG3VM54Igbjwv4OCJEjz9MMi9+EU8glcnx3s1A//opoYxJ9qPBC7RKw0G2FvhDx
 l+zwVEgHI8BEw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 19 Aug 2021 23:05:17 +0200
Date: Thu, 19 Aug 2021 23:05:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <20210819210517.GF27036@scaer>
References: <20210819092904.2942827-1-jose.pekkarinen@unikie.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819092904.2942827-1-jose.pekkarinen@unikie.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] package/libselinux: Add autorelabel for
 first boot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Sm9zw6ksIEFsbCwKCk9uIDIwMjEtMDgtMTkgMTI6MjkgKzAzMDAsIEpvc8OpIFBla2thcmluZW4g
c3Bha2UgdGh1c2x5Ogo+IEN1cnJlbnRseSBidWlsZHJvb3Qgc2hpcCBsaWJzZWxpbnV4IHdpdGhv
dXQgdHJpZ2dlcmluZwo+IHRoaXMgb3B0aW9uLCB3aGljaCBvZnRlbiBzaG93cyBpbmNvbnNpc3Rl
bmNpZXMgYmV0d2Vlbgo+IHdoYXQgdGhlIHJlZnBvbGljeSBkZWZpbmVzIGFzIGEgbGFiZWwgZm9y
IGEgZmlsZSBhbmQKPiB3aGF0IHRoZSBhY3R1YWwgZmlsZSBoYXMuIFRyaWdnZXJpbmcgYW4gaW5p
dGlhbCByZWxhYmVsCj4gd291bGQgaGVscCBhY3RpdmF0aW5nIGVuZm9yY2luZyBzdGF0ZSByaWdo
dCBhd2F5IHdpdGhvdXQKPiByZXF1aXJpbmcgdG8gZW50ZXIgaXQgb25jZSBpbiBwZXJtaXNzaXZl
IGFuZCB0d2VhayB0aGUKPiBsYWJlbHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2Fy
aW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5jb20+Cj4gLS0tCj4gWyB2MSAtPiB2MiBdIEZp
eCBpZiBzdGF0ZW1lbnQgaW4gbGlic2VsaW51eCByZWNpcGUKPiAKPiAgcGFja2FnZS9saWJzZWxp
bnV4L0NvbmZpZy5pbiAgICAgfCA3ICsrKysrKysKPiAgcGFja2FnZS9saWJzZWxpbnV4L2xpYnNl
bGludXgubWsgfCAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzZWxpbnV4L0NvbmZpZy5pbiBiL3BhY2thZ2UvbGli
c2VsaW51eC9Db25maWcuaW4KPiBpbmRleCA2MjA3MGM4ZDU5Li5kZjhiZDdmZmQwIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvbGlic2VsaW51eC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2xpYnNl
bGludXgvQ29uZmlnLmluCj4gQEAgLTE4LDMgKzE4LDEwIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9M
SUJTRUxJTlVYCj4gIAo+ICBjb21tZW50ICJsaWJzZWxpbnV4IG5lZWRzIGEgdG9vbGNoYWluIHcv
IHRocmVhZHMsIGR5bmFtaWMgbGlicmFyeSIKPiAgCWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5f
SEFTX1RIUkVBRFMgfHwgQlIyX1NUQVRJQ19MSUJTCj4gKwo+ICtjb25maWcgQlIyX1BBQ0tBR0Vf
TElCU0VMSU5VWF9BVVRPUkVMQUJFTAo+ICsJYm9vbAo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9MSUJTRUxJTlVYCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0ZJTkRVVElMUwo+ICsJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9HUkVQCj4gKwlkZWZhdWx0IHkKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saWJzZWxpbnV4L2xpYnNlbGludXgubWsgYi9wYWNrYWdlL2xpYnNlbGludXgvbGlic2Vs
aW51eC5tawo+IGluZGV4IGZkZDEzYWE5NDIuLmFkZjRiM2Q2ZjYgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9saWJzZWxpbnV4L2xpYnNlbGludXgubWsKPiArKysgYi9wYWNrYWdlL2xpYnNlbGludXgv
bGlic2VsaW51eC5tawo+IEBAIC03MSw2ICs3MSw5IEBAIGRlZmluZSBMSUJTRUxJTlVYX0lOU1RB
TExfVEFSR0VUX0NNRFMKPiAgCSQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpIFwK
PiAgCQkkKExJQlNFTElOVVhfTUFLRV9PUFRTKSBERVNURElSPSQoVEFSR0VUX0RJUikgXAo+ICAJ
CSQoTElCU0VMSU5VWF9NQUtFX0lOU1RBTExfVEFSR0VUUykKPiArCSQoaWYgJChCUjJfUEFDS0FH
RV9MSUJTRUxJTlVYX0FVVE9SRUxBQkVMKSwKPiArCQllY2hvICItRiIgPiAkKFRBUkdFVF9ESVIp
Ly5hdXRvcmVsYWJlbAo+ICsJCW1rZGlyICQoVEFSR0VUX0RJUikvdmFyL2xpYi9zZWxpbnV4KQoK
SXNuJ3QgdGhpcyBnb2luZyB0byBmYWlsIG9uIHJlYWQtb25seSBmaWxlc3lzdGVtcz8gUmVsYWJl
bGxpbmcgc3Vwb3NlZGx5CnJlcXVpcmVzIHRoYXQgZXh0ZW5kZWQgYXR0cmlidXRlcyBiZSBhZGRl
ZC91cGRhdGVkL3JlbW92ZWQsIGFuZCB0aGF0CnJlcXVpcmVzIGEgcmVhZC13cml0ZSBmaWxlc3lz
dGVtLi4uCgpDYW4ndCB3ZSBkbyB0aGUgcmUtbGFiZWxsaW5nIGF0IHRoZSB0aW1lIHdlIGNyZWF0
ZSB0aGUgZmlsZXN5c3RlbSwgaS5lLgppbiBmcy9jb21tb24ubWs/CgpBbmQgaXQgc2VlbXMgd2Ug
YWxyZWFkeSBoYXZlIHRoYXQ6CgogICA1MiBpZmVxICgkKEJSMl9QQUNLQUdFX1JFRlBPTElDWSks
eSkKICAgNTMgZGVmaW5lIFJPT1RGU19TRUxJTlVYCiAgIDU0ICAgICAkKEhPU1RfRElSKS9zYmlu
L3NldGZpbGVzIC1tIC1yICQoVEFSR0VUX0RJUikgXAogICA1NSAgICAgICAgIC1jICQoVEFSR0VU
X0RJUikvZXRjL3NlbGludXgvdGFyZ2V0ZWQvcG9saWN5L3BvbGljeS4kKEJSMl9QQUNLQUdFX0xJ
QlNFUE9MX1BPTElDWV9WRVJTSU9OKSBcCiAgIDU2ICAgICAgICAgJChUQVJHRVRfRElSKS9ldGMv
c2VsaW51eC90YXJnZXRlZC9jb250ZXh0cy9maWxlcy9maWxlX2NvbnRleHRzIFwKICAgNTcgICAg
ICAgICAkKFRBUkdFVF9ESVIpCiAgIDU4IGVuZGVmCiAgIDU5IFJPT1RGU19DT01NT05fREVQRU5E
RU5DSUVTICs9IGhvc3QtcG9saWN5Y29yZXV0aWxzCiAgIDYwIGVuZGlmCgpTbyB3aHkgaXMgdGhl
IGxhYmVsbGluZyB3cm9uZz8gQ2FuJ3Qgd2UgZml4IGl0IHJpZ2h0IHRoZXJlIHJhdGhlciB0aGFu
CmF0IHJ1bnRpbWU/CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAgCWlmICEgZ3JlcCAtcSAi
c2VsaW51eGZzIiAkKFRBUkdFVF9ESVIpL2V0Yy9mc3RhYjsgdGhlbiBcCj4gIAkJZWNobyAibm9u
ZSAvc3lzL2ZzL3NlbGludXggc2VsaW51eGZzIG5vYXV0byAwIDAiID4+ICQoVEFSR0VUX0RJUikv
ZXRjL2ZzdGFiIDsgZmkKPiAgZW5kZWYKPiAtLSAKPiAyLjI1LjEKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVzeWJveC5uZXQKPiBodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZ
YW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBF
cmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25l
ciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5
IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVy
ZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBI
VE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0t
JwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJv
eC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
