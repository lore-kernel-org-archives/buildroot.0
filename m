Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE2AC83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 22:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D78F7410A7;
	Mon, 28 Jul 2025 22:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxNwObza6ZJZ; Mon, 28 Jul 2025 22:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2073341096
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2073341096;
	Mon, 28 Jul 2025 22:53:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C9C415C
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02E8741096
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jm9wAqIybs9E for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 22:53:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2502C4108A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2502C4108A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2502C4108A
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:53:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 12F9A13F86E;
 Tue, 29 Jul 2025 00:53:48 +0200 (CEST)
Received: from [192.214.236.6:35924] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 00:53:48 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 00:53:48 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20250727082253.883440-1-thomas.perale@mind.be>
References: <20250727082253.883440-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <2e8b2dd93b35d024aa1b0bcf77586ba6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753743231;
 bh=77Y8osJVa0dU/Dx+LLWZARPzRLPUaxMe9zKQwnFJZyA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bYzjwhGy80EeMhq2oU+bGgMt0zVkWEywSCgAyguFdYq4EoqtLpM3dbq22xVcZGeL0
 OB7eb73PyM7K4bq4H0+Q+rM+PYLZKY7/XTrg1xQ98jkslAZ2jsK7tSCCLpruJhurDI
 TxJVQvHAGZOWQ++ruIO87c/ZSbWY5nqUQbh3Bvx+9DJB877bEjz6WIUbNxW1Ec72CP
 hYMsCwmxgCKJCVtfS9dNjCNjZBcZ48EoELf2FGrm6gPzuemZpRf+HoAuBT7pYRPWje
 35UHm0qcpcdO1A62au6gG8Drz2iLLzWT+kybfqRXrsibHQQ/NiPyN8xOUkrhINCvK4
 PhDgyd3Tb55YQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bYzjwhGy
Subject: Re: [Buildroot] [PATCH] package/qpid-proton: update mirror url
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

On 27/07/2025 10:22, Thomas Perale via buildroot wrote:
> The current mirror now only has the version 0.40.0 available.
> 
> Older version of apache packages moved to the "archive.apache.org"
> location.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/853/853c354b9bde4408e122046496fd3f0e7ffb0b55
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
