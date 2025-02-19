Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00F8C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 21:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 865D8610EA;
	Wed, 19 Feb 2025 21:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsMEuoCVt1SI; Wed, 19 Feb 2025 21:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF7661104
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF7661104;
	Wed, 19 Feb 2025 21:38:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 214AFCF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 21:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 050FB40347
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 21:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RB8Oa41a1VS for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 21:38:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB0294017A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB0294017A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB0294017A
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 21:38:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1E1A113F86E;
 Wed, 19 Feb 2025 22:38:11 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Feb 2025 22:38:10 +0100
MIME-Version: 1.0
Date: Wed, 19 Feb 2025 22:38:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250219081444.7981-1-vincent.stehle@laposte.net>
References: <20250219081444.7981-1-vincent.stehle@laposte.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <a7b019de9df9139fa70c0bc97764b32f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740001093;
 bh=3KaMvSuvHxJYst/43stE331Lb/n5UWazV7CTun9aVu4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=anPPYudv/4PCoqlrfXneg0KYeR1YLNIem8lxGq0oyIvLdObcn5bOmmBGOJiPmWYxK
 EswFo4r8w4kQ29aODrqCjZKT6gS9Oa/GF5vJ92zsXSrq0UueqprGb+0DfF/OPDt6Vl
 HWIUBPybx2ZSBhXhpOo9r1sIVyGZCY5RLXwSPkhXDnxu9+/doqs5YdCIS6g29yGEDs
 /rj2/MV/5gqecs1+fB9DpFI8ivyZUyPiWFZ7B1Ch6OCZy3eScacJksrORfGRv6MDdk
 wt14Uiy89B5wXHLPZv7fxKJ+kQVSe/asklz6uAQlqFEKPj3wyXhmDNvxf+ZFoMM/9I
 PoEIJbQyTow+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=anPPYudv
Subject: Re: [Buildroot] [PATCH] boot/boot-wrapper-aarch64: bump version
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

T24gMTkvMDIvMjAyNSAwOToxNCwgVmluY2VudCBTdGVobMOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gQnVtcCBib290LXdyYXBwZXIgdG8gdGhlIGxhdGVzdCB2ZXJzaW9uLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+Cj4gQ2M6
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgpBcHBsaWVk
IHRvIG1hc3RlciwgdGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
