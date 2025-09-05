Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593C5CA0FED
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 20:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0514F611E3;
	Fri,  5 Sep 2025 20:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iySG4QfTCBLm; Fri,  5 Sep 2025 20:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37E6F611DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E6F611DC;
	Fri,  5 Sep 2025 20:07:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D1C8CA
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 20:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ECC48121F
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 20:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnUkYN_utlFf for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 20:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E23B80F30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E23B80F30
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E23B80F30
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 20:06:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 78952B0051E;
 Fri,  5 Sep 2025 22:06:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Sep 2025 22:06:55 +0200
MIME-Version: 1.0
Date: Fri, 05 Sep 2025 22:06:55 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250905050559.69719-1-fido_max@inbox.ru>
References: <20250905050559.69719-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.11
Message-ID: <c2292c3b9413d92a25eb4c9ac6bd0869@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757102816;
 bh=fNsDDfGe+LJJ7/xdYlf15eDqEktswGK7Hp9URwfmulI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UowL7In4EiUDEuLQHjMTj0bi4B+Ju2Pl9z/yb5Mq7kBw5axxVEgC1FGOguCSSqre5
 8WBCyh+Owsgt9aarD5MOL87pKbI2Mwi+AcIYkoE157fFGfZWgX/MAtujD/UwiqKgEG
 M0gormvb+BhGLl14Qwi+W5RuIiKtDeGFArPSZvHy1ZA4o01ay3XIs2q99Q0rodk+3D
 +u8q1ogRliX5SfBmegpyvbBBAy21qpDs3i6cqXxWoMcaIg0S+le47Rk3JwvpZqHePW
 W1cG6By1+u5r4pLjANSgvioqA4wBYv3/S+skcsQr5iTAjrWKlyrrVhMk9rCdb2Fvqc
 LytddJEVchNUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UowL7In4
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump to version 3.5.3
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

On 05/09/2025 07:05, Maxim Kochetkov wrote:
> Changelog: https://github.com/postgis/postgis/blob/3.5.3/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master (since it's a bugfix only release), thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
