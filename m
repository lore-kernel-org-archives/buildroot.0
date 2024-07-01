Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B6DC3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E857380BE4;
	Mon,  1 Jul 2024 07:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRKQ_qdYOZ0H; Mon,  1 Jul 2024 07:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB8880BD9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAB8880BD9;
	Mon,  1 Jul 2024 07:55:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BED441BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB356409B1
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVxjK_t46SD9 for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 97714400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97714400D3
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97714400D3
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 07:55:02 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 8E3B3C0BE4
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 09:55:00 +0200 (CEST)
Message-ID: <1a585d0b-873a-40c1-a0df-8c1d53a9e3e5@grenoble.cnrs.fr>
Date: Mon, 1 Jul 2024 09:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240701024316.19646-1-zhangdongdong@eswincomputing.com>
 <d244f478-1960-4306-a661-6005536a3f94@mind.be>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <d244f478-1960-4306-a661-6005536a3f94@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1719820500;
 bh=Xa1ySYEmIpn67+gUWke/l3wDjGoplsaxFqUTRT8fDHg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ZfacO9Fmcmq1jDwq3fsj+NR2tq7MNifF087+QLi/xHJNUj/Y3RvPmdbHnkC5AUN9t
 XJBtPBECIE96f7x/SjGD2I3MYyD3rB++SC/NVLPeBWdZCxm5DNRQ0CaXLDfZi96iyo
 sViC3UA9L6QJIHaWv/UqCtalhKlwbqPeHca6/hWCvcGu+/T6WhIqfo/Ud/TeMRQaKb
 Hk9AYEM1V8euNMfSk+CYysIqe3DvPHlgSUga3Qh5BjdafhQEZsMNV7HLIOG9jQRfWT
 s5mKSil8536w0dgTqOZQoddfTv1jSb7QXRUOxQlTp9Hgq6dtUir+tVV1FoGiZ8Dy5r
 NCykXukoRW8ng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=ZfacO9Fm
Subject: Re: [Buildroot] [PATCH] .github: add github action to automate PR
 handling
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWJvdXQgdGhlIGRlc3NhbnQvcmVwby1sb2NrZG93biB3b3JrZmxvdywgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgd3JvdGU6Cj4gSXMgdGhlcmUgYW55dGhpbmcgc3RvcHBpbmcgdGhhdCB3b3JrZmxvdyBw
cm92aWRlciBmcm9tIGluc3RhbGxpbmcgYQo+IGJhY2tkb29yIGluIGFsbCB0aGUgcHJvamVjdHMg
dGhhdCB1c2UgdGhhdCB3b3JrZmxvdz8KCk5vLCB0aGVyZSBpc24ndC4gQSBjb21tb24gcHJvdGVj
dGlvbiBhZ2FpbnN0IHN1Y2ggYXR0YWNrcyBpcyB0byBub3QgcmVseQpvbiBhIHRhZyBsaWtlIOKA
nHY04oCdLCBidXQgaW5zdGVhZAoKYGBgeWFtbAogIHVzZXM6IHByb3ZpZGVyL2FjdGlvbkA8c3Bl
Y2lmaWMgU0hBMT4KYGBgCgpDaGVlcnMhCgpFZGdhciBCb25ldC4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
