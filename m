Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB75C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 08:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12E1A4092B;
	Thu, 16 May 2024 08:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hCUNA9g1qwY; Thu, 16 May 2024 08:38:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1A240B75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A1A240B75;
	Thu, 16 May 2024 08:38:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2BCD1BF855
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 08:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ACFC407CD
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 08:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9MvKXi8LwLf for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 08:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A1C54079F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A1C54079F
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A1C54079F
 for <buildroot@buildroot.org>; Thu, 16 May 2024 08:38:14 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 6D5A6C0D84;
 Thu, 16 May 2024 10:38:11 +0200 (CEST)
Message-ID: <a7168f66-76c7-42e0-b1e2-c82b821695f5@grenoble.cnrs.fr>
Date: Thu, 16 May 2024 10:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <5647a701-8c5a-4ce6-92c3-3c252e1cd91b@grenoble.cnrs.fr>
 <4c9e89d1-48f6-48a7-b7af-0d429e2256cc@grenoble.cnrs.fr>
 <d0cbd392-35af-4501-9703-d9d79db2a984@mind.be>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <d0cbd392-35af-4501-9703-d9d79db2a984@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1715848691;
 bh=01kENREYoDxeJhT4eMFouiRciPBZz2oST8BwKks8FBc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GgGFMuYM8Wnu35CFKKOQ3JKFIEVlqTqnFiuCxuiLw4oCzPWn+lnwb+Bwlroe64Izm
 vuMcI2jdrCA5G8FdEqrP9zvzPHD7/iXkqi76rtVaK4ACM8KeFQWjZg3NicyA4nAhJZ
 qrFQztz+ypsTVGhchVXrcCszXtsBfkczW8O7BWbQwVlFpm54ieba+xvJ0PBnB1if72
 gGPEnbKIjte9YydYtYEB5Z14lsIm8pQfsZ31cgn8BtzRl3H9/C1D4fWjLvBt5GnN5O
 PJyCm3K+q0mBKQKb4RixA6zgkA7+Ax8LMfq96aMBz1kA6cPVh7Fw/nz64eFhf2yLUf
 apVZtsqZNS/yA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=GgGFMuYM
Subject: Re: [Buildroot] Nginx fails to build with GCC 14
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LCBhbGwhCgo+IHRoZSBwYXRjaCBzaG91bGQgaGF2ZSBhbiBVcHN0cmVhbTog
dGFnIHdpdGggdGhlIFVSTCBvZiB0aGUgUFIgb3IKPiB3aGF0ZXZlciB5b3UgbWFkZSB0byBzZW5k
IHRoZSBwYXRjaCB1cHN0cmVhbS4KCk9LLiBJIGd1ZXNzIEkgd2lsbCBoYXZlIHRvIGxlYXJuIHNv
bWUgYmFzaWMgbWVyY3VyaWFsIGNvbW1hbmRzLCBhcyB0aGUKTmdpbnggZGV2ZWxvcGVycyBleHBl
Y3QgcGF0Y2hlcyB0byBiZSBzdWJtaXR0ZWQgaW4g4oCcSEcgY2hhbmdlc2V0IHBhdGNo4oCdCmZv
cm1hdC4uLgoKPiA+ICsrICAgIG5neF9mZWF0dXJlX3Rlc3Q9InZvbGF0aWxlIHNpemVfdCAgbiA9
IDA7Cj4KPiBUaGUgaW50ZXJmYWNlIGFjdHVhbGx5IGRlZmluZXMgaXQgYXMgQU9fdCwgc28gcGVy
aGFwcyB1c2UgdGhhdCBpbnN0ZWFkCj4gb2Ygdm9sYXRpbGUgc2l6ZV90PyAKCk9oIHJpZ2h0ISBJ
IGhhZG4ndCBldmVuIGNoZWNrZWQgdGhlIEFQSS4gV2lsbCB1c2UgQU9fdC4KClRoYW5rcyEKCkVk
Z2FyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
