Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBAECA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 14:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2015884417;
	Sun, 24 Aug 2025 14:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuI4ZwNsa6Gb; Sun, 24 Aug 2025 14:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB6884164
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB6884164;
	Sun, 24 Aug 2025 14:11:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A71FD1D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C9508415E
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoqxSHLbLO7x for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 14:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFF5882435
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFF5882435
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFF5882435
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:11:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6C5AE2003C1;
 Sun, 24 Aug 2025 16:11:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 Aug 2025 16:11:00 +0200
MIME-Version: 1.0
Date: Sun, 24 Aug 2025 16:11:00 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250815221125.1348145-1-thomas.petazzoni@bootlin.com>
References: <20250815221125.1348145-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6e47864a8d21ce56bd6e17920e89ec3b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756044661;
 bh=KMGxqh5PV/3xuvM27sTBLv/nMIRTFFc6tRabWOjSeGM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pZhNyvJmqCyWn+uPZbEK3GHX9rCcFEhgz5h9DrB4+45851iqsjpeUmd8oe7SCJpfo
 FeZuJSFL16fwk/MqdPfaLIAIgRo2LD4KrLBB2XtG0Tl67vz3CF5AV398Xa9watvYD1
 dZBW1W0DWtjS61tnD8BL1oBFtBa60UOo+3EdZoqsc6G3fFaPV01E/c/jNEI6TYcNfV
 rQz3nBtloJB3H1C85tSiEiar1/rF0YrDXOaBhqXBYS4FWczO5RP5ahw00vkPLgIL6P
 IVykjQLRcIiwZGCx7P9JQwdj8pk47Wpq6v61ad9cVLr9Jyg+ubuinSJnR5QTh4l0pq
 NPU12hT8qIlyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pZhNyvJm
Subject: Re: [Buildroot] [PATCH 1/2] package/weston: do not select JPEG,
 no longer needed
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

On 16/08/2025 00:11, Thomas Petazzoni via buildroot wrote:
> Since upstream commit 66e1614122c22d455cc3a28db08b3afac2b7be29, which
> first appeared in version 1.11.0, back in 2016, jpeg is no longer a
> mandatory dependency. And in fact, Buildroot no longer has it
> unconditionally in WESTON_DEPENDENCIES since commit
> f67a6e9b7a7be9adbc405b3126000056120a01af, but BR2_PACKAGE_WESTON is
> still selecting in.
> 
> A build without libjpeg works just fine, so let's drop this select.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
