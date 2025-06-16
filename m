Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A0FC71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9F37808A9;
	Mon, 16 Jun 2025 20:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DW75b10qpa9i; Mon, 16 Jun 2025 20:43:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E9968101F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9968101F;
	Mon, 16 Jun 2025 20:43:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8521C151
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76E7080878
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5EwGtERtJfI for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 20:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A026A808A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A026A808A9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A026A808A9
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 20:43:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6671B5FFAA;
 Mon, 16 Jun 2025 22:43:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Jun 2025 22:43:40 +0200
MIME-Version: 1.0
Date: Mon, 16 Jun 2025 22:43:40 +0200
From: Julien Olivain <ju.o@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>
In-Reply-To: <20250616164331.3452816-1-buildroot@bubu1.eu>
References: <20250616164331.3452816-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <3a852e89a5728c74e4a4584791b76c5c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750106622;
 bh=+BehSPDyLhE6CBvTHAIuHxBK0TSIBUGEVXHvG+H8ykA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HfC+LsCCAHaf9NMVuomhZWnu1NkLgMyT3X9T8eMfnsM+HoPjpgaF8V5GXci3RF9JX
 DAQfniBsgZzHP1TMPkjchvXToI/F/dLKy/wbf0NcmFJZBMkFeuiPl9NXuTRwf1Epo+
 PyPNKf2xt9CwMUD/U2UEDYrE/wSSGtTd8rcbkn30jpzDWu0SykSuisoJRI+jb2f5QU
 sDg7K3vxpiEP+MDulMuAZ9fUBgTXVoLc5wx2vkocSRI3JzZ+rnjOcm2WNG99XHUUBz
 BCWjXNigfXYmwFmVtiXQN6zKrkU/EJVMvvKvqu78A97uHS+737rIy1ZcytMWswBYk8
 oRQd5Tbq50wyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HfC+LsCC
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: bump to 20250419
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

On 16/06/2025 18:43, Marcus Hoffmann via buildroot wrote:
> Changelog: 
> https://metadata.ftp-master.debian.org/changelogs//main/c/ca-certificates/ca-certificates_20250419_changelog
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
