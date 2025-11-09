Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F87CCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 21:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FEF580BAE;
	Sun,  9 Nov 2025 21:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paEQLOWAVbD9; Sun,  9 Nov 2025 21:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A01BF8066C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A01BF8066C;
	Sun,  9 Nov 2025 21:45:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 225E11CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F3F76087C
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hS5gZT7ONA_j for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 21:45:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 566896087B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 566896087B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 566896087B
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:45:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5FD702003C3;
 Sun,  9 Nov 2025 22:45:41 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Nov 2025 22:45:41 +0100
MIME-Version: 1.0
Date: Sun, 09 Nov 2025 22:45:41 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Stefan_S=C3=B8rensen?=
 <stefan.sorensen@spectralink.com>
In-Reply-To: <20251109104429.587721-1-dario.binacchi@amarulasolutions.com>
References: <20251109104429.587721-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b3c74d0132e8a36b551bd89befad2856@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762724743;
 bh=nHBp3hTJ5ahs61U3K486N0EME1NLGcqHI9DxSoRN+oA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DlOSf1QweQn4xz06yrlrd4Zs703kt6TiHFfwvXLX6p2WXcx46xIrniTcPkczBPoO0
 UIz08uUlpHrJe7z9/MfCkXSlIc3UvbMVLFfomVuJremyb3b30v4Ks46BOBPksdikeS
 R7ppeZ7GwzfCD+R0vMWo5Z8cIx6zsqqE0MiDvyvplbSJdTrFQKIU1Tb8Jfx0gJ22uX
 ioAfRXnjT2nEUVj7OXNsmKpBtrnuya1E//PsB5vehW8+UWkOeOupf3uMSQ7uYFyKVc
 m34skd0VAnQ/Xpn777hn6FbzTts4EGCWjM9N0oyUn6FxY77w9iMq0l7BPdx2GzBwrh
 VtY4PRepLktEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DlOSf1Qw
Subject: Re: [Buildroot] [PATCH 1/1] package/cracklib: bump to version 2.10.3
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

On 09/11/2025 11:44, Dario Binacchi wrote:
> https://github.com/cracklib/cracklib/blob/v2.10.3/src/NEWS
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
