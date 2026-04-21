Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D77F8FA9E
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 17:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF9C4119A;
	Tue, 21 Apr 2026 17:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L56gBDXGu_AC; Tue, 21 Apr 2026 17:23:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75B2D410DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776792216;
	bh=cMl+0Y+LKmK8uwytdf9ZDEo3dFBUNUTcz++eCPrNVqw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QCXcfw94y25WfUd0kFxuBYZM5l9/DrTgq3j1FzMoYEaqc3wmtgLEgKp+DtfGBcmOb
	 HoKZiXd/K/xGcJ9NOFtSlehcElpeM/eYL9xUyJj/QXZypQ4I5Cd5m8B1Kq8yzYOuED
	 pIC+qPDeC8V/6twaFHlqXwNYOyrNElkbwP2ZRnPBeHH1pcTwEYeOZnLIqC0qxP8zIX
	 ++AO859PY2wiCS/ynje97O17cWA8uZ5fHZE4a/nZeyDjq/8+ooy4CaX6dAp6w+DDEX
	 IM+wO3y5e8F2DNrODBciZIU0r0HTQOruUsUEZW8qhvqw1FhRi4q71EV8viGVXqlxHH
	 qFwGfUZXJ1qNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75B2D410DB;
	Tue, 21 Apr 2026 17:23:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83B0C24D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 694D083F14
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ygre0Wpd19JK for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 17:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E9C7E83EFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C7E83EFC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9C7E83EFC
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 17:23:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B5B5819F5BA;
 Tue, 21 Apr 2026 19:23:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Apr 2026 19:23:29 +0200
MIME-Version: 1.0
Date: Tue, 21 Apr 2026 19:23:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260420180954.3749024-1-bernd@kuhls.net>
References: <20260420180954.3749024-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <3cbd9399d45398f080080393242a2d53@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776792212;
 bh=X91KAaYE3G70kEAVrEG11vZfjCCWPofGRjdh7VTjiRg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=memT8XBMSRu9Lh5LM8haLEgD/+0f3DaJ6Y1Y5WmlJAjmGBucT7+6mPiJPtkeQGrAq
 yAgOcvmcfs7+6QDOh1RhtgpjGUjPquPmJ7lUrdQL/MkC6sYHIjJNcH/8oLN6M0TaCy
 LmAXALBX7FwaXOSK0DxTIfGuowVwu10eCh+ID/ZLgvFFcvaLbADQ3l1MY9ZF1Rhg/a
 TRIXEm2+E6Umx0j5DaC3Lvx+sbSOJk3JS/ut7pN8Gqg8gkxY/d8bfJg7kfEr/XYGJe
 caikH68rLw+HryzqZp/E36ZmVxHlOadxq6uUMEKAzzvDk/zvsppTxb2CYXpJHX5Xsv
 UHeSOWaAdKqnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=memT8XBM
Subject: Re: [Buildroot] [PATCH 1/1] package/boinc: bump version to 8.2.11
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

On 20/04/2026 20:09, Bernd Kuhls wrote:
> https://github.com/BOINC/boinc/wiki/Client-release-notes
> 
> Updated license hash due to upstream commit
> https://github.com/BOINC/boinc/commit/44742026e2e30e1c97fa846796236cbb73e43521
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
