Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E4F103E168
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 12:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C19C760A79;
	Wed, 18 Mar 2026 12:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHyTnBI62Bkl; Wed, 18 Mar 2026 12:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3220A60729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773837627;
	bh=KjkefwC5XmTJMidErNyVQrR2KiHbHKrEMtfOzJ6Xuk0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V6gxSEwPV4px7fJ5a1inJ7yrSbt5SD+Z+2Mk4R7X/mNIGaks8BpeRXPO651rYKhaH
	 gaSySE9pxjg+k6Fhr3qcUoXNT0SNgjQBZapGyvB7BQQXuvTRSyCFwbGyPDXNpEzqLq
	 HNqt4iOebxRFnpL5lM8kKRXVzA6PMyGcHJXk1PqLI8fp91mDl25utG9qOJoOs+yl34
	 JNYSgdt77b07JaGhk1aYUs4lutxzbghclCOpHjYyUjEUK6oVWYCDlwU1vYRx4gp1qv
	 Byb+Q8crqdW/ttuvlaJ6KiB8u4QK7gevGdPLsNVaWvOrqCgpltcNAb1U9c4GjDgwuL
	 ZX5/uuBI997vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3220A60729;
	Wed, 18 Mar 2026 12:40:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C5E31BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01E2040D38
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUjQlsVhijbY for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 12:40:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BB3340D29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BB3340D29
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BB3340D29
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 12:40:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 384916013D;
 Wed, 18 Mar 2026 13:40:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 13:40:21 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 13:40:21 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260318102413.107588-1-dario.binacchi@amarulasolutions.com>
References: <20260318102413.107588-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <2374ea2d54dfce5329ee5bb714fc52dd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773837622;
 bh=8d/JyHqa8Kyk2Os5IZQaQiMi9ClsvZz5/5foYmCNOb8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UO2WhplP7czTZxmRISdWzv0V2DhLXoA12/riciI1ld2DZbV8qnTtZTE1u4l0gHea5
 ZNhrMKpHNga4Vdu+x5uBny6J/Jn76eHfnIOXRLnuTjoYwF0RCPISPk81ijQy/0THXV
 aPqXIzC52FRXKd1dfoLFDIlkJGOM9xgFe2wRzvXlz+sbvm/vsuouimFEsPFgJBMsbh
 9sI99O+156SYPfE+K3AK8hZa2tLvNKv2JvV4wOd6H9Ylg815UUJi6IsyAUxfAcNoq3
 XesLku+IAERarSrEVh/SBYOv2U4uhNxhZ3RFDghWkZf6yBlpugsq6lrOVe1hOT5b9a
 DY5e1JmPetZzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UO2WhplP
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 15.2.4
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

On 18/03/2026 11:24, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
