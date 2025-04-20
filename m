Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E1FC369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 19:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D897840695;
	Sun, 20 Apr 2025 19:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuzuZhOHQ0vS; Sun, 20 Apr 2025 19:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D32BF40689
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D32BF40689;
	Sun, 20 Apr 2025 19:18:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A746C1A0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 19:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E27140936
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 19:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfp4-szYXDX2 for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 19:18:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C5B724057A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5B724057A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5B724057A
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 19:18:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AD4BEB00565;
 Sun, 20 Apr 2025 21:18:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Apr 2025 21:18:00 +0200
MIME-Version: 1.0
Date: Sun, 20 Apr 2025 21:18:00 +0200
From: Julien Olivain <ju.o@free.fr>
To: =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250417125251.301268-1-raphael.melotte@mind.be>
References: <20250417125251.301268-1-raphael.melotte@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <a97d4e4929f7a67fcb0e1041a160e64f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745176683;
 bh=8+Cmyy34AjHuJ5mmUvpJPVv6guenMXMr/iaxPTVZTs0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n99aHlc+ERusLWHY15M358tB+1yVAAiGNDYIk3xpwcaTJiEOUst7nKO9wzOpmK2Yv
 ypu/6VjDds1sERd4dCn3qfp5HpLtPVFqWC0vRr1JPUmYlSFB6kWK06t71KNdXzCFbj
 I4HVBKLZ3z8idtnWsRTs/tAXRrCleB52dwvxNQmu1LUVohzObsCNKas5AgDsGVyLvO
 +l7hGTNKJyTb2vRFjX/7bA34ZwFAxBRNIeXuJDkf0YGiFw8YZqTjqxajsiY/1rczzd
 SKofCxKUtEd1Oyean4AQ8YYgrQmY+l11pTA4OWfw3STnq/E4vNe/zuNe2dk9DMutht
 aDKERD1iKbGyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=n99aHlc+
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sdbus: bump to version
 0.14.0
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

T24gMTcvMDQvMjAyNSAxNDo1MiwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBUaGUgdXBzdHJlYW0gVVJMIGhhcyBjaGFuZ2VkIHNvIHdoaWxlIGF0IGl0IGFsc28gdXBk
YXRlIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1l
bG90dGVAbWluZC5iZT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
