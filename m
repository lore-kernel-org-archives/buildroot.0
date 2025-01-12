Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E20E7719C
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B76D36065A;
	Sun, 12 Jan 2025 11:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bc12DudWZWV2; Sun, 12 Jan 2025 11:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEB2060663
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB2060663;
	Sun, 12 Jan 2025 11:17:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D2B368
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B6AB6061B
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RiC-SXGN4Su for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:17:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7D505605EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D505605EC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D505605EC
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:17:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A8860780371;
 Sun, 12 Jan 2025 12:17:38 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35902])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:17:38 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:17:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111180150.2923566-1-james.hilliard1@gmail.com>
References: <20250111180150.2923566-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <87515d6d56347e602c83697013b7357e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736680659;
 bh=ECC1STQGrmG3MSiZbvk/O5agRSyYuiXAuiJkZLKZBHY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yz/iaJvWKMWx4hTx/E4/4NKObd+LT/zqelCmRvrVSiNnmf1qsjjmTtSr5zBihgo5M
 FzQVssCeURcYzoPgqLPW7IRYR8KAWEcUcPnXiTFYsYrYeccYsyfATY4rmhbZP60VVC
 NDN6hGWObAvbkd/jUvjODma3mn9g5mW+t1Myv88Hd7tJB+TUixjPLyGvj9vdGjoRfb
 J4MOQZCft07w35iWIBgRCbAqZxfCQbBJmXl4QZa93kNpZaQ+YbmbTzUa6LcoL7+SJx
 Ju8zzKDKdLauwgL+V3MLGstznCMvGwP7h9YZKGAJriXoCef+Qaseai/Mr1k+74ILqc
 TEKVZI4him5ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yz/iaJvW
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tabledata: bump to
 version 1.3.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 19:01, James Hilliard wrote:
> Add new host-python-setuptools-scm build dependency.
> 
> License hash changed due to year update:
> https://github.com/thombashi/tabledata/commit/c86bbd425f5f2bfa8e65a4e216e4457f9bd70c4e
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
