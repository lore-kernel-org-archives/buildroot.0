Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A37C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 20:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7859D40524;
	Mon, 20 Jul 2026 20:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQYLInJLYEOP; Mon, 20 Jul 2026 20:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A624540531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784578998;
	bh=T+uVXQts68BWt8FdP+8HGUKkzCdZ7mhvS+MhGc7qfHY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tAqhRomVTgcISBhZICWWnA8uixsZN+5RqA1agHMkz+Grvyyy9ltis+fn5/JA1cBa/
	 Yj+PvM4/L1Xr0+3YlcmuZn44FONJlGnRTD0vC9YLG45MixpDyrAPC9njWnnnZ0nWb5
	 81BIv7UGqFlqUVD6BgbXOu8Zd/88yj6loSQS04mRxUij2rUC9VQUwvqPzvk9hDzS5o
	 /Rin3sHN94SVJ1zrhjKyJyHwisXAW4nCz4HXviCGG9f1pjpUfKAShv/MOM2zs/RSSd
	 YRpmHChWdjb9lovQzsil8bmsftUG8HNFO7mU6/dfLdLsn7oV2fE2j2Tkv54FudLH6Z
	 7eNWvNHEY99Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A624540531;
	Mon, 20 Jul 2026 20:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 695DE1142
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BA9840194
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rM7G2O5bG0Jx for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 20:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30B5C40099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30B5C40099
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30B5C40099
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:23:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1AC3519F59C;
 Mon, 20 Jul 2026 22:23:12 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jul 2026 22:23:12 +0200
MIME-Version: 1.0
Date: Mon, 20 Jul 2026 22:23:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260718085806.1047751-1-bernd@kuhls.net>
References: <20260718085806.1047751-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <efd886f810cc2f27b9014c2f67896e79@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784578994;
 bh=IMNuYb0iW/vlIqjk95QlMGQBjS3TE8w+suQ0RTL83ow=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XvtuQAIJIQTNATJd8N2s7/6tQu+0/Yv8xeGvuSnDOvF+JNpOvXnGjlihjzkGNTvlK
 dFoY0NdBg2xAKJSz51R9tpP/1r5iC9KX+csl8vOR7pRdVObXdTYUcuSr8Vx7mRO8Ej
 XNVTuwadtLlyO0GKlq/XPqsxKQvd0E5aLcLC0hyTV5j2DdriFKiotklNtq0SH9lKM0
 jsjmHfONeIq/HMlVFva0cnTVbPD3/GD2hAuSFHNnlSttazlc/0CbwKPZuwL12bqbNj
 Vui41FuHMswonhcK3J1GHE/BZqFcf/lPxMZ5zuOKR4t4rcXgyQ1h2zVnTeEOouNdB8
 rjBZlgfV+wgwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XvtuQAIJ
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: fix build for
 powerpc64le
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

On 18/07/2026 10:58, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/40a/40a26d9831667233944e6aabf2388f02a8cf30ac/
> https://gitlab.com/buildroot.org/buildroot/-/work_items/79
> 
> packet.c: In function 'ssh_packet_log_type':
> packet.c:1219:1: sorry, unimplemented: argument 'used' is not supported
>  for '-fzero-call-used-regs' on this target
> 
> Upstream bug report: https://bugzilla.mindrot.org/show_bug.cgi?id=3673
> 
> Upstream commit
> https://github.com/openssh/openssh-portable/commit/29cf521486bf97ab9de5b9b356f812107e0671bc
> which was first released with version 10.1 and was added to buildroot
> with commit b52b3fd59dc6c86ef51b6cad5b76017f90c83beb introduced cache
> variables to disable zero-call-used-regs when needed.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
