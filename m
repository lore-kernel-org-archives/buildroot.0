Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BC5D5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 12:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CB9C60D86;
	Sat, 13 Dec 2025 12:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiCjvJdCReTg; Sat, 13 Dec 2025 12:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8408C60D74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765628188;
	bh=PdTfrGS3pIOwteyZSf7Vcw+53sVdJEXsJWByPHY1LEM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AqhdRrXbTbCntD0zrtyG4Cgk+upZYJc15SZuddW6GMqtqxv4ZczNbbrPG5VZ9KkrH
	 9AdDn299ZR29xS4kcv6bkqWkYBYM/S0DjuDHlA6d6DRTbW2KK9nk7XVVHr7FDofNBB
	 baEJe+1K6zkryHfePoBUHRvE7VXeuRQMk46ChGFuqFqL53M5xfXN1/xqoQQOCpqJw/
	 mLQNhmDMliymDj6MPYvm/N12cf2XzVjMlBZ72oPfczUGVp0LwW0qYHG/dUo2X2qtUB
	 7039TZ0izdqcjSgh796y8skQL10meNT1Pv4rqp4bRbXZf0Xp8au+NTVotaI4cqx+aE
	 GMur4fbFRF71g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8408C60D74;
	Sat, 13 Dec 2025 12:16:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DBFB13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5022D405C0
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlGbTCbcw-l8 for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 12:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 218B3405A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 218B3405A2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 218B3405A2
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:16:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 6E52819F5BE;
 Sat, 13 Dec 2025 13:16:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 13:16:21 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 13:16:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251213115914.1277421-1-bernd@kuhls.net>
References: <20251213115914.1277421-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a410ade2734aebcd959e3f5f66992ed7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765628182;
 bh=q1VkqCQmN+OP9Di1s1Tm/gO2rOepiUm/uri5sYivDI0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YZCadeVi5TmMDsuzPLIHmXoo913A9AhOLC0s8yRhPXuqOvv84JnB4HIrudVFEVggo
 vkWCQHvcqUR4IjeAZ+mvEi9ixy4YjSz3os9DzXFe/D3jrIyp1APajXYgB9TTcbJ+RR
 lmEvOCUQORpxCtfeO8qyAWsndFGLGEY/lLJhhwZcwkBFcjLBmaEwKhNKiyljsQjXFo
 dkM6BuZQXsZOtOfUJiBnK+EuT+NjrA8JS8VSFXKfKGZ6SuriiIal/B+GFVaZzu4yu5
 QmCPcsKBEestCzKAgOmJeGQm5qBr2zMBKNewwTc2CC3BuiUnBi2va2UgD9w6EV9+92
 4nQw9JoEWyPvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YZCadeVi
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{12, 17,
 18}.x series
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

On 13/12/2025 12:59, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
