Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45D3CCF9F8
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 21:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DADA81366;
	Sun,  9 Nov 2025 21:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SN1C7H2bpL7t; Sun,  9 Nov 2025 21:46:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF8481363
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBF8481363;
	Sun,  9 Nov 2025 21:46:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5861A1CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A5C981363
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mt0jNgALJ53 for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 21:46:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D79F8062B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D79F8062B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D79F8062B
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:46:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CD7A95FF95;
 Sun,  9 Nov 2025 22:46:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Nov 2025 22:46:21 +0100
MIME-Version: 1.0
Date: Sun, 09 Nov 2025 22:46:21 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251109154300.602812-1-dario.binacchi@amarulasolutions.com>
References: <20251109154300.602812-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <01390ba9a7c4e5949e4631369040b149@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762724782;
 bh=x+ztLaFsqhSWxHHSab3mM6v/jbDo8Crm+i/gwwNK+jc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=al3PQFDfikQxxCGVEfnkw3wn9/K29i12L18lAyT4ouC9ICuX5qxof5dwkuEb9AXAp
 O7fWC9OXcMW6EOoaw+oAkdhTufLt7jm0TWBeJ9HCymKzV+FcF6rrcigKXxetdJsvRj
 fDpYNVeuXDQID6Zi6L6sSWAsqNSJIB4460cwagDwHr/0XueT7TdcDYK4nL+v2uC803
 uXWCC4AKjkQydW1ksB2KcsW/CW65vJ1cI2owU5MJvDwwWef5PuhWnvuTtUYypzTZTM
 vAs0MJlzGKZNNoLA19dEnCIdjSVinPMfj5cjJH0vEEEw+DECnvlRQ4ccO23xhmBKzh
 vFoB27pEAvCqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=al3PQFDf
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptodev-linux: bump to
 version 1.14
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

On 09/11/2025 16:42, Dario Binacchi wrote:
> The removed patches has been merged upstream.
> 
> Release notes:
> https://github.com/cryptodev-linux/cryptodev-linux/blob/master/NEWS
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
