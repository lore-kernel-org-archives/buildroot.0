Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C044C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BCCE84B21;
	Fri, 28 Feb 2025 23:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TM8344OCw78b; Fri, 28 Feb 2025 23:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EA0D84B7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EA0D84B7B;
	Fri, 28 Feb 2025 23:08:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32DAC1CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14BE5416AF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uflV-V7kvOQG for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:08:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3AD44405C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AD44405C6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AD44405C6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:08:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 42F6E2003A4;
 Sat,  1 Mar 2025 00:08:45 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 00:08:45 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 00:08:45 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Falco Hyfing <hyfinglists@gmail.com>
In-Reply-To: <20250217111330.1849773-1-james.hilliard1@gmail.com>
References: <20250217111330.1849773-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <bc7102d38bfee4f9bddadec954cbdc27@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740784127;
 bh=AvRTT8TwmdrT/R5DV8nBBOpUsooziW5PBVQF1gnh5C8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XRdpLO30QDV79/12rPCmlzrGuH9JyrzKWFHYKTE9WrW/gUk24vmrn5RIOT2LOFVYR
 qaICIenyqcqDhqK72Xx4qpsQ7cKavad14BUze0wsIAK+ETy35sUcH7jH/dj1vgSkVU
 OJgwA1Jbg990a6506QHd8FkhSvGS2pK0MJSMVPvPC3ElyvCBfU4m39hfaFe5zFGDbZ
 KLfDZUJXjyg3CBMAAZD9sVrrVLTnfA4Y4U1SaVXJDvijbBaEiho9lom9/PK7V1Q4Sx
 vCc65IYt55ClsErMANT37YvFx7VAkl3F72oeooj1PlMqJ0+B7fbJB8lt42BMDniLx2
 MQQw7FMyQdUeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XRdpLO30
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to
 version 3.8.6
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

On 17/02/2025 12:13, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
