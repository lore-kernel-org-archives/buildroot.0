Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA032C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BD46846D4;
	Sun, 11 Feb 2024 21:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ksNwHEL1ausl; Sun, 11 Feb 2024 21:30:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B7CC84584
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7CC84584;
	Sun, 11 Feb 2024 21:30:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1289A1BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CB7241545
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nzkgu31Wv0wy for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:30:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE743414D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE743414D1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE743414D1
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:30:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E6F8D13F879;
 Sun, 11 Feb 2024 22:30:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 22:30:29 +0100
Date: Sun, 11 Feb 2024 22:30:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Zck8dbS2rUrI23uZ@landeda>
References: <20240209175631.1337370-1-james.hilliard1@gmail.com>
 <20240209175631.1337370-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240209175631.1337370-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707687035;
 bh=ziXebO4n4vq3d5ETemN0OzYQKvd8P2/y7cj6ABBzipg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZdMIiNFEqsvhy4vDNETmu5YHJzUGTjsikcBRsuHXQ9NiAHl9VWCV+tiAmeagNMv06
 p1eNbpr7cUjtAaS0FWn2cXxmWwkQaAdKhXPjMe/dV0JwTxD5WJXA2KtmsyLbUPeHOK
 ROugdl/8ooFakAbO79pxjGD3p6sChSUae8h8HE3kdDS8m5Y0EAZmbEsUolKlQ9Rh3R
 93B+BNelj0vuEQZl9bb5mEv8pHcaM9LC2dgMAABltgVP2gEby32SGqFyuTYiZR7plo
 qAZu+tQoiQmO0weD1mZL/8IggUu+B0oJZZa5t9dW68m3XWinSJROxefAet8HiQouIF
 y4IrQcf4TrAeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZdMIiNFE
Subject: Re: [Buildroot] [PATCH 2/2] package/python-cython: bump to version
 3.0.8
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjQtMDItMDkgMTA6NTYgLTA3MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBMaWNlbnNlIGhhc2ggY2hhbmdlZCBkdWUgdG8gY2hhbmdpbmcgbGlua3Mg
ZnJvbSBodHRwIHRvIGh0dHBzOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9jeXRob24vY3l0aG9uL2Nv
bW1pdC8zMzFkOWQ4MjRlZTVmMGM1MzkzMTAzMzIyMTVlYmQ2ZWQzMjU3MzI1CgpUaGFua3MgZm9y
IHRoZSBzaW1wbGUgYW5kIHN1ZmZpY2llbnQgZXhwbGFuYXRpb24uIPCfkY0KCj4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tClst
LVNOSVAtLV0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tY3l0aG9uL3B5dGhvbi1jeXRo
b24ubWsgYi9wYWNrYWdlL3B5dGhvbi1jeXRob24vcHl0aG9uLWN5dGhvbi5tawo+IGluZGV4IDQ3
ZTEwNWMwNjUuLmQ3NmJmYjc2NmQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tY3l0aG9u
L3B5dGhvbi1jeXRob24ubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1jeXRob24vcHl0aG9uLWN5
dGhvbi5tawo+IEBAIC00LDkgKzQsOSBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gIAo+IC1QWVRIT05fQ1lUSE9OX1ZFUlNJT04gPSAwLjI5LjM2Cj4gK1BZVEhPTl9DWVRIT05f
VkVSU0lPTiA9IDMuMC44CgpHaXZlbiB0aGVyZSB3YXMgYW4gZWFybGllciBkaXNjdXNzaW9uIGFi
b3V0IGhvdyB0aGUgY3l0aG9uIGJ1bXAgd2FzCmNhdXNpbmcgc29tZSBpc3N1ZXMgd2l0aCB2YXJp
b3VzIHBhY2thZ2VzLCBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgYXQKbGVhc3QgYSBwb3N0LWNvbW1p
dCBzdW1tYXJpc2luZyB3aGF0IHRlc3RzIHdlcmUgZG9uZSB0byBlbnN1cmUgdGhlIGJ1bXAKd2Fz
IE9LLgoKQWxzbywgYXMgdGhvc2Ugc2FtZSBkaXNjdXNzaW9ucyBoaW50ZWQgYXQsIGN5dGhvbiAw
LjI5IHNlZW1zIHRvIHN0aWxsIGJlCmluIGFjdGl2ZSBkZXZlbG9wbWVudCAob3IgYXQgbGVhc3Qg
YWN0aXZlIG1haW50ZW5hbmNlKSwgc28gdGhlIGNvbW1pdApsb2cgc2hvdWxkIGhhdmUgYWxzbyBl
eHBsYWluZWQgd2h5IGl0IHdhcyBkZWNpZGVkIHRvIGdvIHdpdGggYSBmdWxsIGJ1bXAKdG8gMy4w
LnggcmF0aGVyIHRoYW4gaW50cmlkdWNpbmcgYSBjeXRob24zIHBhY2thZ2UgYW5kIGluc3RhbGxp
bmcgYm90aAppbiBwYXJhbGxlbC4gT3IgdGhhdCBpdCB3YXMgbm90IHBvc3NpYmxyIHRvIGRvIHNv
IGJlY2F1cyB0aGV5IGNhbid0IGJlCmluc3RhbGxlZCBpbiBwYXJhbGxlbC4KCkNvdWxkIHlvdSBy
ZXNwaW4gdGhpcyBzZXJpZXMsIGZpeGluZyB0aGUgY2hlY2stcGFja2FnZSBpc3N1ZXMgaW4gcGF0
Y2gKMSwgYW5kIGV4dGVuZGluZyB0aGUgY29tbWl0IGxvZyBwcXRjaCAyIHRvIGJldHRlciBhc3Nl
c3MgdGhlIHNpdHVhdGlvbiwKcGxlYXNlPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gIFBZ
VEhPTl9DWVRIT05fU09VUkNFID0gQ3l0aG9uLSQoUFlUSE9OX0NZVEhPTl9WRVJTSU9OKS50YXIu
Z3oKPiAtUFlUSE9OX0NZVEhPTl9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3Jn
L3BhY2thZ2VzLzM4L2RiL2RmMGU5OWQ2YzVmZTE5ZWU1Yzk4MWQyMmFhZDU1N2JlNGJkZWVkM2Vj
ZmFlMjVkNDdiODRiMDdmMGY5OAo+ICtQWVRIT05fQ1lUSE9OX1NJVEUgPSBodHRwczovL2ZpbGVz
LnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNjgvMDkvZmZiNjFmMjliOGUzZDIwN2M0NDQwMzJi
MjEzMjgzMjdkNzUzZTI3NGVhMDgxYmM3NGUwMDk4MjdjYzgxCj4gIFBZVEhPTl9DWVRIT05fU0VU
VVBfVFlQRSA9IHNldHVwdG9vbHMKPiAgUFlUSE9OX0NZVEhPTl9MSUNFTlNFID0gQXBhY2hlLTIu
MAo+ICBQWVRIT05fQ1lUSE9OX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HLnR4dCBMSUNFTlNFLnR4
dAo+IC0tIAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
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
