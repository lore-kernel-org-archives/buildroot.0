Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5B2E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 11:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F75F80E41;
	Fri, 26 Dec 2025 11:06:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdoRlXf6rjsW; Fri, 26 Dec 2025 11:06:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6DC480D88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766747186;
	bh=Ag1/9/Thm9YAYClwuXn6PnsRrVp+nt9FliOnQQDT6ZA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DJtLA31BmBbxjxw8Lw5Rv9SoTDXLELLlc72nJf5UD0+mf9FQGucgk3XAg3Dbb9MJM
	 d0APthpSDXQf9V1kjv9ZmrX2ek3EeWYBpQ62g448LecSHNMMMTBaeA6CACYCjpmgtL
	 Go8KBdVE5PG2MNVLqajoL7Zx916h2c/5eY4w9tkJk32B4g9xi+O/hM+uXnJe7D5KND
	 s+Nddjjrd3OBwwtkZ8Irqq4BDhH4X8jKPxbOm4+UGsLHcRdOzyguY3znldUza8HUuB
	 EUJhiOQS52wCN/PJenrLR8v2pgjVL1HJr84qh+GLZQtQ54xnNjTsBTCMiq29lxAiZh
	 7v/S2pu3zUVow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6DC480D88;
	Fri, 26 Dec 2025 11:06:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EF27EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 053B280D88
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgDpnD5W-sEQ for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 11:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2A36E80D53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A36E80D53
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A36E80D53
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:06:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3E6A3780503;
 Fri, 26 Dec 2025 12:06:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 12:06:20 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 12:06:20 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251224112404.3796586-1-giulio.benetti@benettiengineering.com>
References: <20251224112404.3796586-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <94ea81011c21af12b9318833ee37f22b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766747181;
 bh=ThfYSxds0jzkj+YEx5ol6tTivxKenqb9aveim+eE7e0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OcxRv4tH7GXDeGPfV0Ammmbf+Bf4ntXWze+nUrlC2cErb+sAfcLzYfwEW+cwZE02p
 anEZPcDB0QNBWs2esoVRbcEGUEAR7eULeyXo3h6XMJvKQWVxVxLYE/z3y51j/dV8nK
 W/fuMmVr8G51Z920J4ila1PJjOZxz1Xe7WjTQu/2B/8RLzUEp8OZ8S2H/ifuDfwrkh
 jQeJhNV0Q+4N8KhN8XtNqKpXYFI0ZnI6uSYfR+Wo2hdt9xsP9W0pQmuptlhfKJlzL0
 fc7QnWuORrm7RZGFgPMaemlfE5tj04ADMS/dGFipkPgT55PpB5Jv+tZGL3DGgVrIGa
 Yc9WR7dlU4/1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OcxRv4tH
Subject: Re: [Buildroot] [PATCH] package/vim: bump package to version
 9.1.2017
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

On 24/12/2025 12:24, Giulio Benetti wrote:
> Changelog:
> https://github.com/vim/vim/compare/v9.1.1989...v9.1.2017
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
