Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DACCD5BB8
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 19:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6885A810FF;
	Sat, 23 May 2026 19:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_2XRTz2dU4J; Sat, 23 May 2026 19:59:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E21B810FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779566361;
	bh=4nbNimCcXuCMxf7NwDLKPfzP8f32fh3cz6GpnDB02e4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MFYAMyKc0YkYcFS6nCef2KzqNX/KvjVdhdotECdXorTXfX7Q2rnrhQIMjAKtBtn4n
	 V3wW6LK2q7ZTCn8j5IghwOws4bexo7xJxsizemEynT+Qs3P4T2X/IkxTGkvrG+bEkd
	 AqI5PBx8ZNS/Ns/+42lOhMgHVkutAYqhMM1XnlkjYeL5/UfPslyCoZpsAIVwQDdj+j
	 IlO4f0paf40pFjMdeMZ70c6Skya4hY0mvnItGte/LvCqocaGwiz340zjGOVr+gnn/Y
	 NofJ+ycVHC7fZp4yIX2A1xdtYtOBzOklKXkc3/MJYiSJaHo4bLX9zt4SJWcu1T4DO3
	 Eh47sVw25E0Fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E21B810FA;
	Sat, 23 May 2026 19:59:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53AE2263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 19:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 451D040CF2
 for <buildroot@buildroot.org>; Sat, 23 May 2026 19:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Znmht4uhgVt for <buildroot@buildroot.org>;
 Sat, 23 May 2026 19:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C83B5407C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C83B5407C9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C83B5407C9
 for <buildroot@buildroot.org>; Sat, 23 May 2026 19:59:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 75E095FFBA;
 Sat, 23 May 2026 21:59:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 23 May 2026 21:59:14 +0200
MIME-Version: 1.0
Date: Sat, 23 May 2026 21:59:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260523160106.1306246-1-bernd@kuhls.net>
References: <20260523160106.1306246-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <b4937d19c9f381740fac350ea28274a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779566355;
 bh=NjkMOaaMAW52hXzeDbweSU/Mts5P3RswiNECvc7Dbss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DpCtHOY2UeTHkWpCTbEZMVx/QZRQCoBVV6Vn/WJsLliXrPIxBr2qATVgiMLtyFmjs
 HeKvb67Wlt80ZY25KfBqs4qhXAeUuvoaaekO72zFUQDl2wODZ7IXld8MthUHKirBSe
 YZib8nGqBQjXWKRF1xMzJPrqfllS2ARyYBU/04+FPY4eLQ8mKEXaNWdKjUzrWN3i4X
 o9fcLbimkV9WR6qgPCF9chRptm6eCvmzjLcbNjlytzuDX6pl+nkINQfKgjwn+xWcOi
 AygXVZg5oOCvmaV6hIG3evvrNuB7zZeTEHGKth0Xcb2w4pXrnD8U2NnssImMVBkOKU
 ELwOYMZK+/dPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DpCtHOY2
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x / 7.0.x series
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

On 23/05/2026 18:01, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
