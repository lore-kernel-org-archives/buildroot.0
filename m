Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDD0CAC59A
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 17:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E9D040F34;
	Fri, 19 Sep 2025 17:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezC-R-FnX3Ii; Fri, 19 Sep 2025 17:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4786A40F12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4786A40F12;
	Fri, 19 Sep 2025 17:33:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4A0B150
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 17:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AE0F83B89
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 17:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwu_jQwPOOQk for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 17:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8FE6183B67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE6183B67
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FE6183B67
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 17:33:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5696D5FFA3;
 Fri, 19 Sep 2025 19:33:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Sep 2025 19:33:25 +0200
MIME-Version: 1.0
Date: Fri, 19 Sep 2025 19:33:25 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250919072349.169149-1-fido_max@inbox.ru>
References: <20250919072349.169149-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.11
Message-ID: <e155e911435893c111d4caf4919a4e1c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758303206;
 bh=nxxCTf6mHFzTkMpqSyTiy9ShGV576B37AG+1tcgsB8I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Elg8HC2WuNxAMKaA5h2HqiECjdz675jH9zTVTpDt7S2eJrGlp/2PwdPd76tf54AjN
 SgvCqI4gkpkHWjWj4mvAG6sM1oq6IDuFq8sBwP2bfG1L/8fHwWCfmj1+7i9bq9NheY
 e2gkksIX2/kK70Fg2K8HL4iKyKZTr+Jd6pL9IetziwE4ClpCJFtCjEi/h4uSGSQO0U
 IiQE2r9bo4MUZ3y0WSJQW93vLV/w4yshg/oLnuuUh5GvD3B1gJXk46f7S5mMq29L+u
 vr6C2PACE/QlIRMIOBRICgmgZ4+EauGD7ax2EVp2iN7/Janq1osYhYePzJdOHR5d36
 zveWRsq2E8uSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Elg8HC2W
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: security bump to
 version 17.6
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

On 19/09/2025 09:23, Maxim Kochetkov via buildroot wrote:
> Fixes the following security issue:
> 
> CVE-2025-8713: PostgreSQL optimizer statistics can expose sampled data
> within a view, partition, or child table
> 
> PostgreSQL optimizer statistics allow a user to read sampled data 
> within
> a view that the user cannot access. Separately, statistics allow a user
> to read sampled data that a row security policy intended to hide.
> PostgreSQL maintains statistics for tables by sampling data available 
> in
> columns; this data is consulted during the query planning process. 
> Prior
> to this release, a user could craft a leaky operator that bypassed view
> access control lists (ACLs) and bypassed row security policies in
> partitioning or table inheritance hierarchies. Reachable statistics 
> data
> notably included histograms and most- common-values lists. 
> CVE-2017-7484
> and CVE-2019-10130 intended to close this class of vulnerability, but
> this gap remained. Versions before PostgreSQL 17.6, 16.10, 15.14, 
> 14.19,
> and 13.22 are affected.
> 
> CVE-2025-8714: PostgreSQL pg_dump lets superuser of origin server 
> execute
> arbitrary code in psql client
> 
> Untrusted data inclusion in pg_dump in PostgreSQL allows a malicious
> superuser of the origin server to inject arbitrary code for 
> restore-time
> execution as the client operating system account running psql to 
> restore
> the dump, via psql meta-commands. pg_dumpall is also affected. 
> pg_restore
> is affected when used to generate a plain-format dump. This is similar 
> to
> MySQL CVE-2024-21096. Versions before PostgreSQL 17.6, 16.10, 15.14,
> 14.19, and 13.22 are affected.
> 
> CVE-2025-8715: PostgreSQL pg_dump newline in object name executes
> arbitrary code in psql client and in restore target server
> 
> Improper neutralization of newlines in pg_dump in PostgreSQL allows a 
> user
> of the origin server to inject arbitrary code for restore-time 
> execution
> as the client operating system account running psql to restore the 
> dump,
> via psql meta-commands inside a purpose-crafted object name. The same
> attacks can achieve SQL injection as a superuser of the restore target
> server. pg_dumpall, pg_restore, and pg_upgrade are also affected.
> Versions before PostgreSQL 17.6, 16.10, 15.14, 14.19, and 13.22 are 
> affected.
> Versions before 11.20 are unaffected. CVE-2012-0868 had fixed this 
> class
> of problem, but version 11.20 reintroduced it.
> 
> https://www.postgresql.org/about/news/postgresql-176-1610-1514-1419-1322-and-18-beta-3-released-3118/
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
