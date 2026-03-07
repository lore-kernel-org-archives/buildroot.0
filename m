Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23162F55105
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 21:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFD5D83E51;
	Sat,  7 Mar 2026 21:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-c4Az_2QCD3; Sat,  7 Mar 2026 21:22:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F054183E45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772918578;
	bh=T2tGfhPgbJ8w6STui52jNq6hP4GCEY3YUbN3Tg8jcjA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U6lqZPC9m7hw5GjnRJ/TdG8X/71z3YyFB7AasPbO4O4i5Gyrvk4zBbhmkMTYMNRRO
	 uhywDK+eNzn8ZDc9DtYn8ONy5ZZg0YpO293e4tpc8kzY3jNqmyqhA+beLDvhSi4hBi
	 7IqYR//4VbVcLVi1NKDbyp0xP4EL+iPHItLgqtdOl+42riFoCp1hIpKVKwxAdGo9ug
	 5m++MSAox0VFZG2VGSbLu4TsiHY2x2bIyjoq5vivIEeeKz/xT9nVcLEZw9+zDGTQHk
	 xoTS+D0D6jWEy4dn4w2Avw4LkHxr9zT3RsJK/6mj8gBboJkFqILzJeDBE71NTSZpK5
	 r8mFRcg53TBDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F054183E45;
	Sat,  7 Mar 2026 21:22:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E68223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 729AC40226
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6whsbSa8ejSq for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 21:22:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7305E40075
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7305E40075
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7305E40075
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 21:22:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 993D378032A;
 Sat,  7 Mar 2026 22:22:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 22:22:50 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 22:22:50 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
In-Reply-To: <20260307144615.711975-1-bernd@kuhls.net>
References: <20260307144615.711975-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <1f0bdb58cb52cde196a8ef07a08f8a0b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772918572;
 bh=N/VjTNFQgw5sQTrG25FwW/4rMCskKriT4oG9MmKCRn4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G5lij+UCy6HZl5b0Oh+08OgRKy2f41CQHrXuEw8Qp3rxm3F7j8Sxn+Oq9I2JgAV1l
 FjKLxHF69Ut5b+WHTOrPSSZTiEJroqtF+lfhZh7Pij44lLrALjTW8aRL8aM+Ci7V+D
 8NQ+SwWa9djO6/73o3xLqHhOy7bfUFES+PRfi/F0ycptg06Q11gZyZw12/ftGOhN5S
 tXEjTb9II+aSkL5XuHqRRZi6/7v00V8tyNsqHTwXKu4IksbAX8W89LE3v8j32DG7VP
 pn8j3gBNU7xS01+DdnQTN/YA6y9eazTTaq845s880l8mBNgk0E5WoGkhkULXUbUGAm
 55H+0q/enA/cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G5lij+UC
Subject: Re: [Buildroot] [PATCH 1/1] package/xscreensaver: bump version to
 6.14
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

On 07/03/2026 15:46, Bernd Kuhls wrote:
[...]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
