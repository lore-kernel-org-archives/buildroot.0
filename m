Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12FECCD193
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 11:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3E1841A9;
	Wed, 15 Oct 2025 11:32:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSkQLIrZj5Jd; Wed, 15 Oct 2025 11:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5845C841A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5845C841A1;
	Wed, 15 Oct 2025 11:32:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A8F51C9
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7108E841A1
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nVHd_XnBY0C for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 11:32:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A15383F62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A15383F62
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A15383F62
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 11:32:09 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:c5bc:1bbb:3ad6:c156] (unknown
 [IPv6:2a01:e0a:12:eba0:c5bc:1bbb:3ad6:c156])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 83899C10CD
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 13:32:06 +0200 (CEST)
Message-ID: <e3b0c6c4-dbb5-4c15-97e0-ada5f245fd68@grenoble.cnrs.fr>
Date: Wed, 15 Oct 2025 13:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <23d1f4ad-241a-4fe1-9db0-08bffa4775b6@iwave-global.com>
 <45b0422f-620c-4db5-9a35-423466de2db5@iwave-global.com>
 <584f433e-3ace-4493-a073-7cb92eae6d08@gmx.de>
 <3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com>
Content-Language: en-US
In-Reply-To: <3ac2065a-8ac7-4a59-9889-51fce1eae53d@iwave-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1760527926;
 bh=6QOYP8/wD+yD7CK0jDSmupKED0N94rc5yc1SiOogmFk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=X+n91gX+2IxlpCaGIFaTNekYuUxmg2yvo8SWocuWBTrkLHuT9d3Ykb4zk+w4RnMhn
 2bygHbY9gemrs9cfAllIuR/DjKAEHXMpyb2wBCZh7Aa8sS0alKsVbXqBo8uwbpfHFU
 8MWyso2Cjk5H1ZwA/aIPjH0UzQq0+rNtwVa94uXIN39YeUUjUkS0YPzPqr3MuPNSwE
 RVQ1aqV/1QJRy4Z1hZuXDJSvlVsPOBqVJjxC3OIRKhWudBpAtLT5JlYl0HN+VyY5Lk
 3MBWLoJXnUkJLLhfGqUGh6XIcBuDXrsBHBaGAJ4GdO0QW28T8sBCuYkGxx7nDmxFMT
 RRIH9Ur3dxtKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=X+n91gX+
Subject: Re: [Buildroot] Implementation Procedure for i.MX93 Custom Board
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RXNha2tpYW1tYWwgTSB3cm90ZToKPiBJdCBzZWVtcyB0aGUgTlhQIFdpLUZpIGRyaXZlciAobW9h
bC5rbykgaXNu4oCZdCBiZWluZyBidWlsdAoKRG8geW91IG1lYW4gdGhpcz8gaHR0cHM6Ly9naXRo
dWIuY29tL254cC1pbXgvbXdpZmlleAoKSWYgc28sIGFmdGVyIOKAmG1ha2UgZnJlZXNjYWxlX2lt
eDkzZXZrX2RlZmNvbmZpZ+KAmSwgdHJ5IOKAmG1ha2UgbmNvbmZpZ+KAmSAob3IKbWVudWNvbmZp
ZyksIGFuZCBzZWxlY3QgVGFyZ2V0IHBhY2thZ2VzIC8gSGFyZHdhcmUgaGFuZGxpbmcgLwpueHAt
bXdpZmlleC4KClJlZ2FyZHMsCgpFZGdhci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
