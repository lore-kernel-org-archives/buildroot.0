Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C06CCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD4706112C;
	Wed, 29 Oct 2025 21:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggaSzjXdGlcy; Wed, 29 Oct 2025 21:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5BF66110C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5BF66110C;
	Wed, 29 Oct 2025 21:36:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC8FB2A3
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD4326110C
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSMY8DhyR6Kz for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 21:36:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA6486110A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA6486110A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA6486110A
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:36:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6DE53780331;
 Wed, 29 Oct 2025 22:36:33 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Oct 2025 22:36:33 +0100
MIME-Version: 1.0
Date: Wed, 29 Oct 2025 22:36:33 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, "Wojciech M . Zabolotny" <wzab01@gmail.com>
In-Reply-To: <20251027182604.2503743-1-dario.binacchi@amarulasolutions.com>
References: <20251027182604.2503743-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8201cd92718140b9bfb326245d6f9e19@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761773796;
 bh=RTK6jW+9Wq427qRvG5sVop/xLxyFfM0KaOzPQmBZtyE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=isiFzMTCSndwE0sGRoDKF7Ve1XktjP/S6acN44PfBMKqTIvBlG5D3HukV0QwbKF+i
 WwjUTZksZDqYDIGMqlzV31Wj6fRYAzf5tmwXCUEH8si6WGhUQDedw4JqY7olWia0lN
 ydw/eMqab/Dm5H5xgRV+L39rcBjmIZTqJ8y6XHhYrTAnU4HZCLsWeKnV3lvHPZ0GRw
 mMK71ZwXqpcaclZ/vGKhCrDJo1OsB/C7bPJDDAutO9I53LbUXk8LENaFzy2tpPbNNk
 KH0aF7/zKRmKZu9RjVElxczuVzZS2UnN0isL4rBYyJKU5zHcOLe4wlAGqkLOeIi2o7
 daIIUn2fsN5IA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=isiFzMTC
Subject: Re: [Buildroot] [PATCH 1/1] package/avrdude: bump to version 8.1
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

On 27/10/2025 19:26, Dario Binacchi wrote:
> Release notes:
> https://github.com/avrdudes/avrdude/blob/v8.1/NEWS
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
