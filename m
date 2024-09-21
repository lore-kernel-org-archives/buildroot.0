Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0956BCF9C69
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 17:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A12F840674;
	Sat, 21 Sep 2024 17:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3QW__0oXYMR; Sat, 21 Sep 2024 17:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AD8C40676
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AD8C40676;
	Sat, 21 Sep 2024 17:01:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5991BF373
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 17:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 593AF6063D
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 17:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vhPmurZIKq2f for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 17:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAB7660637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAB7660637
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAB7660637
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:01:32 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:cab4:7575:2c8b:d0b8] (unknown
 [IPv6:2a01:e0a:12:eba0:cab4:7575:2c8b:d0b8])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 52ADBBFBD1;
 Sat, 21 Sep 2024 19:01:29 +0200 (CEST)
Message-ID: <f93ddbfa-17ca-4968-8503-435da26fac7a@grenoble.cnrs.fr>
Date: Sat, 21 Sep 2024 19:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240919202026.723863-1-yann.morin.1998@free.fr>
 <e35baa79-3f30-4a85-b811-d3d662e6f96a@grenoble.cnrs.fr>
 <Zu6XZXX1bCgd2jFP@landeda>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <Zu6XZXX1bCgd2jFP@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1726938089;
 bh=ECfwZvdLpF9/YBuPl+iMLoRrFrzaKGYYY1NyGfUhN5Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pDFTWIVQL673NLXcpX/TCMvJIu4MWWldgnNpfDa16K98on1tC2zZvLnjP0bbsqVQU
 +AKK0Imk4O193L97cwDB1toA2HGoK0tyajDbIZ0Huq0M/PPvFYTSaf9hMKyZsvT7nF
 s8sBD1GmYj53sxLApiQkNj4MvWweAFrRH+oODSnpc+RcKTNSzZjG+hxazYCS4z/Pfz
 pmupFyeSZ9UVOW5BmXiqOyHOYCLB79xaab1dYgYI1IEeaOHnDRW90vopug7i7wkzg1
 1k3urVWoIJAgMR1cbAmHZAaX+4580/wdp0yxmf2gQoJ+7lyLNn6ZxJHnrzTrpJw0Gk
 dw3uyRHBq1OIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=pDFTWIVQ
Subject: Re: [Buildroot] [PATCH] configs: regenerate all defconfigs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpZYW5uIEUuIE1PUklOIHdyb3RlOgo+IEknbGwgc2VuZCBhIG5ldyBwYXRjaHNldCB0
aGF0IGFjdHVhbGx5IGFsbG93cyB1c2luZyBzYXZlZGVmY29uZmlnOyBJCj4ganVzdCBuZWVkIHRv
IHRoaW5rIGEgbGl0dGxlIGJpdCBtb3JlIGFib3V0IGl0IChJIHRoaW5rIEkgaGF2ZSBhCj4gc29s
dXRpb24pLgoKTmljZSEgVGhhdCB3b3VsZCBiZSByZWFsbHkgY29udmVuaWVudCBmb3IgdGhlIG1h
aW50YWluZXJzIG9mIHRoZQpwcm92aWRlZCBkZWZjb25maWdzLiDwn5GNCgpSZWdhcmRzLAoKRWRn
YXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
