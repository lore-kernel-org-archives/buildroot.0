Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED492C52D6F
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4868805A3;
	Sat,  3 Aug 2024 20:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SqYTxC0ttiC; Sat,  3 Aug 2024 20:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0456E80B4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0456E80B4B;
	Sat,  3 Aug 2024 20:16:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B35EE1BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0970401ED
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vo5TOfvwmKn5 for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:16:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 82841400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82841400DD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82841400DD
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:16:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C21F0B00579;
 Sat,  3 Aug 2024 22:16:06 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42884])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Aug 2024 22:16:06 +0200
MIME-Version: 1.0
Date: Sat, 03 Aug 2024 22:16:06 +0200
From: Julien Olivain <ju.o@free.fr>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <CAOMZO5DBp21mF9+X1iYq-PJf7RJvJ=wFGKLsr2vT3vzNPCfZ7w@mail.gmail.com>
References: <20240803111855.1726141-1-ju.o@free.fr>
 <CAOMZO5DBp21mF9+X1iYq-PJf7RJvJ=wFGKLsr2vT3vzNPCfZ7w@mail.gmail.com>
User-Agent: Webmail Free/1.6.7
Message-ID: <a624df42fadcc3d3f0c176e94367478a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722716170;
 bh=spApV1RPOblbvaEdkacYFhWbZjOYb+SrgOsJyQGWprw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EqciWVtwlV+ZlZadPbCVWP36y7/hbIS5sTJjMhCktQ73Ev5O9FLxBvtLlXNXPXYzJ
 9uoFHYF6NVKYiTEoO05mkI+IjyGLyCKeG24p7/3WPdCgkq51GMWpaW2Pp33DWIE0XC
 PlWX6ugHkoklZBiuE9i8XLcRnTgVV0a/4BEhQ5OJZ3esJJV56mB0mX1QcAcJr8UpwK
 kkvVxAGysbWT/OZ+5jlgsnrTlLAbQqQJZaL4FZTVPUoRcLRf1AoXDWjgaeDPjXd6E4
 fkhxUEsDtPrmtbgSF9/rfHZTA2K0KbKuF3i9/8DainWAUlcz6J956xy0DsHA828X23
 8esCQvLIpxivw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EqciWVtw
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx6ullevk: bump BSP
 components to lf-6.6.23-2.0.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmFiaW8sIEFsbCwKCk9uIDAzLzA4LzIwMjQgMTg6MzgsIEZhYmlvIEVzdGV2YW0gd3JvdGU6
Cj4gSGkgSnVsaWVuLAo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaGVzIHRoYXQgdXBkYXRlIHRo
ZSBjb21wb25lbnRzIGZvciB0aGUgTlhQIGJvYXJkcy4KPiAKPiBPbiBTYXQsIEF1ZyAzLCAyMDI0
IGF0IDg6MTnigK9BTSBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPiB3cm90ZToKPj4gCj4+
IEJ1bXAgQVRGLCBVLUJvb3QgYW5kIExpbnV4IGtlcm5lbCB0byB0aGUgTlhQIEJTUCBsZi02LjYu
MjMtMi4wLjAKPj4gdmVyc2lvbnMuCj4gCj4gTml0OiB0aGUgaW14NnVsIFNvQyBkb2VzIG5vdCB1
c2UgQVRGLgoKVGhhbmtzISAgSSd2ZSBjdXQvcGFzdGVkIG1lc3NhZ2UgZnJvbSBvdGhlciBpLk1Y
OCB0b28gcXVpY2tseS4KSSdsbCBzZW5kIGEgdjIuCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
