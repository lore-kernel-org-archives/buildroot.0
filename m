Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F879C369B5
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 21:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A7DF61001;
	Mon, 14 Apr 2025 21:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3CZlhyvQL_C; Mon, 14 Apr 2025 21:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F2AF60A42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F2AF60A42;
	Mon, 14 Apr 2025 21:43:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FEEE200
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7133B408B5
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qpbatvkTxuSf for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 21:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9ED7540D8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ED7540D8C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9ED7540D8C
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:43:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D1DB75FFAF;
 Mon, 14 Apr 2025 23:42:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 14 Apr 2025 23:42:58 +0200
MIME-Version: 1.0
Date: Mon, 14 Apr 2025 23:42:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas.devoogdt@barco.com>
In-Reply-To: <20250414212453.2903952-1-thomas@devoogdt.com>
References: <20250414212453.2903952-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <656b501fbacf5ac093d1162aab465fc7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744666981;
 bh=HYX89Ob9Y7hvvUa24dJQXdQX2783FXBdQYhErV7b9Zs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uc862vpZ/QZKpGjSiLX3b/PxGwMBNTk0EMsMkChBwFJDVBJhTh2zEg5kgfI80p+Cp
 KgVl/m7dRoAa9fOIAv4O2NJowm/j4gIJZXMFs2M46A0VAvJ3bI2pwDHD+QHuo2brhX
 Ziqa12KgbWVpYpZszEhYTlw9/AMvKW1SiJeqB3f8r9S34NfYbQa2POrR6HPRg6G0Yi
 Ueu+ycUzYiE/G+jDtSJ5+NBleyiEHTThKD74Qp3L77MZuTH935WMsEM1Y1jYHCdpNE
 c1JG/C7wnuZ4agvuzimm+5mP/lLnksCLHOoMn8w2Cq4IegIuoDG1x8JN2xoZXc6ZdS
 enRpTkKJIuKdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uc862vpZ
Subject: Re: [Buildroot] [PATCH v1] package/libfcgi: bump to 2.4.5 to fix
 CVE-2025-23016
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

On 14/04/2025 23:24, Thomas Devoogdt wrote:
> From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> 
> Announcement:
> - https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.5
> 
> See:
> - https://nvd.nist.gov/vuln/detail/CVE-2025-23016
> - https://github.com/advisories/GHSA-9825-56cx-cfg6
> - https://github.com/FastCGI-Archives/fcgi2/issues/67
> 
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
