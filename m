Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0534CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 630BF4136C;
	Sun, 19 Oct 2025 19:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQitfIxEvpGB; Sun, 19 Oct 2025 19:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABCE74130A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABCE74130A;
	Sun, 19 Oct 2025 19:39:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EC0243F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C5E3412DA
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sb3N_FkL0cTD for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:39:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C6294134B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C6294134B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C6294134B
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:39:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8E472B00539;
 Sun, 19 Oct 2025 21:39:02 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 21:39:02 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 21:39:02 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251016183247.169061-1-dario.binacchi@amarulasolutions.com>
References: <20251016183247.169061-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2df9bf220b9fada020a62195a1e5d21f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760902743;
 bh=jr1GAnlmckaB5Y4D/hqQvmC55LSeAhdWB0qxMzUf++M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tggO96arL8M9cJ2XWQgOJO5OqYt1sUdt9E7Oz4QnKrCTjX1NzQU6vi6poNwhIUzVy
 f1ymI/B6sIiITQHRuzQqPIONCzwBQXt+tJtScFNxiM4rM/bBLHbSpNVuj8GP/bD0F9
 mjq5FmSADUVk8vXQ/JXP2dLclc6X3WmnLmkSY+0FvNeEUfMidsKJUguW8HVxtJn/Hm
 PIxzKfMBlSyNlOVbDqo7DaiYsu7DXtgqsQIGfJrenXd4FB2c0ATj2fCGmn1iQLErv2
 1jT0jlg9VWSMw/gRwS5UJoz3P52EqL1rOPTOSytS0VIXoLXa/IRVRtQgGiOeHu+vKM
 /NZilMWDC1vCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tggO96ar
Subject: Re: [Buildroot] [PATCH 1/1] package/json-glib: bump to version
 1.10.8
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

On 16/10/2025 20:32, Dario Binacchi wrote:
> Release notes:
> https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.8.news
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
