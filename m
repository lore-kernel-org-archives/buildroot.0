Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E27C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 12:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BCAF81947;
	Sat, 25 Jan 2025 12:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dA4by5TpffwL; Sat, 25 Jan 2025 12:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AE3081698
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AE3081698;
	Sat, 25 Jan 2025 12:43:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E23111183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2FF940965
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rw4npbj8VgUx for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 12:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9F3940294
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9F3940294
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9F3940294
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 12:43:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 101C95FFA3;
 Sat, 25 Jan 2025 13:43:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42954])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 13:43:04 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 13:43:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250125052520.86158-1-nemaakhilesh@gmail.com>
References: <20250125052520.86158-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <7e1ed3a372a6b2c6ba3504561ba597a3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737808986;
 bh=6/o8ZIZBfMtX/VgSbHslo6MtGNlVQInvJHH3I/ZYZis=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=seVWx1thM4ybMqldkxn1ZvnEg8gSTRwldReqzGTX34ri/jsWOQ6iPskXeCfVl2qhi
 AAI+cke8hSW1l4GRi66RDpclePAs7LjUyF37BOpyMn6r+IxjyyNRBvv0OoFnaPrm4t
 SeFI978g1w0frUR+gadgiQwjcppUzslt812OnHzy19oH8Ia3dOAeGcD3xOUwZ8Z+jr
 xLilBlGHqUYvecRULmKglzAg2LYDS7FfQqg7ejtDPGxA+brwnfpOgXX5w+ZqVJHnAK
 44t7gO94HP3E0mrQlw9IYCFhISdADFKLvCETpBF4gWUtXayV8FgpBtpxiIqgYEtjw5
 8icEFIvJi1f2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=seVWx1th
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.13
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

On 25/01/2025 06:25, Akhilesh Nema wrote:
> Release notes:
> https://github.com/strace/strace/releases/tag/v6.13
> 
> - Updated hash of the COPYING file (copyright year bump)
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
