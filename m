Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17111C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 10:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D941581775;
	Sun, 26 Jan 2025 10:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBYYlvB2qEi5; Sun, 26 Jan 2025 10:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 032C681776
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 032C681776;
	Sun, 26 Jan 2025 10:44:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23420941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 045EF6064E
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XO6j3BbI4oW for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 10:44:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B47B6076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B47B6076C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B47B6076C
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:44:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3716019F58A;
 Sun, 26 Jan 2025 11:44:38 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44108])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 11:44:38 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 11:44:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
In-Reply-To: <20250125232729.219531-1-james.hilliard1@gmail.com>
References: <20250125232729.219531-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <db373e23aa2edbc585be11927b68eea4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737888280;
 bh=lrmTzbzvltFQ02pGJ4kkLZuWW7limP1waHyaoHE0xgk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ehII/BAOJK0+xJrfEiC1BorNo6HMN2DD3yHlD4iNrbHdnzEO2YEuE0b4wEgFUGpbi
 pR/6TMKijgIB9IkND2a6WPLh26CQbAlGGG/QxJIIIAS6J+XUBoLgJl1RsPZ0ekPWgX
 naIoBN/fI6MnfS377MnhZYSJwTP02K98Nsx+UjybV32p5KcxrXHUE5DMLkgq/yQmWK
 5lfVtaBpf4uN78D44nuu1kC7wQ+921LYL2nndrRvrFx/48u8aEXerGyFasP9QkVmwh
 N5WlW9EI1m0YUL2tX3b1gwkchYz9VzkuD6/+xibO3a5kMrpYfwJuSY06NcEVc5o3/f
 0wax2ig+7R0Dw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ehII/BAO
Subject: Re: [Buildroot] [PATCH v3 1/1] package/python-web2py: bump to
 version 3.0.11
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

On 26/01/2025 00:27, James Hilliard wrote:
> Download submodules which are now required.
> 
> Drop patch which is now upstream.
> 
> License file renamed without content changes.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
