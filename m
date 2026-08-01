Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68704C55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 11:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3105760BCD;
	Sat,  1 Aug 2026 11:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8_HnkILS_K7; Sat,  1 Aug 2026 11:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1FEE608F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785582702;
	bh=Qej8S242jtgGgMrqBwabBvZridvfSw26AMd07PMhS7E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=byouxUJTDZcOsDIKikj1c3F4+OGeibRjhBbabzZ2cSPR9+Bp8CiGOEGeiBxScx921
	 12RdvGObzWq72Cfz+gu+S/sMSQI67jdQ7DJ5Ft4nF0LD7eTcmiHgXhnS+K+F+OcCu5
	 9+cL/svZ7f5fd388Vss/IiLcfVC1vOBX1VKxNj8PX53KCJJeRfCV63DSp1p45+ll67
	 fvvJd1bgB8/uD+9/vaxEpU/rDQ9DzpnujKmiTkrCKHiikr5lRln81lR98ACEKD0FxJ
	 p6iQt96C6gEluufrhk/zaEwSJX0cCIgY2Yw6w6Pm48BR6bB9KEcmTGhcL/IZAp9cmo
	 wgk36qnXy//aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1FEE608F0;
	Sat,  1 Aug 2026 11:11:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8503C194
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76E4240061
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7wA8gPT6sJj for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 11:11:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC6634004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC6634004E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC6634004E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C1D63B0054E;
 Sat,  1 Aug 2026 13:11:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Aug 2026 13:11:36 +0200
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 13:11:36 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260718095042.230873-1-ju.o@free.fr>
References: <20260718095042.230873-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <ca4cafeab8364e3dc7e1b78922987ef8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785582697;
 bh=402E9K8JApbySwoqnX2V75f9rRS9kcKJNgIG2/tbPW0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YoPUWTz/qyh9ebeG5Aw0m5f2ZCqX45J0t2eStG954DI9LVpQZh0RNo1NpQHulyhE+
 yWwiak3TrJXoyBtfqKIK1sGHa8zbYDxEhoeJY3t+CY6nIQS3I92wugOVF7JlYIrpwP
 ZvRlNAe9V7eLBBEvBTos5p+nvermZIvW+pYR9XePyK28gtgeuiiYvxAzLoTYXL3G5O
 8BylRV6jfY2muT1RwqxqDCng07IGsiVPJ2N73w9G+rt6gBqrsTQdSay5DlTHrBzuyv
 NxIvLEkXuEZI+QWCkwREiCBp1nCCJOr+nWJXMUgA1xvfOMNbMFHd1/UEhPy9dPgMFm
 spv2s8h2cysJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YoPUWTz/
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.34
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

On 18/07/2026 11:50, Julien Olivain via buildroot wrote:
> For change log since v0.3.33, see:
> https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.34
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
