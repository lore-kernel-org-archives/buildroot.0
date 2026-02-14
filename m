Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D250EF5852
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 20:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6ED40B43;
	Sat, 14 Feb 2026 20:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLrxAJtD2HPk; Sat, 14 Feb 2026 20:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC6740B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771099997;
	bh=lXyUJcGn+NfKnmXW7mSRCXPUqcPL/wfWfgUoWmbfKOs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TIZJdYJmlO7ZZBc0LN590GjzsJoCPRjb6Kg/jtmfpKDTN2NfHgF2Y0bhpaaYp/1Qc
	 V0748KKz9VfH0DrBl8be+SiBrfY0PWHQ4rAdiPGxRGo4n89XrBXc6ecWkr1UVWbmQd
	 9FjXwTChFWOzILeJsmUDe2xcOxcjhiZa3r0cAJUByGCqzREG6YRwOFMf9vslMXNnar
	 Lsu7FDHXFrRT2zQw0vVujeNPhtpTY4GAKIrWRt912awD2u+AOBIGq8A9Nl8FiiV6mc
	 v9jJg9UBcxr/hSK44ck1FMnMbssHo4BUw1xDOyqDKEVdYjIMC4BNRGc5XHenkY+A0Q
	 G2Al1Kyo7k6oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FC6740B34;
	Sat, 14 Feb 2026 20:13:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3625C69
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AF4040139
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHtmleJ1rONQ for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 20:13:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FE18400B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FE18400B0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FE18400B0
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:13:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 91B17B0053E;
 Sat, 14 Feb 2026 21:13:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Feb 2026 21:13:10 +0100
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 21:13:10 +0100
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260214-libxmlsec_fix-v1-1-0512d1cd6e06@bootlin.com>
References: <20260214-libxmlsec_fix-v1-1-0512d1cd6e06@bootlin.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <61e39dd45777696e3b0808ed48729f0a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771099992;
 bh=b2yKMrLGUoqFSFXf5yTb+rucxRLiyJvCw1HtWIUdt7M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hA6QL8PTxuWfTb5qKlZZxKpCSinv56zt2vQMR/Q46p+XNZZV4IGEmAAO/hMQnwVqc
 +7nTmTL+kiI4emCf+SJbb7vPo1vCBMxJPzxUEpxaIkkrYtQnQTkKMt2DrkzZsRVzk1
 JLccMHpSSjNfL8ZfHuJjzf51XImFCnkxu642ywZks5C0rjVjantKHnEt8QYjJoJAG1
 7HOF445q26ZGwgeFzamUXAt+4GTAO7dVvt/DaUP/f0fM8FR2mXoyFQmEcAyWY0MHu6
 jOqJChtOTKOJGJ1M3J/qT8OtXRGaTJj8qHvpiW2fgaqx+qyF4V0e9Vs1o5hE1gcRe+
 roW72HEUY1yVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hA6QL8PT
Subject: Re: [Buildroot] [PATCH] package/libxmlsec1: disable des support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTQvMDIvMjAyNiAxMjoyNSwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4gbGlieG1zbGVjMSBidWlsZCBmYWlscyBvbiBzb21lIGNvbmZpZ3VyYXRpb25zIHdpdGggdGhl
IGZvbGxvd2luZyBidWlsZAo+IGxvZ3M6ClsuLi5dCj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExv
dGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
