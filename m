Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760DFFCC048
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 17:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C78241E03;
	Fri,  6 Mar 2026 17:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfwPI-znuneR; Fri,  6 Mar 2026 17:53:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34B5D41BAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772819590;
	bh=ASKdnJBEvl4jWo19a9hxCTclhAjjamXyi99CJoTfmFw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PTYIysC6ZwZn77MgF16ZPMTlAbU3lGdSON65jnfcWQaCbQZGoIYGbWTKr2KXmCl8F
	 y0Am+cGAZYg+xGJkNk6FV0fpfNBw2A4pl1MQHlCfbJYMTheM1Ws8GYKF9Fm7WMwani
	 drqDtbnT1i4UMVsfJ5XDdianUb3qQ02+zSeHw22+k29uxEmDw3mp/Ujxn4n3qJXgXB
	 nUprwOWDSzP7vCFg+OapSfx91QVE1rGzwKtrP8hRpYjfXxD6fyhy3GEZHaAlIaAXQl
	 IEG8LiwGQuJ3N7WqpG9d/UCRXvLPLziTi5s2u5On916wGOrJ/3Jt84LO1Dqq74Y3AH
	 Zd3RbE53KiC2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34B5D41BAE;
	Fri,  6 Mar 2026 17:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1E2A339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D78241BAE
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtcyyA2bGuIA for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 17:53:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD1BA41ABE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1BA41ABE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD1BA41ABE
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:53:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B5480B0059A;
 Fri,  6 Mar 2026 18:53:04 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 18:53:04 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 18:53:04 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260305192855.47795-1-bernd@kuhls.net>
References: <20260305192855.47795-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <c6696f6c933734af9fc459b8a5966619@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772819585;
 bh=GRLo5vgaPveoiTPiWUCfPjK8LvhxqTwFS/P+wAG+Cr8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sbAc7EzwYGNaGebLmsIBZzMCGaVMxxDyd1gPZGeBnvpRRGP+3KD+2seNKFmgm5O0d
 txjQ4j/m5uqDitdzNyHmJ4clf7sJL7nq/u02HoFxBGSSWLvZGq/SokS3REirkPx+Kf
 terUpedDahqxlKAWK8I7N8VjUL+bnp4X/Ww/1t6IBZNUKJC7etaHitTo4+N4OV4xdl
 vAUbQcfOE2tEPqyCOoJ4k6JrKQqCrTllFKEuV5UNk5fkMp8PmI9dMmlZOiVxmz45J6
 a37MtaMucduTriQ1R+d0TMYwlh/M/jVVKD1PywigybLmVeVjvrTn1DPjPZVZKj6xa3
 rAPAz0p1ywr0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sbAc7Ezw
Subject: Re: [Buildroot] [PATCH v2 1/1] package/linux-firmware: bump version
 to 20260221
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

On 05/03/2026 20:28, Bernd Kuhls wrote:
> Updating the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Updated hash of LICENSE.amd-ucode due to copyright year bump:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/LICENSE.amd-ucode?h=20260221&id=e399bb332bdaaeacb27923e8a0a68b0d6f303d49
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
