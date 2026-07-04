Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0871C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 17:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6203980F59;
	Sat,  4 Jul 2026 17:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlcNMeCMK8_q; Sat,  4 Jul 2026 17:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA88B80EC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783186171;
	bh=V4glZkIgK5H/NUIYyn7pgNnYsVondE9x4JWPOwQMaCc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I3p3FwyjcYsNJERffUxdj31K3+2dv6KM3/ZN7JPPZO+FSvz7vaF8axroCE2YLPEfs
	 LqwOLpPKTMSMfHzObOkuueEXYDABov+YOhVDtzgzw8MgK18cwDA5o5CRhn/cUhkqHk
	 +SfvpumsLdk4EFk/6Js6IWHMKFI+Yo+b8tD88rT6Oa7JkQaQgFUwFSD6cQa7sqy3Yz
	 h0untareJ8xcA8ALHTfGG//YWyPSypMrPVtX2z9Ux2mhfgif0Mn8N9+c+xhZL1f2AO
	 eXXWwQwtjcFaEYCiqtGOtLBuwR629F9qXm8mIrUlsk68Ux2mHabT8W12VWvYT1XM3b
	 hiWQyGgzTvadA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA88B80EC2;
	Sat,  4 Jul 2026 17:29:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB9942A8
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDED380EB7
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tb3ZBbnFmvqU for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 17:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F32C180EB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F32C180EB2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F32C180EB2
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:29:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C40AC19F57B;
 Sat,  4 Jul 2026 19:29:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 19:29:24 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 19:29:24 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <akaqRiHr-DLEYcqw@waldemar-brodkorb.de>
References: <akaqRiHr-DLEYcqw@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.16
Message-ID: <5e47762645d2997923248eb048eb4e7f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783186165;
 bh=BTyl9IRWYQA+dOKGoHauMJS0TQiOJIfpphkkGbDVdpM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eXHf4Xtsm85Elpxl7JtghanQFDyI/J/JkRxxBW9PT+tH1Ao2qp3g58PemWPqQXO0U
 EnT9nNW6ID4TDorOKLk724+vzNGLfP1zQb6Lx4dGV6SnMiP6S6+spp8XYAoVKD+H6q
 /07/cFqB1TG2IiYoS0scAssauDaVCeH8pLylGq9+5BAS0oddygJFr/21Qbq/ASHT/4
 PSnkqoXZvHaKvgJluWWpGshLSM1hEe7dGq1lRLlEAINXfnS3pH6ZRxyOkBUmrubiBK
 3hGx8rBk4boQuVI7bVro4H7+yGBQVC930YRia5/CvreIeN/JR8rEdzGq9QWgoas19O
 h0TfMocJa9cEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eXHf4Xts
Subject: Re: [Buildroot] [PATCH] package/mpg123: bump to 1.33.6
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

On 02/07/2026 20:13, Waldemar Brodkorb wrote:
> See here for changes:
> https://www.mpg123.de/#2026-06-06
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
