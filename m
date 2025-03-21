Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076E4C28B30
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 02:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75A5582F96;
	Fri, 21 Mar 2025 02:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0EnczyBO1ev; Fri, 21 Mar 2025 02:15:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 866B382FE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 866B382FE4;
	Fri, 21 Mar 2025 02:15:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD281A4
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 02:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEA9041A57
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 02:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id au8Oc12dMMcE for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 02:15:42 +0000 (UTC)
X-Greylist: delayed 472 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 21 Mar 2025 02:15:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C2C2741A46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2C2741A46
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4b98:dc0:43:f816:3eff:fe1a:d13f; helo=jcornell.net;
 envelope-from=jakob@jcornell.net; receiver=<UNKNOWN> 
Received: from jcornell.net (jcornell.net
 [IPv6:2001:4b98:dc0:43:f816:3eff:fe1a:d13f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2C2741A46
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 02:15:41 +0000 (UTC)
Received: from [IPV6:2602:ae:1441:f100:1146:5f01:f718:9dc5] (unknown
 [IPv6:2602:ae:1441:f100:1146:5f01:f718:9dc5])
 by jcornell.net (Postfix) with ESMTPSA id 9AD50203C6
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 02:07:46 +0000 (UTC)
Message-ID: <070aaa04-49c7-46d6-9e3b-b4cf55b0b43f@jcornell.net>
Date: Thu, 20 Mar 2025 21:07:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=jcornell.net; s=default; t=1742522866;
 bh=h4HjCNhnxb4hqG+tBCXUg0YrZuwAHDll72iPDFGu6q8=;
 h=Date:To:From:Subject:From;
 b=mNWywoRh3Yvwcp9n3+W+rYAKZvl3xhjDn68XqKN5giEm/vOzjlJvNXLzEqfw+Z5LS
 TgwbVCKMdEyuvaPzZ8/s4OMyekn6trCk5iUqHRyOJ+4rPrpRX4V4iZOzhwwYr6gJk0
 Ffl1zqUG0cmZROhPoh5xHLk6sJslN7SX/eMcglMmR0YMRfx+H4OpEP5Jy+xADtrK3p
 nuOYWLfw/Tw7k7Msv/lpJqhgM7wk3mm16DUL94u1lEHG7ZMxpq1hHPoyWDQKmeYNhG
 kkMUu52hba5OFZlPFj8cwie9jRsGgngld66O6KYA3aZIGRzJSN9rilgQbQqSewMG+U
 2UjDRFbXSlzPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=jcornell.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=jcornell.net header.i=@jcornell.net header.a=rsa-sha256
 header.s=default header.b=mNWywoRh
Subject: [Buildroot] How to configure Barebox for 32-bit?
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
From: Jakob Cornell via buildroot <buildroot@buildroot.org>
Reply-To: Jakob Cornell <jakob@jcornell.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSdtIHRyeWluZyB0byBidWlsZCBhbiBpbWFnZSBmb3IgYSBzeXN0ZW0gdGhhdCBoYXMgYSBWaWEg
QzcgcHJvY2Vzc29yIChJQS0zMiksIHNvIEkgaGF2ZSBCdWlsZHJvb3Qgc2V0IHVwIHdpdGggYW4g
YXJjaGl0ZWN0dXJlIG9mIGkzODYgYW5kIFZpYSBDMy0yIGFzIHRoZSBhcmNoaXRlY3R1cmUgdmFy
aWFudC4gV2hlbiBidWlsZHJvb3QgdHJpZXMgdG8gYnVpbGQgQmFyZWJveCBpdCBsb29rcyBsaWtl
IGl0J3MgdGFyZ2V0aW5nIGEgNjQtYml0IGFyY2hpdGVjdHVyZToKCj4gPj4+IGJhcmVib3ggMjAy
Mi4xMi4wIENvbmZpZ3VyaW5nCj4gPj4+IGJhcmVib3ggMjAyMi4xMi4wIEJ1aWxkaW5nCj4gR0lU
X0RJUj0uIFBBVEg9Ii9ob21lL2pha29iL3Byb2plY3RzL2lnZWwvYnVpbGRyb290LTIwMjUuMDIv
b3V0cHV0L2hvc3QvYmluOi9ob21lL2pha29iL3Byb2plY3RzL2lnZWwvYnVpbGRyb290LTIwMjUu
MDIvb3V0cHV0L2hvc3Qvc2JpbjovaG9tZS9qYWtvYi8uY2FyZ28vYmluOi91c3IvbG9jYWwvYmlu
Oi91c3IvYmluOi9iaW46L3Vzci9sb2NhbC9nYW1lczovdXNyL2dhbWVzIiBQS0dfQ09ORklHPSIv
aG9tZS9qYWtvYi9wcm9qZWN0cy9pZ2VsL2J1aWxkcm9vdC0yMDI1LjAyL291dHB1dC9ob3N0L2Jp
bi9wa2ctY29uZmlnIiBQS0dfQ09ORklHX1NZU1JPT1RfRElSPSIvIiBQS0dfQ09ORklHX0FMTE9X
X1NZU1RFTV9DRkxBR1M9MSBQS0dfQ09ORklHX0FMTE9XX1NZU1RFTV9MSUJTPTEgUEtHX0NPTkZJ
R19MSUJESVI9Ii9ob21lL2pha29iL3Byb2plY3RzL2lnZWwvYnVpbGRyb290LTIwMjUuMDIvb3V0
cHV0L2hvc3QvbGliL3BrZ2NvbmZpZzovaG9tZS9qYWtvYi9wcm9qZWN0cy9pZ2VsL2J1aWxkcm9v
dC0yMDI1LjAyL291dHB1dC9ob3N0L3NoYXJlL3BrZ2NvbmZpZyIgL3Vzci9iaW4vbWFrZSAtajMg
QVJDSD14ODYgQ1JPU1NfQ09NUElMRT0iL2hvbWUvamFrb2IvcHJvamVjdHMvaWdlbC9idWlsZHJv
b3QtMjAyNS4wMi9vdXRwdXQvaG9zdC9iaW4vaTY4Ni1idWlsZHJvb3QtbGludXgtbXVzbC0iIC1D
IC9ob21lL2pha29iL3Byb2plY3RzL2lnZWwvYnVpbGRyb290LTIwMjUuMDIvb3V0cHV0L2J1aWxk
L2JhcmVib3gtMjAyMi4xMi4wCj4gbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvaG9tZS9q
YWtvYi9wcm9qZWN0cy9pZ2VsL2J1aWxkcm9vdC0yMDI1LjAyL291dHB1dC9idWlsZC9iYXJlYm94
LTIwMjIuMTIuMCcKPiDCoCBTWU5DwqDCoMKgIGluY2x1ZGUvY29uZmlnL2F1dG8uY29uZi5jbWQK
PiDCoCBIT1NUQ0PCoCBzY3JpcHRzL2Jhc2ljL2ZpeGRlcAo+IMKgIEhPU1RDQ8KgIHNjcmlwdHMv
a2NvbmZpZy9jb25mLm8KPiDCoCBIT1NUQ0PCoCBzY3JpcHRzL2tjb25maWcvY29uZmRhdGEubwo+
IMKgIEhPU1RDQ8KgIHNjcmlwdHMva2NvbmZpZy9leHByLm8KPiDCoCBIT1NUQ0PCoCBzY3JpcHRz
L2tjb25maWcvbGV4ZXIubGV4Lm8KPiDCoCBIT1NUQ0PCoCBzY3JpcHRzL2tjb25maWcvbWVudS5v
Cj4gwqAgSE9TVENDwqAgc2NyaXB0cy9rY29uZmlnL3BhcnNlci50YWIubwo+IMKgIEhPU1RDQ8Kg
IHNjcmlwdHMva2NvbmZpZy9wcmVwcm9jZXNzLm8KPiDCoCBIT1NUQ0PCoCBzY3JpcHRzL2tjb25m
aWcvc3ltYm9sLm8KPiDCoCBIT1NUQ0PCoCBzY3JpcHRzL2tjb25maWcvdXRpbC5vCj4gwqAgSE9T
VExEwqAgc2NyaXB0cy9rY29uZmlnL2NvbmYKPiDCoCBDUkVBVEXCoCBpbmNsdWRlL2NvbmZpZy5o
Cj4gwqAgSE9TVENDwqAgc2NyaXB0cy9iaW4yYwo+IMKgIENDwqDCoMKgwqDCoCBzY3JpcHRzL21v
ZC9lbXB0eS5vCj4gY2MxOiBzb3JyeSwgdW5pbXBsZW1lbnRlZDogNjQtYml0IG1vZGUgbm90IGNv
bXBpbGVkIGluCj4gbWFrZVszXTogKioqIFsvaG9tZS9qYWtvYi9wcm9qZWN0cy9pZ2VsL2J1aWxk
cm9vdC0yMDI1LjAyL291dHB1dC9idWlsZC9iYXJlYm94LTIwMjIuMTIuMC9zY3JpcHRzL01ha2Vm
aWxlLmJ1aWxkOjE0MTogc2NyaXB0cy9tb2QvZW1wdHkub10gRXJyb3IgMQo+IG1ha2VbMl06ICoq
KiBbL2hvbWUvamFrb2IvcHJvamVjdHMvaWdlbC9idWlsZHJvb3QtMjAyNS4wMi9vdXRwdXQvYnVp
bGQvYmFyZWJveC0yMDIyLjEyLjAvc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNzU6IHNjcmlwdHMv
bW9kXSBFcnJvciAyCj4gbWFrZVsyXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4u
Li4KPiDCoCBDQ8KgwqDCoMKgwqAgYXJjaC94ODYvbGliL2FzbS1vZmZzZXRzLnMKPiBjYzE6IHNv
cnJ5LCB1bmltcGxlbWVudGVkOiA2NC1iaXQgbW9kZSBub3QgY29tcGlsZWQgaW4KPiBtYWtlWzJd
OiAqKiogWy9ob21lL2pha29iL3Byb2plY3RzL2lnZWwvYnVpbGRyb290LTIwMjUuMDIvb3V0cHV0
L2J1aWxkL2JhcmVib3gtMjAyMi4xMi4wL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MTEzOiBhcmNo
L3g4Ni9saWIvYXNtLW9mZnNldHMuc10gRXJyb3IgMQo+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6
OTk1OiBwcmVwYXJlMF0gRXJyb3IgMgo+IG1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlz
aGVkIGpvYnMuLi4uCj4gbWFrZVsxXTogKioqIFtNYWtlZmlsZTo5NzY6IHNjcmlwdHNdIEVycm9y
IDIKPiBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvamFrb2IvcHJvamVjdHMvaWdl
bC9idWlsZHJvb3QtMjAyNS4wMi9vdXRwdXQvYnVpbGQvYmFyZWJveC0yMDIyLjEyLjAnCj4gbWFr
ZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI3MzogL2hvbWUvamFrb2IvcHJvamVjdHMv
aWdlbC9idWlsZHJvb3QtMjAyNS4wMi9vdXRwdXQvYnVpbGQvYmFyZWJveC0yMDIyLjEyLjAvLnN0
YW1wX2J1aWx0XSBFcnJvciAyCldoYXQgY291bGQgYmUgdGhlIGNhdXNlIG9mIHRoaXM/IEkndmUg
c2VsZWN0ZWQgImVmaSIgYXMgdGhlIEJhcmVib3ggYm9hcmQgZGVmY29uZmlnLi4ubm8gaWRlYSB3
aGV0aGVyIHRoYXQncyByaWdodC4KCkpha29iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
