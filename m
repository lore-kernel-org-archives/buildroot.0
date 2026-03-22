Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA0BFC72C6
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 14:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DE56410FB;
	Sun, 22 Mar 2026 14:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iqlwg6iXKOCT; Sun, 22 Mar 2026 14:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67DED410F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774189716;
	bh=FhwWI2oJsOZSLUtO6hHGgPHoPt6CrnZ09c72ISjK7JQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HiL0wk+ZT65KHa3Ssxd+By8xRIES9U29EBh3Ug9AnMOFjUFfyjoNvhounGDIxBTXO
	 BeLeuNk8jUj1zgHOhjdwmWutRW5yzl4SZQd8mHm4dSmnvwwaOx9YHLpC0JZt3LjLzp
	 imW5QjFzVexMgotSSWlfWvCpM1IbrxDzKXY4kGlcdh7NJrRFNCOT1NFo3ZSXgMXEOi
	 almzuKGUA8wgq5xBZ0TseASIm3+s62OvLzt4FS1yS2b6pAICczZojiU1cF2+ZmYI3q
	 reWWZ022aOFS6D5jht2BwVJC5fxYeGKTgvh6RXY9NanTNEHEd8SR1aX1D3uL9SpOWd
	 NofQ6GwrYaziQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67DED410F5;
	Sun, 22 Mar 2026 14:28:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DCEE25C
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED62540429
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkGqDZN6iscW for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 14:28:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C521C40052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C521C40052
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C521C40052
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:28:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D1BC178032A;
 Sun, 22 Mar 2026 15:28:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Mar 2026 15:28:30 +0100
MIME-Version: 1.0
Date: Sun, 22 Mar 2026 15:28:30 +0100
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260321163837.11161-1-shirokovalexs@gmail.com>
References: <20260321163837.11161-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <aa79a3350d0bdb82a33a1aa04096f660@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774189712;
 bh=YM67kdV5GxzYZ3idRhmtcWjMRCQmsPQde9KsAONq/w0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sEKF/9Cmi9UDHKRziYzgfE8aittxdJ4vSaNt+kyW+vMX6/cbBWHJLM5H0r2dpeFyo
 DqKPWlP/GN1yP507Z/TX92Ee/AJCHjQVeP/EdZYVY0H80zTKKQUGw2rGFXXt2TOgw0
 m2oFrIDyJp4slsmo0RXIPntHcLIpFnIXUmbIL05OJlk9NRi35tHXCcNX9ssfLxxHMz
 rw++2EYxI7Br1lO7ApfMviqqPFHOKB5wNphM6ksBNNKl5tOcqLNAK1qQnjUWbthuZM
 YolJcpj8Al5LQD9Gx+FXdXzoZiHgBA62RNKPr2c2YqTuGQSxfSMtvpT+qJiH54Td5R
 XVK79ggj8FrcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sEKF/9Cm
Subject: Re: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.56.1
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

On 21/03/2026 17:38, Alexander Shirokov wrote:
> Changelog: https://github.com/Canop/broot/blob/v1.56.1/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
