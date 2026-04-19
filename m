Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C086EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271F260FFF;
	Sun, 19 Apr 2026 19:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeu4P81Ewqm5; Sun, 19 Apr 2026 19:45:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF26160BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776627905;
	bh=3/ABHXIe1tqNYxuSOhsojFNAPC4/08Pbdxfi73VA2Lc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D05WNQA6K50sGqYfDt5JYCEtnmt6VfADPk+YX0W/YSxjK0D9akL0ZWVhaLc1gWsJ3
	 7AemFGNqn3NpacPEnyJobx+yypvvIeDgayqoM63lCG9LUKXd6m6BJazebLGHDQdH2+
	 h04IatPVqGbLuNJE9HUQZ4t1ScFoPFXyfMv3M+DManoZRnWdXR0DrZcbsvy/x4KxTU
	 zPZRv++ZE/6kou9G2eet+GRcUWoqG+ljJtlgnCiQcgJdvhujOw4krPRJNy7VqecG9R
	 n+o2hlIEweN0aD5PbXTg+zFfkipZ/vYpw5RuPptBZ5PZxMwqfUamYCADKJGceFikD0
	 c+1MB0CvWCymA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF26160BC6;
	Sun, 19 Apr 2026 19:45:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EBE724D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50AE6407B1
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfdXAMyidMPc for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:45:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42B5F40448
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42B5F40448
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42B5F40448
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:45:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1B7EB780395;
 Sun, 19 Apr 2026 21:44:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 21:44:59 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 21:44:59 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260419134326.3225671-1-bernd@kuhls.net>
References: <20260419134326.3225671-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <2bbf03d151db822321b7e57f675f179f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776627901;
 bh=GC67IvhoCM4UpzOoS6hNMVcPBoKgxRFULgstGVIa1aE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KyIekA/FVr3GajT9C8zwr2YEgfuSZIu0E1G4bJsiuOz7BKRCfEAafvcpUAJ+7EaBB
 s1avAulYLGv3n7mgg6lsDFBhmvWOLSOKTVreey+UCCN69yQsHcMHbdWCgZLrb2Asw7
 gQlQBbAdCyeKoJ0R+QNNLML7hBpKDZlFe2GFZynyiIU+dKV54dChIVo8hAC+YLSAqt
 CQjyOe97SU85IUR5dlzrqYpVUjZu4DrSE8PdLWO3nZ3YCphlEy6X9dXrwQ6XyidnCc
 t2v4MUqPlfcMRZnm5X11+LP85Rma7K0xUmj8cqJv0H1Ny+32tSqHQ6Qdg5nI6lXTU9
 JIxjp8/+3eKsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KyIekA/F
Subject: Re: [Buildroot] [PATCH v2 1/1] package/lftp: bump version to 4.9.3
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

On 19/04/2026 15:43, Bernd Kuhls wrote:
> https://github.com/lavv17/lftp/releases/tag/v4.9.3
> 
> Removed patches which are included in this release.
> 
> Added patch for gnulib to fix linking error which would be introduced
> by this bump.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
