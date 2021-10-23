Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52F4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:02:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7941060EE3
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 22:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7941060EE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4847F60811;
	Sat, 23 Oct 2021 22:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKFFEtZTenhG; Sat, 23 Oct 2021 22:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D5D60789;
	Sat, 23 Oct 2021 22:02:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B59251BF5E0
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1F0C4036A
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 22:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SH74EaIug3f0 for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 22:02:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB86C40369
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 22:02:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8cf8:eeb7:8c5b:1909])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id E1F907802C5;
 Sun, 24 Oct 2021 00:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635026545;
 bh=w8f5jCzzSlYhRyFvCbuUkNFEnMb/+78t62/ehGhdUlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwwg1knDNm7gMSwCaXhBC6b43zaLHdIF0SD+pLW5yrWb4UC1hdts3sWYHjZ0nEq3m
 uk6EcJYk2CtEDBfotdP9mkTE5q2nT15EEvOwCaOYXehHYZpYXBDfchNSgEcygLh/Tv
 jKHozB/odUk9ZUwS6hkFwq3LdN5XbFzQNs2HXehPjZ234a12RfiQT78mhBA4PrXIQi
 lPXIdskxlg7oBrgC9GYuiVgwEB9oBM5NE9VD8zJv2RQKITgE68bnNgqDdMPqSGmxtn
 g9nrhIgBtV9LEX0jmkJduDJnZ3u0xE8vuJVaLDZS96vIgGSRIKNYq3rfL0yqX2xmyx
 TCL5ZoHiU0AhQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Oct 2021 00:02:16 +0200
Date: Sun, 24 Oct 2021 00:02:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211023220216.GL2400@scaer>
References: <20211022115134.345595-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022115134.345595-1-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/5] boot/grub2/grub2.mk: fix the
 installation of target tools
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
Cc: thomas.petazzoni@bootlin.com, aduskett@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjEtMTAtMjIgMTM6NTEgKzAyMDAsIEtvcnkgTWFpbmNlbnQgc3Bh
a2UgdGh1c2x5Ogo+IFRoZSB0b29scyB3ZXJlIG5vdCBpbnN0YWxsZWQgYW55bW9yZSBzaW5jZSB3
ZSBtb3ZlIGZyb20gYXV0b3Rvb2xzIHRvCj4gZ2VuZXJpYy1wYWNrYWdlLiBUaGlzIHBhdGNoIGZp
eGVzIHRoZWlyIGluc3RhbGxhdGlvbi4KPiAKPiBXZSBoYXZlIGRlY2lkZWQgdG8gaW1wbGVtZW50
IHRoZSBpbnN0YWxsIHRvb2wgcHJvY2VzcyBieSBydW5uaW5nIHRoZSAibWFrZQo+IGluc3RhbGwi
IGNvbW1hbmQgZm9yIGVhY2ggdHVwbGUuIFRoaXMgYWxsb3dzIHRvIGhhdmUgYWxsIGRpZmZlcmVu
dAo+IHBsYXRmb3JtcyBHcnViIG1vZHVsZXMgaW5zdGFsbGVkIGluIHRoZSB0YXJnZXQuIFRoZSBk
cmF3YmFjayBpcyB0aGUKPiBvdmVyd3JpdGUgb2YgR3J1YjIgYmluYXJpZXMgdG9vbHMgZHVyaW5n
IGVhY2ggIm1ha2UgaW5zdGFsbCIgY29tbWFuZC4gVGhpcwo+IGRyYXdiYWNrIGlzIGFic29sdXRl
bHkgbm90IGltcG9ydGFudCBhcyBpdCBoYXBwZW5zIGluIHRoZSBzYW1lIHBhY2thZ2UuIFRoaXMg
aXMKPiB0aGUgYmVzdCBvcHRpb24gdG8gYXZvaWQgdW5uZWNlc3NhcnkgYW5kIG1vcmUgY29tcGxl
eGl0eSB0byB0aGlzIHBhY2thZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8
a29yeS5tYWluY2VudEBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KPiBUZXN0ZWQtYnk6IEFkYW0gRHVza2V0dCA8YWR1
c2tldHRAZ21haWwuY29tPgoKU2VyaWVzIG9mIDUgcGF0Y2hlcyBhcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKSSd2ZSB0d2Vha2VkIHNvbWUgb2YgdGhlIGNvbW1pdCBsb2dzLi4uCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgYm9vdC9ncnViMi9ncnViMi5tayB8IDggKysrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9i
b290L2dydWIyL2dydWIyLm1rIGIvYm9vdC9ncnViMi9ncnViMi5tawo+IGluZGV4IGUwMWViYjJl
ZGIuLmExODY5NmI2Y2MgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9ncnViMi9ncnViMi5tawo+ICsrKyBi
L2Jvb3QvZ3J1YjIvZ3J1YjIubWsKPiBAQCAtMTk1LDUgKzE5NSwxMyBAQCBkZWZpbmUgR1JVQjJf
SU5TVEFMTF9JTUFHRVNfQ01EUwo+ICAJKQo+ICBlbmRlZgo+ICAKPiAraWZlcSAoJChCUjJfVEFS
R0VUX0dSVUIyX0lOU1RBTExfVE9PTFMpLHkpCj4gK2RlZmluZSBHUlVCMl9JTlNUQUxMX1RBUkdF
VF9DTURTCj4gKwkkKGZvcmVhY2ggdHVwbGUsICQoR1JVQjJfVFVQTEVTLXkpLCBcCj4gKwkJJChU
QVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgLUMgJChARCkvYnVpbGQtJCh0dXBsZSkgREVTVERJUj0k
KFRBUkdFVF9ESVIpIGluc3RhbGwKPiArCSkKPiArZW5kZWYKPiArZW5kaWYKPiArCj4gICQoZXZh
bCAkKGdlbmVyaWMtcGFja2FnZSkpCj4gICQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2thZ2Up
KQo+IC0tIAo+IDIuMjUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBS
ZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6
IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04g
ICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0t
LS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
