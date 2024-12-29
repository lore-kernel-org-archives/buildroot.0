Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4F7E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 23:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 853DC60A37;
	Sun, 29 Dec 2024 23:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKqZcZMLx3Yi; Sun, 29 Dec 2024 23:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B35260A40
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B35260A40;
	Sun, 29 Dec 2024 23:09:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E01BAC8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 23:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD212405F6
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 23:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oV-FLkTTieFo for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 23:09:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF3D84057A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF3D84057A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF3D84057A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 23:09:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2A2085FFAA;
 Mon, 30 Dec 2024 00:09:37 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40442])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 30 Dec 2024 00:09:37 +0100
MIME-Version: 1.0
Date: Mon, 30 Dec 2024 00:09:37 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20241229202647.788835-1-thomas.petazzoni@bootlin.com>
References: <20241229202647.788835-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f1114a9b7846c16d71b9efca90be0a8f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735513779;
 bh=X01etdHjrm+77cqD4ZMVPTVxfo70Gh0ulEqFtgjEZYQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=urfpu6GQOwiuGfEArbyJr12dIQM2+spnOuRhMyH7o6AWaTqHCo68waShEDmvU+qOK
 9agAJu3sxdmRIohpk8Qgma7qD0mM4/z3HXS+naWxMm5DyJVMwNHf/OLkMy84cCcIxj
 b32nEH6CQJmM5z8KuyVfX/KNjHV7+e47teJ1v1o+AW9pPOwCFbmESZTi9eYXHkzM9A
 6Y5IAOMIUzp5spCaqkO680h/fVYC7/8zom8peWNLowKxkFGrrv56L6R41Od7UdIqsv
 o9T/P2Tk/EtqHOFRsM5EiJCy0tYzeLBcInEp1vZjhW8btzqQds4kyJyXk/h+Xgf+3m
 ZGhm6vRc+ybxQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=urfpu6GQ
Subject: Re: [Buildroot] [PATCH v2 1/2] package/procps-ng: add wchar
 dependency
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

On 29/12/2024 21:26, Thomas Petazzoni via buildroot wrote:
> Since procps-ng was bumped from 3.3.17 to 4.0.4 in commit
> d79f40dbbe98983bc657d4c82d46b38b8283351b ("package/procps-ng: security
> bump to version 4.0.4"), the build has been failing on !wchar
> configurations with:
> 
> src/ps/output.c:68:10: fatal error: wctype.h: No such file or directory
>    68 | #include <wctype.h>
>       |          ^~~~~~~~~~
> compilation terminated.
> 
> The problematic code has been added by upstream commit
> https://gitlab.com/procps-ng/procps/-/commit/605ea4a8f7460920b6de9e432757bd13f80f0dba,
> which landed in upstream release v4.0.0.
> 
> To solve this, we simply add a BR2_USE_WCHAR dependency, and update
> the comment related to this dependency on the only reverse dependency
> of procps-ng.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/afc035e866bec6f2c14f9d52fa74a9c1897706de/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
