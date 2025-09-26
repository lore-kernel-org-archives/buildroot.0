Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF75CAC5AE
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 17:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00EE661CAB;
	Fri, 26 Sep 2025 17:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jaiw-U1pJoa2; Fri, 26 Sep 2025 17:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A5B861C7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A5B861C7F;
	Fri, 26 Sep 2025 17:25:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E835177
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F5E2616D2
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cUs6eCb1Gof for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 17:25:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6E8D261AE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E8D261AE1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E8D261AE1
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:25:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0607A19F576;
 Fri, 26 Sep 2025 19:25:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Sep 2025 19:25:37 +0200
MIME-Version: 1.0
Date: Fri, 26 Sep 2025 19:25:37 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250904211239.1928818-1-neal.frager@amd.com>
References: <20250904211239.1928818-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8f678b6f960c7d54c25dc7feacb46cb1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758907547;
 bh=hTEY15ujtwQ/ZculHxY/KCpOq6J3Dbyu74VhDPPrcpM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V7qMweJEQOqlSScxxJZhOq08KlKh7tFb+V/ObIHAo5Ca2B3W4HAkLCDCTqNL8AeLI
 RVkJ1dvigBJ58NnHeu+6moDOO1+fuOpwUEBthvDVaMhAj6FPbQcJCrKOHAtRteZvNQ
 CnXu4qgnFfWZLFYJgpcFlg+EZ2btxTnpcyk8MiNlwEqMqVcSZjcygUKFTPDSBAJnki
 ssSI2tbUAO414TZmIO+XC1SoDueySnP+wadG6xHQe/LORq2RD0y1cxr5yvkKFQEw61
 LyxURQQxXSnjHC9ncahkKedzravh7kNtz38GHR6PwAYsSAdWuqqpBJUiIvhLssT36J
 aQjSdwMWzssCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=V7qMweJE
Subject: Re: [Buildroot] [PATCH v4 1/4] boot/xilinx-prebuilt: add support
 for plmfw.elf filename
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

On 04/09/2025 23:12, Neal Frager via buildroot wrote:
> AMD / Xilinx has made the decision to change the name of plm.elf to 
> plmfw.elf
> in the prebuilt binaries repo starting with the next update.
> 
> This patch updates the xilinx-prebuilt package to support either the 
> old
> plm.elf filename or the new plmfw.elf filename.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
