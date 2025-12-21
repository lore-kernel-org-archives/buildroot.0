Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AF8E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 13:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D0260E42;
	Sun, 21 Dec 2025 13:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOO5LvURLKSJ; Sun, 21 Dec 2025 13:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998CD6080F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766324576;
	bh=YqRp2gBJqqqdUO+TzEYhJzhPFx0ksahAj0/5vuc+52o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q/c5BjXb0jo8dgkyQ2V4nQyQMC23Jb+G7EyfEHuGu+d6F4tCc2gYF4mSmjNiuW/2F
	 tq/iafS8gv+4T7Pm8YLpqlwuaxrukYfeopabG63aw77Oc0Syp/F1louJtJGECU/u4a
	 +yZzBSu0wcVTW1ihMACh0gXUyViLnfcCHxJ+AEqU8xoHgb9UDpkCCadAJzGcJzLgzF
	 UjFpqCC2F5onGWNcfmikhm05SUDVh8onigu6c1bDBS0zrc5EvNR/KXqv5o3SOo9qys
	 86LYhh2O8a0kD+CHn51v+tZfSo6W3Kgz7KFqNbLtrZdJPn1xi4iE6tEA0OUJA9K0Xp
	 j7Y2THqjrzL5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998CD6080F;
	Sun, 21 Dec 2025 13:42:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59DE8119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 556576080F
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZUryyZ2OTKK for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 13:42:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 474BD607C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 474BD607C4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 474BD607C4
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:42:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 74C5E13F88F;
 Sun, 21 Dec 2025 14:42:51 +0100 (CET)
Received: from 37-167-60-49.coucou-networks.fr ([37.167.60.49:29850])
 via 37-167-60-49.coucou-networks.fr ([37.167.60.49])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 14:42:51 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 14:42:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251125221246.857929-1-bernd@kuhls.net>
References: <20251125221246.857929-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <b6f9a4deb0b899428a0331d878b9d9a5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766324572;
 bh=X5L+hE6hlX3U93mofR+ARl+wfFNL2PwFTz+P78Daqgw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TrlfDh17mcia5eDkFPuMRZqV/nvWZ6GFShQFwMMBIwXl7rJJbBK8ObgaBG6eqx7ba
 TogIM8K3E6meF4UKeUfj7fkqx8XNuvtk9B8yUH0ufYiCM7Ku87JfBaqN8CrT358bpZ
 aInNV9NepeyuL0bb3yl8HlDAu5s0EPZ7AXN08rGZoHwOL0AEW7kFoyNkF+QkK+6bN8
 +IJiu2zrLkwuDsLMtdWkTGKlCUfmlPpDKyqiqIDxIAjDhQ/9lRFF7W29Gintj8M6+L
 W3Lmz69CHcZjqVHfqhsKfFD2e9+4USSZUcGYGOwJVGf3sbAHdq6RqPqlUZalsGHhBk
 vNYFVg9Y6ObBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TrlfDh17
Subject: Re: [Buildroot] [PATCH 1/1] package/udpcast: bump version to
 20250223
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

On 25/11/2025 23:12, Bernd Kuhls wrote:
> Release notes of this bugfix release:
> https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/JTGZCUMSXYLVT73TIRJJICBX7AWIE4CA/
> 
> Switched _SITE to https.
> 
> Fixes:
> https://autobuild.buildroot.net/results/acf/acf208588c2ca7e658a9a7bee49b947309d6b8be
> 
> Upstream removed the tarball of the previous version causing 
> autobuilder
> errors, first recorded March, 2nd 2025.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
