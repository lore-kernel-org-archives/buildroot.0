Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FFFE6B240
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 11:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A256C607A3;
	Fri,  1 Nov 2024 11:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5H-SCHMvU_Q; Fri,  1 Nov 2024 11:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBFBB60B5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBFBB60B5E;
	Fri,  1 Nov 2024 11:05:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBB833B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D0B560631
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYU3FXByY_Ty for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 11:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F5F1607A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F5F1607A3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F5F1607A3
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 11:05:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 10FC313F88E;
 Fri,  1 Nov 2024 12:05:36 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:54856])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 01 Nov 2024 12:05:36 +0100
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 12:05:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <b49bf4c2-c744-4d4d-a7c3-6ed473033629@smile.fr>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-2-ju.o@free.fr>
 <b49bf4c2-c744-4d4d-a7c3-6ed473033629@smile.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <905906d8c413494d1f06b23319bf984b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730459139;
 bh=zRgndCxNuUdXWu++Ta4lMi8asPYHt9D1QEwNZmzbh0A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fb9loq2dRd/oIW/bPZloLYftsn25VN9tuGWanPAAt71R14sn+IpYshFVndqx3ziKZ
 et6E6aIpL1GAOT6ljODrenMBzqQyP6RLm2aHaMUZyFIJIRr+d5w5jt4CZChag8P7NO
 twisg4ZD+aj2uV/Qlh3PnKuOPxKo709X229d7QYSdO3XY7KGWfm/m3AC+4mM7AZwPe
 uWeEZ0t5sMlF/bxNNOEedAAwj1pXrXCn2/OOgd92BOwDNwQiljVzu/QPsq3CGVffB/
 8bZ2d7fOTKus0j5b8XUoUrNxz1z/h6IwllBIknzcoSpG/GqaCzRc54hyJ0YBDuZahP
 oes3GKitCvPrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fb9loq2d
Subject: Re: [Buildroot] [PATCH v3 1/8] configs/qemu_aarch64_sbsa_defconfig:
 update ATF to v2.11
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

SGkgUm9tYWluLAoKT24gMzEvMTAvMjAyNCAyMjo1MSwgUm9tYWluIE5hb3VyIHdyb3RlOgo+IEhl
bGxvIEp1bGllbiwKPiAKPiBMZSAzMS8xMC8yMDI0IMOgIDIyOjMzLCBKdWxpZW4gT2xpdmFpbiBh
IMOpY3JpdMKgOgo+PiBGcm9tOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4K
Pj4gCj4+IHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZyBkb2Vzbid0IGJvb3Qgc2luY2UgdGhl
IHFlbXUgdmVyc2lvbiBidW1wIAo+PiB0bwo+PiA5LjAgWzFdLiBTeW5jIHRoZSBBVEYgdmVyc2lv
biB3aXRoIHRoZSBvbmUgKHYyLjExKSB1c2VkIGJ5IFFlbXUgdGVzdHMKPj4gWzJdLgo+PiAKPj4g
U2luY2Ugd2UgdXNlIGEgcmVsZWFzZWQgdmVyc2lvbiBvZiBBVEYsIHdlIHN3aXRjaCB0byBBVEYg
Y3VzdG9tIAo+PiB2ZXJzaW9uCj4+IHRvIHVzZSB0aGUgb2ZmaWNpYWwgQVRGIHJlcG9zaXRvcnkg
aW5zdGVhZCBvZiB0aGUgcmVhZC1vbmx5IG1pcnJvciBvbgo+PiBBUk0tc29mdHdhcmUncyBnaXRo
dWIuCj4+IAo+PiBUaGlzIGRvZXNuJ3QgZml4IHlldCB0aGlzIGRlZmNvbmZpZyBkdWUgdG8gYSBi
dWcgaW4gZWRrMiBhcyBtZW50aW9uZWQKPj4gaW4gdGhlIHFlbXUgY29tbWl0IGxvZyBbMl0uCj4+
IAo+PiBXaXRoIHRoZSBlZGsyIHZlcnNpb24gYnVtcCBhcHBsaWVkLCB0aGlzIGRlZmNvbmZpZyBk
b2Vzbid0IGJvb3Qgd2l0aAo+PiBBVEYgdjIuMTAtbHRzIGJ1dCBib290IHN1Y2Nlc3NmdWxseSB3
aXRoIEFURiB2Mi4xMS4KPj4gCj4+IFsxXSAKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzEwM2E1NTAyOGM3NWRhY2UzMTI0NzBiYTA1YTE5Nzg4
NmM2YjYxMDAKPj4gWzJdIAo+PiBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUv
LS9jb21taXQvMjRhN2NkNmE3YzIxZjgyZjFjZTliZDVlY2Y2ZmI1NGViN2JmNDYwMgo+PiAKPj4g
U2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4gCj4g
V2hlbiB5b3UgcmVzcGluIGEgcGF0Y2gsIHlvdSBuZWVkIHRvIGFkZCB5b3VyIFNvQiBsaW5lIGhl
cmUuCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gIEknbGwgZG8gdGhhdCBpbiB0aGUgZnV0dXJl
IChJIGluaXRpYWxseQpkaWQgbm90IGFkZGVkIGl0IGJlY2F1c2UgSSBkaWQgbm90IG1vZGlmaWVk
IHRoaXMgcGF0Y2ggYXQgYWxsKS4KCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgoKQmVzdCByZWdh
cmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
