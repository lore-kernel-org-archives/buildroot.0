Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6540C36002
	for <buildroot@archiver.kernel.org>; Fri, 21 Mar 2025 20:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7011F41E35;
	Fri, 21 Mar 2025 20:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dw4qpbonqjWM; Fri, 21 Mar 2025 20:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7A8B40B65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7A8B40B65;
	Fri, 21 Mar 2025 20:07:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B267B12F
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9926040430
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkbAAE_c8vvp for <buildroot@buildroot.org>;
 Fri, 21 Mar 2025 20:07:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABC904010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC904010C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABC904010C
 for <buildroot@buildroot.org>; Fri, 21 Mar 2025 20:07:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0400613F86E;
 Fri, 21 Mar 2025 21:07:11 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Mar 2025 21:07:11 +0100
MIME-Version: 1.0
Date: Fri, 21 Mar 2025 21:07:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250321164209.936661-1-bernd@kuhls.net>
References: <20250321164209.936661-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <9dbc852d1686a87f5d935a62859bc49b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742587633;
 bh=Yj+nz+RpjAagWCfSiw1IiAWuz5+gLVYbisiCrnpzM5Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nYEpd5yZevhXmaackJViGfTdVVVfr9Uu8FqPMC7SuBK7+6j4t/ggWs1uOxvypAMIa
 wTg7HZ6o5mr3P77gZBHSVz5ityfE69UeDvQQ+m2gHSzW8LbPSg/I6dNgIXOvWuByKh
 U5lA3NYVBHldQ1za83yGQ+xpfhjxW3FK/r0RIzu5byr7XFqWg6kPcEsFT6JUDHRwlY
 nxRL1N0nXys6NOMJ+kdekAdm6CkPPN43hgUzrBJ+huW+sgepv2u2VPSGpODo5AV80j
 lIVJaVLg+qFL/IQUy4CL8pfQMGYKL24dKMSd8JpuN2D32uQ4pbZE7Bmglv02oN/8il
 j4sWlQrb+Hu0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nYEpd5yZ
Subject: Re: [Buildroot] [PATCH 1/1] package/nut: fix build with python 3.13
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

On 21/03/2025 17:42, Bernd Kuhls wrote:
> Buildroot bumped Python from 3.12.x to version 3.13.x with commit
> d63e207eb869063f82c867658676c2903beb08cb
> 
> This python bump removed telnetlib which is needed by nut.
> Add upstream patches to fix a build error not yet caught by 
> autobuilders.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

For info, I fixed "make check-packages" errors.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
