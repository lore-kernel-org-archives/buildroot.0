Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C581E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 16:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1145D401F2;
	Fri, 27 Dec 2024 16:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z58Gm-dIXQiw; Fri, 27 Dec 2024 16:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC2CF40208
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC2CF40208;
	Fri, 27 Dec 2024 16:43:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B185F1B
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 16:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C1D380CDD
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 16:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOuTCEKqvzPA for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 16:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 502D380CDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 502D380CDC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 502D380CDC
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 16:43:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1EC7C13FA36;
 Fri, 27 Dec 2024 17:43:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41392])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 17:43:22 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 17:43:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241227153522.3076932-10-peter@korsgaard.com>
References: <20241227153522.3076932-1-peter@korsgaard.com>
 <20241227153522.3076932-10-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <cc98e6c6dfb8a48b0547361325ec43f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735317803;
 bh=zHMIOEEHp7I8Zp7Sb40caTRkMuBzRsvRddZ9ShIaa6o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RWnuq/dDXkfKVUjZSuvBwrFwqCKpI8iU3NnfZtOU3WusRKaTkUentrs5TmAfE1g7h
 PVATbgMDFA8yj7wN8W2LK1MOvZO9vqrdy2pzAhESX15RWTcRf/muzevk76R8dHgqFz
 LxTL22Iqh32DChYZcEivCyQEfOE9tYCkALLgVxJoIXmeQEavviQqpfut0jYsgOm1er
 D3tW6K7vphAyeOIvm6CzREULIEpCBjLSAp35cDzeM8BOhu//C80haMVdJt+iEKk/c7
 S1F52IxZlosybw1WHzJSV//WLO+hkzBjU7Gi1beEItpube7I6/A0eU9cZ8vYWLGXJd
 tdVmo9D+3hUFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RWnuq/dD
Subject: Re: [Buildroot] [PATCH 10/12] package/gst1-rtsp-server: bump
 version to 1.22.12
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

Hi Peter,

On 27/12/2024 16:35, Peter Korsgaard wrote:
> No functional change, but bump for consistency.  For details, see the
> release notes:
> 
> https://gstreamer.freedesktop.org/releases/1.22/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.hash | 4 ++--
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

For info, while applying this series, I fixed the title of this patch to
"package/gst1-vaapi: bump version to 1.22.12".

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
