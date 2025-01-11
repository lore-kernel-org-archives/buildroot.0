Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4D3E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D07E7837DA;
	Sat, 11 Jan 2025 17:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EHaHMQFaRtAe; Sat, 11 Jan 2025 17:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03BDA83834
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03BDA83834;
	Sat, 11 Jan 2025 17:32:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F324942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FB1F40DB3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4bYq0zdUMkb for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:32:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE9E840B67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE9E840B67
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE9E840B67
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:32:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2D776B00583;
 Sat, 11 Jan 2025 18:32:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:53056])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:32:08 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:32:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20250111151216.2829390-1-james.hilliard1@gmail.com>
References: <20250111151216.2829390-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6fc7759a3ee29a0bc0baa0968f4e9ce5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736616730;
 bh=T7hmnc4vw1F0ZsjTXJ3Nn4cBnTJ7uVFXpwIZZ/LBnKU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rhHMqwWjthJ6Hmff7yVoFNZGpQtPgcVtvpbNDLmVd9Cf8ntEh4YEDDWLbZRhNBcKz
 A5WlbvMDmpIEE8v8vhHbJS1qt0Iu6MCos5gZkFn21WnxH7wrkguR9N9x/O8zPeBeiy
 JR8Nx3YemHCxGsodSS2qVn158Ll+jV5EN5FANqMx8j0peqe0y5ML4xTVzn4l2JJrka
 c+mFH+m1ScER5xWSjUfKIvwr54Z2WYe2kI02YZ34WpivWE0PO8PD675dAdj76yrpFy
 W02Ef7rmoVTxaH7IDkPF9l+Lx6wfiq5opgkuTQhiKnw+O4MVQdZ24H0wZ6Ct/CtCGe
 xcyi3gm6CrAew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rhHMqwWj
Subject: Re: [Buildroot] [PATCH 1/1]
 package/python-poetry-dynamic-versioning: bump to version 1.6.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 16:12, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
