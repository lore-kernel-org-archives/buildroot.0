Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7858CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 10:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7149F40F32;
	Sun, 12 Oct 2025 10:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDLyZnhoIlPk; Sun, 12 Oct 2025 10:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D4BA40F06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D4BA40F06;
	Sun, 12 Oct 2025 10:35:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D068D12B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B650540F06
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sO2KtqJetLz0 for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 10:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F00E140F05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F00E140F05
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F00E140F05
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 10:35:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A723E13F854;
 Sun, 12 Oct 2025 12:35:16 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Oct 2025 12:35:16 +0200
MIME-Version: 1.0
Date: Sun, 12 Oct 2025 12:35:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251012101631.3510138-1-bernd@kuhls.net>
References: <20251012101631.3510138-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a0f837b8ceebf071e8dab9f5ef3ef1f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760265317;
 bh=dnCDFbKYSs2+9S7OOgNseVX6KWCdZKtdmG+PwwLxXac=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=onDgJqx2cra9Rle7OwpKeMcU/XgmzLiayr9C8Qg6q9HhjBtoY09ujLaSLWCe6cWu9
 t06olxQKZaJnAuCtliayPxNh/hSzgy0He44OWV2KB01tgqSKmW4Wg7rFE5H5z1puW0
 CcbCpB+Fxng7sKquEforVI3gFqwTL/U3Lfbv7AguacXv4brXUfHKX6k12yNyKOsGYa
 f93R2rui68pdvnMbEcMERvqrfjJ8IFOkduUGcIaAKYfA5I7DAl9BmvaC6HDo3wtQ38
 6eUec2hwvEiAzAjtg2/9PXTeipk054pitODF7q2lBWpSLCPecAlbQc5Aw17APs1udi
 MuKn2282iktXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=onDgJqx2
Subject: Re: [Buildroot] [PATCH v2 1/1] package/linux-firmware: bump version
 to 20251011
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

On 12/10/2025 12:16, Bernd Kuhls wrote:
> Updating the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Updated paths for iwlwifi files due to upstream commits:
> https://gitlab.com/kernel-firmware/linux-firmware/-/commit/078946281c84e8477222e51f29416439a037d83d
> https://gitlab.com/kernel-firmware/linux-firmware/-/commit/06205c0eb81a78fef9eae2cb5b1789d99a78ac25
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
