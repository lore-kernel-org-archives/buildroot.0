Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56F8CD13DA
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 11:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C7AD61036;
	Sat,  2 May 2026 11:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKTgh6bnlbGC; Sat,  2 May 2026 11:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CCC560F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777722529;
	bh=c2czpIrz5USLiHNyCq5mvGCC966G4e0l2GZah4rFtyk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WvZHuYkcxK8VfadXH9k+ajRAKcjE6F/sqC2u3qw9g34j9boWKdCswyQHllp9DADq/
	 TBcGb3A2yLj/UempKSKdUpLAMTE7sv8LGdhfcwS1Z7zYxKR2SnnZv7N5XseHCOLXg7
	 32G/vup0f/kXUY0knJW+d2TXHpxU3O2LOW9Guj7qyxNBz1DAbTPcvKZnuPlEKbLt6y
	 3Dmv0dztIwCIqxlqscJj+vIH06i50Jc8Q7dsM/hfRYZjCIhEYvwlWaWdzkxLQQJF1p
	 YGkGoncsrlpY3WJfUPCpKSKnt0HYdx65tV1YTknaGZlMfkOsisFVzmQHuLvT9dLxRC
	 QOFyrSREbRzNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CCC560F4E;
	Sat,  2 May 2026 11:48:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7590127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD5EF60F4E
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSNZKfxsKwoU for <buildroot@buildroot.org>;
 Sat,  2 May 2026 11:48:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07C5860A54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07C5860A54
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07C5860A54
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:48:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DE350B0053D;
 Sat,  2 May 2026 13:48:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 13:48:43 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 13:48:43 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430145244.1804343-1-giulio.benetti@benettiengineering.com>
References: <20260430145244.1804343-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <105b2b7dfd49abf363f0fe815e91857e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777722525;
 bh=2aiQ8UGpwsDO0NAihDU2M0e5QEuobNR9PTUr/6rDff0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CH3GMFrmruCth1FpTT2qp2ZQqgof//3Yjuz3tfDn8pm3xkd/++FrhJdQJfiLwAbZc
 KefW/duow5OazouWg72zilQHctzPQSw09IGpMHiF0cqw0exrFCQEUF6/06/yOgyl/9
 Gxy6C7o11+BhU9eLqp0VYs9fdipg52HzGbtWCujbqm4cHy5BobCp3+YF9F2gke5rZL
 vpbmKMmDXifasT2zG/M8k6PUOZSOWMJaZZM5mMhu/i0dgYCeapvWIjRMnTx6U8/9oB
 uCrfygPGDM3OcFkaEaCKoAzgd+Sx2w/8KrBNb9cW+PafwlFYdYEpSBpXj5J3XiuzCV
 Xsyj/ISl253BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CH3GMFrm
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to wireshark
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

On 30/04/2026 16:52, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
