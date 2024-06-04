Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BA2C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 16:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64BEC84798;
	Tue,  4 Jun 2024 16:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RU8CbhZ-fJ9O; Tue,  4 Jun 2024 16:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7073C84788
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7073C84788;
	Tue,  4 Jun 2024 16:03:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF3591BF869
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 16:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA68A404B5
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 16:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYVOPjbUjGOL for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 16:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6596440204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6596440204
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6596440204
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 16:03:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 86A3A13F8B9;
 Tue,  4 Jun 2024 18:03:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jun 2024 18:03:25 +0200
Date: Tue, 4 Jun 2024 18:03:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <Zl86zcPEc1GGAVP3@landeda>
References: <20240511235609.88305-1-christian@aperture.us>
 <Zlw0x-GMNwen_N31@landeda> <87a5k3ljy8.fsf@dell.be.48ers.dk>
 <874ja8g88f.fsf@dell.be.48ers.dk>
 <CA+h8R2qZ8dVMUH94QN85v5Vms1RtNXM5k4VR+5AqBHEOJzzwDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2qZ8dVMUH94QN85v5Vms1RtNXM5k4VR+5AqBHEOJzzwDg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717517009;
 bh=CnG+FKhIjUT2HJlmqKTnu1IDVzMWmb9sJIIVNMnrszs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dRojZbuIG07izTR2kxJicI5hQQFU7u/E6BWNFzJ7m229kOBWXckSzWpDgVaIm3z8c
 9CtJS4yPTD5fpm+TMRiMiu/seoqUAzotrzzA8am3yBMMUVJ0VcftFw0cITyhcl0sOT
 E0PqozG5dblWey6K8h+dxB8zhtQ+Pc5s9Xp+fiUp36o1zYjPqEGUtu7rQuWuT3PSWX
 DXEe56HSWUlUBRVuF24YUKQTqrJW4Ytf7oBKoH7mDId+YVZcM4FGs9AAl88xMdXA06
 uiw2/rBetpGMYph3NymA4IF6HoYa8HzMFO+IJ5UxatRCKN76Ycpmcu6cF8El7EVzc9
 Ptzcv9IqL3ToA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dRojZbuI
Subject: Re: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version
 to v2.27.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hyaXN0aWFuLCBBbGwsCgpPbiAyMDI0LTA2LTA0IDA4OjQ3IC0wNzAwLCBDaHJpc3RpYW4gU3Rl
d2FydCBzcGFrZSB0aHVzbHk6Cj4gSXMgdGhpcyB0aGUgY29ycmVjdCB2ZXJzaW9uPyAoSSdtIG9u
IG15IHBob25lIGFuZCBkb24ndCBoYXZlIGEgY2hhbmNlIHRvIGNoZWNrCj4gcmlnaHQgbm93KS4K
PiBbMTVdaHR0cHM6Ly9taXJyb3Iuc2tpZmZvcy5jb20vZG9ja2VyLWNvbXBvc2UvZG9ja2VyLWNv
bXBvc2UtMi4yNy4wLWdvMi50YXIuZ3oKClllcywgdGhhdCBhcmNoaXZlIGRvaWVzIGhhdmUgdGhl
IGhhc2ggY3VycmVudGx5IGluIEJ1aWxkcm9vdC4KCj4gSXQgc2VlbXMgdG8gbWUgdGhhdCB0aGVy
ZSBpcyBhIGRpZmZlcmVuY2UgYmV0d2VlbiBlaXRoZXIgR28gdmVyc2lvbnMgdmVuZG9yLwo+IGZv
cm1hdCBPUiB0aGVyZSBpcyBhIGRpZmZlcmVuY2UgYmV0d2VlbiBhcmNoaXRlY3R1cmVzIChhbWQ2
NCBvciBhcm0pLsKgCj4gSG9wZWZ1bGx5IHdlIGNhbiB0ZWxsIHRoZSBkaWZmZXJlbmNlIGZyb20g
dGhlIHRhcmJhbGwgYWJvdmUKCkknbSBpbnZlc3RpZ2F0aW5nLi4uCgpUaGFua3MhCgpSZWdhcmRz
LApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAt
LS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5v
ICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
