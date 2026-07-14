Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF917C44508
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 15:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92BF0409E9;
	Tue, 14 Jul 2026 15:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qJONIGPwTen3; Tue, 14 Jul 2026 15:19:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F41B40738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784042378;
	bh=Si/l7VRVfFatrYlAtfFyGSnBxz1RfaysbZm2wlg07vI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CFe8ObSMTOVxn8OJrunPEBxEdEFX4Qfe7875XvnJCTHkcPjPWfgnCTb8Kx5FQ2R+O
	 kZt0jjzNr2qf2XGb7r6/oD9elu8Hjr6m3RJnmqfBU8telqS8KV+5K2aEgjCqgFWHU7
	 deTT3xs/5zMjDYGPmk/txAs0J/TvrvtqkZJITrf5oIcvE4rqD/zjggmkgoaJWT9jDa
	 7Dl4yIl/4K2rucYRSp5dL6g0gmTH0A6f+5UwAd8WdYkeGq/9jFPU8ZILb4jA4eruFT
	 PMJAMaWarAE8L4PnQNdV4L5sbSScFbWBQOpL9OzSdV7EILwmSH+ddPxVkOzDmLaIfc
	 QXE/qZCIGgTww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F41B40738;
	Tue, 14 Jul 2026 15:19:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32AF496C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 15:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24A0460A99
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 15:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvw5Xvjf-QZq for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 15:19:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B7F160A95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B7F160A95
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B7F160A95
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 15:19:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3341A19F5C6;
 Tue, 14 Jul 2026 17:19:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 17:19:32 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 17:19:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260617212408.1374984-1-bernd@kuhls.net>
References: <20260617212408.1374984-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <38beb1276b3af1cfff6fe2305deb447a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784042374;
 bh=uGrYydKoExBMajpTdMpYspOzv+Ugu41SVhPqImD+TFc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LZ8D/O0m8ZO81tG0pP/JDtAkg6Kjh4pY21CM+7iF2mbME0XMJRNytt5d5y88vPRQe
 CGmCeArdaVT5EtHHPXfXMJdyS+tJPkYNJDSWel5L6LzjtKf9LiEat5yEcvCSb/UNB3
 OUf6Lk3ZxNYYJUF5fRh87NprR8UT365/m6vY09qvWl7tcaei+WLXav0/xT9Yw4gyBy
 t0OsklJDBUTahKVX3aZD3G3aTsZf2NZ1KdFuIB1Xcix0iuD9P0FGt93MXht2CLoKmb
 /uae+FC1r48o6mu4IYTthUHLerr4LnkPr7tgjzFJLkuPN61kFuY/baG7ZDy+EoWP0B
 i2xes+cone+cA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LZ8D/O0m
Subject: Re: [Buildroot] [PATCH 1/1] package/wget2: new package
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

On 17/06/2026 23:24, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
