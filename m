Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D66103E19D
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 21:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 032F660D9D;
	Wed, 18 Mar 2026 21:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kObKqpiO0hHq; Wed, 18 Mar 2026 21:43:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E34D760D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773870180;
	bh=SSWJ1bOhcdPu9Jwjs2Og/fqpAuT7QRAyzO96WwIYpHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mpgPRZ9IpGNcNsGey0A2Ur3LzsoGGvaeJXeb7WtIFc7B0ojTMavhBECEFRngzzL5j
	 pl5c+uh4ycAdnE/rNUfGnmlErVb59lBWUzS2X7MYcH0MmOJr2i/Gxt2E38Nbnpnnp9
	 9SdM80sc4SEZFcCAoOYukjhEA/a5LIxUKaNMP8Ls0CoWJzrERaFOUCyGq69UTKItxj
	 3IcL2jOkJXzEgo6y3ddl8i/i+rgkFeipAWcYzPoEbhu0qkPd4u6aLp5P2zg48K7Q3i
	 VFRojZTELVqTZXbdJjNfsnoGVCr0jln+vi/Slqgr0gMAj/pXA0nTo6kWsIvYA1a8c3
	 tY+a+n0QKhp+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E34D760D9F;
	Wed, 18 Mar 2026 21:42:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10FA81AD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAB5360D9F
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:42:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTOKvhPL6o44 for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 21:42:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD28960D9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD28960D9D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD28960D9D
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:42:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7CD4D5FF95;
 Wed, 18 Mar 2026 22:42:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 22:42:52 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 22:42:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260318204928.3438683-1-bernd@kuhls.net>
References: <20260318204928.3438683-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <72e604afd8469a3bab25847302924b01@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773870174;
 bh=q5rjohSVnLnQHC1uWFg1iRBTY30hlVk6aB5eZS3Z0zM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IzG2yn8A8sJiBcTJDUFJCsse/oKcgdq8BuPf2nLfIQWJyypixilknrY+TpEYmpnsJ
 MfXhOnhYjGpsL4xRDdjFpnH+jRYPXWp3P+W+jt4NPpRrVYtJvIM3MqYZ4yUrXDinei
 Pi13jXxrmKwtYjfsczYk3u9WGaIyMiJvRC0aQobQ4qpHlANK6gAMcTIXf6Y0ebsCkN
 s3DlJu3OosYOhjuuVxcPXZz3peveiRZkM5lDgQ3wRHflOdPe/C61Z6GhlhQU8/+eu3
 dPA5rebwMNX9khSQ4Ng8UMz2s968y6aHzQT030LhwXSY0z8VZPdiN1zGQiWMH+40gZ
 r2Y2ODmSf3B3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IzG2yn8A
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.7.5
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

On 18/03/2026 21:49, Bernd Kuhls wrote:
> https://github.com/libexpat/libexpat/blob/R_2_7_5/expat/Changes
> 
> Fixes CVE-2026-32776, CVE-2026-32777 & CVE-2026-32778.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
