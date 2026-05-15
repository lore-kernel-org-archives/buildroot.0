Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25B2CD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8840784198;
	Fri, 15 May 2026 09:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erVKdgk_OmgG; Fri, 15 May 2026 09:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4DC48417F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839185;
	bh=lj2MhaXUHbQftPioShN+ybYfy7j4QV0yIbFT49AIES8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F9p+JKM9ArP7dn0PjovAvHCsNlMe9+pXBSi/MHcMFRPtUebPs9W10jp1FudXj2u7w
	 OsKJPw2ciJ6pdVXjoRIYVDAU+e9CQ3rH5HfkG9bJEO7wco++HxZqFfkuyjo77czYZj
	 HRIS1abrd0f8ihPoVDAzIbJ31cUcs5ObEmhs0fcUZQAhPikwfy9UrP7zgEOZEmOo3M
	 nZom61Yvc7HL2Gipi7Gpeq8VVzQrxDR/rqxB620r+qFRlwj0MqWIHSAHOrmtbjUWXZ
	 1Nlp+4sPzDRO9nH46Q/th4fonZYwMemGUF/KW2nTAelbd1RYooWEE0Ccrt8Xlt2OQG
	 kj6Op/lNLEEHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4DC48417F;
	Fri, 15 May 2026 09:59:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEB4EE7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D434D4131B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJ2OOMM9eVCg for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:59:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B8224130E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B8224130E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B8224130E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:59:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5A2E4780505;
 Fri, 15 May 2026 11:59:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 11:59:37 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 11:59:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Aleksander Morgado <aleksander@aleksander.es>
In-Reply-To: <20260512164718.3852205-1-bernd@kuhls.net>
References: <20260512164718.3852205-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <7c071e4de1a79d2625062398d8b65c4a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778839179;
 bh=PkXwzBo4MFqhbB00QXm80WE3kOxLbFeWtIH/SA7UZwU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WLHEBPVvMx0y2KL9uO6NR0qxRnIfMDEgmjCLm+8o9+WlU7z502/GXWgftQ90UzioK
 7cAA44B4pQarWmvaHSCfSMpWVmEJ2yBpjlCz4Ca2zhhz5WE47r9+tkF2plHNNIAHCT
 TDoEZ3AYdp9uwifdeJLVEhVHuxoOWQ2bBKXd+QDOByawHR0MRBRRWMD6HNUsQr60Un
 ODfyaxyKwMo3TDkp00JiBxQcyGooo3sHDUpuYLk0O1ietrLI+z5k0IvVVfgJcv7SyA
 mpzTalHZQiatYFX0YFiomEBoXkR5EN8ir0agsCHZVUJQOOcG2dNWEaHzXRbDumtImu
 hBPYkmAXalBXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WLHEBPVv
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libmbim: bump version to
 1.34.0
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

On 12/05/2026 18:47, Bernd Kuhls wrote:
> https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/blob/1.34.0/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
