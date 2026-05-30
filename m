Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA101CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85F486F59E;
	Sat, 30 May 2026 13:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHTilrrG7tCk; Sat, 30 May 2026 13:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EC0E6F4F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149233;
	bh=b0eKxwokowMVHrR4Bq1TGF3OrT4FUG59CcAd+I05Tsg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q8HIIlJSG0s40hbS0LUsjVgAAKmlsDM+q12K7/9BTmooHLwLmcnavrfN/lUKvD1xC
	 Gu4QxxCSn0zPJ0zUjDfVHAyAiBJl/LLQHUDyfHqsC9SACOKRKMMfenD46MGAK1Ok47
	 Ogj6zO2/GgvFE8DfowIRLL6+4jBxyq+S5WUPh74omgRgKDCn6jSpuMPr3OgJc3W04K
	 WbMlUREnfip4I6xb+v9n7vKxDIMviRtYDqbcqVLFwgxYYjrbKNFrQNxEmr5uEZiSX1
	 exVwM4ND4AK3lki8c4li/bjIxUTD2LyqdNf9ck3EeJa2/9BiRruLeHpArOqZRYlYtk
	 Ba7U3IwCmUQsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC0E6F4F4;
	Sat, 30 May 2026 13:53:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFF3412F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B20416F576
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mx6SY-cmrUtN for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:53:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D874161C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D874161C13
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D874161C13
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:53:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 696262003DE;
 Sat, 30 May 2026 15:53:38 +0200 (CEST)
Received: from 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3
 via 2a01:e0a:1015:b940:caf0:d340:4af7:8ed3 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 30 May 2026 15:53:38 +0200
MIME-Version: 1.0
Date: Sat, 30 May 2026 15:53:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Olivier Schonken
 <olivier.schonken@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260506163136.1330722-2-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
 <20260506163136.1330722-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <f7ad2fac19ada174eaf053476315143e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780149228;
 bh=NffbrK+FCsR7WA3DqHNdhRMAN0oaZF+jrDfDAAscM+c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FC+l8KPZbYGGdEywW/qaLza2as1tYzqPmZ8eDLhahPMmPqCkcnVNwLtVMkPzB5gO8
 jGHLewsoWMI4Chqjex/amTrDIcRli518doawk49a+4QG66cdQ+iWTjMG1NzkDLBaGr
 /ucbEwOyQ0tP6D6lIu/L4ohW2QXw9SYWz5VDMQa/kQaUi8P36wlR07r6H4WUZoSwlb
 8XXaj+awLZQXkSMQg2pRsUVOQyRUHK8hMbUOiPYalPOroLNRDUEmZ/+nqapUqBU1th
 +2pMSCPYGC77rwR9qz1kEHBN1XcXUohKUJ/BuU+olAGPNSUJoZzJH341MBFXDnkMU7
 pbI5V9IPaaTTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FC+l8KPZ
Subject: Re: [Buildroot] [PATCH v5 01/22] package/autoconf: bump version to
 2.73
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

On 06/05/2026 18:31, Bernd Kuhls wrote:
> https://lists.gnu.org/archive/html/autoconf/2026-03/msg00060.html
> 
> Rebased patch due to upstream commit
> https://cgit.git.savannah.gnu.org/cgit/autoconf.git/commit/build-aux/git-version-gen?id=2f1f41b8d3cf38101c6dce30e6319402f8c44b83
> 
> Added Upstream: tag to patch.
> 
> Added sha256 hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks. For info, I fixed few check-package 
errors.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
