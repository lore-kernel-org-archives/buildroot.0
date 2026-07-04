Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B91C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 15:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07CB140368;
	Sat,  4 Jul 2026 15:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ou7PgXYlT7Je; Sat,  4 Jul 2026 15:00:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3169B40986
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783177218;
	bh=DIx5IWXtJjflHWWB4mhaZWG1jORGUGf8AMjaspQ4Quc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y0ToTUAykfMYzx0Fn0W5+QN8LI1JJtURGnOyYMKs9MS1DQgWK9dn6gjGdTVilxFxF
	 3aZgXKO6sxMmGNHd0vcG1rXkNbLQPFML/oUICsvJYm1wkitg3Cyi2/IzcJJ8KmP+zy
	 rd2jL/14qGeJabzF4uUIwvkM0yL8URan2dV+sySY/Di33+AIiq2qs8xa0V3n9sUywX
	 cJMQVGvhvL6Eg54H/Ezzamxo08L+oiPimJzCMWrS8cZAaDJ45ClkeJad9rFnQ7fw4v
	 pU0Ni2Z1pqwolWi4BAenJwE9eRJJOJ0n46+yqxQA9kMgCOq/0aIezSaN0tr0TqeLFZ
	 8m/l+1sim7Mrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3169B40986;
	Sat,  4 Jul 2026 15:00:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9519B14F
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 15:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AB5740986
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 15:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71ScaMuC8cIL for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 15:00:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61A1E408FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61A1E408FD
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61A1E408FD
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 15:00:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1A5F52003AE;
 Sat,  4 Jul 2026 17:00:11 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 17:00:11 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 17:00:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260703190417.3687939-1-bernd@kuhls.net>
References: <20260703190417.3687939-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <9fdf78710ab0892d7eb34fdb95d75588@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783177213;
 bh=M5FHcZtA+Wg93N+fNik6dRk6qpmrxEUQ3nwRQIiBHHw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DC7lIN8R19AEUnpXDCQPfUfC9daz03Km7f4t7HKTz5C3bMCNQqJZzgsqAY7pExWIs
 akC8r3soQwXBk3t6nTEsw03vfgfb2p5oR7hN5rI+FVmXOKfM5732X4FjlkPv2PPcHZ
 5TD1BVHx8vfCQ45wqDyb+wGJz+lVDthGl7rHnHkaCLiFt36VQM7tMkZcJYY+dekIm1
 XVN+aOtbsKuQyuN380Asj1r4lr+B/F4hOt2rJ0wQ17ajR1RVy9RU5IYOiuzBD5spRE
 m527Pp0uFiRKVa30YRAbsmvpwUxiRrL0/z94OxwKKeEdkEHWHc8rYg8cSya28i5SpK
 Y0wPV1e31ZesQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DC7lIN8R
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump version to
 8.5.8
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

On 03/07/2026 21:04, Bernd Kuhls wrote:
> https://www.php.net/ChangeLog-8.php#8.5.8
> https://news-web.php.net/php.announce/498
> https://github.com/php/php-src/blob/php-8.5.8/NEWS
> 
> Fixes CVE-2026-14355.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
