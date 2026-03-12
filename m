Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB16106ACE4
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 20:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB89405F3;
	Thu, 12 Mar 2026 20:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A82aCYh0FCYr; Thu, 12 Mar 2026 20:17:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C117E40698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773346627;
	bh=2c9POmopwI1YUHcwTtlOGoHxfetANiGMyYCR4UEm00c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D4pr1lTup3DiDledO8VnslYUdeBbCJ8EEMWMSw4/Jov21XrUV/a/8RSBRw619RIKZ
	 6lM0m3B/AWZbJuuArsBrisCplgOvYlCPPS1+hK2+xx69NEiulhZ+ziX6C8c4sK3TTc
	 xiTt350Zp2IxHcwEj46D9D9JN7MzwCWBqotFcWy83KkZDAo2BcKOV1MaZXLm82xBmY
	 oBoUF3mXukdfjFopxwXgVO3NK7lCMrXVy3/79bXyaakIkhBpNqXIsMvMPLMv4botHM
	 iffHmJ6sNXNllSW+VZg9Cx5iDJ3znwk9gkbwKywyFHun+wDziRNxNZitq92Fi/d12a
	 lsyzRvBkpgnTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C117E40698;
	Thu, 12 Mar 2026 20:17:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8656D201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C32060642
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hew8h65kJcRo for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 20:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A52756065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A52756065A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A52756065A
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:17:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8E96119F576;
 Thu, 12 Mar 2026 21:17:02 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Mar 2026 21:17:02 +0100
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 21:17:02 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260312164958.3197885-1-bernd@kuhls.net>
References: <20260312164958.3197885-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <c918c503bb98e4c63d3f68ade1918305@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773346623;
 bh=eGcP6Ts+hU9aOVsultq/1hrVyBWs2WmGuE+SCHlecgc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FjU1jNyfYMGOIcAS4xEAOTpZepAmXiis1DHsjWsXO6dt4GRL68MTe/MOjMSUlf0IO
 6XrTV0LinhZLCO7rsNlVJ1gt5y5VKiJt4yRD7OCyMHabRxGlNYagIamVxx3CpHM0zo
 s3Q5zk/2HxMv0OghKBjS/WuFsXMh7ANKmRov04NKakk6gHLTyf+whQOFkChMCwS2u0
 n8LQH6oAW3D/3i+hJNsBNWvHi4tfr4kl+GzRmB4ggFGHMfVo9lAEblErmx8iISyYGD
 LYhSv1Y6/Wuhgvznemj1yIOMnRLq4XIJy9K93OvAxK+mKB5cxsNR1GrYNnYERP4b9s
 tH3XonZxyu+RA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FjU1jNyf
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20260309
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

On 12/03/2026 17:49, Bernd Kuhls wrote:
> Updating the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
