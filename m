Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEBACCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 18:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED4AE60DAD;
	Sat, 18 Oct 2025 18:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_vnu0Z9Gb5Z; Sat, 18 Oct 2025 18:23:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24B1560DB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24B1560DB0;
	Sat, 18 Oct 2025 18:23:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 932D343F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8526F40995
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5GZ2LqypqAi for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 18:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9141040904
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9141040904
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9141040904
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:23:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8534378035B;
 Sat, 18 Oct 2025 20:23:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Oct 2025 20:23:13 +0200
MIME-Version: 1.0
Date: Sat, 18 Oct 2025 20:23:13 +0200
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251017210430.496962-1-raphael.pavlidis@gmail.com>
References: <20251017210430.496962-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <442cd538161223867a0aed36c52b0a06@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760811794;
 bh=Hf71eYj920qZBxKWbBUlhhcXzL9qcE6hMk331tWA/iQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZpTvOOTmJiHCN+OQXrNf7OMmy+wxKqdODhDugzIcWcx6Ax16HxnBUsaXGBNojHEUs
 huYFjIisHetPZzZmck2dgEeexVXciI06I9oPSUQAe/4qE7m+rc1K4P4SC6zM/x6YB4
 T40iqNcGXqECG6LV9BxTXT4237AS5hzEcNk1g+0N457BEAoroZ5u4bFVolx5GoHKNG
 k8KFOU4PdNmHKp4hTWaf5xpkzwEL40tM3TsTOHiMxmSIxlqQ1zUARNdgTYsKVIptBr
 lV+COtj2a1gOU2zFmSWFySR5SGoflWQtHAHDR8wrGi152X7RCZZVbW965bTagbLu09
 8Ad1grzP0232g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZpTvOOTm
Subject: Re: [Buildroot] [PATCH v1 1/1] package/podman: bump to version 5.6.2
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

On 17/10/2025 23:04, Raphael Pavlidis wrote:
> Changelog:
> https://github.com/containers/podman/releases/tag/v5.6.0
> https://github.com/containers/podman/releases/tag/v5.6.1
> https://github.com/containers/podman/releases/tag/v5.6.2
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to master, thanks. For info, I marked this commit as
"security related", due to its fix for CVE-2025-9566. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/4cbb39d4d2c2664b91c5862e2e3ec472c8194cb9

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
