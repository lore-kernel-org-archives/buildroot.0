Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29619E92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 21:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0B1B4065D;
	Sat, 27 Dec 2025 21:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZd-HGmNoKE1; Sat, 27 Dec 2025 21:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E0E040638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766871276;
	bh=d7LPRFG+2ocTvg6KVbSbdy4u/A1s5q28Y9lZnk4MbkE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=joSHxBto2coG0IPOYmiHRubXdkUmkVBJ5FH1UQ4/AcYJNNTd+tBVNaJ/gSUnkCGoE
	 9fERxnvoqNe0qpyJa9OzAgOEz/uPAP8R+w8GBUDC9s6im/gx2bTqJWkYy+c8sCz1lM
	 6Td9yM5bTizM2a0GL6W78pTNoqtGFL6XsUtV5hqYj+lLOGEQFxaKcVrJIqrLIGgNwG
	 8oQbD8P277cjFqCTYOdw4/CWFUQD/DK9nA7gA3/2yjizL3dxZiDwtI6ReeqlbLcjZ0
	 0/3XAoozbEKNq7CJYMDcRR+u5DhBobFp8721tux6FtRCDQnQLkAvfeNjYklc6bwjT2
	 SvmT+3j0LfaGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E0E040638;
	Sat, 27 Dec 2025 21:34:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E522CB9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D673B80F30
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xpas5pZ2CmmZ for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 21:34:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDEEA80E63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDEEA80E63
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDEEA80E63
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:34:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CD34119F5B2;
 Sat, 27 Dec 2025 22:34:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 22:34:28 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 22:34:28 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
In-Reply-To: <20251012223047.3323531-1-giulio.benetti@benettiengineering.com>
References: <20251012223047.3323531-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <c7235d0f11e8e508998e0fb3ceca3fac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766871271;
 bh=5Cd7ZrsxLMElBy3oEZBJrbxDGKC4245Wr/Md/2XHpLU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sTQXHXbx2BA82EZLfP2F5AqCwSIC6m0pRzwpxokSK9tmIevJGT+9e9n+Bci75KJHm
 1nS/ZZVE9Gb0uyZaZT3zesBiuqBKBklfUVeCpQ22CUXtYCT0QhFJKLJCGoRnRMJ3Gj
 CbLjNy+ii/EHDFLdEEaz3EPDOXsWU2njS0GbrhH/wDoXKFj4iAPxB6OG0izSpAxowH
 HKL8d5x2vII2ArYQdDnnZxQkQjPO2ixfXrFMaU35Ml2REdh+98JWMX7AOdD0Wn1Ap7
 u14qMfuLfGwOuIx96t9XbbQER76oax077a0fZHOw1rBYVEMXZzoES5wb3hqT3I04ft
 0ZKRWoO/ChWww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sTQXHXbx
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: bump to version
 2025-10-11
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13/10/2025 00:30, Giulio Benetti wrote:
> Drop upstreamed patch.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
