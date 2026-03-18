Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC471077603
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7395360BC8;
	Wed, 18 Mar 2026 18:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6G9KAkdlqlS; Wed, 18 Mar 2026 18:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9740B60BAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773859042;
	bh=Uh9TQZnvhMUV9SiFI5r1wiPti4B84FBDhnxgQk65wqc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nLfS0DOfWz/O1LXgA18qgVQZrOq9fEs3LWJ3lL3CFaCqlobSBAFY+sIt+Y23bKaPm
	 +E0An6V82VFnz2kE/e/xChevYy+8Mjo1ZOly+pGD8IZLs03Jjt3XBYCRW9Dhlfsd7j
	 yDODClNGW2embvFNd5U71ADjCtnV36rUPiVOobnldoH7/S6Z/MgP5vvU4XFdPCfW+P
	 bAGlDmudVbKP2n8SQEoQRXKAvGN8cjUHXe8AMJRGEj/Ti9LrkFcbUCp4usU091Ner5
	 o+p/kwRYBAQF8T+PJ5/RKjUaRvQboTsTz9JRiFf870Wo8/RPJ9uFynnm1hsilBrlQt
	 02DGgyivWE25g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9740B60BAF;
	Wed, 18 Mar 2026 18:37:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA1181BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F31840494
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWcovTY5wTfP for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:37:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3208400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3208400C5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3208400C5
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:37:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 23C8F13F8AD;
 Wed, 18 Mar 2026 19:37:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 19:37:13 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 19:37:13 +0100
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 thomas.petazzoni@bootlin.com, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260317115814.323699-1-kory.maincent@bootlin.com>
References: <20260317115814.323699-1-kory.maincent@bootlin.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <9a242c0c3963c4a30d4096b8cd7fd16e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773859037;
 bh=2Ay1hldAPeyaGYSpVlucClG0yaybT+jkT7gsDSCxqC8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NloiFs723rfiQxMcfH5uIgdbZgvTfDOTV2umTj6Y9HlzWg3vplxjkzrUbACJcP2nw
 rwQAVWRqU2ED73Cu3KTU5WRrVAjWkgI5xIBCH4C2GUXVoDU2KMU/w37UsZ69buG99Y
 nhVcTS7almQCpm3YFPFPhoz8cCyfk6xzUdVIUiy2VHuXkrHG/w8yRe+KCUDyZXNpBb
 lfHDWeqeIqozdvjMguntrIFWH6OlRUjTdQOOihMpxQBIr9rltzyR7a9I5NXuzqppyZ
 +zomn7OXZ3JygnLlmRF/BUmoW8/6Ey3yiXjxip5Zj/YZMwLcxrGpsJdimi5SSBtVN+
 oFPlw4XLPsMWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NloiFs72
Subject: Re: [Buildroot] [PATCH v2] package/drm-info: new package
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

On 17/03/2026 12:58, Kory Maincent via buildroot wrote:
> drm_info is a small utility to dump info about DRM devices.
> 
> Link: https://gitlab.freedesktop.org/emersion/drm_info
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Applied to master, thanks. For info, I did few minor changes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/63364f08142de9433874e34dfcf5e90206ef40b9

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
