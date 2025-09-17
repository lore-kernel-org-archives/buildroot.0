Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC56ECAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 16:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 901B141174;
	Wed, 17 Sep 2025 16:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y86vgRDH1xDo; Wed, 17 Sep 2025 16:52:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 066A9405D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 066A9405D2;
	Wed, 17 Sep 2025 16:52:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CA80C199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0FDF611F1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MprhfEYtUytZ for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 16:52:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 10CCE614FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10CCE614FF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10CCE614FF
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 16:52:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2A53A2003E3;
 Wed, 17 Sep 2025 18:52:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 18:52:07 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 18:52:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20250916005333.2536248-1-james.hilliard1@gmail.com>
References: <20250916005333.2536248-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <19574866357b5e0094aacf90672a7150@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758127929;
 bh=jSoRti2/dGE5QTPmJKPV5NEX/HD1uFkG3R/UiL38zEI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y4Kw6tB5o/U+SpAp3E7wtvWpKO3qJJJS43143s8li6taG+7oX6k0WhHkkRIvXTAY/
 gY49NrlsYi6kBifTCI/f2rhugocW81/uYmdWLdDcIkkJ4NSyEFrwR4ca4yAiVEjgjm
 bxGEyWUbSVUhcioqQutBG0IBcN31C30yr9VM11bH6Of0Nv2z0CGgT7iFVmBAq1JiSX
 gUUO7/LiiUYeuGoFrIZujyWA76KEcmfkbptrSmxUqOO7qOP7FpyNpAimI3vG9ASojs
 KP9Lychaqtgh7MY1xNmHwGk/uuN97N0ldGKoy7mcRyJs/No0DgPJPz2RVNFTWfSQFI
 C8OUtQ99P5xuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y4Kw6tB5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to
 version 2.38.0
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

On 16/09/2025 02:53, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
