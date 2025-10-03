Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5883CCCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F338361580;
	Fri,  3 Oct 2025 20:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2z6sJ0RX1Wz; Fri,  3 Oct 2025 20:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92C346155E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92C346155E;
	Fri,  3 Oct 2025 20:58:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B91E226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 087C68376B
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSg90Qmz2hOd for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:58:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2B2883759
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2B2883759
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2B2883759
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:58:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C7CDC6014D;
 Fri,  3 Oct 2025 22:58:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 22:58:18 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 22:58:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251003201423.2430485-1-bernd@kuhls.net>
References: <20251003201423.2430485-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <8c7618321d60b5cc2a1309e2fa73b4a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759525099;
 bh=qlWUKg4Ct1b3FawigNyllDORYEsgQTTocrwU9dscTXI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NjmxZ5yNMipMX067IrsCouj75TCb8T9Pf6FgMx6Dv5Xfc4BthGWTqAx20nfrkU1gk
 gzpP4S4BJp5ikJ2JJZUb69FLxuGeUx8IqVw4hIUgdfMUzeiw7ZfVVkH2f5Ffgjy/z+
 tnABwehLBwsVMqlR/6A05gEGg7KSKSNb4o8QCnwcdY5s7m4x/S3KkNhSp2wg8uKIyC
 1POBS+Upkdfr5TNvr1PqacsP7ui8+FVLWQyQ6JQQGqKr9lyer7jmFf42mbaYYaF0aT
 Ca0DyQVdJJG2sR8RE8r0rgvIrBq9/5DrDVTvtExLeErO2NRcDvwwrC6HuMHQ5jGX+B
 6pVRIuPscqfiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NjmxZ5yN
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.17
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

On 03/10/2025 22:14, Bernd Kuhls wrote:
> Release notes:
> https://github.com/strace/strace/releases/tag/v6.17
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
