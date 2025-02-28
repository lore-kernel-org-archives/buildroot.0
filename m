Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC43C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 20:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B66486EAF;
	Fri, 28 Feb 2025 20:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTN6LlNlkgJm; Fri, 28 Feb 2025 20:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4F348046D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4F348046D;
	Fri, 28 Feb 2025 20:13:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E061E68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 20:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A89A703A4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 20:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RD7Gjb1IPePe for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 20:10:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 34BFA707D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34BFA707D4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34BFA707D4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 20:07:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 43F225FFC0;
 Fri, 28 Feb 2025 21:07:25 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Feb 2025 21:07:25 +0100
MIME-Version: 1.0
Date: Fri, 28 Feb 2025 21:07:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250227163620.462308-1-raphael.pavlidis@gmail.com>
References: <20250227163620.462308-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d838ee5fe97a7db142081fed37b56618@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740773246;
 bh=kerJx5+9I4B0rMUnucqi0wbmF+gVm4eXZOolJAdEtRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YBpS+IxwrxFMOSWrT9X0gGUDSM2fMKdIYHmNEIKTgurKlx7Q1lDpfiGn31u98IVGU
 pWmFTuXdTmkQxhgvfiJ9RDuyCCRMetT4tqqFYmk7vwew0koMV/1GVrWIBLZRvci87u
 z9Il/BH8+17wikpASqjaj7/8/gVurmwzABp52OZcbtNpy9FgeFShQJ/qALrqYU/yAm
 iKGAUcdySbRUsoUMwuTY6N7mwikJq8EVSC6zuZchzgy7b9y4xTU+6bmOtU6RpaOEmr
 ZFx3FEKVNEsaxOH+h9T2YBiw9FGc0FvZL4SeWqDiD447LmBsl0Po2undxMgC4Y0ZLm
 dz/7mtxyHgmLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YBpS+Ixw
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: bump to version 4.17.3
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

On 27/02/2025 17:36, Raphael Pavlidis wrote:
> Changelog: [1] [2] [3] [4].
> 
> [1]: https://github.com/shadow-maint/shadow/releases/tag/4.17.3
> [2]: https://github.com/shadow-maint/shadow/releases/tag/4.17.2
> [3]: https://github.com/shadow-maint/shadow/releases/tag/4.17.1
> [4]: https://github.com/shadow-maint/shadow/releases/tag/4.17.0
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
