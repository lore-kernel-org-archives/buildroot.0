Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEBEEE4997
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3AE560B9F;
	Tue, 30 Dec 2025 17:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgVsXjvCv4rT; Tue, 30 Dec 2025 17:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A81F360A88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767117573;
	bh=/+PqtAP7+bjCakx4w2hQF+cngFSpk7UCl4WlKDh+L1g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cE2yn0peOVQvpewKRzZZR+H0q5zUUI8PrLA3h1kbHv8JN9rcd+cxkBu7X2WMksODu
	 /A8sTqSly/7ioTdeLCxQAKsLw8KmVxKProEW7HrbsKTi0H23WXHXf48+fxNYm+ShdZ
	 YYu4jvbp/hRHOUPkffdR2tbodmLjQe6mQW4Tg29mKTmEgGIDtt+02rXGYYOOGxyHyd
	 YCN5lHtSbLThdDRJ+wRsMfyxVZQcq0epq9HJ2LPBYd4Pm20t/oGQ+ceXJ+nPmnf8CW
	 HlzG0u35ZAa5kU77rOU2nI5Iiw9kq2XImzMrpFseAUICpvApM8nCO3l9HP4dZn032y
	 4CgyV3ilYr2iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A81F360A88;
	Tue, 30 Dec 2025 17:59:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B567277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6905F40637
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJ-O2foz85yR for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:59:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 952084064F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 952084064F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 952084064F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:59:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6B1AF78034D;
 Tue, 30 Dec 2025 18:59:27 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Dec 2025 18:59:27 +0100
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 18:59:27 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20251230170325.2417410-1-giulio.benetti@benettiengineering.com>
References: <20251230170325.2417410-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <ba05d222470a4ee4f2e7b3ac5860cae9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767117569;
 bh=YjTcdz/tDPgBMhPMr4/deyIKoauluekXN5Ak6eTuhrI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dEmEcruRKhz5P45KtLN8ycdDCdWyclxi3N7Qf8gb/1PWCmSTRT1K4NeKf5+N00qzT
 D4DrEbklMx2teK5x8YeiTnbnyqIpQnKwiOnAcWbiez1EAIE2UUwl/v75RN1LT5V4Tr
 Qc4F8KqRVXBQe0K2jxuG8ekF6Otqx+Qzr6fEfoLfIcxW3GGvtj0wZL4k6/uy3qczbb
 wqSrO61Qa6hE2hSNxW+ASq17G5I1D3z27t9HDCR6iWBqtiNB/cJwGdmZM/hl2FIAgO
 IvboOXPB1FYjnXZAhotjQI3DikszuYDCRNRACmUz8JWd/flRgwaBgu0oGaDs7SkZqn
 crqApA6Wc0x0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dEmEcruR
Subject: Re: [Buildroot] [PATCH] package/libtraceevent: bump to version 1.8.7
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

On 30/12/2025 18:03, Giulio Benetti wrote:
> Release notes:
> https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/tag/?h=libtraceevent-1.8.7
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
