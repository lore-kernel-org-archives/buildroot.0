Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5900ECAC592
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 19:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A6A845B0;
	Mon, 22 Sep 2025 19:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AV7WuZfxRY1; Mon, 22 Sep 2025 19:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 151E5845B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 151E5845B3;
	Mon, 22 Sep 2025 19:00:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A56498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3267961B78
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zb4eDBd8c__u for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 19:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AE8361B64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AE8361B64
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AE8361B64
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:00:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 19B5C19F576;
 Mon, 22 Sep 2025 21:00:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Sep 2025 21:00:28 +0200
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 21:00:28 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250922162241.289717-1-aperez@igalia.com>
References: <20250922162241.289717-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9935a8314f1f6385d5e8ac3b3e5014b8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758567630;
 bh=3Wa2noHjDpzUM0Y6Rrnb0GKWj4VbE8ngUb003xIYl60=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hiXd2VqQ5kfv9FcMQs+luHclEMUVyVyyVjpuN9G3gAVEuIYORBlLtsxgcTpEQ6XA4
 gwjNZF4YypFjZzTJlx72ruUvmABbtM/env2IO1Jk3OfjZE1wdXiK4/pZbencTeDWwn
 Z3taN4pa2hkstraqrvalY5uRFMe/RZzrA9M6Bl5XWHqhzt1lPS/uUYG0nA2vBIBMRZ
 YcFyBPKy5JX4lxMrUH43yleEx1YJPtqKsvO2Wn1Mkvj8gBDxi+Yv8C7zPLhLMcXvEW
 pboyeASElks8a3SJGykAeTzYBD27KQFBHptT5VggjtldO5I5QPW4qmLzEwwbo29ldt
 j7zhYXYIxAUng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hiXd2VqQ
Subject: Re: [Buildroot] [PATCH] package/libdex: bump to version 1.0.0
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

On 22/09/2025 18:22, Adrian Perez de Castro wrote:
> This is the first release considered feature-complete, and despite the
> ceremonious version number, it mainly includes fixes and API additions
> providing improved ergonomics.
> 
>   https://gitlab.gnome.org/GNOME/libdex/-/blob/1.0.0/NEWS
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
