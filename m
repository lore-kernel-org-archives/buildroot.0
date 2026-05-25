Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AD5CD5BD0
	for <buildroot@archiver.kernel.org>; Mon, 25 May 2026 13:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4555360FA2;
	Mon, 25 May 2026 13:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrlYtJNtbIe9; Mon, 25 May 2026 13:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09DC360F8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779714205;
	bh=2+pRehGEZtVSF5Yj7h5INgOrjYNH7BaPIlUzUTO0LS4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AQon1drobFT/VN6rpRt9HbadReULu8jHFJiHDb1k8j1s+y+kEbPZ2GiFQhXi+kDzV
	 45LuyePRumZdmO9wAMTVLX1lfxqLxmGkut1cMJM5/5x1oIaRm7gfFTwpW40sUQ/lmR
	 zWJU0R9q4QKWwohWucNAOgWQTVBD+kM1Croi8Qc7whjpx5BNSSJCsKzWnvWkpQu/l0
	 cf9EeCIT4t0/7XPsG5GIcBgCnYsXxnlI7N0ClAq81IaZzRNhLp2WCJ8Sph1N768lf8
	 b+izd2at/vJ3dANXeVCYR/Xmo3/N6ZxuFdlYMYB+CSYjFAK9PaajF0OYWx5if5qlZw
	 CtgT1co5YHznQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09DC360F8D;
	Mon, 25 May 2026 13:03:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 715C3265
 for <buildroot@buildroot.org>; Mon, 25 May 2026 13:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57168406A1
 for <buildroot@buildroot.org>; Mon, 25 May 2026 13:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gd-7Jy7QB2D9 for <buildroot@buildroot.org>;
 Mon, 25 May 2026 13:03:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 783184037F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 783184037F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 783184037F
 for <buildroot@buildroot.org>; Mon, 25 May 2026 13:03:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9666E2003C8;
 Mon, 25 May 2026 15:03:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 25 May 2026 15:03:18 +0200
MIME-Version: 1.0
Date: Mon, 25 May 2026 15:03:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260525123125.2919307-1-bernd@kuhls.net>
References: <20260525123125.2919307-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <f22ad2d91ba6d7ca67343ac51a330297@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779714199;
 bh=a3irhr1jB7CoIfJCnwAohpUtZrM+DkO9/l0qJaG79pg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jLkcRrFlNDzlTcw1st1lb88Ctn7Hx9kSKfdehBoHmq7Azwu2tS11J4p5iuqzE5yLq
 78cUVz54JdLZWuyUAQpNGffbb3rWf81TSwF0NTzTQa1I4B5c5Sexr10QwbsSaleiz1
 /N3LjuSZ+aT74vIllgF3W4A7PkMkDLmZKI0+xGTcBYLkxRisR47gIBFl9IDqPePlBJ
 k9l6jUrkfMDQDTaul1/jxD7rVhrWYKagloZ+r92l/h88XsIZNnlXae6HZ/zZKluTeh
 66WnOpWAY9WR0XqAGIH8lUvzFxoQROUIbCZKRKBr+u5+nwxEG/vXJsbslBByo+uyCJ
 hANAf4A9mUG0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jLkcRrFl
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: security bump version
 to 10.11.17
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

On 25/05/2026 14:31, Bernd Kuhls wrote:
> https://mariadb.com/docs/release-notes/community-server/10.11/10.11.17
> https://mariadb.com/docs/release-notes/community-server/changelogs/10.11/10.11.17
> 
> Fixes CVE-2026-44168, CVE-2026-44169, CVE-2026-44170, CVE-2026-44171,
> CVE-2026-44172 & CVE-2026-44173.
> 
> https://mariadb.com/docs/release-notes/community-server/10.11/10.11.16
> https://mariadb.com/docs/release-notes/community-server/changelogs/10.11/10.11.16
> 
> Fixes CVE-2026-3494 & CVE-2026-34303.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
