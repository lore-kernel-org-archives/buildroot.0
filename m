Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6629BE8538B
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31E7040CAC;
	Fri,  3 Apr 2026 17:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cb1rPeOLmrpm; Fri,  3 Apr 2026 17:50:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D5140B56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775238649;
	bh=N57RygIZKz8nhm8K2P5N/ZcXLVkJp6YafekdM9m/obU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QQ0pnBqwvzAIjTiJPKF1zjvTE/Dyz4ozlV15h73WUaTHBi7TBzYYDaor+mbTFQQ2o
	 kf9ae38q1ylkJx80FppVPKG1HmjSySsdDZOogzX8UNidlrNombO+LJ+Dt0S2ZwAZZR
	 5W0P1DMaBqOlgfR+m6o8Nonz6aAsTwRyavOt8LgdUcM9z7w/5hNIGfdR1DQmYkWfti
	 /YjEl0L1J6B47viPawtbEgeRW7mmikClf/jV4sG08LfRwyDQaEnFYUrZOy0Fbm9EXl
	 r5vTBdXTZypMrGTpEzVLJtq4wCB1SAhHjKVkHHlMObi5LyUa7dKR/z1weGX6Vo0MaM
	 vjqvxZdgHtFeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65D5140B56;
	Fri,  3 Apr 2026 17:50:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96F4F1A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CE3E40B56
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgasLk4htnqS for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A352140A02
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A352140A02
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A352140A02
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:50:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6F2EE5FFC0;
 Fri,  3 Apr 2026 19:50:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 19:50:42 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 19:50:42 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, Ayoub Zaki <ayoub.zaki@embetrix.com>
In-Reply-To: <20260403162143.16290-1-chakrabortyshubham66@gmail.com>
References: <20260403162143.16290-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <63124edb1a19b244e5df5ac24f028907@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775238644;
 bh=vwhLVTm5jZEO+E6Wz38EsGsv33Purf5F/Aqv20gdbcA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sPcREzDNY3TGuxC7W16YPG1uxf7t5I1lf/ptSBoq1NriD7YfsxIU0JMwH64/2XwuC
 tjhzJQDC8G7ioFJZb+nWheWW2YmPaPGvfUxdGlwX2/mmQqZ2i/yp0ZF1MoJXmPBKRQ
 c4096/EswN+4WzCxYGYp9ZqGqNekZIv/rAMUTp5Kzu66TG7FniQc3dNUzZleEJ02vG
 7GndgvwgpRgUgus1p8qM9Xm56a01gCWwdF2nVc5bZH64hTZaHrVka1OJ0+F4JcWBUC
 8JkqZB/7ITt6a3Gp7bK3V+9n4dh9mNYg4gUouj2VjazYaYTQDNIoIBRT4hAZfSm4d3
 yvVOKs7qdksiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sPcREzDN
Subject: Re: [Buildroot] [PATCH] package/bmap-writer: bump to version 1.0.4
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

On 03/04/2026 18:21, Shubham Chakraborty wrote:
> This version includes upstream fixes for static linking issues
> related to libarchive. In previous versions, CMake's
> FindLibArchive module did not propagate private dependencies,
> leading to link-time errors (e.g. missing zlib, bzip2, lz4,
> liblzma, zstd) in static build environments such as Buildroot.
> 
> The upstream build system has been updated to correctly handle
> these dependencies, allowing us to drop the downstream patch.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
